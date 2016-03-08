using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
namespace HVP.Staff
{
    public partial class ViewSchdList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
        }
        protected void BindGridView()
        {
            string userID = Membership.GetUser(Page.User.Identity.Name).ProviderUserKey.ToString();
            if (Roles.IsUserInRole(Page.User.Identity.Name, "Administrator"))
            {
                string query = "SELECT ST.SiteID, SCHD.Schd_ID,SCHD.VisitDate,ST.Sites,UN.NameID, UN.Name,COALESCE(UN2.Name,'N/A') as Second_Name, COALESCE(UN2.NameID,0) AS NameID_2, COALESCE(ST.Num_of_HV,0) AS Num_HV, SCHD.Status "
                + " FROM [ISBEPI_DEV].[dbo].[Scheduling] SCHD JOIN [ISBEPI_DEV].[dbo].[UserNames] UN "
                  + " ON UN.NameID = SCHD.NameID JOIN [ISBEPI_DEV].[dbo].[Sites] ST "
               + " ON ST.SiteID = SCHD.SiteID LEFT JOIN [ISBEPI_DEV].[dbo].[UserNames] UN2 ON SCHD.Second_NameID = UN2.NameID  ORDER BY [VisitDate] DESC";
                DataTable dt = DBHelper.GetDataTable(query);

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            else
            {             
             
                string secondMonitorQuery = "SELECT ST.SiteID, SCHD.Schd_ID,SCHD.VisitDate,ST.Sites, UN.Name,COALESCE(UN2.Name,'N/A') as Second_Name, COALESCE(ST.Num_of_HV,0) AS Num_HV, SCHD.Status "
              + " FROM [ISBEPI_DEV].[dbo].[Scheduling] SCHD JOIN [ISBEPI_DEV].[dbo].[UserNames] UN "
                + " ON UN.NameID = SCHD.NameID JOIN [ISBEPI_DEV].[dbo].[Sites] ST "
             + " ON ST.SiteID = SCHD.SiteID LEFT JOIN [ISBEPI_DEV].[dbo].[UserNames] UN2 ON SCHD.Second_NameID = UN2.NameID WHERE UN.UserId ='" + userID + "' OR UN2.UserId ='" + userID + "' ORDER BY [VisitDate] DESC";
                DataTable dt_2 = DBHelper.GetDataTable(secondMonitorQuery);

                GridView1.DataSource = dt_2;
                GridView1.DataBind();
            }
        }
        protected void GridView1_SelectedIndexChanging1(object sender, GridViewSelectEventArgs e)
        {
            Session["Site_ID"] = GridView1.Rows[e.NewSelectedIndex].Cells[1].Text;
            Session["Schd_Id"] = GridView1.Rows[e.NewSelectedIndex].Cells[2].Text;
            Response.Redirect("~/Staff/SiteStatusChecklist.aspx");
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindGridView();
        }
    }
}