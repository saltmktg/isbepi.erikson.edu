using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace HVP
{
    public partial class ManageSite : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            hfsiteid.Value = Session["Site_ID"] == null ? "" : Session["Site_ID"].ToString();
            hfSchdId.Value = Session["Schd_Id"] == null ? "" : Session["Schd_Id"].ToString();
            if (string.IsNullOrEmpty(hfSchdId.Value) && string.IsNullOrEmpty(hfsiteid.Value))
            {
                if (Roles.IsUserInRole("Administrator"))
                {

                    Response.Redirect("~/Admin/managesite.aspx");
                }
                else if (Roles.IsUserInRole("Staff"))
                {
                    Response.Redirect("~/Staff/ViewSchdList.aspx");
                }
                else if (Roles.IsUserInRole("ISBE Consultant"))
                {
                    Response.Redirect("~/ISBEStaff/AccessSites.aspx");
                }
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