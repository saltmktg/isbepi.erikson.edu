using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;

namespace HVP.ManageUsers
{
    public partial class CreateUser : System.Web.UI.Page
    {
        int count3;
        Label lblerrormsg = new Label();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void btnAutoPWd_Click(object sender, EventArgs e)
        {
            string Password = Membership.GeneratePassword(12, 1);
            txtPwd.Text = Password;          
           
        }
              

      
        public string GetErrorMessage(MembershipCreateStatus status)
        {
            switch (status)
            {
                case MembershipCreateStatus.Success:
                    return "The user account was successfully created!";
                    
                case MembershipCreateStatus.DuplicateUserName:
                    return "Username already exists. Please enter a different user name.";

                case MembershipCreateStatus.DuplicateEmail:
                    return "A username for that e-mail address already exists. Please enter a different e-mail address.";

                case MembershipCreateStatus.InvalidEmail:
                    return "The e-mail address provided is invalid. Please check the value and try again.";             

                case MembershipCreateStatus.UserRejected:
                    return "The user creation request has been canceled. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

                default:
                    return "An unknown error occurred. Please verify your entry and try again. If the problem persists, please contact your system administrator.";
            }
        }


        protected void ddlRoles_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlRoles.SelectedItem.Text == "Program Site Director")
            {
                lblSites.Visible = true;
                ddlSites.Visible = true;
            }
            else
            {
                lblSites.Visible = false;
                ddlSites.Visible = false;
            }
        }

        protected void lnkCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Home.aspx");
        }

        protected void lnkCreate_Click(object sender, EventArgs e)
        {
            try
            {
                lblerrormsg.ForeColor = System.Drawing.Color.Red;
                MembershipCreateStatus msg;
                MembershipUser newUser = Membership.CreateUser(txtUserName.Text, txtPwd.Text, txtEmail.Text, "Nothing", "Nothing", true, out msg);
                GetErrorMessage(msg);
                if (msg.ToString() == "Success")
                {

                    string userId = Membership.GetUser(txtUserName.Text).ProviderUserKey.ToString();
                    Roles.AddUserToRole(txtUserName.Text, ddlRoles.SelectedItem.Value);
                    string sqlstr = string.Format("INSERT INTO [ISBEPI_DEV].[dbo].[UserNames]"
                            + "VALUES('{0}','{1}','{2}')", userId, txtName.Text, txtEmail.Text);
                    int count = DBHelper.ExecuteSQL(sqlstr);
                    string sqlstr2 = string.Format("INSERT INTO Staff(UserId,RoleId,NameID) SELECT dbo.aspnet_UsersInRoles.UserId, dbo.aspnet_UsersInRoles.RoleId, UserNames.NameID FROM  UserNames, dbo.aspnet_UsersInRoles WHERE UserNames.Name ='" + txtName.Text + "' AND  dbo.aspnet_UsersInRoles.UserId = '" + userId + "';");
                    int count1 = DBHelper.ExecuteSQL(sqlstr2);
                    
                    if (ddlRoles.SelectedItem.Text == "Program Site Director")
                    {
                        if (!string.IsNullOrEmpty(ddlSites.SelectedValue))
                        {
                            string sqlstrgetID = string.Format("SELECT [Staff_ID] FROM [ISBEPI_DEV].[dbo].[Staff] WHERE USERID = '" + userId + "'");
                            DataTable dt = DBHelper.GetDataTable(sqlstrgetID);
                            string sqlstr3 = string.Format("INSERT INTO [dbo].[ProgramDirector]([dbo].[ProgramDirector].SiteID,[dbo].[ProgramDirector].Staff_ID) SELECT dbo.Sites.SiteID, dbo.Staff.Staff_ID FROM  dbo.Sites, dbo.Staff WHERE dbo.Sites.SiteID ='" + ddlSites.SelectedValue + "' AND  dbo.Staff.Staff_ID = '" + dt.Rows[0]["Staff_ID"].ToString() + "';");

                            count3 = DBHelper.ExecuteSQL(sqlstr3);
                        }
                        else
                        {
                            count3 = 0;
                        }
                    }
                    if ((count != 1 && count1 != 1)
                        ||(count != 1 && count1 != 1 && count3 != 1))
                    {

                        Membership.DeleteUser(txtUserName.Text);
                        Response.Redirect("~/UnauthorizedAccess.aspx");
                    }
                    else
                    {
                        lblerrormsg.ForeColor = System.Drawing.Color.Green;                        
                        //string strMsg = GetErrorMessage(msg);
                        lblerrormsg.Text = GetErrorMessage(msg);
                        PlaceHolder1.Controls.Add(lblerrormsg);
                        //System.Web.HttpContext.Current.Response.Write("<Script Language='JavaScript'>window.alert('" + strMsg + "');window.location.href='CreateUser.aspx';</script>");

                    }
                }
                else
                {

                    //lblerrormsg.Text = GetErrorMessage(msg);
                    lblerrormsg.ForeColor = System.Drawing.Color.Red;         
                    lblerrormsg.Text = GetErrorMessage(msg);
                    PlaceHolder1.Controls.Add(lblerrormsg);
                }
            }

            catch (MembershipCreateUserException errorMsg)
            {
                lblerrormsg.ForeColor = System.Drawing.Color.Red;   
                lblerrormsg.Text = GetErrorMessage(errorMsg.StatusCode);
                PlaceHolder1.Controls.Add(lblerrormsg);

            }
        }
    }
}