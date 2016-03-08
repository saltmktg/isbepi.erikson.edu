using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HVP.ISBEStaff
{
    public partial class SiteStatusChecklist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                hfsiteid.Value = Session["Site_ID"] == null ? "" : Session["Site_ID"].ToString();
                hfSchdId.Value = Session["Schd_Id"] == null ? "" : Session["Schd_Id"].ToString();
                if (hfsiteid.Value.Length > 0)
                {
                    string sqlquerySite = "SELECT Sites,Program_ID FROM Sites WHERE SiteID=" + hfsiteid.Value;
                    DataTable dt = DBHelper.GetDataTable(sqlquerySite);
                    lblSitename.Text = dt.Rows[0]["Sites"].ToString();
                    lblProgramId.Text = dt.Rows[0]["Program_ID"].ToString();
                    if (hfSchdId.Value.Length > 0)
                    {
                        string sqlqueryschd = "SELECT CASE WHEN (VisitDate IS NULL) THEN 'Not Schedule' ELSE CAST(VisitDate AS VARCHAR) END VisitDate,"
                                                + "ISNULL([IsbeLetter_toSite],0) IsbeLetter_toSite,"
                                                + "ISNULL([InitialCall],0) InitialCall"
                                                + ",ISNULL([SiteVistScheduled],0) SiteVistScheduled"
                                                + ",ISNULL([PrepCall],0) PrepCall"
                                                + ",ISNULL([DocReceived],0) DocReceived"
                                                + ",ISNULL([SiteVistCompleted],0) SiteVistCompleted"
                                                + ",ISNULL([VideoSubmitted],0) VideoSubmitted"
                                                + ",ISNULL([FeedBackCallSchd],0) FeedBackCallSchd"
                                                + ",ISNULL([FeedbackCallCompleted],0) FeedbackCallCompleted"
                                                + " FROM [ISBEPI_DEV].[dbo].[Scheduling] WHERE Schd_ID=" + hfSchdId.Value;
                        string sqlqueryhvsurvey = "SELECT count(*) AS Count FROM [dbo].[HomeVisitorSiteVisitSurvey] WHERE Schd_ID =" + hfSchdId.Value;
                        string sqlqueryPDsurvey = "SELECT CASE WHEN Completed = 'Completed' THEN 'true' ELSE 'false' END AS Completed " +
                                                "FROM [dbo].[Program_Director_Survey] PD right join Scheduling schd "
                                                 + "on schd.Schd_ID = PD.Schd_ID WHERE schd.Schd_ID =" + hfSchdId.Value;
                        string sqlqueryPIQRI = "SELECT DISTINCT CASE WHEN pd.Schd_ID IS NULL AND HV.Schd_ID IS NULL THEN 'false' ELSE 'true' "
                                               + " END AS Confirm FROM PDInterview pd INNER JOIN HomeVisitorInterview HV ON pd.Schd_ID = HV.Schd_ID"
                                                + " RIGHT JOIN Scheduling SCHD ON SCHD.Schd_ID = pd.Schd_ID AND SCHD.Schd_ID = HV.Schd_ID"
                                                  + " WHERE SCHD.Schd_ID =" + hfSchdId.Value;
                        string sqlqueryPicc = "SELECT CASE WHEN picc.Schd_ID IS NULL THEN 'false' ELSE 'true' END AS Confirm  FROM PiccTool picc "
                                            + " RIGHT JOIN Scheduling SCHD ON SCHD.Schd_ID = picc.Schd_ID WHERE SCHD.Schd_ID =" + hfSchdId.Value;
                        DataTable dtSchd = DBHelper.GetDataTable(sqlqueryschd);
                        DataTable dtHvSurvey = DBHelper.GetDataTable(sqlqueryhvsurvey);
                        DataTable dtPdSurvey = DBHelper.GetDataTable(sqlqueryPDsurvey);
                        DataTable dtPiqri = DBHelper.GetDataTable(sqlqueryPIQRI);
                        DataTable dtPicc = DBHelper.GetDataTable(sqlqueryPicc);

                        chkSiteVisitScheduled.Checked = Convert.ToBoolean(dtSchd.Rows[0]["SiteVistScheduled"].ToString());
                        if (dtSchd.Rows[0]["VisitDate"].ToString().Equals("Not Schedule"))
                        {
                            lblSchdDate.Text = dtSchd.Rows[0]["VisitDate"].ToString();
                        }
                        else
                        {
                            lblSchdDate.Text = DateTime.Parse(dtSchd.Rows[0]["VisitDate"].ToString()).ToShortDateString();
                        }
                        int count = Convert.ToInt32(dtHvSurvey.Rows[0]["Count"].ToString());
                        if (count > 0)
                        {
                            chkHVSurvry.Checked = true;
                            lblHVSurveyCount.Text = count.ToString();
                        }
                        else
                        {
                            chkHVSurvry.Checked = false;
                            lblHVSurveyCount.Text = count.ToString();
                        }
                        chkPDSurvey.Checked = Convert.ToBoolean(dtPdSurvey.Rows[0]["Completed"].ToString());
                        lblPDSurveyCompleted.Text = dtPdSurvey.Rows[0]["Completed"].ToString().Replace("true", "Completed").Replace("false", "Not Completed");
                        chkPIQRIInterView.Checked = Convert.ToBoolean(dtPiqri.Rows[0]["Confirm"].ToString());
                        chkPicc.Checked = Convert.ToBoolean(dtPicc.Rows[0]["Confirm"].ToString());

                        chkIsbeLettertoSite.Checked = Convert.ToBoolean(dtSchd.Rows[0]["IsbeLetter_toSite"].ToString());
                        chkInitialCall.Checked = Convert.ToBoolean(dtSchd.Rows[0]["InitialCall"].ToString());
                        chkPrepCall.Checked = Convert.ToBoolean(dtSchd.Rows[0]["PrepCall"].ToString());
                        chkDocReceived.Checked = Convert.ToBoolean(dtSchd.Rows[0]["DocReceived"].ToString());
                        chkSiteVisitCompleted.Checked = Convert.ToBoolean(dtSchd.Rows[0]["SiteVistCompleted"].ToString());
                        chkVideo.Checked = Convert.ToBoolean(dtSchd.Rows[0]["VideoSubmitted"].ToString());
                        chkFeedbackCallSchd.Checked = Convert.ToBoolean(dtSchd.Rows[0]["FeedBackCallSchd"].ToString());
                        chkFeedbackCallCompleted.Checked = Convert.ToBoolean(dtSchd.Rows[0]["FeedbackCallCompleted"].ToString());
                    }
                }
            }
        }

    }
}
