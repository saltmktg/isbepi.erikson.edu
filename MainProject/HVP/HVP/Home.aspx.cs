using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace HVP
{
    public partial class _default2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Admin.UsersAnalytics userinfo = new Admin.UsersAnalytics();
            userinfo.GetUserInfo(Request.UserAgent, Request.Browser.Browser, Request.Browser.Version, Request.Browser.MajorVersion.ToString(), Request.Browser.MinorVersion.ToString(), Page.User.Identity.Name);            
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.Now.AddDays(-1));
            Response.Cache.SetNoStore();

            if (!IsPostBack)
            {
                if (Roles.IsUserInRole(Page.User.Identity.Name, "Program Site Director"))
                {
                    Response.Redirect("~/ProgramDirector/default.aspx");
                }
                else if (Roles.IsUserInRole(Page.User.Identity.Name, "Administrator"))
                {
                    Response.Redirect("~/Admin/default.aspx");
                }
                else if (Roles.IsUserInRole(Page.User.Identity.Name, "Staff"))
                {
                    Response.Redirect("~/Staff/default.aspx");
                }
                else if (Roles.IsUserInRole(Page.User.Identity.Name, "ISBE Consultant"))
                {
                    Response.Redirect("~/ISBEStaff/default.aspx");
                }
            }

        }
    }
}