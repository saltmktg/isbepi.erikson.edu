using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HVP.Survey
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Display();
            }
        }

        protected void Display()
        {
            string siteID = Session["siteID"].ToString();
            string sqlquery;
            sqlquery = "SELECT [ISBEPI_DEV].[dbo].[UserNames].Name, [ISBEPI_DEV].[dbo].[Sites].Sites, [ISBEPI_DEV].[dbo].[Scheduling].VisitDate,"
                 + "[ISBEPI_DEV].[dbo].[Scheduling].Status,[ISBEPI_DEV].[dbo].[Sites].City_or_location, [ISBEPI_DEV].[dbo].[Sites].SiteID,"
                 + "[ISBEPI_DEV].[dbo].[Sites].Site_Address, [ISBEPI_DEV].[dbo].[Sites].City, [ISBEPI_DEV].[dbo].[Sites].State "
             + "FROM [ISBEPI_DEV].[dbo].[Scheduling] JOIN [ISBEPI_DEV].[dbo].[UserNames] ON [ISBEPI_DEV].[dbo].[UserNames].NameID=[ISBEPI_DEV].[dbo].[Scheduling].[NameID] "
             + "JOIN [ISBEPI_DEV].[dbo].[Sites] ON [ISBEPI_DEV].[dbo].[Sites].SiteID = [ISBEPI_DEV].[dbo].[Scheduling].SiteID WHERE [ISBEPI_DEV].[dbo].[Sites].SiteID LIKE '%" + siteID + "%';";
            DataTable dt = DBHelper.GetDataTable(sqlquery);

            if (dt.Rows.Count > 0)
            {               
                txtSiteName.Text = dt.Rows[0]["Sites"].ToString();
                txtSiteAddress.Text = dt.Rows[0]["City_or_location"].ToString();
            }
        }

    }
}