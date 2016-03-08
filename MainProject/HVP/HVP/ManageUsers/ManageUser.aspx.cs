using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HVP.ManageUsers
{
    public partial class ManageUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lnkunlockuser_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ManageUsers/UnlockUser.aspx");
        }

        protected void lnkAdduser_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ManageUsers/CreateUser.aspx");
        }

        protected void lnkRetrieve_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ManageUsers/RetrievePassword.aspx");
        }

        protected void lnkDisableUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ManageUsers/DisableUser.aspx");
        }

       
    }
}