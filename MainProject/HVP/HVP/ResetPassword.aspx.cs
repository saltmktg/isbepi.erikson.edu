using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace HVP
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MultiView1.ActiveViewIndex = 0;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //MembershipProvider mp = Membership.Providers["AdminSqlMembershipProvider"];
            //MembershipUser user = mp.GetUser(txtuserName.Text, true);
            //lblPassword.Text = user.ResetPassword();
            if (Membership.GetUser(txtuserName.Text).PasswordQuestion.ToLower() != "nothing")
            {
                lblQuestion.Text = Membership.GetUser(txtuserName.Text).PasswordQuestion;
                MultiView1.ActiveViewIndex = 1;
            }
            else
            {
                Response.Redirect("~/ErrorPage.aspx");
            }
        }

        protected void btnSumitQuestion_Click(object sender, EventArgs e)
        {
            if (Membership.GetUser(txtuserName.Text).IsLockedOut)
            {
                Membership.GetUser(txtuserName.Text,true).UnlockUser();
                //Membership.GetUser(true).UnlockUser();
                lblPassword.Text = Membership.GetUser(txtuserName.Text).ResetPassword(txtAnswer.Text);
                MultiView1.ActiveViewIndex = 2;
            }
            else
            {
                lblPassword.Text = Membership.GetUser(txtuserName.Text).ResetPassword(txtAnswer.Text);
                MultiView1.ActiveViewIndex = 2;
            }
        }
    }
}