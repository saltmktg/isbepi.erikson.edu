using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HVP.Staff
{
    public partial class RunReports : System.Web.UI.Page
    {        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                YearList();
            }
        }
        private void YearList()
        {
            var min = DateTime.Now.AddYears(-2).Year;
            var max = DateTime.Now.AddYears(5).Year;// Enumerable.Range(DateTime.Now.Year, 5);

            while (min <= max)
            {
                ddlYear.Items.Add(new ListItem(min.ToString(), min.ToString()));
                min++;
            }
        }
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {

            if (calFrom.Visible == false)
            {                
                calFrom.Visible = true;
            }
            else
            {                
                calFrom.Visible = false;
            }
        }

        protected void calFrom_SelectionChanged(object sender, EventArgs e)
        {
            txtFromDate.Text = calFrom.SelectedDate.ToShortDateString();
            calFrom.Visible = false;
        }

        protected void calTo_SelectionChanged(object sender, EventArgs e)
        {
            if (calFrom.SelectedDate < calTo.SelectedDate)
            {
                txtToDate.Text = calTo.SelectedDate.ToShortDateString();
                calTo.Visible = false;
            }
            else
            {
                Label lblmsg = new Label();
                lblmsg.Text = "<h3 class='errormsg'>To Date should be greater than from date.</h3>";
                PlaceHolder1.Controls.Add(lblmsg);
            }
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            if (!string.IsNullOrEmpty(txtFromDate.Text))
            {
                calTo.Visible = true;
            }
            else
            {
                Label lblmsg = new Label();
                lblmsg.Text = "<h3 class='errormsg'>From Date Required.</h3>";
                PlaceHolder1.Controls.Add(lblmsg);
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            BindGrid();
        }
        private void BindGrid()
        {
            if (ddlTypeofReport.SelectedValue == "1")
            {
                string monitor = " SCHD.NameID = '" + ddlMonitor.SelectedValue + "'";
                string from_date = " SCHD.VisitDate BETWEEN '" + txtFromDate.Text + "' AND '" + txtToDate.Text + "'";
                string status = " SCHD.Status = '" + ddlStatus.SelectedValue + "'";
                string year = " ST.Assigned_Yr = " + ddlYear.SelectedValue;
                bool check = false;
                DataTable dt = new DataTable();

                if (ddlMonitor.SelectedValue.Length > 0 && ddlStatus.SelectedValue.Length > 0
                    && txtFromDate.Text.Length > 0 && txtToDate.Text.Length > 0)
                {
                    string query = " SELECT ST.Sites, SCHD.VisitDate,SCHD.Status, " +
                                   "CAST (CASE WHEN SCHD.SiteVistCompleted ='1' THEN '1' ELSE '0' END AS bit) AS SiteVisit, " +
                                    "COALESCE(HVS.HVS_Count,0) HVS, COALESCE(HVI.HVI_COUNT,0) HVI, " +
                                   "CAST (CASE WHEN PDS.Completed ='COMPLETED' THEN 1 ELSE 0 END AS bit) AS PDS," +
                                   "CAST (CASE WHEN PDI.Completed ='1' THEN '1' ELSE '0' END AS bit) AS PDI FROM Scheduling SCHD " +
                                   "LEFT JOIN Sites ST ON ST.SiteID = Schd.SiteID LEFT JOIN " +
                                   "(SELECT HVS_1.Schd_ID, COUNT(*) AS HVS_Count FROM HomeVisitorSiteVisitSurvey HVS_1 " +
                                   "GROUP BY HVS_1.Schd_ID) AS HVS ON SCHD.Schd_ID = HVS.Schd_ID LEFT JOIN " +
                                   "(SELECT HVI_1.Schd_ID, COUNT(*) AS HVI_COUNT FROM HomeVisitorInterview HVI_1 " +
                                   "GROUP BY HVI_1.Schd_ID) HVI ON HVI.Schd_ID = SCHD.Schd_ID " +
                                   "LEFT JOIN Program_Director_Survey PDS ON PDS.Schd_ID = SCHD.Schd_ID " +
                                   "LEFT JOIN PDInterview PDI ON PDI.Schd_ID = SCHD.Schd_ID " +
                                    "WHERE " +
                                    monitor + "AND" +
                                    from_date + "AND" +
                                    status;
                    dt = DBHelper.GetDataTable(query);
                    if (dt.Rows.Count > 0)
                    {
                        check = true;
                    }
                    else
                    {
                        check = false;
                    }
                }

                else if (ddlMonitor.SelectedValue.Length > 0 && txtFromDate.Text.Length > 0 && txtToDate.Text.Length > 0)
                {
                    string query = " SELECT ST.Sites, SCHD.VisitDate,SCHD.Status, " +
                                    "CAST (CASE WHEN SCHD.SiteVistCompleted ='1' THEN '1' ELSE '0' END AS bit) AS SiteVisit, " +
                                    "COALESCE(HVS.HVS_Count,0) HVS, COALESCE(HVI.HVI_COUNT,0) HVI, " +
                                   "CAST (CASE WHEN PDS.Completed ='COMPLETED' THEN 1 ELSE 0 END AS bit) AS PDS," +
                                   "CAST (CASE WHEN PDI.Completed ='1' THEN '1' ELSE '0' END AS bit) AS PDI FROM Scheduling SCHD " +
                                   "LEFT JOIN Sites ST ON ST.SiteID = Schd.SiteID LEFT JOIN " +
                                   "(SELECT HVS_1.Schd_ID, COUNT(*) AS HVS_Count FROM HomeVisitorSiteVisitSurvey HVS_1 " +
                                   "GROUP BY HVS_1.Schd_ID) AS HVS ON SCHD.Schd_ID = HVS.Schd_ID LEFT JOIN " +
                                   "(SELECT HVI_1.Schd_ID, COUNT(*) AS HVI_COUNT FROM HomeVisitorInterview HVI_1 " +
                                   "GROUP BY HVI_1.Schd_ID) HVI ON HVI.Schd_ID = SCHD.Schd_ID " +
                                   "LEFT JOIN Program_Director_Survey PDS ON PDS.Schd_ID = SCHD.Schd_ID " +
                                   "LEFT JOIN PDInterview PDI ON PDI.Schd_ID = SCHD.Schd_ID " +
                                    "WHERE " +
                                    monitor + "AND" +
                                    from_date;
                    dt = DBHelper.GetDataTable(query);
                    if (dt.Rows.Count > 0)
                    {
                        check = true;
                    }
                    else
                    {
                        check = false;
                    }
                }
                else if (ddlMonitor.SelectedValue.Length > 0 && ddlStatus.SelectedValue.Length > 0)
                {
                    string query = " SELECT ST.Sites, SCHD.VisitDate,SCHD.Status, " +
                                   "CAST (CASE WHEN SCHD.SiteVistCompleted ='1' THEN '1' ELSE '0' END AS bit) AS SiteVisit, " +
                                    "COALESCE(HVS.HVS_Count,0) HVS, COALESCE(HVI.HVI_COUNT,0) HVI, " +
                                   "CAST (CASE WHEN PDS.Completed ='COMPLETED' THEN 1 ELSE 0 END AS bit) AS PDS," +
                                   "CAST (CASE WHEN PDI.Completed ='1' THEN '1' ELSE '0' END AS bit) AS PDI FROM Scheduling SCHD " +
                                   "LEFT JOIN Sites ST ON ST.SiteID = Schd.SiteID LEFT JOIN " +
                                   "(SELECT HVS_1.Schd_ID, COUNT(*) AS HVS_Count FROM HomeVisitorSiteVisitSurvey HVS_1 " +
                                   "GROUP BY HVS_1.Schd_ID) AS HVS ON SCHD.Schd_ID = HVS.Schd_ID LEFT JOIN " +
                                   "(SELECT HVI_1.Schd_ID, COUNT(*) AS HVI_COUNT FROM HomeVisitorInterview HVI_1 " +
                                   "GROUP BY HVI_1.Schd_ID) HVI ON HVI.Schd_ID = SCHD.Schd_ID " +
                                   "LEFT JOIN Program_Director_Survey PDS ON PDS.Schd_ID = SCHD.Schd_ID " +
                                   "LEFT JOIN PDInterview PDI ON PDI.Schd_ID = SCHD.Schd_ID " +
                                   "WHERE " +
                                   monitor + "AND" +
                                   status;
                    dt = DBHelper.GetDataTable(query);
                    if (dt.Rows.Count > 0)
                    {
                        check = true;
                    }
                    else
                    {
                        check = false;
                    }
                }
                else if (ddlStatus.SelectedValue.Length > 0 && txtFromDate.Text.Length > 0 && txtToDate.Text.Length > 0)
                {
                    string query = " SELECT ST.Sites, SCHD.VisitDate,SCHD.Status, " +
                                   "CAST (CASE WHEN SCHD.SiteVistCompleted ='1' THEN '1' ELSE '0' END AS bit) AS SiteVisit, " +
                                    "COALESCE(HVS.HVS_Count,0) HVS, COALESCE(HVI.HVI_COUNT,0) HVI, " +
                                   "CAST (CASE WHEN PDS.Completed ='COMPLETED' THEN 1 ELSE 0 END AS bit) AS PDS," +
                                   "CAST (CASE WHEN PDI.Completed ='1' THEN '1' ELSE '0' END AS bit) AS PDI FROM Scheduling SCHD " +
                                   "LEFT JOIN Sites ST ON ST.SiteID = Schd.SiteID LEFT JOIN " +
                                   "(SELECT HVS_1.Schd_ID, COUNT(*) AS HVS_Count FROM HomeVisitorSiteVisitSurvey HVS_1 " +
                                   "GROUP BY HVS_1.Schd_ID) AS HVS ON SCHD.Schd_ID = HVS.Schd_ID LEFT JOIN " +
                                   "(SELECT HVI_1.Schd_ID, COUNT(*) AS HVI_COUNT FROM HomeVisitorInterview HVI_1 " +
                                   "GROUP BY HVI_1.Schd_ID) HVI ON HVI.Schd_ID = SCHD.Schd_ID " +
                                   "LEFT JOIN Program_Director_Survey PDS ON PDS.Schd_ID = SCHD.Schd_ID " +
                                   "LEFT JOIN PDInterview PDI ON PDI.Schd_ID = SCHD.Schd_ID " +
                                   "WHERE " +
                                   from_date + "AND" +
                                   status;
                    dt = DBHelper.GetDataTable(query);
                    if (dt.Rows.Count > 0)
                    {
                        check = true;
                    }
                    else
                    {
                        check = false;
                    }
                }
                else if (ddlMonitor.SelectedValue.Length > 0 || ddlStatus.SelectedValue.Length > 0
                    || (txtFromDate.Text.Length > 0 && txtToDate.Text.Length > 0))
                {
                    if (ddlMonitor.SelectedValue.Length > 0)
                    {
                        string query = " SELECT ST.Sites, SCHD.VisitDate,SCHD.Status, " +
                                   "CAST (CASE WHEN SCHD.SiteVistCompleted ='1' THEN '1' ELSE '0' END AS bit) AS SiteVisit, " +
                                    "COALESCE(HVS.HVS_Count,0) HVS, COALESCE(HVI.HVI_COUNT,0) HVI, " +
                                   "CAST (CASE WHEN PDS.Completed ='COMPLETED' THEN 1 ELSE 0 END AS bit) AS PDS," +
                                   "CAST (CASE WHEN PDI.Completed ='1' THEN '1' ELSE '0' END AS bit) AS PDI FROM Scheduling SCHD " +
                                   "LEFT JOIN Sites ST ON ST.SiteID = Schd.SiteID LEFT JOIN " +
                                   "(SELECT HVS_1.Schd_ID, COUNT(*) AS HVS_Count FROM HomeVisitorSiteVisitSurvey HVS_1 " +
                                   "GROUP BY HVS_1.Schd_ID) AS HVS ON SCHD.Schd_ID = HVS.Schd_ID LEFT JOIN " +
                                   "(SELECT HVI_1.Schd_ID, COUNT(*) AS HVI_COUNT FROM HomeVisitorInterview HVI_1 " +
                                   "GROUP BY HVI_1.Schd_ID) HVI ON HVI.Schd_ID = SCHD.Schd_ID " +
                                   "LEFT JOIN Program_Director_Survey PDS ON PDS.Schd_ID = SCHD.Schd_ID " +
                                   "LEFT JOIN PDInterview PDI ON PDI.Schd_ID = SCHD.Schd_ID " +
                                   "WHERE " +
                                   monitor;
                        dt = DBHelper.GetDataTable(query);
                        if (dt.Rows.Count > 0)
                        {
                            check = true;
                        }
                        else
                        {
                            check = false;
                        }
                    }
                    else if (ddlStatus.SelectedValue.Length > 0)
                    {
                        string query = " SELECT ST.Sites, SCHD.VisitDate,SCHD.Status, " +
                                   "CAST (CASE WHEN SCHD.SiteVistCompleted ='1' THEN '1' ELSE '0' END AS bit) AS SiteVisit, " +
                                    "COALESCE(HVS.HVS_Count,0) HVS, COALESCE(HVI.HVI_COUNT,0) HVI, " +
                                   "CAST (CASE WHEN PDS.Completed ='COMPLETED' THEN 1 ELSE 0 END AS bit) AS PDS," +
                                   "CAST (CASE WHEN PDI.Completed ='1' THEN '1' ELSE '0' END AS bit) AS PDI FROM Scheduling SCHD " +
                                   "LEFT JOIN Sites ST ON ST.SiteID = Schd.SiteID LEFT JOIN " +
                                   "(SELECT HVS_1.Schd_ID, COUNT(*) AS HVS_Count FROM HomeVisitorSiteVisitSurvey HVS_1 " +
                                   "GROUP BY HVS_1.Schd_ID) AS HVS ON SCHD.Schd_ID = HVS.Schd_ID LEFT JOIN " +
                                   "(SELECT HVI_1.Schd_ID, COUNT(*) AS HVI_COUNT FROM HomeVisitorInterview HVI_1 " +
                                   "GROUP BY HVI_1.Schd_ID) HVI ON HVI.Schd_ID = SCHD.Schd_ID " +
                                   "LEFT JOIN Program_Director_Survey PDS ON PDS.Schd_ID = SCHD.Schd_ID " +
                                   "LEFT JOIN PDInterview PDI ON PDI.Schd_ID = SCHD.Schd_ID " +
                                   "WHERE " +
                                   status;
                        dt = DBHelper.GetDataTable(query);
                        if (dt.Rows.Count > 0)
                        {
                            check = true;
                        }
                        else
                        {
                            check = false;
                        }
                    }
                    else if ((txtFromDate.Text.Length > 0 && txtToDate.Text.Length > 0))
                    {
                        string query = " SELECT ST.Sites, SCHD.VisitDate,SCHD.Status, " +
                                    "CAST (CASE WHEN SCHD.SiteVistCompleted ='1' THEN '1' ELSE '0' END AS bit) AS SiteVisit, " +
                                    "COALESCE(HVS.HVS_Count,0) HVS, COALESCE(HVI.HVI_COUNT,0) HVI, " +
                                   "CAST (CASE WHEN PDS.Completed ='COMPLETED' THEN 1 ELSE 0 END AS bit) AS PDS," +
                                   "CAST (CASE WHEN PDI.Completed ='1' THEN '1' ELSE '0' END AS bit) AS PDI FROM Scheduling SCHD " +
                                   "LEFT JOIN Sites ST ON ST.SiteID = Schd.SiteID LEFT JOIN " +
                                   "(SELECT HVS_1.Schd_ID, COUNT(*) AS HVS_Count FROM HomeVisitorSiteVisitSurvey HVS_1 " +
                                   "GROUP BY HVS_1.Schd_ID) AS HVS ON SCHD.Schd_ID = HVS.Schd_ID LEFT JOIN " +
                                   "(SELECT HVI_1.Schd_ID, COUNT(*) AS HVI_COUNT FROM HomeVisitorInterview HVI_1 " +
                                   "GROUP BY HVI_1.Schd_ID) HVI ON HVI.Schd_ID = SCHD.Schd_ID " +
                                   "LEFT JOIN Program_Director_Survey PDS ON PDS.Schd_ID = SCHD.Schd_ID " +
                                   "LEFT JOIN PDInterview PDI ON PDI.Schd_ID = SCHD.Schd_ID " +
                                   "WHERE " +
                                   from_date;
                        dt = DBHelper.GetDataTable(query);
                        if (dt.Rows.Count > 0)
                        {
                            check = true;
                        }
                        else
                        {
                            check = false;
                        }
                    }
                    else
                    {
                        string query = " SELECT ST.Sites, SCHD.VisitDate,SCHD.Status, " +
                                    "CAST (CASE WHEN SCHD.SiteVistCompleted ='1' THEN '1' ELSE '0' END AS bit) AS SiteVisit, " +
                                    "COALESCE(HVS.HVS_Count,0) HVS, COALESCE(HVI.HVI_COUNT,0) HVI, " +
                                   "CAST (CASE WHEN PDS.Completed ='COMPLETED' THEN 1 ELSE 0 END AS bit) AS PDS," +
                                   "CAST (CASE WHEN PDI.Completed ='1' THEN '1' ELSE '0' END AS bit) AS PDI FROM Scheduling SCHD " +
                                   "LEFT JOIN Sites ST ON ST.SiteID = Schd.SiteID LEFT JOIN " +
                                   "(SELECT HVS_1.Schd_ID, COUNT(*) AS HVS_Count FROM HomeVisitorSiteVisitSurvey HVS_1 " +
                                   "GROUP BY HVS_1.Schd_ID) AS HVS ON SCHD.Schd_ID = HVS.Schd_ID LEFT JOIN " +
                                   "(SELECT HVI_1.Schd_ID, COUNT(*) AS HVI_COUNT FROM HomeVisitorInterview HVI_1 " +
                                   "GROUP BY HVI_1.Schd_ID) HVI ON HVI.Schd_ID = SCHD.Schd_ID " +
                                   "LEFT JOIN Program_Director_Survey PDS ON PDS.Schd_ID = SCHD.Schd_ID " +
                                   "LEFT JOIN PDInterview PDI ON PDI.Schd_ID = SCHD.Schd_ID ";
                        dt = DBHelper.GetDataTable(query);
                        if (dt.Rows.Count > 0)
                        {
                            check = true;
                        }
                        else
                        {
                            check = false;
                        }
                    }
                }
                else
                {
                    string query = " SELECT ST.Sites, SCHD.VisitDate,SCHD.Status, " +
                                    "CAST (CASE WHEN SCHD.SiteVistCompleted ='1' THEN '1' ELSE '0' END AS bit) AS SiteVisit, " +
                                    "COALESCE(HVS.HVS_Count,0) HVS, COALESCE(HVI.HVI_COUNT,0) HVI, " +
                                   "CAST (CASE WHEN PDS.Completed ='COMPLETED' THEN 1 ELSE 0 END AS bit) AS PDS," +
                                   "CAST (CASE WHEN PDI.Completed ='1' THEN '1' ELSE '0' END AS bit) AS PDI FROM Scheduling SCHD " +
                                   "LEFT JOIN Sites ST ON ST.SiteID = Schd.SiteID LEFT JOIN " +
                                   "(SELECT HVS_1.Schd_ID, COUNT(*) AS HVS_Count FROM HomeVisitorSiteVisitSurvey HVS_1 " +
                                   "GROUP BY HVS_1.Schd_ID) AS HVS ON SCHD.Schd_ID = HVS.Schd_ID LEFT JOIN " +
                                   "(SELECT HVI_1.Schd_ID, COUNT(*) AS HVI_COUNT FROM HomeVisitorInterview HVI_1 " +
                                   "GROUP BY HVI_1.Schd_ID) HVI ON HVI.Schd_ID = SCHD.Schd_ID " +
                                   "LEFT JOIN Program_Director_Survey PDS ON PDS.Schd_ID = SCHD.Schd_ID " +
                                   "LEFT JOIN PDInterview PDI ON PDI.Schd_ID = SCHD.Schd_ID ";
                    dt = DBHelper.GetDataTable(query);
                    if (dt.Rows.Count > 0)
                    {
                        check = true;
                    }
                    else
                    {
                        check = false;
                    }
                }

                if (check)
                {
                    GridView1.Visible = true;
                    GridView1.DataSource = dt;

                    GridView1.DataBind();
                }
                else
                {
                    GridView1.Visible = true;
                    GridView1.DataSource = dt;
                    GridView1.EmptyDataText = "No Records to Display";
                    GridView1.DataBind();
                }
            }
            else if (ddlTypeofReport.SelectedValue == "2")
            {
                string year = "ST.Assigned_Yr = " + ddlYear.SelectedValue;
                string from_date = " SCHD.VisitDate BETWEEN '" + txtFromDate.Text + "' AND '" + txtToDate.Text + "'";
                string monitor = " SCHD.NameID = '" + ddlMonitor.SelectedValue + "'";
                if (txtToDate.Text.Trim().Length > 0 && txtFromDate.Text.Trim().Length > 0 && ddlMonitor.SelectedValue.Length > 0 && ddlYear.SelectedValue.Length > 0)
                {


                    string query = "SELECT DISTINCT ST.Sites, CAST (CASE WHEN SCHD.SiteVistScheduled ='1' " +
                                   " THEN '1' ELSE '0' END AS bit) AS SiteVistSCHD, COALESCE(U.Name,' ') AS Monitor , ST.Assigned_Yr Year" +
                                   " FROM Sites ST LEFT JOIN Scheduling SCHD ON ST.SiteID = SCHD.SiteID " +
                                   " LEFT JOIN UserNames U ON U.NameID = SCHD.NameID WHERE " + from_date + " AND " + year + " AND " + monitor;
                    DataTable dt = new DataTable();
                    dt = DBHelper.GetDataTable(query);
                    if (dt.Rows.Count > 0)
                    {

                        GridView2.Visible = true;
                        GridView2.DataSource = dt;
                        GridView2.DataBind();
                    }
                    else
                    {
                        GridView2.Visible = true;
                        GridView2.DataSource = dt;
                        GridView1.EmptyDataText = "No Records to Display";
                        GridView2.DataBind();
                    }

                }
                else if (txtToDate.Text.Trim().Length > 0 && txtFromDate.Text.Trim().Length > 0 
                    && ddlMonitor.SelectedValue.Length > 0)
                {
                    string query = "SELECT DISTINCT ST.Sites, CAST (CASE WHEN SCHD.SiteVistScheduled ='1' " +
                                  " THEN '1' ELSE '0' END AS bit) AS SiteVistSCHD, COALESCE(U.Name,' ') AS Monitor , ST.Assigned_Yr Year" +
                                  " FROM Sites ST LEFT JOIN Scheduling SCHD ON ST.SiteID = SCHD.SiteID " +
                                  " LEFT JOIN UserNames U ON U.NameID = SCHD.NameID WHERE " + from_date + " AND " + monitor;
                    DataTable dt = new DataTable();
                    dt = DBHelper.GetDataTable(query);
                    if (dt.Rows.Count > 0)
                    {

                        GridView2.Visible = true;
                        GridView2.DataSource = dt;
                        GridView2.DataBind();
                    }
                    else
                    {
                        GridView2.Visible = true;
                        GridView2.DataSource = dt;
                        GridView1.EmptyDataText = "No Records to Display";
                        GridView2.DataBind();
                    }
                }
                else if (txtToDate.Text.Trim().Length > 0 && txtFromDate.Text.Trim().Length > 0
                   && ddlYear.SelectedValue.Length > 0)
                {
                    string query = "SELECT DISTINCT ST.Sites, CAST (CASE WHEN SCHD.SiteVistScheduled ='1' " +
                                 " THEN '1' ELSE '0' END AS bit) AS SiteVistSCHD, COALESCE(U.Name,' ') AS Monitor , ST.Assigned_Yr Year" +
                                 " FROM Sites ST LEFT JOIN Scheduling SCHD ON ST.SiteID = SCHD.SiteID " +
                                 " LEFT JOIN UserNames U ON U.NameID = SCHD.NameID WHERE " + from_date + " AND " + year;
                    DataTable dt = new DataTable();
                    dt = DBHelper.GetDataTable(query);
                    if (dt.Rows.Count > 0)
                    {

                        GridView2.Visible = true;
                        GridView2.DataSource = dt;
                        GridView2.DataBind();
                    }
                    else
                    {
                        GridView2.Visible = true;
                        GridView2.DataSource = dt;
                        GridView1.EmptyDataText = "No Records to Display";
                        GridView2.DataBind();
                    }
                }
                else if (ddlMonitor.SelectedValue.Length > 0 && ddlYear.SelectedValue.Length > 0)
                {
                    string query = "SELECT DISTINCT ST.Sites, CAST (CASE WHEN SCHD.SiteVistScheduled ='1' " +
                                 " THEN '1' ELSE '0' END AS bit) AS SiteVistSCHD, COALESCE(U.Name,' ') AS Monitor , ST.Assigned_Yr Year" +
                                 " FROM Sites ST LEFT JOIN Scheduling SCHD ON ST.SiteID = SCHD.SiteID " +
                                 " LEFT JOIN UserNames U ON U.NameID = SCHD.NameID WHERE " + monitor + " AND " + year;
                    DataTable dt = new DataTable();
                    dt = DBHelper.GetDataTable(query);
                    if (dt.Rows.Count > 0)
                    {

                        GridView2.Visible = true;
                        GridView2.DataSource = dt;
                        GridView2.DataBind();
                    }
                    else
                    {
                        GridView2.Visible = true;
                        GridView2.DataSource = dt;
                        GridView1.EmptyDataText = "No Records to Display";
                        GridView2.DataBind();
                    }
                }
                else if (txtToDate.Text.Trim().Length > 0 && txtFromDate.Text.Trim().Length > 0)
                {
                    string query = "SELECT DISTINCT ST.Sites, CAST (CASE WHEN SCHD.SiteVistScheduled ='1' " +
                                " THEN '1' ELSE '0' END AS bit) AS SiteVistSCHD, COALESCE(U.Name,' ') AS Monitor , ST.Assigned_Yr Year" +
                                " FROM Sites ST LEFT JOIN Scheduling SCHD ON ST.SiteID = SCHD.SiteID " +
                                " LEFT JOIN UserNames U ON U.NameID = SCHD.NameID WHERE " + from_date;
                    DataTable dt = new DataTable();
                    dt = DBHelper.GetDataTable(query);
                    if (dt.Rows.Count > 0)
                    {

                        GridView2.Visible = true;
                        GridView2.DataSource = dt;
                        GridView2.DataBind();
                    }
                    else
                    {
                        GridView2.Visible = true;
                        GridView2.DataSource = dt;
                        GridView1.EmptyDataText = "No Records to Display";
                        GridView2.DataBind();
                    }
                }
                else if (ddlYear.SelectedValue.Length > 0)
                {
                    string query = "SELECT DISTINCT ST.Sites, CAST (CASE WHEN SCHD.SiteVistScheduled ='1' " +
                                " THEN '1' ELSE '0' END AS bit) AS SiteVistSCHD, COALESCE(U.Name,' ') AS Monitor , ST.Assigned_Yr Year" +
                                " FROM Sites ST LEFT JOIN Scheduling SCHD ON ST.SiteID = SCHD.SiteID " +
                                " LEFT JOIN UserNames U ON U.NameID = SCHD.NameID WHERE " + year;
                    DataTable dt = new DataTable();
                    dt = DBHelper.GetDataTable(query);
                    if (dt.Rows.Count > 0)
                    {

                        GridView2.Visible = true;
                        GridView2.DataSource = dt;
                        GridView2.DataBind();
                    }
                    else
                    {
                        GridView2.Visible = true;
                        GridView2.DataSource = dt;
                        GridView1.EmptyDataText = "No Records to Display";
                        GridView2.DataBind();
                    }
                }
                else if (ddlMonitor.SelectedValue.Length > 0)
                {
                    string query = "SELECT DISTINCT ST.Sites, CAST (CASE WHEN SCHD.SiteVistScheduled ='1' " +
                                " THEN '1' ELSE '0' END AS bit) AS SiteVistSCHD, COALESCE(U.Name,' ') AS Monitor , ST.Assigned_Yr Year " +
                                " FROM Sites ST LEFT JOIN Scheduling SCHD ON ST.SiteID = SCHD.SiteID " +
                                " LEFT JOIN UserNames U ON U.NameID = SCHD.NameID WHERE " + monitor;
                    DataTable dt = new DataTable();
                    dt = DBHelper.GetDataTable(query);
                    if (dt.Rows.Count > 0)
                    {

                        GridView2.Visible = true;
                        GridView2.DataSource = dt;
                        GridView2.DataBind();
                    }
                    else
                    {
                        GridView2.Visible = true;
                        GridView2.DataSource = dt;
                        GridView1.EmptyDataText = "No Records to Display";
                        GridView2.DataBind();
                    }
                }
                else
                {
                    string query = "SELECT DISTINCT ST.Sites, CAST (CASE WHEN SCHD.SiteVistScheduled ='1' " +
                                 " THEN '1' ELSE '0' END AS bit) AS SiteVistSCHD,  COALESCE(U.Name,' ') AS Monitor , ST.Assigned_Yr Year" +
                                 " FROM Sites ST LEFT JOIN Scheduling SCHD ON ST.SiteID = SCHD.SiteID " +
                                 " LEFT JOIN UserNames U ON U.NameID = SCHD.NameID;";
                    DataTable dt = new DataTable();
                    dt = DBHelper.GetDataTable(query);
                    if (dt.Rows.Count > 0)
                    {

                        GridView2.Visible = true;
                        GridView2.DataSource = dt;
                        GridView2.DataBind();
                    }
                    else
                    {
                        GridView2.Visible = true;
                        GridView2.DataSource = dt;
                        GridView1.EmptyDataText = "No Records to Display";
                        GridView2.DataBind();
                    }
                }

            }
           
        }
        protected void ddlTypeofReport_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlTypeofReport.SelectedValue == "1")
            {
                ddlMonitor.Enabled = true;
                ddlStatus.Enabled = true;
                txtFromDate.Enabled = true;
                txtToDate.Enabled = true;
                ImageButton1.Enabled = true;
                ImageButton2.Enabled = true;
                ddlYear.Enabled = false;
                GridView2.Visible = false;                
            }
            else if (ddlTypeofReport.SelectedValue == "2")
            {
                //ddlMonitor.Enabled = false;
                ddlYear.Enabled = true;
                ddlStatus.Enabled = false;
                //txtFromDate.Enabled = false;
                //txtToDate.Enabled = false;
                //ImageButton1.Enabled = false;
                //ImageButton2.Enabled = false;
                GridView1.Visible = false;              
            }
          
        }

       
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindGrid();
        }

        protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView2.PageIndex = e.NewPageIndex;
            BindGrid();
        }
        
    }
}