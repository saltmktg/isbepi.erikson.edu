using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Security;

namespace HVP.ProgramDirector
{
    public partial class _default : System.Web.UI.Page
    {
        HVSurvey pd = new HVSurvey();
        DataRow row; 
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.Now.AddDays(-1));
            Response.Cache.SetNoStore();
            if (!IsPostBack)
            {
                Display();
            }
        }

        protected void Display()
        {
            string name = Page.User.Identity.Name;
            string userID = Membership.GetUser(name).ProviderUserKey.ToString();
            string sqlquerysiteID = " Select  PD.SiteID From [ISBEPI_DEV].[dbo].[ProgramDirector] PD RIGHT JOIN " +
                                    "[ISBEPI_DEV].[dbo].Staff ST " +
                                    "ON PD.Staff_ID = ST.Staff_ID WHERE ST.UserId ='" + userID + "' ;";
            DataTable dtsiteID = DBHelper.GetDataTable(sqlquerysiteID);
            if (dtsiteID.Rows.Count > 0)
            {
                string siteID = dtsiteID.Rows[0]["SiteID"].ToString();
                string sqlquery = "SELECT SCHD.Schd_ID, SCHD.SiteID, SCHD.VisitDate, UN.Name,PDS.Completed, coalesce( HVS.Survey_Count, 0) AS NumberOFSurvey " +
                                        "FROM Scheduling SCHD RIGHT JOIN UserNames UN " +
                                        "ON SCHD.NameID = UN.NameID " +
                                        "LEFT JOIN Program_Director_Survey PDS " +
                                        "ON PDS.Schd_ID = SCHD.Schd_ID " +
                                        "LEFT JOIN (SELECT COUNT(*) AS Survey_Count, Schd_ID " +
                                        "FROM HomeVisitorSiteVisitSurvey WHERE  Schd_ID =Schd_ID " +
                                        "GROUP BY Schd_ID) AS HVS ON HVS.Schd_ID = SCHD.Schd_ID " +
                                        "WHERE SCHD.SiteID= '" + siteID + "' " +
                                        "GROUP BY SCHD.Schd_ID, SCHD.SiteID, SCHD.VisitDate, UN.Name,PDS.Completed, HVS.Survey_Count";
                DataTable dtGetTable = DBHelper.GetDataTable(sqlquery);

                if (string.IsNullOrEmpty(dtGetTable.Rows[0]["Name"].ToString()) && string.IsNullOrEmpty(dtGetTable.Rows[0]["VisitDate"].ToString()))
                {
                    grdPDView.EmptyDataText = "No Upcoming Visit";
                    grdPDView.DataBind();

                }
                else
                {
                    grdPDView.DataSource = dtGetTable;
                    grdPDView.DataBind();
                }
            }
            else
            {
                Response.Redirect("~/UnauthorizedAccess.aspx");
            }

        }

       
        protected void grdPDView_RowDataBound(object sender, GridViewRowEventArgs e)
        {         
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblComplete = (Label)e.Row.FindControl("lblComplete");
                Label lblvisitDate = (Label)e.Row.FindControl("lblVisitDate");
                LinkButton lnkbtnsurvey = (LinkButton)e.Row.FindControl("lnkbtnNewSurvey");
                toGetInfo setinfo = new toGetInfo();
                setinfo.setVisitDate(lblvisitDate.Text); 
                if (string.IsNullOrEmpty(lblComplete.Text))
                {
                    lblComplete.Visible = false;
                    lnkbtnsurvey.Visible = true;

                }
                else if (!string.IsNullOrEmpty(lblComplete.Text))
                {
                    if (lblComplete.Text == "Completed")
                    {
                        lnkbtnsurvey.Visible = false;
                        lblComplete.Visible = true;
                    }
                    else
                    {
                        lnkbtnsurvey.Visible = true;
                        lblComplete.Visible = false;
                    }

                }
            }
        }

        protected void lnkbtnNewSurvey_Command(object sender, CommandEventArgs e)
        {
            toGetInfo getinfo = new toGetInfo();
            string schdid = e.CommandArgument.ToString();            
           
            string name = Page.User.Identity.Name;
            string userID = Membership.GetUser(name).ProviderUserKey.ToString();
            string sqlquerysiteID = " Select PD.Staff_ID, PD.SiteID From [ISBEPI_DEV].[dbo].[ProgramDirector] PD RIGHT JOIN " +
                                    "[ISBEPI_DEV].[dbo].Staff ST " +
                                    "ON PD.Staff_ID = ST.Staff_ID WHERE ST.UserId ='" + userID + "' ;";
            DataTable dt = DBHelper.GetDataTable(sqlquerysiteID);

            string sqlQueryGetSurveyStatus = "SELECT PD.Staff_ID, PD.Completed, PD.Schd_ID FROM  " +
                                                "[ISBEPI_DEV].[dbo].[Program_Director_Survey] PD WHERE PD.Schd_ID ='" + schdid + "'" +
                                                "AND PD.Staff_ID ='" + dt.Rows[0]["Staff_ID"].ToString() + "'";                                                
            DataTable dtgetStatus = DBHelper.GetDataTable(sqlQueryGetSurveyStatus);
            if (dtgetStatus.Rows.Count < 1)
            {
                //row = pd.Program_Director_Survey.NewRow();
                //row["Staff_ID"] = dt.Rows[0]["Staff_ID"].ToString();
                //row["Schd_ID"] = schdid;
                //row["StartedDate"] = DateTime.Now.ToShortDateString();
                //row["Completed"] = "Started";
                string sqlUpdate_NewRow = "INSERT INTO [ISBEPI_DEV].[dbo].[Program_Director_Survey] (Staff_ID, Schd_ID, StartedDate, Completed)"
                                         + " VALUES ('" + dt.Rows[0]["Staff_ID"].ToString() + "', '" + schdid + "', GETDATE(), 'Started');";
                int count = DBHelper.ExecuteSQL(sqlUpdate_NewRow);
                //pd.Program_Director_Survey.Rows.Add(row);
                //HVSurveyTableAdapters.Program_Director_SurveyTableAdapter PDSA = new HVSurveyTableAdapters.Program_Director_SurveyTableAdapter();
                //PDSA.Update(row);
                if (count > 0)
                {
                    toGetInfo setinfo = new toGetInfo();
                    setinfo.setSiteID(dt.Rows[0]["SiteID"].ToString());
                    Session["staffid"] = dt.Rows[0]["Staff_ID"].ToString();
                    setinfo.setSchdID(schdid);
                    setinfo.setStarted(false);
                    Response.Redirect("~/ProgramDirector/DirectorSurvey.aspx");
                }
                else
                {
                    Response.Redirect("~/UnauthorizedAccess.aspx");
                }
            }
            else
            {              
                toGetInfo setinfo = new toGetInfo();
                setinfo.setSiteID(dt.Rows[0]["SiteID"].ToString());
                Session["staffid"] = dt.Rows[0]["Staff_ID"].ToString();
                setinfo.setSchdID(schdid);
                setinfo.setStarted(true);
                Response.Redirect("~/ProgramDirector/DirectorSurvey.aspx");
            }
        }
    }
}