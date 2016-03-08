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
    public partial class LockorUnlockUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {          
                ddlUsers.Items.Insert(0, new ListItem(String.Empty, String.Empty));
                ddlUsers.SelectedIndex = 0;
                foreach(MembershipUser mu in Membership.GetAllUsers())
                {
                    if (!Roles.IsUserInRole(mu.UserName, "Administrator"))
                    {
                        string sqlquery = "SELECT UN.Name FROM [ISBEPI_DEV].[dbo].[UserNames] UN WHERE UN.[UserId] ='" + mu.ProviderUserKey + "'";
                        DataTable dt = DBHelper.GetDataTable(sqlquery);
                        ddlUsers.Items.Insert(1, new ListItem(dt.Rows[0]["Name"].ToString(), mu.UserName));                                             
                    }
                }                
                ddlUsers.DataBind();  
               
            }
        }

        protected void lnkUnlock_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(ddlUsers.SelectedValue))
            {
                if (Membership.GetUser(ddlUsers.SelectedValue).IsLockedOut)
                {
                    Membership.GetUser(ddlUsers.SelectedValue).UnlockUser();
                    if (!Membership.GetUser(ddlUsers.SelectedValue).IsLockedOut)
                    {
                        lblComment.Text = "<h4 style='color:green'>User " + ddlUsers.SelectedItem.Text + "'s account is now unlocked</h4>";
                    }
                }
                else if (!Membership.GetUser(ddlUsers.SelectedValue).IsLockedOut)
                {
                    lblComment.Text = "<h4 style='color:red'>User " + ddlUsers.SelectedItem.Text + "'s account is not locked</h4>";
                }
            }
            else
            {
                lblComment.Text = "<h4 style='color:red'>Please Select a User to unlock</h4>";
            }
        }

        protected void lnkCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Home.aspx");
        }

        
    }
}