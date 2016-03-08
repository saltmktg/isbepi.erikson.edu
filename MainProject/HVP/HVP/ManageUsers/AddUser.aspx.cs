using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;

namespace HVP.Admin
{
    //not using this page. Create user is right page.
    public partial class AddUser : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
               
            }
        }

        

        protected void CreateUserWizard1_CreatedUser1(object sender, EventArgs e)
        {
            bool error = false;

            try
            {

                string username = CreateUserWizard1.UserName;
                string userId = Membership.GetUser(username).ProviderUserKey.ToString();
                RadioButtonList roles = (RadioButtonList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("rdoBtnLstRole");
                TextBox name = (TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("Name");
                TextBox email = (TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("Email");

                Roles.AddUserToRole(username, roles.SelectedItem.Value);
                //______________________________________________

                string sqlstr = string.Format("INSERT INTO [ISBEPI_DEV].[dbo].[UserNames]"
                    + "VALUES('{0}','{1}','{2}')", userId, name.Text, email.Text);
                int count = DBHelper.ExecuteSQL(sqlstr);
                string sqlstr2 = string.Format("INSERT INTO Staff(UserId,RoleId,NameID) SELECT dbo.aspnet_UsersInRoles.UserId, dbo.aspnet_UsersInRoles.RoleId, UserNames.NameID FROM  UserNames, dbo.aspnet_UsersInRoles WHERE UserNames.Name ='" + name.Text + "' AND  dbo.aspnet_UsersInRoles.UserId = '" + userId + "';");
                int count1 = DBHelper.ExecuteSQL(sqlstr2);
                if (count != 1 && count1 != 1)
                {
                    Membership.DeleteUser(username);
                    Response.Redirect("~/UnauthorizedAccess.aspx");
                }
            }
            catch (MembershipCreateUserException errorMsg)
            {
               TextBox msg = (TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("lblMsg");
               msg.Text = GetErrorMessage(errorMsg.StatusCode);
            }
            
            //rdoBtnLstRole.Visible = false;
            //lblRole.Visible = false;
        }
        public string GetErrorMessage(MembershipCreateStatus status)
        {
            switch (status)
            {
                case MembershipCreateStatus.DuplicateUserName:
                    return "Username already exists. Please enter a different user name.";

                case MembershipCreateStatus.DuplicateEmail:
                    return "A username for that e-mail address already exists. Please enter a different e-mail address.";                

                case MembershipCreateStatus.InvalidEmail:
                    return "The e-mail address provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidAnswer:
                    return "The password retrieval answer provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidQuestion:
                    return "The password retrieval question provided is invalid. Please check the value and try again.";

                

                case MembershipCreateStatus.UserRejected:
                    return "The user creation request has been canceled. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

                default:
                    return "An unknown error occurred. Please verify your entry and try again. If the problem persists, please contact your system administrator.";
            }
        }


        protected void btnAutoPwd_Click(object sender, EventArgs e)
        {
            string Password = Membership.GeneratePassword(12,1);
            TextBox pwd = (TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("Password");
            TextBox confirmPwd = (TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ConfirmPassword");
            pwd.Text = Password;
            confirmPwd.Text = Password;

        }

        

        

       

      


        
    }
}

            
                   

                    

                


            

    
