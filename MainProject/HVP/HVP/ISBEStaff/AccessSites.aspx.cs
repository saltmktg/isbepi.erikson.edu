using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HVP.ISBEStaff
{
    public partial class AccessSites : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["Site_ID"] = null;
                Session["Schd_Id"] = null;
            }
        }
        protected void ddlProgram_SelectedIndexChanged(object sender, EventArgs e)
        {
            string sqlquerySite = "SELECT s.SiteID,s.Sites FROM [ISBEPI_DEV].[dbo].[Sites] s JOIN "
             + "[ISBEPI_DEV].[dbo].[Program] P ON p.Program_ID = s.Program_ID WHERE p.Program_ID ='" + ddlProgram.SelectedValue + "' ORDER BY SITES;";
            DataTable dtSiteName = DBHelper.GetDataTable(sqlquerySite);
            ddlSite.DataSource = dtSiteName;
            ddlSite.DataTextField = "Sites";
            ddlSite.DataValueField = "SiteID";
            ddlSite.DataBind();
        }


        protected void lnkbtnEnter_Click(object sender, EventArgs e)
        {
            Session["Site_ID"] = ddlSite.SelectedValue;
            string sqlquerySchd = "SELECT * FROM [ISBEPI_DEV].[dbo].[Scheduling] WHERE Status = 'ACTIVE' AND SiteID =" + ddlSite.SelectedValue;
            DataTable dtSchd = DBHelper.GetDataTable(sqlquerySchd);
            if (dtSchd.Rows.Count > 0)
            {
                Session["Schd_Id"] = dtSchd.Rows[0]["Schd_ID"].ToString();
                Response.Redirect("~/ISBEStaff/SiteStatusChecklist.aspx");
            }
            else
            {
                Response.Redirect("~/ISBEStaff/AccessSites.aspx");
            }

        }
    }
}