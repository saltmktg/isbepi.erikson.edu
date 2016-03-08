using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using System.Web.UI.HtmlControls;


namespace HVP.ManageUsers
{
    public partial class DisableUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlUsers.Items.Insert(0, new ListItem(String.Empty, String.Empty));
                ddlUsers.SelectedIndex = 0;
                foreach (MembershipUser mu in Membership.GetAllUsers())
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

        protected void lnkDisable_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(ddlUsers.SelectedValue))
            {
                if (Membership.GetUser(ddlUsers.SelectedValue).IsApproved == true)
                {
                    MembershipUser user = Membership.GetUser(ddlUsers.SelectedValue);
                    user.IsApproved = false;   
                    Membership.UpdateUser(user);
                    if (Membership.GetUser(ddlUsers.SelectedValue).IsApproved == false)
                    {
                        HtmlMeta meta = new HtmlMeta();
                        meta.HttpEquiv = "Refresh";
                        meta.Content = "2;url=ManageUser.aspx";
                        this.Page.Controls.Add(meta);
                        lblComment.Text = "<h4 style='color:green'>User " + ddlUsers.SelectedItem.Text + "'s account is now Disabled</h4><br/><br/>You will now be redirected in 5 seconds";
                    }                
                }
                else
                {
                    lblComment.Text = "<h4 style='color:green'>User " + ddlUsers.SelectedItem.Text + "'s account is Disabled.</h4>";
                }
            }
            else
            {
                lblComment.Text = "<h4 style='color:red'>Please Select a User to Disable</h4>";
            }
        }

        protected void lbkUnDisable_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(ddlUsers.SelectedValue))
            {
                if (Membership.GetUser(ddlUsers.SelectedValue).IsApproved == false)
                {
                    MembershipUser user = Membership.GetUser(ddlUsers.SelectedValue);
                    user.IsApproved = true;
                    Membership.UpdateUser(user);
                    if (Membership.GetUser(ddlUsers.SelectedValue).IsApproved == true)
                    {
                        HtmlMeta meta = new HtmlMeta();
                        meta.HttpEquiv = "Refresh";
                        meta.Content = "2;url=ManageUser.aspx";
                        this.Page.Controls.Add(meta);                        
                        lblComment.Text = "<h4 style='color:green'>User " + ddlUsers.SelectedItem.Text + "'s account is now Undisabled</h4><br/><br/>You will now be redirected in 5 seconds";
                    }
                }
                else
                {
                    lblComment.Text = "<h4 style='color:green'>User " + ddlUsers.SelectedItem.Text + "'s account is not Disabled.</h4>";
                }
            }
            else
            {
                lblComment.Text = "<h4 style='color:red'>Please Select a User to Undisable</h4>";
            }
        }

        protected void lnkCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Home.aspx");
        }
    }
}