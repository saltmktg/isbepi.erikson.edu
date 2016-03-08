using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace HVP.ManageUsers
{
    public partial class DeleteUsers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ChkBxLstDeleteUser.DataSource = Membership.GetAllUsers();
                ChkBxLstDeleteUser.DataBind();
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Membership.DeleteUser(ChkBxLstDeleteUser.SelectedValue);
            Response.Redirect(Request.RawUrl); 
        }
    }
}