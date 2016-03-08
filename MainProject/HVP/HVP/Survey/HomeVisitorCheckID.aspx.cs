using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HVP.Survey
{
    public partial class HomeVisitorCheckID : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Program Name
            string sqlProgramName = "SELECT * FROM [ISBEPI_DEV].[dbo].[Program] ORDER BY PROGRAM";
            DataTable dtPrograms = DBHelper.GetDataTable(sqlProgramName);
            ddlProgramName.DataSource = dtPrograms;
            ddlProgramName.DataTextField = "Program";
            ddlProgramName.DataValueField = "Program_ID";
            ddlProgramName.DataBind();
            ddlProgramName.Items.Insert(0, new ListItem(String.Empty, String.Empty));
            ddlProgramName.SelectedIndex = 0;

            // Site Name
            string sqlquerySite = "SELECT * FROM [ISBEPI_DEV].[dbo].[Sites] ORDER BY Sites";
            DataTable dtSiteName = DBHelper.GetDataTable(sqlquerySite);
            ddlSiteName.DataSource = dtSiteName;
            ddlSiteName.DataTextField = "Sites";
            ddlSiteName.DataValueField = "SiteID";
            ddlSiteName.DataBind();
            ddlSiteName.Items.Insert(0, new ListItem(String.Empty, String.Empty));
            ddlSiteName.SelectedIndex = 0;
            }
        }        
        protected void checkid()
        {   
                //Session["siteID"] = ddlSiteName.SelectedValue;

                string sqlquery;
                sqlquery = "SELECT UN.Name, S.Sites, Schd.VisitDate, Schd.Status, S.City_or_location, S.SiteID, Schd.Schd_ID,"
                     + "S.Site_Address, S.City, S.State From Scheduling Schd JOIN UserNames UN ON UN.NameID = Schd.NameID"
                     + " JOIN Sites S ON s.SiteID = Schd.SiteID WHERE S.SiteID =" + ddlSiteName.SelectedValue + " AND Schd.Status <>'Closed' AND VisitDate IS NOT NULL ";
                
             
           DataTable dt = DBHelper.GetDataTable(sqlquery);

           if (dt.Rows.Count > 0)
           {              
                   //if ((dt.Rows[]["Status"].ToString() == "Closed".ToLower()) || (dt.Rows[i]["Status"].ToString() == "Closed".ToUpper()) || (dt.Rows[i]["Status"].ToString() == "Closed"))
                   //{
                   //    string strMsg = "Survey Not Active yet. Please Contact Administrator. Thank You!";
                   //    System.Web.HttpContext.Current.Response.Write("<Script Language='JavaScript'>window.alert('" + strMsg + "');</script>");
                   //}
                   //if (dt.Rows[i]["Status"].ToString() != "Closed")
                   //{
                       Session["siteID"] = ddlSiteName.SelectedValue;
                       Session["Schd_ID"] = dt.Rows[0]["Schd_ID"].ToString();
                       Admin.UsersAnalytics userinfo = new Admin.UsersAnalytics();
                       userinfo.GetUserInfo(Request.UserAgent, Request.Browser.Browser, Request.Browser.Version, Request.Browser.MajorVersion.ToString(), Request.Browser.MinorVersion.ToString(), ddlSiteName.SelectedItem.Text);
                       Response.Redirect("~/Survey/PIQRIHomeVisitorOnlineSurvey.aspx");

                   //}             
           }
           else
           {
               Label lblerrormsg = new Label();
               string strMsg = "<h3 class='errormsg'>Survey Not Active yet. Please Contact Administrator. Thank You!</h3>";
               lblerrormsg.Text = strMsg;
               PlaceHolder1.Controls.Add(lblerrormsg);
               //System.Web.HttpContext.Current.Response.Write("<Script Language='JavaScript'>window.alert('" + strMsg + "');</script>");
           }
               
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/default.aspx");
        }

        protected void btnCheckSite_Click(object sender, EventArgs e)
        {
            checkid();
        }

        protected void ddlProgramName_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Site Name
            string sqlquerySite = "  SELECT [ISBEPI_DEV].[dbo].[Sites].SiteID,[ISBEPI_DEV].[dbo].[Sites].Sites  FROM [ISBEPI_DEV].[dbo].[Sites] JOIN"
                + "[ISBEPI_DEV].[dbo].[Program] ON [ISBEPI_DEV].[dbo].[Program].Program_ID = [ISBEPI_DEV].[dbo].[Sites].Program_ID WHERE [ISBEPI_DEV].[dbo].[Sites].Program_ID ='" + ddlProgramName.SelectedValue + "' ORDER BY SITES;";
            DataTable dtSiteName = DBHelper.GetDataTable(sqlquerySite);
            ddlSiteName.DataSource = dtSiteName;
            ddlSiteName.DataTextField = "Sites";
            ddlSiteName.DataValueField = "SiteID";
            ddlSiteName.DataBind();
            //ddlSiteName.Items.Insert(0, new ListItem(String.Empty, String.Empty));
            //ddlSiteName.SelectedIndex = 0;
        }

    }
}