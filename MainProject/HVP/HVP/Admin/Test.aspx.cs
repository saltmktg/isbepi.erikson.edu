using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;

namespace HVP.Admin
{
    public partial class Test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Print the time when the page loaded initially
            Response.Write("<span class='logo' />The Page Loaded at: " + DateTime.Now.ToLongTimeString());
            divLANIPAddress.InnerHtml = GetIP4Address().Replace("::ffff:", "");

            Response.Write("<BR><B>User Agent ::</B> " + Request.UserAgent + "<BR>");
            Response.Write("<B>Browser ::</B> " + Request.Browser.Browser + "<BR>");
            Response.Write("<B>Version ::</B> " + Request.Browser.Version + "<BR>");
            Response.Write("<B>Major::</B> " + Request.Browser.MajorVersion + "<BR>");
            Response.Write("<B>Minor::</B> " + Request.Browser.MinorVersion + "<BR>");
        }

        /*
          Method to get the IP Address of the User
          
        public String GetLanIPAddress()
        {
            //The X-Forwarded-For (XFF) HTTP header field is a de facto standard for identifying the originating IP address of a 
            //client connecting to a web server through an HTTP proxy or load balancer


            //String ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            var ip = (HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != null
             && HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != "")
            ? HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"]
            : HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            if (ip.Contains(","))
                ip = ip.Split(',').First().Trim();

            if (string.IsNullOrEmpty(ip))
            {
                ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            }

            return ip;


        }
         */

        public static string GetIP4Address()
        {
            string IP4Address = string.Empty;
            foreach (IPAddress IPA in
            Dns.GetHostAddresses(HttpContext.Current.Request.UserHostAddress))
            {
                if (IPA.AddressFamily.ToString() == "InterNetwork")
                {
                    IP4Address = IPA.ToString();
                    break;
                }
            }
            if (IP4Address != string.Empty)
            {
                return IP4Address;
            }
            foreach (IPAddress IPA in Dns.GetHostAddresses(Dns.GetHostName()))
            {
                if (IPA.AddressFamily.ToString() == "InterNetwork")
                {
                    IP4Address = IPA.ToString();
                    break;
                }
            }
            return IP4Address;
        }
    }
}