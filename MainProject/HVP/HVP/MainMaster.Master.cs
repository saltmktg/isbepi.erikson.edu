using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
namespace HVP
{
    public partial class MainMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.Now.AddDays(-1));
            Response.Cache.SetNoStore();
            if (!IsPostBack)
            {

                //if (Page.User.Identity.Name.Length > 1)
                //{

                //    if (Roles.IsUserInRole(Page.User.Identity.Name, "Staff"))
                //    {
                //        Response.Cache.SetCacheability(HttpCacheability.NoCache);
                //        Response.Cache.SetExpires(DateTime.Now.AddDays(-1));
                //        Response.Cache.SetNoStore();
                //        MenuItem mnuItem = Menu1.FindItem("Admin"); // Find particular item
                //        MenuItem mnuItem1 = Menu1.FindItem("ProgramDirector");
                //        Menu1.Items.Remove(mnuItem);
                //        Menu1.Items.Remove(mnuItem1);


                //    }
                //    else if (Roles.IsUserInRole(Page.User.Identity.Name, "Administrator"))
                //    {
                //        Response.Cache.SetCacheability(HttpCacheability.NoCache);
                //        Response.Cache.SetExpires(DateTime.Now.AddDays(-1));
                //        Response.Cache.SetNoStore();
                //        MenuItem mnuItem = Menu1.FindItem("Staff"); // Find particular item
                //        MenuItem mnuItem1 = Menu1.FindItem("ProgramDirector");
                //        Menu1.Items.Remove(mnuItem);
                //        Menu1.Items.Remove(mnuItem1);

                //    }
                //    else if (Roles.IsUserInRole(Page.User.Identity.Name, "Program Site Director"))
                //    {
                //        Response.Cache.SetCacheability(HttpCacheability.NoCache);
                //        Response.Cache.SetExpires(DateTime.Now.AddDays(-1));
                //        Response.Cache.SetNoStore();
                //        MenuItem mnuItem = Menu1.FindItem("Admin"); // Find particular item
                //        MenuItem mnuItem1 = Menu1.FindItem("Staff");
                //        Menu1.Items.Remove(mnuItem);
                //        Menu1.Items.Remove(mnuItem1);

                //    }
                //    else
                //    {
                //        FormsAuthentication.RedirectToLoginPage();
                //    }

                //}
                //else if (Page.User.Identity.Name.Length < 1)
                //{
                //    FormsAuthentication.RedirectToLoginPage();
                //    Response.Redirect("Login.aspx");
                //    Response.Write("<script language=JavaScript> parent.location.href='Login.aspx'</script>");
                //}
            }
            

        }

        protected void LoginStatus1_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.Now.AddDays(-1));
            Response.Cache.SetNoStore();
        }
    }
}