using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Security;
using System.Data;

namespace HVP.ManageUsers
{
    public partial class RetrievePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                ddlRetrieve.Items.Insert(0, new ListItem(String.Empty, String.Empty));
                ddlRetrieve.SelectedIndex = 0;
                foreach (MembershipUser mu in Membership.GetAllUsers())
                {
                    if (!Roles.IsUserInRole(mu.UserName, "Administrator"))
                    {
                        string sqlquery = "SELECT UN.Name FROM [ISBEPI_DEV].[dbo].[UserNames] UN WHERE UN.[UserId] ='"+mu.ProviderUserKey+"'";
                        DataTable dt = DBHelper.GetDataTable(sqlquery);                       
                            ddlRetrieve.Items.Insert(1, new ListItem(dt.Rows[0]["Name"].ToString(), mu.UserName));                        
                    }
                }
                ddlRetrieve.DataBind();                 
            }
        }       

        protected void lnkRetrieve_Click(object sender, EventArgs e)
        {
            try
            {
                if (!string.IsNullOrEmpty(ddlRetrieve.SelectedValue))
                {
                    MembershipProvider mp = Membership.Providers["AdminSqlMembershipProvider"];
                    MembershipUser user = mp.GetUser(ddlRetrieve.SelectedValue, true);
                    lblRetrieve.Text = user.GetPassword();
                    lblUserName.Text = ddlRetrieve.SelectedValue;
                    lblComment.Visible = false;
                }
                else
                {
                    lblComment.Visible = true;
                    lblComment.Text = "<h4>Please Select a User</h4>";
                }
            }
            catch (Exception msg)
            {
                lblComment.Visible = true;
                lblComment.Text = msg.Message;
            }
        }

        protected void lnkCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Home.aspx");
        }
    }
}