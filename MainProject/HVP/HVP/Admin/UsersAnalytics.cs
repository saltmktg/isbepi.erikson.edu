using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Data;

namespace HVP.Admin
{
    class UsersAnalytics
    {

        public void GetUserInfo(string userAgent, string browser, string Version, string major, string minor, string usernmae)
        {
            if (GetIP4Address() != "50.151.7.239")
            {
                dsTableAdapters.UsersAnalyticsTableAdapter userAnalyticsInsert = new dsTableAdapters.UsersAnalyticsTableAdapter();
                userAnalyticsInsert.Insert(DateTime.Now, GetIP4Address(), userAgent, browser, Version, major, minor, usernmae);
            }
        }     
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

               // or this
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
    }
}