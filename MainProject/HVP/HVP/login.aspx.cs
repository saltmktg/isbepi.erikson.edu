using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Configuration;

namespace HVP
{
    public partial class _default : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {                      
            //Session["UserName"] = Page.User.Identity.Name;
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.Now.AddDays(-1));
            Response.Cache.SetNoStore();
            
            if (Request.IsAuthenticated && !string.IsNullOrEmpty(Request.QueryString["ReturnUrl"]))
            {
                Response.Redirect("~/UnauthorizedAccess.aspx");
            }            
        }

        protected void Login1_LoginError(object sender, EventArgs e)
        {

            if (Membership.GetUser(Login1.UserName) == null)
            {
                Response.Redirect("~/ErrorPage.aspx");
            }
            else if (Membership.GetUser(Login1.UserName) != null)
            {
                if (Membership.GetUser(Login1.UserName).IsLockedOut)
                {                    
                    Response.Redirect("~/ErrorPage.aspx");
                }
                else if (Membership.ValidateUser(Login1.UserName, Login1.Password) == false)
                {
                    if (!string.IsNullOrEmpty(Request.QueryString["ReturnUrl"]))
                    {
                        Login1.FailureAction = LoginFailureAction.Refresh;
                    }
                    else if (string.IsNullOrEmpty(Request.QueryString["ReturnUrl"]))
                    {
                        Login1.FailureAction = LoginFailureAction.Refresh;
                    }
                }
            }
        }  

        //protected void Login1_LoggedIn(object sender, EventArgs e)
        //{

        //    if (Membership.ValidateUser(Login1.UserName, Login1.Password))
        //    {                
        //        if (!string.IsNullOrEmpty(Request.QueryString["ReturnUrl"]))
        //        {
        //            Response.Redirect(Request.QueryString["ReturnUrl"]);
        //            //Response.Redirect("~/Home.aspx");
        //        }
        //        else
        //        {
        //            Response.Redirect("~/Home.aspx");
        //        }
        //    }
        //    else
        //    {
        //        FormsAuthentication.RedirectToLoginPage();
        //    }
        //}

        

       
       
        
       
        
      
       
      

       
    }
}