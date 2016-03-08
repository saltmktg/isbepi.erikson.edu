using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace HVP.Admin
{
    public partial class ManageRoles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BulllstRole.DataSource = Roles.GetAllRoles();
                BulllstRole.DataBind();
            }
        }
       
        protected void btnSubmitTextBX_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtCreateNewRole.Text))
            {
                lblComment.Visible = true;
                lblComment.ForeColor = System.Drawing.Color.Red;
                lblComment.Text = "Plese Enter a new role.";
            }
            else if (Roles.RoleExists(txtCreateNewRole.Text))
            {
                lblComment.Visible = true;
                lblComment.ForeColor = System.Drawing.Color.Red;
                lblComment.Text = "Role '" + txtCreateNewRole.Text.ToUpper() + "' Already Exits";
            }
            else if (!Roles.RoleExists(txtCreateNewRole.Text))
            {
                Roles.CreateRole(txtCreateNewRole.Text);
                if (Roles.RoleExists(txtCreateNewRole.Text))
                {
                    lblComment.Visible = true;
                    lblComment.ForeColor = System.Drawing.Color.Green;
                    lblComment.Text = "Role Created Successfully";
                    BulllstRole.DataSource = Roles.GetAllRoles();
                    BulllstRole.DataBind();
                }
            }
            //Roles.AddUserToRole(ddlUsers.SelectedItem.Text, chkbxRole.SelectedItem.Text);
        }
    }
}