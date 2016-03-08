using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace HVP
{
    public partial class ChnagePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnChangePwd_Click(object sender, EventArgs e)
        {
            MembershipUser u = Membership.GetUser(User.Identity.Name);

            try
            {
                if (u.ChangePassword(txtCurrentPwd.Text, txtConfirmPwd.Text))
                {
                   
                        MembershipUser user = Membership.GetUser(User.Identity.Name);
                        Boolean result = user.ChangePasswordQuestionAndAnswer(txtConfirmPwd.Text,
                                                          ddlQuestion.SelectedItem.Text,
                                                          txtAnswer.Text);
                        if (result)
                        {
                            lblComment.ForeColor = System.Drawing.Color.Green;
                            lblComment.Text = "Password changed.";
                        }
                        else
                        {
                            lblComment.ForeColor = System.Drawing.Color.Red;
                            lblComment.Text = "Password change failed. Please re-enter your values and try again.";
                        }
                }
                else
                {
                    lblComment.ForeColor = System.Drawing.Color.Red;
                    lblComment.Text = "Password change failed. Please re-enter your values and try again.";
                }
            }
            catch (Exception msg)
            {
                lblComment.ForeColor = System.Drawing.Color.Red;
                lblComment.Text = "An exception occurred: " + Server.HtmlEncode(msg.Message) + ". Please re-enter your values and try again.";
            }            
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Home.aspx");
        }
    }
}