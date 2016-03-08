using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HVP
{
    public partial class DirectorSurvey1 : System.Web.UI.Page
    {

        
        DataRow row;
        bool check;
        HVSurvey pd = new HVSurvey();
        private DataRow dr;
        private DataTable saveTable = new DataTable();
        int value1, value2, value3, value4, value5, value6, value7, value8, value9;
        HVSurveyTableAdapters.Program_Director_SurveyTableAdapter PD = new HVSurveyTableAdapters.Program_Director_SurveyTableAdapter();
        HVSurveyTableAdapters.Program_Director_Survey_Q12toQ16_Education_And_ExperienceTableAdapter DsEducation = new HVSurveyTableAdapters.Program_Director_Survey_Q12toQ16_Education_And_ExperienceTableAdapter();
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Cache.SetExpires(DateTime.UtcNow.AddDays(-1));
            HttpContext.Current.Response.Cache.SetValidUntilExpires(false);
            HttpContext.Current.Response.Cache.SetRevalidation(HttpCacheRevalidation.AllCaches);
            HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            HttpContext.Current.Response.Cache.SetNoStore();
            if (!IsPostBack)
            {    
                MultiView1.ActiveViewIndex = 0;
                Display();
                getInsertData();
            }
        }
        
        protected void Display()
        {
            toGetInfo getinfo = new toGetInfo();
            hfSchdID.Value =  getinfo.getSchdID();
            hfSIteID.Value = getinfo.getValueSiteID();
            hfStaffID.Value = Session["staffid"].ToString();
            Session["staffid"] = null;
            getinfo.setSchdID(null);
            getinfo.setSiteID(null);
            if (hfSIteID.Value.Length > 0 && hfSchdID.Value.Length > 0)
            {               
                string sqlquery = "SELECT [Question_ID], [Question], Label_ID FROM [ISBEPI_DEV].[dbo].[PROGRAM_DIRECTOR_SURVEY_QUESTIONS] WHERE [Label_ID] IN ( 'lblQ1','lblQ2','lblQ3','lblQ4','lblQ5','lblQ6','lblQ7','lblQ8','lblQ9','lblQ10','lblQ11');";
                DataTable dt = DBHelper.GetDataTable(sqlquery);
                Label lblQ = new Label();
                for (int x = 0; x < dt.Rows.Count; x++)
                {
                    if (dt.Rows[x]["Question_ID"].ToString().Trim() == "Q7")
                    {
                        lblQ = this.Master.FindControl("ContentPlaceHolder1").FindControl(dt.Rows[x]["Label_ID"].ToString().Trim()) as Label;
                        const int july = 7;
                        //const int june = 1;
                        if (DateTime.Now.Month == july)
                        {
                            string update = dt.Rows[x]["Question"].ToString().Replace("July 2014-June 2015", "July " + DateTime.Now.Year.ToString() + "-June " + DateTime.Now.AddYears(1).Year.ToString() + "");
                            string sqlupdate = "UPDATE [PROGRAM_DIRECTOR_SURVEY_QUESTIONS] SET [Question] ='" + update + "' WHERE Question_ID ='Q7'";
                            DBHelper.ExecuteSQL(sqlupdate);
                            string sqlqueryq7 = "SELECT * FROM [PROGRAM_DIRECTOR_SURVEY_QUESTIONS] WHERE Question_ID ='Q7'";
                            DataTable dtq7 = DBHelper.GetDataTable(sqlqueryq7);
                            lblQ.Text = dtq7.Rows[0]["Question"].ToString();
                           
                        }
                        else
                        {
                            lblQ.Text = dt.Rows[x]["Question"].ToString();
                        }
                    }
                    else
                    {
                        lblQ = this.Master.FindControl("ContentPlaceHolder1").FindControl(dt.Rows[x]["Label_ID"].ToString().Trim()) as Label;
                        lblQ.Text = dt.Rows[x]["Question"].ToString();
                    }
                }
                lblQ5_Yes_or_No.Text = "Do you Speak any languages, other than English, that you speak fluently?";               
            }
            else
            {
                Response.Redirect("~/ProgramDirector/default.aspx");
            }
        }  

      
        protected void getInsertData()
        {

            string sqlquery = "SELECT * FROM [ISBEPI_DEV].[dbo].[Program_Director_Survey] WHERE [ISBEPI_DEV].[dbo].[Program_Director_Survey].[Schd_ID]='" + hfSchdID.Value + "' AND Staff_ID='" + hfStaffID.Value + "'";
            DataTable dt = DBHelper.GetDataTable(sqlquery);

            if (hfSchdID.Value.Length > 0 && hfSIteID.Value.Length > 0)
            {
                for (int r = 0; r < dt.Rows.Count; r++)
                {

                    if (dt.Rows[r]["Schd_ID"].ToString() == hfSchdID.Value)
                    {
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_DEMOGRAPHICS_BASICPROGRAMINFORMATION_Q1"].ToString()))
                        {
                            txtQ1.Text = dt.Rows[r]["PD_DEMOGRAPHICS_BASICPROGRAMINFORMATION_Q1"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_DEMOGRAPHICS_BASICPROGRAMINFORMATION_Q2"].ToString()))
                        {
                            rdobtnlstQ2.SelectedValue = dt.Rows[r]["PD_DEMOGRAPHICS_BASICPROGRAMINFORMATION_Q2"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_DEMOGRAPHICS_BASICPROGRAMINFORMATION_Q3"].ToString()))
                        {
                            txtQ3.Text = dt.Rows[r]["PD_DEMOGRAPHICS_BASICPROGRAMINFORMATION_Q3"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_DEMOGRAPHICS_BASICPROGRAMINFORMATION_Q4"].ToString()))
                        {
                            rdobtnlstQ4.SelectedValue = dt.Rows[r]["PD_DEMOGRAPHICS_BASICPROGRAMINFORMATION_Q4"].ToString();
                            if (!string.IsNullOrEmpty(dt.Rows[r]["PD_DEMOGRAPHICS_BASICPROGRAMINFORMATION_Q4_Other"].ToString()))
                            {
                                txtQ4Explain.Text = dt.Rows[r]["PD_DEMOGRAPHICS_BASICPROGRAMINFORMATION_Q4_Other"].ToString();
                            }
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_DEMOGRAPHICS_BASICPROGRAMINFORMATION_Q5_Yes_or_no"].ToString()))
                        {
                            if (Convert.ToBoolean(dt.Rows[r]["PD_DEMOGRAPHICS_BASICPROGRAMINFORMATION_Q5_Yes_or_no"].ToString()))
                            {
                                rdobtnlst_Yes_or_No.SelectedValue = "1";
                            }
                            else
                            {
                                rdobtnlst_Yes_or_No.SelectedValue = "0";
                            }

                            if (rdobtnlst_Yes_or_No.SelectedValue == "1")
                            {
                                chkbxlstQ5.DataBind();
                                txtQ5Explain.Visible = true;
                                chkbxlstQ5.Visible = true;

                                for (int x = 0; x < chkbxlstQ5.Items.Count; x++)
                                {
                                    int add = x + 1;
                                    //if (!string.IsNullOrEmpty(dt.Rows[r]["PD_DEMOGRAPHICS_BASICPROGRAMINFORMATION_Q5_" + add].ToString()))
                                    //{
                                    chkbxlstQ5.Items[x].Selected = Convert.ToBoolean(dt.Rows[r]["PD_DEMOGRAPHICS_BASICPROGRAMINFORMATION_Q5_" + add].ToString());
                                    //}
                                }
                            }
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_DEMOGRAPHICS_BASICPROGRAMINFORMATION_Q5_5_OTher"].ToString()) && !string.IsNullOrEmpty(dt.Rows[r]["PD_DEMOGRAPHICS_BASICPROGRAMINFORMATION_Q5_5"].ToString()))
                        {
                            txtQ5Explain.Text = dt.Rows[r]["PD_DEMOGRAPHICS_BASICPROGRAMINFORMATION_Q5_5_OTher"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_DEMOGRAPHICS_BASICPROGRAMINFORMATION_Q6"].ToString()))
                        {
                            rdobtnlstQ6.SelectedValue = dt.Rows[r]["PD_DEMOGRAPHICS_BASICPROGRAMINFORMATION_Q6"].ToString();

                            if (!string.IsNullOrEmpty(dt.Rows[r]["PD_DEMOGRAPHICS_BASICPROGRAMINFORMATION_Q6_Other"].ToString()))
                            {
                                txtQ6Explain.Text = dt.Rows[r]["PD_DEMOGRAPHICS_BASICPROGRAMINFORMATION_Q6_Other"].ToString();
                            }
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_FAMILYINFORMATION_Q7"].ToString()))
                        {
                            txtQ7.Text = dt.Rows[r]["PD_FAMILYINFORMATION_Q7"].ToString();
                        }

                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_FAMILYINFORMATION_Q8_1"].ToString()))
                        {
                            txtQ8_1.Text = dt.Rows[r]["PD_FAMILYINFORMATION_Q8_1"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_FAMILYINFORMATION_Q8_2"].ToString()))
                        {
                            txtQ8_2.Text = dt.Rows[r]["PD_FAMILYINFORMATION_Q8_2"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_FAMILYINFORMATION_Q8_3"].ToString()))
                        {
                            txtQ8_3.Text = dt.Rows[r]["PD_FAMILYINFORMATION_Q8_3"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_FAMILYINFORMATION_Q8_4"].ToString()))
                        {
                            txtQ8_4.Text = dt.Rows[r]["PD_FAMILYINFORMATION_Q8_4"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_FAMILYINFORMATION_Q8_5"].ToString()))
                        {
                            txtQ8_5.Text = dt.Rows[r]["PD_FAMILYINFORMATION_Q8_5"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_FAMILYINFORMATION_Q8_6"].ToString()))
                        {
                            txtQ8_6.Text = dt.Rows[r]["PD_FAMILYINFORMATION_Q8_6"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_FAMILYINFORMATION_Q8_7"].ToString()))
                        {
                            txtQ8_7.Text = dt.Rows[r]["PD_FAMILYINFORMATION_Q8_7"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_FAMILYINFORMATION_Q8_Total"].ToString()))
                        {
                            txtQ8_Total.Text = dt.Rows[r]["PD_FAMILYINFORMATION_Q8_Total"].ToString();
                        }

                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_FAMILYINFORMATION_Q9_1"].ToString()))
                        {
                            txtQ9_1.Text = dt.Rows[r]["PD_FAMILYINFORMATION_Q9_1"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_FAMILYINFORMATION_Q9_2"].ToString()))
                        {
                            txtQ9_2.Text = dt.Rows[r]["PD_FAMILYINFORMATION_Q9_2"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_FAMILYINFORMATION_Q9_3"].ToString()))
                        {
                            txtQ9_3.Text = dt.Rows[r]["PD_FAMILYINFORMATION_Q9_3"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_FAMILYINFORMATION_Q9_4"].ToString()))
                        {
                            txtQ9_4.Text = dt.Rows[r]["PD_FAMILYINFORMATION_Q9_4"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_FAMILYINFORMATION_Q9_5"].ToString()))
                        {
                            txtQ9_5.Text = dt.Rows[r]["PD_FAMILYINFORMATION_Q9_5"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_FAMILYINFORMATION_Q9_6"].ToString()))
                        {
                            txtQ9_6.Text = dt.Rows[r]["PD_FAMILYINFORMATION_Q9_6"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_FAMILYINFORMATION_Q9_Total"].ToString()))
                        {
                            txtQ9_Total.Text = dt.Rows[r]["PD_FAMILYINFORMATION_Q9_Total"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_FAMILYINFORMATION_Q10_1"].ToString())
                            && !string.IsNullOrEmpty(dt.Rows[r]["PD_FAMILYINFORMATION_Q10_2"].ToString())
                            && !string.IsNullOrEmpty(dt.Rows[r]["PD_FAMILYINFORMATION_Q10_3"].ToString())
                            && !string.IsNullOrEmpty(dt.Rows[r]["PD_FAMILYINFORMATION_Q10_4"].ToString())
                            && !string.IsNullOrEmpty(dt.Rows[r]["PD_FAMILYINFORMATION_Q10_5"].ToString())
                            && !string.IsNullOrEmpty(dt.Rows[r]["PD_FAMILYINFORMATION_Q10_Total"].ToString()))
                        {
                            txtQ10_1.Text = dt.Rows[r]["PD_FAMILYINFORMATION_Q10_1"].ToString();
                            txtQ10_2.Text = dt.Rows[r]["PD_FAMILYINFORMATION_Q10_2"].ToString();
                            txtQ10_3.Text = dt.Rows[r]["PD_FAMILYINFORMATION_Q10_3"].ToString();
                            txtQ10_4.Text = dt.Rows[r]["PD_FAMILYINFORMATION_Q10_4"].ToString();
                            txtQ10_5.Text = dt.Rows[r]["PD_FAMILYINFORMATION_Q10_5"].ToString();
                            txtQ10_Total.Text = dt.Rows[r]["PD_FAMILYINFORMATION_Q10_Total"].ToString();
                        }
                        chkbxlstQ11.DataBind();

                        for (int x = 0; x < chkbxlstQ11.Items.Count; x++)
                        {
                            int add = x + 1;
                            //if (!string.IsNullOrEmpty(dt.Rows[r]["PD_FAMILYINFORMATION_Q11_" + add + "_temp"].ToString()))
                            //{
                                chkbxlstQ11.Items[x].Selected = Convert.ToBoolean(dt.Rows[r]["PD_FAMILYINFORMATION_Q11_" + add].ToString());
                            //}
                            
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_FAMILYINFORMATION_Q11_6_other"].ToString()))
                        {
                            txtQ11_Other.Text = dt.Rows[r]["PD_FAMILYINFORMATION_Q11_6_other"].ToString();
                        }
                        //Q19_1
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_INITIALTRAINING_Q19_1_CHILDDEVELOPMENT_1"].ToString()))
                        {
                            rdobtnlstQ19_1_1.SelectedValue = dt.Rows[r]["PD_INITIALTRAINING_Q19_1_CHILDDEVELOPMENT_1"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_INITIALTRAINING_Q19_1_CHILDDEVELOPMENT_2"].ToString()))
                        {
                            rdobtnlstQ19_1_2.SelectedValue = dt.Rows[r]["PD_INITIALTRAINING_Q19_1_CHILDDEVELOPMENT_2"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_INITIALTRAINING_Q19_1_CHILDDEVELOPMENT_3"].ToString()))
                        {
                            rdobtnlstQ19_1_3.SelectedValue = dt.Rows[r]["PD_INITIALTRAINING_Q19_1_CHILDDEVELOPMENT_3"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_INITIALTRAINING_Q19_1_CHILDDEVELOPMENT_4"].ToString()))
                        {
                            rdobtnlstQ19_1_4.SelectedValue = dt.Rows[r]["PD_INITIALTRAINING_Q19_1_CHILDDEVELOPMENT_4"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_INITIALTRAINING_Q19_1_CHILDDEVELOPMENT_5"].ToString()))
                        {
                            rdobtnlstQ19_1_5.SelectedValue = dt.Rows[r]["PD_INITIALTRAINING_Q19_1_CHILDDEVELOPMENT_5"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_INITIALTRAINING_Q19_1_CHILDDEVELOPMENT_6"].ToString()))
                        {
                            rdobtnlstQ19_1_6.SelectedValue = dt.Rows[r]["PD_INITIALTRAINING_Q19_1_CHILDDEVELOPMENT_6"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_INITIALTRAINING_Q19_1_CHILDDEVELOPMENT_7"].ToString()))
                        {
                            rdobtnlstQ19_1_7.SelectedValue = dt.Rows[r]["PD_INITIALTRAINING_Q19_1_CHILDDEVELOPMENT_7"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_INITIALTRAINING_Q19_1_CHILDDEVELOPMENT_8"].ToString()))
                        {
                            rdobtnlstQ19_1_8.SelectedValue = dt.Rows[r]["PD_INITIALTRAINING_Q19_1_CHILDDEVELOPMENT_8"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_INITIALTRAINING_Q19_1_CHILDDEVELOPMENT_9"].ToString()))
                        {
                            rdobtnlstQ19_1_9.SelectedValue = dt.Rows[r]["PD_INITIALTRAINING_Q19_1_CHILDDEVELOPMENT_9"].ToString();
                        }

                        //Q19_2
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_INITIALTRAINING_Q19_2_CHILDHEALTHANDSAFETY_1"].ToString()))
                        {
                            rdobtnlstQ19_2_1.SelectedValue = dt.Rows[r]["PD_INITIALTRAINING_Q19_2_CHILDHEALTHANDSAFETY_1"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_INITIALTRAINING_Q19_2_CHILDHEALTHANDSAFETY_2"].ToString()))
                        {
                            rdobtnlstQ19_2_2.SelectedValue = dt.Rows[r]["PD_INITIALTRAINING_Q19_2_CHILDHEALTHANDSAFETY_2"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_INITIALTRAINING_Q19_2_CHILDHEALTHANDSAFETY_3"].ToString()))
                        {
                            rdobtnlstQ19_2_3.SelectedValue = dt.Rows[r]["PD_INITIALTRAINING_Q19_2_CHILDHEALTHANDSAFETY_3"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_INITIALTRAINING_Q19_2_CHILDHEALTHANDSAFETY_4"].ToString()))
                        {
                            rdobtnlstQ19_2_4.SelectedValue = dt.Rows[r]["PD_INITIALTRAINING_Q19_2_CHILDHEALTHANDSAFETY_4"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_INITIALTRAINING_Q19_2_CHILDHEALTHANDSAFETY_5"].ToString()))
                        {
                            rdobtnlstQ19_2_5.SelectedValue = dt.Rows[r]["PD_INITIALTRAINING_Q19_2_CHILDHEALTHANDSAFETY_5"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_INITIALTRAINING_Q19_2_CHILDHEALTHANDSAFETY_6"].ToString()))
                        {
                            rdobtnlstQ19_2_6.SelectedValue = dt.Rows[r]["PD_INITIALTRAINING_Q19_2_CHILDHEALTHANDSAFETY_6"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_INITIALTRAINING_Q19_2_CHILDHEALTHANDSAFETY_7"].ToString()))
                        {
                            rdobtnlstQ19_2_7.SelectedValue = dt.Rows[r]["PD_INITIALTRAINING_Q19_2_CHILDHEALTHANDSAFETY_7"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_INITIALTRAINING_Q19_2_CHILDHEALTHANDSAFETY_8"].ToString()))
                        {
                            rdobtnlstQ19_2_8.SelectedValue = dt.Rows[r]["PD_INITIALTRAINING_Q19_2_CHILDHEALTHANDSAFETY_8"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_INITIALTRAINING_Q19_2_CHILDHEALTHANDSAFETY_9"].ToString()))
                        {
                            rdobtnlstQ19_2_9.SelectedValue = dt.Rows[r]["PD_INITIALTRAINING_Q19_2_CHILDHEALTHANDSAFETY_9"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_INITIALTRAINING_Q19_2_CHILDHEALTHANDSAFETY_10"].ToString()))
                        {
                            rdobtnlstQ19_2_10.SelectedValue = dt.Rows[r]["PD_INITIALTRAINING_Q19_2_CHILDHEALTHANDSAFETY_10"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_INITIALTRAINING_Q19_2_CHILDHEALTHANDSAFETY_11"].ToString()))
                        {
                            rdobtnlstQ19_2_11.SelectedValue = dt.Rows[r]["PD_INITIALTRAINING_Q19_2_CHILDHEALTHANDSAFETY_11"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_INITIALTRAINING_Q19_2_CHILDHEALTHANDSAFETY_12"].ToString()))
                        {
                            rdobtnlstQ19_2_12.SelectedValue = dt.Rows[r]["PD_INITIALTRAINING_Q19_2_CHILDHEALTHANDSAFETY_12"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_INITIALTRAINING_Q19_2_CHILDHEALTHANDSAFETY_13"].ToString()))
                        {
                            rdobtnlstQ19_2_13.SelectedValue = dt.Rows[r]["PD_INITIALTRAINING_Q19_2_CHILDHEALTHANDSAFETY_13"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_INITIALTRAINING_Q19_2_CHILDHEALTHANDSAFETY_14"].ToString()))
                        {
                            rdobtnlstQ19_2_14.SelectedValue = dt.Rows[r]["PD_INITIALTRAINING_Q19_2_CHILDHEALTHANDSAFETY_14"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_INITIALTRAINING_Q19_2_CHILDHEALTHANDSAFETY_15"].ToString()))
                        {
                            rdobtnlstQ19_2_15.SelectedValue = dt.Rows[r]["PD_INITIALTRAINING_Q19_2_CHILDHEALTHANDSAFETY_15"].ToString();
                        }

                        //Q19_3
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_INITIALTRAINING_Q19_3_PARENTCHILDRELATINONSHIPS_1"].ToString()))
                        {
                            rdobtnlstQ19_3_1.SelectedValue = dt.Rows[r]["PD_INITIALTRAINING_Q19_3_PARENTCHILDRELATINONSHIPS_1"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_INITIALTRAINING_Q19_3_PARENTCHILDRELATINONSHIPS_2"].ToString()))
                        {
                            rdobtnlstQ19_3_2.SelectedValue = dt.Rows[r]["PD_INITIALTRAINING_Q19_3_PARENTCHILDRELATINONSHIPS_2"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_INITIALTRAINING_Q19_3_PARENTCHILDRELATINONSHIPS_3"].ToString()))
                        {
                            rdobtnlstQ19_3_3.SelectedValue = dt.Rows[r]["PD_INITIALTRAINING_Q19_3_PARENTCHILDRELATINONSHIPS_3"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_INITIALTRAINING_Q19_3_PARENTCHILDRELATINONSHIPS_4"].ToString()))
                        {
                            rdobtnlstQ19_3_4.SelectedValue = dt.Rows[r]["PD_INITIALTRAINING_Q19_3_PARENTCHILDRELATINONSHIPS_4"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_INITIALTRAINING_Q19_3_PARENTCHILDRELATINONSHIPS_5"].ToString()))
                        {
                            rdobtnlstQ19_3_5.SelectedValue = dt.Rows[r]["PD_INITIALTRAINING_Q19_3_PARENTCHILDRELATINONSHIPS_5"].ToString();
                        }

                        //Q20_1
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_ONGOINGTRAINING_Q20_1_CHILDDEVELOPMENT_1"].ToString()))
                        {
                            rdobtnlstQ20_1_1.SelectedValue = dt.Rows[r]["PD_ONGOINGTRAINING_Q20_1_CHILDDEVELOPMENT_1"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_ONGOINGTRAINING_Q20_1_CHILDDEVELOPMENT_2"].ToString()))
                        {
                            rdobtnlstQ20_1_2.SelectedValue = dt.Rows[r]["PD_ONGOINGTRAINING_Q20_1_CHILDDEVELOPMENT_2"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_ONGOINGTRAINING_Q20_1_CHILDDEVELOPMENT_3"].ToString()))
                        {
                            rdobtnlstQ20_1_3.SelectedValue = dt.Rows[r]["PD_ONGOINGTRAINING_Q20_1_CHILDDEVELOPMENT_3"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_ONGOINGTRAINING_Q20_1_CHILDDEVELOPMENT_4"].ToString()))
                        {
                            rdobtnlstQ20_1_4.SelectedValue = dt.Rows[r]["PD_ONGOINGTRAINING_Q20_1_CHILDDEVELOPMENT_4"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_ONGOINGTRAINING_Q20_1_CHILDDEVELOPMENT_5"].ToString()))
                        {
                            rdobtnlstQ20_1_5.SelectedValue = dt.Rows[r]["PD_ONGOINGTRAINING_Q20_1_CHILDDEVELOPMENT_5"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_ONGOINGTRAINING_Q20_1_CHILDDEVELOPMENT_6"].ToString()))
                        {
                            rdobtnlstQ20_1_6.SelectedValue = dt.Rows[r]["PD_ONGOINGTRAINING_Q20_1_CHILDDEVELOPMENT_6"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_ONGOINGTRAINING_Q20_1_CHILDDEVELOPMENT_7"].ToString()))
                        {
                            rdobtnlstQ20_1_7.SelectedValue = dt.Rows[r]["PD_ONGOINGTRAINING_Q20_1_CHILDDEVELOPMENT_7"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_ONGOINGTRAINING_Q20_1_CHILDDEVELOPMENT_8"].ToString()))
                        {
                            rdobtnlstQ20_1_8.SelectedValue = dt.Rows[r]["PD_ONGOINGTRAINING_Q20_1_CHILDDEVELOPMENT_8"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_ONGOINGTRAINING_Q20_1_CHILDDEVELOPMENT_9"].ToString()))
                        {
                            rdobtnlstQ20_1_9.SelectedValue = dt.Rows[r]["PD_ONGOINGTRAINING_Q20_1_CHILDDEVELOPMENT_9"].ToString();
                        }

                        //Q20_2
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_ONGOINGTRAINING_Q20_2_CHILDHEALTHANDSAFETY_1"].ToString()))
                        {
                            rdobtnlstQ20_2_1.SelectedValue = dt.Rows[r]["PD_ONGOINGTRAINING_Q20_2_CHILDHEALTHANDSAFETY_1"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_ONGOINGTRAINING_Q20_2_CHILDHEALTHANDSAFETY_2"].ToString()))
                        {
                            rdobtnlstQ20_2_2.SelectedValue = dt.Rows[r]["PD_ONGOINGTRAINING_Q20_2_CHILDHEALTHANDSAFETY_2"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_ONGOINGTRAINING_Q20_2_CHILDHEALTHANDSAFETY_3"].ToString()))
                        {
                            rdobtnlstQ20_2_3.SelectedValue = dt.Rows[r]["PD_ONGOINGTRAINING_Q20_2_CHILDHEALTHANDSAFETY_3"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_ONGOINGTRAINING_Q20_2_CHILDHEALTHANDSAFETY_4"].ToString()))
                        {
                            rdobtnlstQ20_2_4.SelectedValue = dt.Rows[r]["PD_ONGOINGTRAINING_Q20_2_CHILDHEALTHANDSAFETY_4"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_ONGOINGTRAINING_Q20_2_CHILDHEALTHANDSAFETY_5"].ToString()))
                        {
                            rdobtnlstQ20_2_5.SelectedValue = dt.Rows[r]["PD_ONGOINGTRAINING_Q20_2_CHILDHEALTHANDSAFETY_5"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_ONGOINGTRAINING_Q20_2_CHILDHEALTHANDSAFETY_6"].ToString()))
                        {
                            rdobtnlstQ20_2_6.SelectedValue = dt.Rows[r]["PD_ONGOINGTRAINING_Q20_2_CHILDHEALTHANDSAFETY_6"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_ONGOINGTRAINING_Q20_2_CHILDHEALTHANDSAFETY_7"].ToString()))
                        {
                            rdobtnlstQ20_2_7.SelectedValue = dt.Rows[r]["PD_ONGOINGTRAINING_Q20_2_CHILDHEALTHANDSAFETY_7"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_ONGOINGTRAINING_Q20_2_CHILDHEALTHANDSAFETY_8"].ToString()))
                        {
                            rdobtnlstQ20_2_8.SelectedValue = dt.Rows[r]["PD_ONGOINGTRAINING_Q20_2_CHILDHEALTHANDSAFETY_8"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_ONGOINGTRAINING_Q20_2_CHILDHEALTHANDSAFETY_9"].ToString()))
                        {
                            rdobtnlstQ20_2_9.SelectedValue = dt.Rows[r]["PD_ONGOINGTRAINING_Q20_2_CHILDHEALTHANDSAFETY_9"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_ONGOINGTRAINING_Q20_2_CHILDHEALTHANDSAFETY_10"].ToString()))
                        {
                            rdobtnlstQ20_2_10.SelectedValue = dt.Rows[r]["PD_ONGOINGTRAINING_Q20_2_CHILDHEALTHANDSAFETY_10"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_ONGOINGTRAINING_Q20_2_CHILDHEALTHANDSAFETY_11"].ToString()))
                        {
                            rdobtnlstQ20_2_11.SelectedValue = dt.Rows[r]["PD_ONGOINGTRAINING_Q20_2_CHILDHEALTHANDSAFETY_11"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_ONGOINGTRAINING_Q20_2_CHILDHEALTHANDSAFETY_12"].ToString()))
                        {
                            rdobtnlstQ20_2_12.SelectedValue = dt.Rows[r]["PD_ONGOINGTRAINING_Q20_2_CHILDHEALTHANDSAFETY_12"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_ONGOINGTRAINING_Q20_2_CHILDHEALTHANDSAFETY_13"].ToString()))
                        {
                            rdobtnlstQ20_2_13.SelectedValue = dt.Rows[r]["PD_ONGOINGTRAINING_Q20_2_CHILDHEALTHANDSAFETY_13"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_ONGOINGTRAINING_Q20_2_CHILDHEALTHANDSAFETY_14"].ToString()))
                        {
                            rdobtnlstQ20_2_14.SelectedValue = dt.Rows[r]["PD_ONGOINGTRAINING_Q20_2_CHILDHEALTHANDSAFETY_14"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_ONGOINGTRAINING_Q20_2_CHILDHEALTHANDSAFETY_15"].ToString()))
                        {
                            rdobtnlstQ20_2_15.SelectedValue = dt.Rows[r]["PD_ONGOINGTRAINING_Q20_2_CHILDHEALTHANDSAFETY_15"].ToString();
                        }

                        //Q20_3
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_ONGOINGTRAINING_Q20_3_PARENTCHILDRELATINONSHIPS_1"].ToString()))
                        {
                            rdobtnlstQ20_3_1.SelectedValue = dt.Rows[r]["PD_ONGOINGTRAINING_Q20_3_PARENTCHILDRELATINONSHIPS_1"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_ONGOINGTRAINING_Q20_3_PARENTCHILDRELATINONSHIPS_2"].ToString()))
                        {
                            rdobtnlstQ20_3_2.SelectedValue = dt.Rows[r]["PD_ONGOINGTRAINING_Q20_3_PARENTCHILDRELATINONSHIPS_2"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_ONGOINGTRAINING_Q20_3_PARENTCHILDRELATINONSHIPS_3"].ToString()))
                        {
                            rdobtnlstQ20_3_3.SelectedValue = dt.Rows[r]["PD_ONGOINGTRAINING_Q20_3_PARENTCHILDRELATINONSHIPS_3"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_ONGOINGTRAINING_Q20_3_PARENTCHILDRELATINONSHIPS_4"].ToString()))
                        {
                            rdobtnlstQ20_3_4.SelectedValue = dt.Rows[r]["PD_ONGOINGTRAINING_Q20_3_PARENTCHILDRELATINONSHIPS_4"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_ONGOINGTRAINING_Q20_3_PARENTCHILDRELATINONSHIPS_5"].ToString()))
                        {
                            rdobtnlstQ20_3_5.SelectedValue = dt.Rows[r]["PD_ONGOINGTRAINING_Q20_3_PARENTCHILDRELATINONSHIPS_5"].ToString();
                        }

                        //Q21_1
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_1_CHILDDEVELOPMENT_1"].ToString()))
                        {
                            rdobtnlstQ21_1_1.SelectedValue = dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_1_CHILDDEVELOPMENT_1"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_1_CHILDDEVELOPMENT_2"].ToString()))
                        {
                            rdobtnlstQ21_1_2.SelectedValue = dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_1_CHILDDEVELOPMENT_2"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_1_CHILDDEVELOPMENT_3"].ToString()))
                        {
                            rdobtnlstQ21_1_3.SelectedValue = dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_1_CHILDDEVELOPMENT_3"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_1_CHILDDEVELOPMENT_4"].ToString()))
                        {
                            rdobtnlstQ21_1_4.SelectedValue = dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_1_CHILDDEVELOPMENT_4"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_1_CHILDDEVELOPMENT_5"].ToString()))
                        {
                            rdobtnlstQ21_1_5.SelectedValue = dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_1_CHILDDEVELOPMENT_5"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_1_CHILDDEVELOPMENT_6"].ToString()))
                        {
                            rdobtnlstQ21_1_6.SelectedValue = dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_1_CHILDDEVELOPMENT_6"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_1_CHILDDEVELOPMENT_7"].ToString()))
                        {
                            rdobtnlstQ21_1_7.SelectedValue = dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_1_CHILDDEVELOPMENT_7"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_1_CHILDDEVELOPMENT_8"].ToString()))
                        {
                            rdobtnlstQ21_1_8.SelectedValue = dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_1_CHILDDEVELOPMENT_8"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_1_CHILDDEVELOPMENT_9"].ToString()))
                        {
                            rdobtnlstQ21_1_9.SelectedValue = dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_1_CHILDDEVELOPMENT_9"].ToString();
                        }

                        //Q21_2
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_2_CHILDHEALTHANDSAFETY_1"].ToString()))
                        {
                            rdobtnlstQ21_2_1.SelectedValue = dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_2_CHILDHEALTHANDSAFETY_1"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_2_CHILDHEALTHANDSAFETY_2"].ToString()))
                        {
                            rdobtnlstQ21_2_2.SelectedValue = dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_2_CHILDHEALTHANDSAFETY_2"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_2_CHILDHEALTHANDSAFETY_3"].ToString()))
                        {
                            rdobtnlstQ21_2_3.SelectedValue = dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_2_CHILDHEALTHANDSAFETY_3"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_2_CHILDHEALTHANDSAFETY_4"].ToString()))
                        {
                            rdobtnlstQ21_2_4.SelectedValue = dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_2_CHILDHEALTHANDSAFETY_4"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_2_CHILDHEALTHANDSAFETY_5"].ToString()))
                        {
                            rdobtnlstQ21_2_5.SelectedValue = dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_2_CHILDHEALTHANDSAFETY_5"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_2_CHILDHEALTHANDSAFETY_6"].ToString()))
                        {
                            rdobtnlstQ21_2_6.SelectedValue = dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_2_CHILDHEALTHANDSAFETY_6"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_2_CHILDHEALTHANDSAFETY_7"].ToString()))
                        {
                            rdobtnlstQ21_2_7.SelectedValue = dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_2_CHILDHEALTHANDSAFETY_7"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_2_CHILDHEALTHANDSAFETY_8"].ToString()))
                        {
                            rdobtnlstQ21_2_8.SelectedValue = dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_2_CHILDHEALTHANDSAFETY_8"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_2_CHILDHEALTHANDSAFETY_9"].ToString()))
                        {
                            rdobtnlstQ21_2_9.SelectedValue = dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_2_CHILDHEALTHANDSAFETY_9"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_2_CHILDHEALTHANDSAFETY_10"].ToString()))
                        {
                            rdobtnlstQ21_2_10.SelectedValue = dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_2_CHILDHEALTHANDSAFETY_10"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_2_CHILDHEALTHANDSAFETY_11"].ToString()))
                        {
                            rdobtnlstQ21_2_11.SelectedValue = dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_2_CHILDHEALTHANDSAFETY_11"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_2_CHILDHEALTHANDSAFETY_12"].ToString()))
                        {
                            rdobtnlstQ21_2_12.SelectedValue = dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_2_CHILDHEALTHANDSAFETY_12"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_2_CHILDHEALTHANDSAFETY_13"].ToString()))
                        {
                            rdobtnlstQ21_2_13.SelectedValue = dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_2_CHILDHEALTHANDSAFETY_13"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_2_CHILDHEALTHANDSAFETY_14"].ToString()))
                        {
                            rdobtnlstQ21_2_14.SelectedValue = dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_2_CHILDHEALTHANDSAFETY_14"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_2_CHILDHEALTHANDSAFETY_15"].ToString()))
                        {
                            rdobtnlstQ21_2_15.SelectedValue = dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_2_CHILDHEALTHANDSAFETY_15"].ToString();
                        }

                        //Q21_3
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_3_PARENTCHILDRELATINONSHIPS_1"].ToString()))
                        {
                            rdobtnlstQ21_3_1.SelectedValue = dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_3_PARENTCHILDRELATINONSHIPS_1"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_3_PARENTCHILDRELATINONSHIPS_2"].ToString()))
                        {
                            rdobtnlstQ21_3_2.SelectedValue = dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_3_PARENTCHILDRELATINONSHIPS_2"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_3_PARENTCHILDRELATINONSHIPS_3"].ToString()))
                        {
                            rdobtnlstQ21_3_3.SelectedValue = dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_3_PARENTCHILDRELATINONSHIPS_3"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_3_PARENTCHILDRELATINONSHIPS_4"].ToString()))
                        {
                            rdobtnlstQ21_3_4.SelectedValue = dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_3_PARENTCHILDRELATINONSHIPS_4"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_3_PARENTCHILDRELATINONSHIPS_5"].ToString()))
                        {
                            rdobtnlstQ21_3_5.SelectedValue = dt.Rows[r]["PD_PROGRAMMATERIAL_Q21_3_PARENTCHILDRELATINONSHIPS_5"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_WRITTENPOLICIESANDPROCEDURES_22"].ToString()))
                        {
                            if (Convert.ToBoolean(dt.Rows[r]["PD_WRITTENPOLICIESANDPROCEDURES_22"].ToString()))
                            {
                                rdobtnlstQ22.DataBind();
                                rdobtnlstQ22.SelectedValue = "1";//dt.Rows[r]["PD_WRITTENPOLICIESANDPROCEDURES_22"].ToString();

                                if (rdobtnlstQ22.SelectedValue == "1")
                                {
                                    chkbxlstQ23.Enabled = true;
                                    rdobtnlstQ24.Enabled = true;
                                    ddlYear.Enabled = true;
                                    ddlMonth.Enabled = true;
                                    Q23.Visible = true;
                                    Q24.Visible = true;
                                    Q25.Visible = true;

                                    chkbxlstQ23.DataBind();
                                    for (int x = 0; x < chkbxlstQ23.Items.Count; x++)
                                    {
                                        int add = x + 1;
                                        //if (!string.IsNullOrEmpty(dt.Rows[r]["PD_WRITTENPOLICIESANDPROCEDURES_Q23_" + add].ToString()))
                                        //{
                                        chkbxlstQ23.Items[x].Selected = Convert.ToBoolean(dt.Rows[r]["PD_WRITTENPOLICIESANDPROCEDURES_Q23_" + add].ToString());
                                        //}
                                    }
                                }
                                else
                                {
                                    chkbxlstQ23.Enabled = false;
                                    rdobtnlstQ24.Enabled = false;
                                    ddlYear.Enabled = false;
                                    ddlMonth.Enabled = false;
                                    Q23.Visible = false;
                                    Q24.Visible = false;
                                    Q25.Visible = false;
                                }
                            }
                            else
                            {
                                rdobtnlstQ22.DataBind();
                                rdobtnlstQ22.SelectedValue = "0";
                            }
                        }

                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_WRITTENPOLICIESANDPROCEDURES_Q24"].ToString()))
                        {
                            rdobtnlstQ24.DataBind();
                            rdobtnlstQ24.SelectedValue = dt.Rows[r]["PD_WRITTENPOLICIESANDPROCEDURES_Q24"].ToString();
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_WRITTENPOLICIESANDPROCEDURES_Q25"].ToString()))
                        {
                            string getQ25Ans = dt.Rows[r]["PD_WRITTENPOLICIESANDPROCEDURES_Q25"].ToString();
                            if (!string.IsNullOrEmpty(getQ25Ans))
                            {
                                string[] q25ans = getQ25Ans.Split(',');

                                ddlMonth.SelectedItem.Text = q25ans[0].ToString();
                                ddlYear.SelectedItem.Text = q25ans[1].ToString();
                            }
                        }
                        // txtQ25.Text = dt.Rows[r]["PD_WRITTENPOLICIESANDPROCEDURES_Q24"].ToString();

                        if (Convert.ToBoolean(dt.Rows[r]["PD_WRITTENPOLICIESANDPROCEDURES_Q26"].ToString()))
                        {
                            rdobtnlstQ26.DataBind();
                            rdobtnlstQ26.SelectedValue = "1";//dt.Rows[r]["PD_WRITTENPOLICIESANDPROCEDURES_Q26"].ToString();
                            if (rdobtnlstQ26.SelectedValue == "1")
                            {
                                txtQ26Explain.Text = dt.Rows[r]["PD_WRITTENPOLICIESANDPROCEDURES_Q26_Describe"].ToString();
                            }
                        }
                        else
                        {
                            rdobtnlstQ26.DataBind();
                            rdobtnlstQ26.SelectedValue = "0";
                        }
                        chkbxlstQ27.DataBind();
                        for (int x = 0; x < chkbxlstQ27.Items.Count; x++)
                        {
                            int add = x + 1;
                            //if (!string.IsNullOrEmpty(dt.Rows[r]["PD_DataCollectionProcess_Q27_" + add].ToString()))
                            //{
                            chkbxlstQ27.Items[x].Selected = Convert.ToBoolean(dt.Rows[r]["PD_DataCollectionProcess_Q27_" + add].ToString());
                            //}
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_DataCollectionProcess_Q27_other"].ToString()))
                        {
                            txtQ27Explain.Text = dt.Rows[r]["PD_DataCollectionProcess_Q27_other"].ToString();
                        }

                        chkbxlstQ28.DataBind();
                        for (int x = 0; x < chkbxlstQ28.Items.Count; x++)
                        {
                            int add = x + 1;
                            //if (!string.IsNullOrEmpty(dt.Rows[r]["PD_DataCollectionProcess_Q28_" + add].ToString()))
                            //{
                                chkbxlstQ28.Items[x].Selected = Convert.ToBoolean(dt.Rows[r]["PD_DataCollectionProcess_Q28_" + add].ToString()); 
                            //}
                        }

                        chkbxlstQ29.DataBind();
                        for (int x = 0; x < chkbxlstQ29.Items.Count; x++)
                        {
                            int add = x + 1;
                            //if (!string.IsNullOrEmpty(dt.Rows[r]["PD_DataCollectionProcess_Q29_" + add].ToString()))
                            //{
                            chkbxlstQ29.Items[x].Selected = Convert.ToBoolean(dt.Rows[r]["PD_DataCollectionProcess_Q29_" + add].ToString());                            
                            //}
                        }

                        chkbxlstQ30.DataBind();
                        for (int x = 0; x < chkbxlstQ30.Items.Count; x++)
                        {
                            int add = x + 1;
                            //if (!string.IsNullOrEmpty(dt.Rows[r]["PD_DataCollectionProcess_Q30_" + add].ToString()))
                            //{
                                chkbxlstQ30.Items[x].Selected = Convert.ToBoolean(dt.Rows[r]["PD_DataCollectionProcess_Q30_" + add].ToString());
                            //}
                        }

                        chkbxlstQ31.DataBind();
                        for (int x = 0; x < chkbxlstQ31.Items.Count; x++)
                        {
                            int add = x + 1;
                            //if (!string.IsNullOrEmpty(dt.Rows[r]["PD_DataCollectionProcess_Q31_" + add].ToString()))
                            //{
                                chkbxlstQ31.Items[x].Selected = Convert.ToBoolean(dt.Rows[r]["PD_DataCollectionProcess_Q31_" + add].ToString());
                            //}
                        }

                        chkbxlstQ32.DataBind();
                        for (int x = 0; x < chkbxlstQ32.Items.Count; x++)
                        {
                            int add = x + 1;
                            //if (!string.IsNullOrEmpty(dt.Rows[r]["PD_DataCollectionProcess_Q32_" + add].ToString()))
                            //{
                                chkbxlstQ32.Items[x].Selected = Convert.ToBoolean(dt.Rows[r]["PD_DataCollectionProcess_Q32_" + add].ToString());
                            //}
                        }

                        chkbxlstQ33.DataBind();
                        for (int x = 0; x < chkbxlstQ33.Items.Count; x++)
                        {
                            int add = x + 1;
                            //if (!string.IsNullOrEmpty(dt.Rows[r]["PD_DataCollectionProcess_Q33_" + add].ToString()))
                            //{
                                chkbxlstQ33.Items[x].Selected = Convert.ToBoolean(dt.Rows[r]["PD_DataCollectionProcess_Q33_" + add].ToString());
                            //}
                        }

                        chkbxlstQ34.DataBind();
                        for (int x = 0; x < chkbxlstQ34.Items.Count; x++)
                        {
                            int add = x + 1;
                            //if (!string.IsNullOrEmpty(dt.Rows[r]["PD_DataCollectionProcess_Q34_" + add].ToString()))
                            //{
                                chkbxlstQ34.Items[x].Selected = Convert.ToBoolean(dt.Rows[r]["PD_DataCollectionProcess_Q34_" + add].ToString());
                            //}
                        }

                        chkbxlstQ35.DataBind();
                        for (int x = 0; x < chkbxlstQ35.Items.Count; x++)
                        {
                            int add = x + 1;
                            //if (!string.IsNullOrEmpty(dt.Rows[r]["PD_DataCollectionProcess_Q35_" + add].ToString()))
                            //{
                                chkbxlstQ35.Items[x].Selected = Convert.ToBoolean(dt.Rows[r]["PD_DataCollectionProcess_Q35_" + add].ToString());
                            //}
                        }
                    }
                }
            }
        }

        private void bindGRid()
        {
            //a.	Title
            string sqlquery_Q12_1 = "SELECT Answer_ID, Question_ID, Answer, AnswerValue FROM PROGRAM_DIRECTOR_SURVEY_ANSWERS WHERE (Question_ID = 'Q12_1');";
            DataTable dt_Q12_1 = DBHelper.GetDataTable(sqlquery_Q12_1);
            DropDownList ddl_Q12_1 = (DropDownList)grdQ12.Rows[0].FindControl("ddl_Q12_1");
            ddl_Q12_1.DataSource = dt_Q12_1;
            ddl_Q12_1.DataTextField = "Answer";
            ddl_Q12_1.DataValueField = "AnswerValue";
            ddl_Q12_1.DataBind();
            ddl_Q12_1.Items.Insert(0, new ListItem(String.Empty, String.Empty));

            //b.	Business function only 
            string sqlquery_Q12_2 = "SELECT Answer_ID, Question_ID, Answer, AnswerValue FROM PROGRAM_DIRECTOR_SURVEY_ANSWERS WHERE (Question_ID = 'Q12_2');";
            DataTable dt_Q12_2 = DBHelper.GetDataTable(sqlquery_Q12_2);
            DropDownList ddl_Q12_2 = (DropDownList)grdQ12.Rows[0].FindControl("ddl_Q12_2");
            ddl_Q12_2.DataSource = dt_Q12_2;
            ddl_Q12_2.DataTextField = "Answer";
            ddl_Q12_2.DataValueField = "AnswerValue";
            ddl_Q12_2.DataBind();
            ddl_Q12_2.Items.Insert(0, new ListItem(String.Empty, String.Empty));

            //c.	Direct responsibility for program implementation and/or staff who work with families?
            string sqlquery_Q12_3 = "SELECT Answer_ID, Question_ID, Answer, AnswerValue FROM PROGRAM_DIRECTOR_SURVEY_ANSWERS WHERE (Question_ID = 'Q12_3');";
            DataTable dt_Q12_3 = DBHelper.GetDataTable(sqlquery_Q12_3);
            DropDownList ddl_Q12_3 = (DropDownList)grdQ12.Rows[0].FindControl("ddl_Q12_3");
            ddl_Q12_3.DataSource = dt_Q12_3;
            ddl_Q12_3.DataTextField = "Answer";
            ddl_Q12_3.DataValueField = "AnswerValue";
            ddl_Q12_3.DataBind();
            ddl_Q12_3.Items.Insert(0, new ListItem(String.Empty, String.Empty));


            //Undergraduate degree?
            string sqlquery_Q13 = "SELECT Answer_ID, Question_ID, Answer, AnswerValue FROM PROGRAM_DIRECTOR_SURVEY_ANSWERS WHERE (Question_ID = 'Q13');";
            DataTable dt_Q13 = DBHelper.GetDataTable(sqlquery_Q13);
            DropDownList ddl_Q13 = (DropDownList)grdQ12.Rows[0].FindControl("ddl_Q13");
            ddl_Q13.DataSource = dt_Q13;
            ddl_Q13.DataTextField = "Answer";
            ddl_Q13.DataValueField = "AnswerValue";
            ddl_Q13.DataBind();
            ddl_Q13.Items.Insert(0, new ListItem(String.Empty, String.Empty));


            //Is undergraduate degree in early childhood field?
            string sqlquery_Q14 = "SELECT Answer_ID, Question_ID, Answer, AnswerValue FROM PROGRAM_DIRECTOR_SURVEY_ANSWERS WHERE (Question_ID = 'Q14');";
            DataTable dt_Q14 = DBHelper.GetDataTable(sqlquery_Q14);
            DropDownList ddl_Q14 = (DropDownList)grdQ12.Rows[0].FindControl("ddl_Q14");
            ddl_Q14.DataSource = dt_Q14;
            ddl_Q14.DataTextField = "Answer";
            ddl_Q14.DataValueField = "AnswerValue";
            ddl_Q14.DataBind();
            ddl_Q14.Items.Insert(0, new ListItem(String.Empty, String.Empty));


            //Graduate degree? 
            string sqlquery_Q15 = "SELECT Answer_ID, Question_ID, Answer, AnswerValue FROM PROGRAM_DIRECTOR_SURVEY_ANSWERS WHERE (Question_ID = 'Q15');";
            DataTable dt_Q15 = DBHelper.GetDataTable(sqlquery_Q15);
            DropDownList ddl_Q15 = (DropDownList)grdQ12.Rows[0].FindControl("ddl_Q15");
            ddl_Q15.DataSource = dt_Q15;
            ddl_Q15.DataTextField = "Answer";
            ddl_Q15.DataValueField = "AnswerValue";
            ddl_Q15.DataBind();
            ddl_Q15.Items.Insert(0, new ListItem(String.Empty, String.Empty));


            //Is undergraduate degree in early childhood field?
            string sqlquery_Q16 = "SELECT Answer_ID, Question_ID, Answer, AnswerValue FROM PROGRAM_DIRECTOR_SURVEY_ANSWERS WHERE (Question_ID = 'Q16');";
            DataTable dt_Q16 = DBHelper.GetDataTable(sqlquery_Q16);
            DropDownList ddl_Q16 = (DropDownList)grdQ12.Rows[0].FindControl("ddl_Q16");
            ddl_Q16.DataSource = dt_Q16;
            ddl_Q16.DataTextField = "Answer";
            ddl_Q16.DataValueField = "AnswerValue";
            ddl_Q16.DataBind();
            ddl_Q16.Items.Insert(0, new ListItem(String.Empty, String.Empty));


            //Years experience in early childhood field: 
            string sqlquery_Q17 = "SELECT Answer_ID, Question_ID, Answer, AnswerValue FROM PROGRAM_DIRECTOR_SURVEY_ANSWERS WHERE (Question_ID = 'Q17');";
            DataTable dt_Q17 = DBHelper.GetDataTable(sqlquery_Q17);
            DropDownList ddl_Q17 = (DropDownList)grdQ12.Rows[0].FindControl("ddl_Q17");
            ddl_Q17.DataSource = dt_Q17;
            ddl_Q17.DataTextField = "Answer";
            ddl_Q17.DataValueField = "AnswerValue";
            ddl_Q17.DataBind();
            ddl_Q17.Items.Insert(0, new ListItem(String.Empty, String.Empty));

            //Years of direct management or mentorship experience ***:
            string sqlquery_Q18 = "SELECT Answer_ID, Question_ID, Answer, AnswerValue FROM PROGRAM_DIRECTOR_SURVEY_ANSWERS WHERE (Question_ID = 'Q18');";
            DataTable dt_Q18 = DBHelper.GetDataTable(sqlquery_Q18);
            DropDownList ddl_Q18 = (DropDownList)grdQ12.Rows[0].FindControl("ddl_Q18");
            ddl_Q18.DataSource = dt_Q18;
            ddl_Q18.DataTextField = "Answer";
            ddl_Q18.DataValueField = "AnswerValue";
            ddl_Q18.DataBind();
            ddl_Q18.Items.Insert(0, new ListItem(String.Empty, String.Empty));
        }
        private void bindGrid_grdV2_label()
        {
            
            string sqlquery_Q12_1_lbl = "SELECT * FROM [ISBEPI_DEV].[dbo].[Program_Director_Survey_Q12toQ16_Education_And_Experience] WHERE Schd_ID ='"+hfSchdID.Value+"'";
            DataTable dt_Q12_1_Education = DBHelper.GetDataTable(sqlquery_Q12_1_lbl);
            grdQ12_V2.DataSource = dt_Q12_1_Education;
            grdQ12_V2.DataBind();            
            for (int x = 0; x < grdQ12_V2.Rows.Count; x++)
            {
                Label lbl_RowID = (Label)grdQ12_V2.Rows[x].FindControl("lblRowID");
                lbl_RowID.Text = dt_Q12_1_Education.Rows[x]["ID"].ToString().Trim();
                Label lbl_Q12_1 = (Label)grdQ12_V2.Rows[x].FindControl("lbl_Q12_1");
                switch (dt_Q12_1_Education.Rows[x]["PD_EDUCATIONANDEXPERIENCE_Q12_1"].ToString().Trim())
                {
                    case "1":
                        {
                            lbl_Q12_1.Text = "Program Director";
                        }
                        break;
                    case "2":
                        {
                            lbl_Q12_1.Text = "Executive Director";
                        }
                        break;
                    case "3":
                        {
                            lbl_Q12_1.Text = "Deputy Director";
                        }
                        break;
                    case "4":
                        {
                            lbl_Q12_1.Text = "Assistant Director";
                        }
                        break;
                    case "5":
                        {
                            lbl_Q12_1.Text = "Program Coordinator";
                        }
                        break;
                    case "6":
                        {
                            lbl_Q12_1.Text = "Pogram Manager";
                        }
                        break;
                    case "7":
                        {
                            lbl_Q12_1.Text = "Parent Educator Supervisor";
                        }
                        break;
                    case "8":
                        {
                            lbl_Q12_1.Text = "Accountant";
                        }
                        break;
                    case "9":
                        {
                            lbl_Q12_1.Text = "Other";
                        }
                        break;
                    default:
                        {
                            lbl_Q12_1.Text = "N/A";
                            break;
                        }
                }

                Label lbl_Q12_2 = (Label)grdQ12_V2.Rows[x].FindControl("lbl_Q12_2");
                switch (dt_Q12_1_Education.Rows[x]["PD_EDUCATIONANDEXPERIENCE_Q12_2"].ToString().Trim())
                {
                    case "1":
                        {
                            lbl_Q12_2.Text = "Yes";
                            break;
                        }
                    case "2":
                        {
                            lbl_Q12_2.Text = "No";
                            break;
                        }
                    default:
                        {
                            lbl_Q12_2.Text = "N/A";
                            break;
                        }
                }


                Label lbl_Q12_3 = (Label)grdQ12_V2.Rows[x].FindControl("lbl_Q12_3");
                switch (dt_Q12_1_Education.Rows[x]["PD_EDUCATIONANDEXPERIENCE_Q12_3"].ToString().Trim())
                {
                    case "1":
                        {
                            lbl_Q12_3.Text = "Yes";
                            break;
                        }
                    case "2":
                        {
                            lbl_Q12_3.Text = "No";
                            break;
                        }
                    default:
                        {
                            lbl_Q12_3.Text = "N/A";
                            break;
                        }
                }

                Label lbl_Q13 = (Label)grdQ12_V2.Rows[x].FindControl("lbl_Q13");
                switch (dt_Q12_1_Education.Rows[x]["PD_EDUCATION_Q13"].ToString().Trim())
                {
                    case "1":
                        {
                            lbl_Q13.Text = "Yes";
                            break;
                        }
                    case "2":
                        {
                            lbl_Q13.Text = "No";
                            break;
                        }
                    default:
                        {
                            lbl_Q13.Text = "N/A";
                            break;
                        }
                }

                Label lbl_Q14 = (Label)grdQ12_V2.Rows[x].FindControl("lbl_Q14");
                switch (dt_Q12_1_Education.Rows[x]["PD_EDUCATION_Q14"].ToString().Trim())
                {
                    case "1":
                        {
                            lbl_Q14.Text = "Yes";
                            break;
                        }
                    case "2":
                        {
                            lbl_Q14.Text = "No";
                            break;
                        }
                    default:
                        {
                            lbl_Q14.Text = "N/A";
                            break;
                        }
                }

                Label lbl_Q15 = (Label)grdQ12_V2.Rows[x].FindControl("lbl_Q15");
                switch (dt_Q12_1_Education.Rows[x]["PD_EDUCATION_Q15"].ToString().Trim())
                {
                    case "1":
                        {
                            lbl_Q15.Text = "Yes";
                            break;
                        }
                    case "2":
                        {
                            lbl_Q15.Text = "No";
                            break;
                        }
                    default:
                        {
                            lbl_Q15.Text = "N/A";
                            break;
                        }
                }

                Label lbl_Q16 = (Label)grdQ12_V2.Rows[x].FindControl("lbl_Q16");
                switch (dt_Q12_1_Education.Rows[x]["PD_EDUCATION_Q16"].ToString().Trim())
                {
                    case "1":
                        {
                            lbl_Q16.Text = "Yes";
                            break;
                        }
                    case "2":
                        {
                            lbl_Q16.Text = "No";
                            break;
                        }
                    default:
                        {
                            lbl_Q16.Text = "N/A";
                            break;
                        }
                }
                Label lbl_Q17 = (Label)grdQ12_V2.Rows[x].FindControl("lbl_Q17");
                switch (dt_Q12_1_Education.Rows[x]["PD_EDUCATION_Q17"].ToString().Trim())
                {
                    case "1":
                        {
                            lbl_Q17.Text = "Less than 1 year";
                            break;
                        }
                    case "2":
                        {
                            lbl_Q17.Text = "At least 1 year";
                            break;
                        }
                    case "3":
                        {
                            lbl_Q17.Text = "At least 3 years";
                            break;
                        }
                    case "4":
                        {
                            lbl_Q17.Text = "At least 5 years";
                            break;
                        }
                    case "5":
                        {
                            lbl_Q17.Text = "More than 7 years";
                            break;
                        }
                    default:
                        {
                            lbl_Q17.Text = "N/A";
                            break;
                        }
                }
                Label lbl_Q18 = (Label)grdQ12_V2.Rows[x].FindControl("lbl_Q18");
                switch (dt_Q12_1_Education.Rows[x]["PD_EDUCATION_Q18"].ToString().Trim())
                {
                    case "1":
                        {
                            lbl_Q18.Text = "Less than 1 year";
                            break;
                        }
                    case "2":
                        {
                            lbl_Q18.Text = "At least 1 year";
                            break;
                        }
                    case "3":
                        {
                            lbl_Q18.Text = "At least 3 years";
                            break;
                        }
                    case "4":
                        {
                            lbl_Q18.Text = "At least 5 years";
                            break;
                        }                    
                    default:
                        {
                            lbl_Q18.Text = "N/A";
                            break;
                        }
                }
            }
            
            
        }

        protected void grdQ12_V2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    //a.	Title
                    string sqlquery_Q12_1 = "SELECT Answer_ID, Question_ID, Answer, AnswerValue FROM PROGRAM_DIRECTOR_SURVEY_ANSWERS WHERE (Question_ID = 'Q12_1');";
                    DataTable dt_Q12_1 = DBHelper.GetDataTable(sqlquery_Q12_1);
                    DropDownList ddl_Q12_1 = (DropDownList)e.Row.FindControl("ddl_Q12_1_V2");
                    ddl_Q12_1.DataSource = dt_Q12_1;
                    ddl_Q12_1.DataTextField = "Answer";
                    ddl_Q12_1.DataValueField = "AnswerValue";
                    ddl_Q12_1.DataBind();
                    ddl_Q12_1.Items.Insert(0, new ListItem(String.Empty, String.Empty));

                    DataRowView dr = e.Row.DataItem as DataRowView;
                    ddl_Q12_1.SelectedValue = dr["PD_EDUCATIONANDEXPERIENCE_Q12_1"].ToString();

                    //b.	Business function only 
                    string sqlquery_Q12_2 = "SELECT Answer_ID, Question_ID, Answer, AnswerValue FROM PROGRAM_DIRECTOR_SURVEY_ANSWERS WHERE (Question_ID = 'Q12_2');";
                    DataTable dt_Q12_2 = DBHelper.GetDataTable(sqlquery_Q12_2);
                    DropDownList ddl_Q12_2 = (DropDownList)e.Row.FindControl("ddl_Q12_2_V2");
                    ddl_Q12_2.DataSource = dt_Q12_2;
                    ddl_Q12_2.DataTextField = "Answer";
                    ddl_Q12_2.DataValueField = "AnswerValue";
                    ddl_Q12_2.DataBind();
                    ddl_Q12_2.Items.Insert(0, new ListItem(String.Empty, String.Empty));

                    ddl_Q12_2.SelectedValue = dr["PD_EDUCATIONANDEXPERIENCE_Q12_2"].ToString();

                    //c.	Direct responsibility for program implementation and/or staff who work with families?
                    string sqlquery_Q12_3 = "SELECT Answer_ID, Question_ID, Answer, AnswerValue FROM PROGRAM_DIRECTOR_SURVEY_ANSWERS WHERE (Question_ID = 'Q12_3');";
                    DataTable dt_Q12_3 = DBHelper.GetDataTable(sqlquery_Q12_3);
                    DropDownList ddl_Q12_3 = (DropDownList)e.Row.FindControl("ddl_Q12_3_V2");
                    ddl_Q12_3.DataSource = dt_Q12_3;
                    ddl_Q12_3.DataTextField = "Answer";
                    ddl_Q12_3.DataValueField = "AnswerValue";
                    ddl_Q12_3.DataBind();
                    ddl_Q12_3.Items.Insert(0, new ListItem(String.Empty, String.Empty));
                    ddl_Q12_3.SelectedValue = dr["PD_EDUCATIONANDEXPERIENCE_Q12_3"].ToString();


                    //Undergraduate degree?
                    string sqlquery_Q13 = "SELECT Answer_ID, Question_ID, Answer, AnswerValue FROM PROGRAM_DIRECTOR_SURVEY_ANSWERS WHERE (Question_ID = 'Q13');";
                    DataTable dt_Q13 = DBHelper.GetDataTable(sqlquery_Q13);
                    DropDownList ddl_Q13 = (DropDownList)e.Row.FindControl("ddl_Q13_V2");
                    ddl_Q13.DataSource = dt_Q13;
                    ddl_Q13.DataTextField = "Answer";
                    ddl_Q13.DataValueField = "AnswerValue";
                    ddl_Q13.DataBind();
                    ddl_Q13.Items.Insert(0, new ListItem(String.Empty, String.Empty));
                    ddl_Q13.SelectedValue = dr["PD_EDUCATION_Q13"].ToString();
                   
                    //Is undergraduate degree in early childhood field?
                    string sqlquery_Q14 = "SELECT Answer_ID, Question_ID, Answer, AnswerValue FROM PROGRAM_DIRECTOR_SURVEY_ANSWERS WHERE (Question_ID = 'Q14');";
                    DataTable dt_Q14 = DBHelper.GetDataTable(sqlquery_Q14);
                    DropDownList ddl_Q14 = (DropDownList)e.Row.FindControl("ddl_Q14_V2");
                    ddl_Q14.DataSource = dt_Q14;
                    ddl_Q14.DataTextField = "Answer";
                    ddl_Q14.DataValueField = "AnswerValue";
                    ddl_Q14.DataBind();
                    ddl_Q14.Items.Insert(0, new ListItem(String.Empty, String.Empty));
                    ddl_Q14.SelectedValue = dr["PD_EDUCATION_Q14"].ToString();

                    //Graduate degree? 
                    string sqlquery_Q15 = "SELECT Answer_ID, Question_ID, Answer, AnswerValue FROM PROGRAM_DIRECTOR_SURVEY_ANSWERS WHERE (Question_ID = 'Q15');";
                    DataTable dt_Q15 = DBHelper.GetDataTable(sqlquery_Q15);
                    DropDownList ddl_Q15 = (DropDownList)e.Row.FindControl("ddl_Q15_V2");
                    ddl_Q15.DataSource = dt_Q15;
                    ddl_Q15.DataTextField = "Answer";
                    ddl_Q15.DataValueField = "AnswerValue";
                    ddl_Q15.DataBind();
                    ddl_Q15.Items.Insert(0, new ListItem(String.Empty, String.Empty));
                    ddl_Q15.SelectedValue = dr["PD_EDUCATION_Q15"].ToString();

                    //Is undergraduate degree in early childhood field?
                    string sqlquery_Q16 = "SELECT Answer_ID, Question_ID, Answer, AnswerValue FROM PROGRAM_DIRECTOR_SURVEY_ANSWERS WHERE (Question_ID = 'Q16');";
                    DataTable dt_Q16 = DBHelper.GetDataTable(sqlquery_Q16);
                    DropDownList ddl_Q16 = (DropDownList)e.Row.FindControl("ddl_Q16_V2");
                    ddl_Q16.DataSource = dt_Q16;
                    ddl_Q16.DataTextField = "Answer";
                    ddl_Q16.DataValueField = "AnswerValue";
                    ddl_Q16.DataBind();
                    ddl_Q16.Items.Insert(0, new ListItem(String.Empty, String.Empty));
                    ddl_Q16.SelectedValue = dr["PD_EDUCATION_Q16"].ToString();

                    //Years experience in early childhood field: 
                    string sqlquery_Q17 = "SELECT Answer_ID, Question_ID, Answer, AnswerValue FROM PROGRAM_DIRECTOR_SURVEY_ANSWERS WHERE (Question_ID = 'Q17');";
                    DataTable dt_Q17 = DBHelper.GetDataTable(sqlquery_Q17);
                    DropDownList ddl_Q17 = (DropDownList)e.Row.FindControl("ddl_Q17_V2");
                    ddl_Q17.DataSource = dt_Q17;
                    ddl_Q17.DataTextField = "Answer";
                    ddl_Q17.DataValueField = "AnswerValue";
                    ddl_Q17.DataBind();
                    ddl_Q17.Items.Insert(0, new ListItem(String.Empty, String.Empty));
                    ddl_Q17.SelectedValue = dr["PD_EDUCATION_Q17"].ToString();

                    //Years of direct management or mentorship experience ***:
                    string sqlquery_Q18 = "SELECT Answer_ID, Question_ID, Answer, AnswerValue FROM PROGRAM_DIRECTOR_SURVEY_ANSWERS WHERE (Question_ID = 'Q18');";
                    DataTable dt_Q18 = DBHelper.GetDataTable(sqlquery_Q18);
                    DropDownList ddl_Q18 = (DropDownList)e.Row.FindControl("ddl_Q18_V2");
                    ddl_Q18.DataSource = dt_Q18;
                    ddl_Q18.DataTextField = "Answer";
                    ddl_Q18.DataValueField = "AnswerValue";
                    ddl_Q18.DataBind();
                    ddl_Q18.Items.Insert(0, new ListItem(String.Empty, String.Empty));
                    ddl_Q18.SelectedValue = dr["PD_EDUCATION_Q18"].ToString();

                 
                }           
                
            }
        }
        private void bindGRid_grdV2_dropdown()
        {
            
            string sqlquery_Q12_1_lbl = "SELECT * FROM [ISBEPI_DEV].[dbo].[Program_Director_Survey_Q12toQ16_Education_And_Experience] WHERE Schd_ID ='" + hfSchdID.Value + "'";
            DataTable dt_Q12_1_Education = DBHelper.GetDataTable(sqlquery_Q12_1_lbl);
            grdQ12_V2.DataSource = dt_Q12_1_Education;
            grdQ12_V2.DataBind();
            for (int x = 0; x < grdQ12_V2.Rows.Count; x++)
            {
                //a.	Title
                string sqlquery_Q12_1 = "SELECT Answer_ID, Question_ID, Answer, AnswerValue FROM PROGRAM_DIRECTOR_SURVEY_ANSWERS WHERE (Question_ID = 'Q12_1');";
                DataTable dt_Q12_1 = DBHelper.GetDataTable(sqlquery_Q12_1);
                DropDownList ddl_Q12_1_V2 = (DropDownList)grdQ12_V2.Rows[x].FindControl("ddl_Q12_1_V2");
                ddl_Q12_1_V2.DataSource = dt_Q12_1;
                ddl_Q12_1_V2.DataTextField = "Answer";
                ddl_Q12_1_V2.DataValueField = "AnswerValue";
                ddl_Q12_1_V2.DataBind();
                ddl_Q12_1_V2.Items.Insert(0, new ListItem(String.Empty, String.Empty));

                //b.	Business function only 
                string sqlquery_Q12_2 = "SELECT Answer_ID, Question_ID, Answer, AnswerValue FROM PROGRAM_DIRECTOR_SURVEY_ANSWERS WHERE (Question_ID = 'Q12_2');";
                DataTable dt_Q12_2 = DBHelper.GetDataTable(sqlquery_Q12_2);
                DropDownList ddl_Q12_2_V2 = (DropDownList)grdQ12_V2.Rows[x].FindControl("ddl_Q12_2_V2");
                ddl_Q12_2_V2.DataSource = dt_Q12_2;
                ddl_Q12_2_V2.DataTextField = "Answer";
                ddl_Q12_2_V2.DataValueField = "AnswerValue";
                ddl_Q12_2_V2.DataBind();
                ddl_Q12_2_V2.Items.Insert(0, new ListItem(String.Empty, String.Empty));

                //c.	Direct responsibility for program implementation and/or staff who work with families?
                string sqlquery_Q12_3 = "SELECT Answer_ID, Question_ID, Answer, AnswerValue FROM PROGRAM_DIRECTOR_SURVEY_ANSWERS WHERE (Question_ID = 'Q12_3');";
                DataTable dt_Q12_3 = DBHelper.GetDataTable(sqlquery_Q12_3);
                DropDownList ddl_Q12_3_V2 = (DropDownList)grdQ12_V2.Rows[x].FindControl("ddl_Q12_3_V2");
                ddl_Q12_3_V2.DataSource = dt_Q12_3;
                ddl_Q12_3_V2.DataTextField = "Answer";
                ddl_Q12_3_V2.DataValueField = "AnswerValue";
                ddl_Q12_3_V2.DataBind();
                ddl_Q12_3_V2.Items.Insert(0, new ListItem(String.Empty, String.Empty));


                //Undergraduate degree?
                string sqlquery_Q13 = "SELECT Answer_ID, Question_ID, Answer, AnswerValue FROM PROGRAM_DIRECTOR_SURVEY_ANSWERS WHERE (Question_ID = 'Q13');";
                DataTable dt_Q13 = DBHelper.GetDataTable(sqlquery_Q13);
                DropDownList ddl_Q13_V2 = (DropDownList)grdQ12_V2.Rows[x].FindControl("ddl_Q13_V2");
                ddl_Q13_V2.DataSource = dt_Q13;
                ddl_Q13_V2.DataTextField = "Answer";
                ddl_Q13_V2.DataValueField = "AnswerValue";
                ddl_Q13_V2.DataBind();
                ddl_Q13_V2.Items.Insert(0, new ListItem(String.Empty, String.Empty));


                //Is undergraduate degree in early childhood field?
                string sqlquery_Q14 = "SELECT Answer_ID, Question_ID, Answer, AnswerValue FROM PROGRAM_DIRECTOR_SURVEY_ANSWERS WHERE (Question_ID = 'Q14');";
                DataTable dt_Q14 = DBHelper.GetDataTable(sqlquery_Q14);
                DropDownList ddl_Q14_V2 = (DropDownList)grdQ12_V2.Rows[x].FindControl("ddl_Q14_V2");
                ddl_Q14_V2.DataSource = dt_Q14;
                ddl_Q14_V2.DataTextField = "Answer";
                ddl_Q14_V2.DataValueField = "AnswerValue";
                ddl_Q14_V2.DataBind();
                ddl_Q14_V2.Items.Insert(0, new ListItem(String.Empty, String.Empty));


                //Graduate degree? 
                string sqlquery_Q15 = "SELECT Answer_ID, Question_ID, Answer, AnswerValue FROM PROGRAM_DIRECTOR_SURVEY_ANSWERS WHERE (Question_ID = 'Q15');";
                DataTable dt_Q15 = DBHelper.GetDataTable(sqlquery_Q15);
                DropDownList ddl_Q15_V2 = (DropDownList)grdQ12_V2.Rows[x].FindControl("ddl_Q15_V2");
                ddl_Q15_V2.DataSource = dt_Q15;
                ddl_Q15_V2.DataTextField = "Answer";
                ddl_Q15_V2.DataValueField = "AnswerValue";
                ddl_Q15_V2.DataBind();
                ddl_Q15_V2.Items.Insert(0, new ListItem(String.Empty, String.Empty));


                //Is undergraduate degree in early childhood field?
                string sqlquery_Q16 = "SELECT Answer_ID, Question_ID, Answer, AnswerValue FROM PROGRAM_DIRECTOR_SURVEY_ANSWERS WHERE (Question_ID = 'Q16');";
                DataTable dt_Q16 = DBHelper.GetDataTable(sqlquery_Q16);
                DropDownList ddl_Q16_V2 = (DropDownList)grdQ12_V2.Rows[x].FindControl("ddl_Q16_V2");
                ddl_Q16_V2.DataSource = dt_Q16;
                ddl_Q16_V2.DataTextField = "Answer";
                ddl_Q16_V2.DataValueField = "AnswerValue";
                ddl_Q16_V2.DataBind();
                ddl_Q16_V2.Items.Insert(0, new ListItem(String.Empty, String.Empty));

                //Years experience in early childhood field: 
                string sqlquery_Q17 = "SELECT Answer_ID, Question_ID, Answer, AnswerValue FROM PROGRAM_DIRECTOR_SURVEY_ANSWERS WHERE (Question_ID = 'Q17');";
                DataTable dt_Q17 = DBHelper.GetDataTable(sqlquery_Q17);
                DropDownList ddl_Q17_V2 = (DropDownList)grdQ12_V2.Rows[0].FindControl("ddl_Q17_V2");
                ddl_Q17_V2.DataSource = dt_Q17;
                ddl_Q17_V2.DataTextField = "Answer";
                ddl_Q17_V2.DataValueField = "AnswerValue";
                ddl_Q17_V2.DataBind();
                ddl_Q17_V2.Items.Insert(0, new ListItem(String.Empty, String.Empty));

                //Years of direct management or mentorship experience ***:
                string sqlquery_Q18 = "SELECT Answer_ID, Question_ID, Answer, AnswerValue FROM PROGRAM_DIRECTOR_SURVEY_ANSWERS WHERE (Question_ID = 'Q18');";
                DataTable dt_Q18 = DBHelper.GetDataTable(sqlquery_Q18);
                DropDownList ddl_Q18_V2 = (DropDownList)grdQ12_V2.Rows[0].FindControl("ddl_Q18_V2");
                ddl_Q18_V2.DataSource = dt_Q18;
                ddl_Q18_V2.DataTextField = "Answer";
                ddl_Q18_V2.DataValueField = "AnswerValue";
                ddl_Q18_V2.DataBind();
                ddl_Q18_V2.Items.Insert(0, new ListItem(String.Empty, String.Empty));


            }
        }

        private void setGridRow()
        {
            DataTable table = new DataTable("data");
            if (table.Columns.Count == 0)
            {
                table.Columns.Add("Q12_1");
                table.Columns.Add("Q12_2");
                table.Columns.Add("Q12_3");
                table.Columns.Add("Q13");
                table.Columns.Add("Q14");
                table.Columns.Add("Q15");
                table.Columns.Add("Q16");
                table.Columns.Add("Q17");
                table.Columns.Add("Q18");
            }
            DataRow row = table.NewRow();
            table.Rows.Add(row);
            grdQ12.DataSource = table;
            grdQ12.DataBind();
        }
        private void setGridRow_grd12_v2()
        {            
            string sqlquery_Q12_1_lbl = "SELECT * FROM [ISBEPI_DEV].[dbo].[Program_Director_Survey_Q12toQ16_Education_And_Experience] WHERE Schd_ID ='" + hfSchdID.Value + "'";
            DataTable dt_Q12_1_Education = DBHelper.GetDataTable(sqlquery_Q12_1_lbl);
            grdQ12_V2.DataSource = dt_Q12_1_Education;
            grdQ12_V2.DataBind();
        }
        protected void btnAddNewRow_Click(object sender, EventArgs e)
        {
            //inserting answer to databse

            

            foreach (GridViewRow row in grdQ12.Rows)
            {
                DropDownList ddl_Q12_1 = (DropDownList)row.FindControl("ddl_Q12_1");
                DropDownList ddl_Q12_2 = (DropDownList)row.FindControl("ddl_Q12_2");
                DropDownList ddl_Q12_3 = (DropDownList)row.FindControl("ddl_Q12_3");
                DropDownList ddl_Q13 = (DropDownList)row.FindControl("ddl_Q13");
                DropDownList ddl_Q14 = (DropDownList)row.FindControl("ddl_Q14");
                DropDownList ddl_Q15 = (DropDownList)row.FindControl("ddl_Q15");
                DropDownList ddl_Q16 = (DropDownList)row.FindControl("ddl_Q16");
                DropDownList ddl_Q17 = (DropDownList)row.FindControl("ddl_Q17");
                DropDownList ddl_Q18 = (DropDownList)row.FindControl("ddl_Q18");

                //Q12_2
                switch (ddl_Q12_2.SelectedItem.Text.ToLower().Trim())
                {
                    case "yes":
                        {
                            value2 = 1;
                        }
                        break;
                    case "no":
                        {
                            value2 = 2;
                        }
                        break;
                }

                //Q12_1

                switch (ddl_Q12_1.SelectedItem.Text.ToLower().Trim())
                {
                    case "program director":
                        {
                            value1 = 1;
                        }
                        break;
                    case "executive director":
                        {
                            value1 = 2;
                        }
                        break;
                    case "deputy director":
                        {
                            value1 = 3;
                        }
                        break;
                    case "assistant director":
                        {
                            value1 = 4;
                        }
                        break;
                    case "program coordinator":
                        {
                            value1 = 5;
                        }
                        break;
                    case "program manager":
                        {
                            value1 = 6;
                        }
                        break;
                    case "parent educator supervisor":
                        {
                            value1 = 7;
                        }
                        break;
                    case "accountant":
                        {
                            value1 = 8;
                        }
                        break;
                    case "other":
                        {
                            value1 = 9;
                        }
                        break;
                }
                //Q12_3
                switch (ddl_Q12_3.SelectedItem.Text.ToLower().Trim())
                {
                    case "yes":
                        {
                            value3 = 1;
                        }
                        break;
                    case "no":
                        {
                            value3 = 2;
                        }
                        break;
                }
                //Q13
                switch (ddl_Q13.SelectedItem.Text.ToLower().Trim())
                {
                    case "yes":
                        {
                            value4 = 1;
                        }
                        break;
                    case "no":
                        {
                            value4 = 2;
                        }
                        break;
                }
                //Q14
                switch (ddl_Q14.SelectedItem.Text.ToLower().Trim())
                {
                    case "yes":
                        {
                            value5 = 1;
                        }
                        break;
                    case "no":
                        {
                            value5 = 2;
                        }
                        break;
                }
                //Q15
                switch (ddl_Q15.SelectedItem.Text.ToLower().Trim())
                {
                    case "yes":
                        {
                            value6 = 1;
                        }
                        break;
                    case "no":
                        {
                            value6 = 2;
                        }
                        break;
                }
                //Q16
                switch (ddl_Q16.SelectedItem.Text.ToLower().Trim())
                {
                    case "yes":
                        {
                            value7 = 1;
                        }
                        break;
                    case "no":
                        {
                            value7 = 2;
                        }
                        break;
                }

                //Q17
                switch (ddl_Q17.SelectedItem.Text.ToLower().Trim())
                {
                    case "less than 1 year":
                        {
                            value8 = 1;
                        }
                        break;
                    case "at least 1 year":
                        {
                            value8 = 2;
                        }
                        break;
                    case "at least 3 years":
                        {
                            value8 = 3;
                        }
                        break;
                    case "at least 5 years":
                        {
                            value8 = 4;
                        }
                        break;
                    case "more than 7 years":
                        {
                            value8 = 5;
                        }
                        break;
                }
                switch (ddl_Q18.SelectedItem.Text.ToLower().Trim())
                {
                    case "less than 1 year":
                        {
                            value9 = 1;
                        }
                        break;
                    case "at least 1 year":
                        {
                            value9 = 2;
                        }
                        break;
                    case "at least 3 years":
                        {
                            value9 = 3;
                        }
                        break;
                    case "at least 5 years":
                        {
                            value9 = 4;
                        }
                        break;                    
                }
                if (saveTable.Columns.Count == 0)
                {
                    saveTable.Columns.Add("10");
                    saveTable.Columns.Add("Q12_1");
                    saveTable.Columns.Add("Q12_2");
                    saveTable.Columns.Add("Q12_3");
                    saveTable.Columns.Add("Q13");
                    saveTable.Columns.Add("Q14");
                    saveTable.Columns.Add("Q15");
                    saveTable.Columns.Add("Q16");
                    saveTable.Columns.Add("Q17");
                    saveTable.Columns.Add("Q18");
                }
                saveTable.Rows.Add(10, value1, value2, value3, value4, value5, value6, value7,value8,value9);
            }
            for (int i = 0; i < saveTable.Rows.Count; i++)
            {           
                DsEducation.Insert(Convert.ToInt32(hfSchdID.Value), Convert.ToInt32(saveTable.Rows[i]["Q12_1"].ToString()),
                                                        Convert.ToInt32(saveTable.Rows[i]["Q12_2"].ToString()),
                                                        Convert.ToInt32(saveTable.Rows[i]["Q12_3"].ToString()),
                                                        Convert.ToInt32(saveTable.Rows[i]["Q13"].ToString()),
                                                        Convert.ToInt32(saveTable.Rows[i]["Q14"].ToString()),
                                                        Convert.ToInt32(saveTable.Rows[i]["Q15"].ToString()),
                                                        Convert.ToInt32(saveTable.Rows[i]["Q16"].ToString()),
                                                        Convert.ToInt32(saveTable.Rows[i]["Q17"].ToString()),
                                                        Convert.ToInt32(saveTable.Rows[i]["Q18"].ToString()));
            }
            bindGrid_grdV2_label();
        }

        protected void saveallquestion1()
        {
            check = false;

            if (rdobtnlstQ4.SelectedItem.Text.Trim() == "Other (Please specify)" && string.IsNullOrEmpty(txtQ4Explain.Text))
            {
                lblQ4Comment.Visible = true;
                lblQ4Comment.Text = "Required";
                check = true;
            }
            else
            {
                lblQ4Comment.Visible = false;
            }
            if (rdobtnlst_Yes_or_No.SelectedValue == "1")
            {
                if (!string.IsNullOrEmpty(chkbxlstQ5.SelectedValue))
                {
                    for (int x = 0; x < chkbxlstQ5.Items.Count; x++)
                    {
                        if (chkbxlstQ5.Items[x].Selected)
                        {
                            if ((chkbxlstQ5.Items[x].Text.Trim() == "Other, please specify:" && string.IsNullOrEmpty(txtQ5Explain.Text)))
                            {
                                lblQ5Comment.Visible = true;
                                lblQ5Comment.Text = "Required";
                                check = true;
                            }
                            else
                            {
                                lblQ5Comment.Visible = false;
                                //check = false;
                            }
                        }
                    }
                }
                else if (string.IsNullOrEmpty(chkbxlstQ5.SelectedValue))
                {
                    lblQ5Comment.Visible = true;
                    lblQ5Comment.Text = "Required";
                    check = true;
                }
            }  
            if (rdobtnlstQ6.SelectedItem.Text.Trim() == "Other (please specify)" && string.IsNullOrEmpty(txtQ6Explain.Text))
            {
                lblQ6Comment.Visible = true;
                lblQ6Comment.Text = "Required";
                check = true;
            }
            else
            {
                lblQ6Comment.Visible = false;
                //check = false;
            }         
            if (!string.IsNullOrEmpty(chkbxlstQ11.SelectedValue))
                {
                    for (int x = 0; x < chkbxlstQ11.Items.Count; x++)
                    {
                        if (chkbxlstQ11.Items[x].Selected)
                        {
                            if ((chkbxlstQ11.Items[x].Text.Trim() == "Other (please specify)" && string.IsNullOrEmpty(txtQ11_Other.Text)))
                            {
                                lblQ11Comment.Visible = true;
                                lblQ11Comment.Text = "Required";
                                check = true;
                            }
                            else
                            {
                                lblQ11Comment.Visible = false;
                            }
                        }
                    }
                }
                else if (string.IsNullOrEmpty(chkbxlstQ11.SelectedValue))
                {
                    lblQ11Comment.Visible = true;
                    lblQ11Comment.Text = "Required";
                    check = true;
                }            
            if (check == false)
            {
                lblQ6Comment.Visible = false;
                lblQ4Comment.Visible = false;
                lblQ5Comment.Visible = false;               
                lblQ11Comment.Visible = false;
               
                string sqlquery = "SELECT [Question_ID], [Question], Label_ID FROM [ISBEPI_DEV].[dbo].[PROGRAM_DIRECTOR_SURVEY_QUESTIONS] WHERE [Label_ID] IN ( 'lblQ12');";
                DataTable dt = DBHelper.GetDataTable(sqlquery);
                Label lblQ = new Label();

                //importing question 
                for (int x = 0; x < dt.Rows.Count; x++)
                {
                    lblQ = this.Master.FindControl("ContentPlaceHolder1").FindControl(dt.Rows[x]["Label_ID"].ToString().Trim()) as Label;
                    lblQ.Text = dt.Rows[x]["Question"].ToString();
                }
                setGridRow();
                bindGrid_grdV2_label();
                bindGRid();

                // inserting answers to database            
                for (int r = 0; r < PD.GetData().Rows.Count; r++)
                {
                    string schdid = PD.GetData().Rows[r]["Schd_ID"].ToString();
                    string staffId = PD.GetData().Rows[r]["Staff_ID"].ToString();
                    if (schdid == hfSchdID.Value && staffId == hfStaffID.Value)
                    {
                        row = PD.GetData().Rows[r];
                        row["PD_DEMOGRAPHICS_BASICPROGRAMINFORMATION_Q1"] = txtQ1.Text;
                        row["PD_DEMOGRAPHICS_BASICPROGRAMINFORMATION_Q2"] = rdobtnlstQ2.SelectedValue;
                        row["PD_DEMOGRAPHICS_BASICPROGRAMINFORMATION_Q3"] = txtQ3.Text;
                        row["PD_DEMOGRAPHICS_BASICPROGRAMINFORMATION_Q4"] = rdobtnlstQ4.SelectedValue;
                        row["PD_DEMOGRAPHICS_BASICPROGRAMINFORMATION_Q4_Other"] = txtQ4Explain.Text;
                        if (rdobtnlst_Yes_or_No.SelectedValue == "1")
                        {
                            row["PD_DEMOGRAPHICS_BASICPROGRAMINFORMATION_Q5_Yes_or_no"] = true;
                        }
                        else
                        {
                            row["PD_DEMOGRAPHICS_BASICPROGRAMINFORMATION_Q5_Yes_or_no"] = false;
                        }
                        if (rdobtnlst_Yes_or_No.SelectedValue == "1")
                        {
                            for (int x = 0; x < chkbxlstQ5.Items.Count; x++)
                            {
                                //if (chkbxlstQ5.Items[x].Selected)
                                //{
                                    int add;
                                    if (x == chkbxlstQ5.Items.Count)
                                    {
                                        break;
                                    }
                                    else
                                    {
                                        add = x + 1;                                        
                                        row["PD_DEMOGRAPHICS_BASICPROGRAMINFORMATION_Q5_" + add] = chkbxlstQ5.Items[x].Selected;
                                        if (chkbxlstQ5.Items[x].Text.Trim() == "Other, please specify:")
                                        {
                                            row["PD_DEMOGRAPHICS_BASICPROGRAMINFORMATION_Q5_5_OTher"] = txtQ5Explain.Text;
                                        }
                                    }
                                //}                                    
                                //else
                                //{
                                //    int add;
                                //    add = x + 1;
                                //    row["PD_DEMOGRAPHICS_BASICPROGRAMINFORMATION_Q5_" + add] = DBNull.Value;
                                //}
                            }
                        }
                        row["PD_DEMOGRAPHICS_BASICPROGRAMINFORMATION_Q6"] = rdobtnlstQ6.SelectedItem.Value;
                        if (rdobtnlstQ6.SelectedItem.Text.Trim() == "Other (please specify)")
                        {
                            row["PD_DEMOGRAPHICS_BASICPROGRAMINFORMATION_Q6_Other"] = txtQ6Explain.Text;
                        }
                        row["PD_FAMILYINFORMATION_Q7"] = txtQ7.Text;


                        row["PD_FAMILYINFORMATION_Q8_1"] = txtQ8_1.Text;
                        row["PD_FAMILYINFORMATION_Q8_2"] = txtQ8_2.Text;
                        row["PD_FAMILYINFORMATION_Q8_3"] = txtQ8_3.Text;
                        row["PD_FAMILYINFORMATION_Q8_4"] = txtQ8_4.Text;
                        row["PD_FAMILYINFORMATION_Q8_5"] = txtQ8_5.Text;
                        row["PD_FAMILYINFORMATION_Q8_6"] = txtQ8_6.Text;
                        row["PD_FAMILYINFORMATION_Q8_7"] = txtQ8_7.Text;
                        toGetInfo gettotal = new toGetInfo();
                        gettotal.Set_total_1(Convert.ToInt32(txtQ8_1.Text) + Convert.ToInt32(txtQ8_2.Text) + Convert.ToInt32(txtQ8_3.Text)
                                            + Convert.ToInt32(txtQ8_4.Text) + Convert.ToInt32(txtQ8_5.Text) + Convert.ToInt32(txtQ8_6.Text)
                                            + Convert.ToInt32(txtQ8_7.Text));
                        txtQ8_Total.Text = gettotal.Get_total_1().ToString();
                        row["PD_FAMILYINFORMATION_Q8_Total"] = txtQ8_Total.Text;
                        row["PD_FAMILYINFORMATION_Q9_1"] = txtQ9_1.Text;
                        row["PD_FAMILYINFORMATION_Q9_2"] = txtQ9_2.Text;
                        row["PD_FAMILYINFORMATION_Q9_3"] = txtQ9_3.Text;
                        row["PD_FAMILYINFORMATION_Q9_4"] = txtQ9_4.Text;
                        row["PD_FAMILYINFORMATION_Q9_5"] = txtQ9_5.Text;
                        row["PD_FAMILYINFORMATION_Q9_6"] = txtQ9_6.Text;
                        gettotal.Set_total_2(Convert.ToInt32(txtQ9_1.Text) + Convert.ToInt32(txtQ9_2.Text) + Convert.ToInt32(txtQ9_3.Text)
                                            + Convert.ToInt32(txtQ9_4.Text) + Convert.ToInt32(txtQ9_5.Text) + Convert.ToInt32(txtQ9_6.Text));
                        txtQ9_Total.Text = gettotal.Get_total_2().ToString();
                        row["PD_FAMILYINFORMATION_Q9_Total"] = txtQ9_Total.Text;

                      
                        row["PD_FAMILYINFORMATION_Q10_1"] = txtQ10_1.Text;
                        row["PD_FAMILYINFORMATION_Q10_2"] = txtQ10_2.Text;
                        row["PD_FAMILYINFORMATION_Q10_3"] = txtQ10_3.Text;
                        row["PD_FAMILYINFORMATION_Q10_4"] = txtQ10_4.Text;
                        row["PD_FAMILYINFORMATION_Q10_5"] = txtQ10_5.Text;
                        gettotal.Set_total_3(Convert.ToInt32(txtQ10_1.Text) + Convert.ToInt32(txtQ10_2.Text) + Convert.ToInt32(txtQ10_3.Text)
                                            + Convert.ToInt32(txtQ10_4.Text) + Convert.ToInt32(txtQ10_5.Text));
                        txtQ10_Total.Text = gettotal.Get_total_3().ToString();
                        row["PD_FAMILYINFORMATION_Q10_Total"] = txtQ10_Total.Text;
                        for (int x = 0; x < chkbxlstQ11.Items.Count; x++)
                        {
                            //if (chkbxlstQ11.Items[x].Selected)
                            //{
                                int add;
                                if (x == chkbxlstQ11.Items.Count)
                                {
                                    break;
                                }
                                else
                                {
                                    add = x + 1;
                                    row["PD_FAMILYINFORMATION_Q11_" + add] = chkbxlstQ11.Items[x].Selected;
                                    if (chkbxlstQ11.Items[x].Text == "Other (please specify)")
                                    {
                                        row["PD_FAMILYINFORMATION_Q11_6_other"] = txtQ11_Other.Text;
                                    }
                                }

                            //}
                            //else
                            //{
                            //    int add;
                            //    add = x + 1;
                            //    row["PD_FAMILYINFORMATION_Q11_" + add] = DBNull.Value;
                            //}

                        }
                        PD.Update(row);
                    }                    
                }
            }
        }
        protected void imgbtnForward0_Click(object sender, ImageClickEventArgs e)
        {
            saveallquestion1();
            if (check == false)
            {
                MultiView1.ActiveViewIndex = 1;
            }
        }      

        protected void imgbtnback1_Click(object sender, ImageClickEventArgs e)
        {            
            MultiView1.ActiveViewIndex = 0;
        }

       
        protected void imgbtnback3_Click(object sender, ImageClickEventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }
      

        protected void saveallquestion3()
        {           
            string sqlquery = "SELECT [Question_ID], [Question], Label_ID FROM [ISBEPI_DEV].[dbo].[PROGRAM_DIRECTOR_SURVEY_QUESTIONS] WHERE [Label_ID] LIKE '%lblQ19%';";
            DataTable dt = DBHelper.GetDataTable(sqlquery);
            Label lblQ = new Label();
            for (int x = 0; x < dt.Rows.Count; x++)
            {
                lblQ = this.Master.FindControl("ContentPlaceHolder1").FindControl(dt.Rows[x]["Label_ID"].ToString().Trim()) as Label;
                lblQ.Text = dt.Rows[x]["Question"].ToString();
            }
          
        }
        protected void imgbtnForward4_Click(object sender, ImageClickEventArgs e)
        {
            string sqlquery_Q12_1_lbl = "SELECT * FROM [ISBEPI_DEV].[dbo].[Program_Director_Survey_Q12toQ16_Education_And_Experience] WHERE Schd_ID ='" + hfSchdID.Value + "'";
            DataTable dt_Q12_1_Education = DBHelper.GetDataTable(sqlquery_Q12_1_lbl);

            if (dt_Q12_1_Education.Rows.Count < 1)
            {
                lblGridComment.Visible = true;
                lblGridComment.Text = "Required at least one";
            }
            else
            {
                lblGridComment.Visible = false;
                //MultiView1.ActiveViewIndex = 2;
                saveallquestion3();
                MultiView1.ActiveViewIndex = 2;
            }          
        }

        protected void saveallquestion4()
        {
            string sqlquery = "SELECT [Question_ID], [Question], Label_ID FROM [ISBEPI_DEV].[dbo].[PROGRAM_DIRECTOR_SURVEY_QUESTIONS] WHERE [Label_ID] LIKE '%lblQ20%';";
            DataTable dt = DBHelper.GetDataTable(sqlquery);
            Label lblQ = new Label();
            for (int x = 0; x < dt.Rows.Count; x++)
            {
                lblQ = this.Master.FindControl("ContentPlaceHolder1").FindControl(dt.Rows[x]["Label_ID"].ToString().Trim()) as Label;
                lblQ.Text = dt.Rows[x]["Question"].ToString();
            }

            //inserting
            for (int r = 0; r < PD.GetData().Rows.Count; r++)
            {

                if (PD.GetData().Rows[r]["Schd_ID"].ToString() == hfSchdID.Value && hfStaffID.Value == PD.GetData().Rows[r]["Staff_ID"].ToString())
                {
                    row = PD.GetData().Rows[r];
                    row["PD_INITIALTRAINING_Q19_1_CHILDDEVELOPMENT_1"] = rdobtnlstQ19_1_1.SelectedValue;
                    row["PD_INITIALTRAINING_Q19_1_CHILDDEVELOPMENT_2"] = rdobtnlstQ19_1_2.SelectedValue;
                    row["PD_INITIALTRAINING_Q19_1_CHILDDEVELOPMENT_3"] = rdobtnlstQ19_1_3.SelectedValue;
                    row["PD_INITIALTRAINING_Q19_1_CHILDDEVELOPMENT_4"] = rdobtnlstQ19_1_4.SelectedValue;
                    row["PD_INITIALTRAINING_Q19_1_CHILDDEVELOPMENT_5"] = rdobtnlstQ19_1_5.SelectedValue;
                    row["PD_INITIALTRAINING_Q19_1_CHILDDEVELOPMENT_6"] = rdobtnlstQ19_1_6.SelectedValue;
                    row["PD_INITIALTRAINING_Q19_1_CHILDDEVELOPMENT_7"] = rdobtnlstQ19_1_7.SelectedValue;
                    row["PD_INITIALTRAINING_Q19_1_CHILDDEVELOPMENT_8"] = rdobtnlstQ19_1_8.SelectedValue;
                    row["PD_INITIALTRAINING_Q19_1_CHILDDEVELOPMENT_9"] = rdobtnlstQ19_1_9.SelectedValue;
                    row["PD_INITIALTRAINING_Q19_2_CHILDHEALTHANDSAFETY_1"] = rdobtnlstQ19_2_1.SelectedValue;
                    row["PD_INITIALTRAINING_Q19_2_CHILDHEALTHANDSAFETY_2"] = rdobtnlstQ19_2_2.SelectedValue;
                    row["PD_INITIALTRAINING_Q19_2_CHILDHEALTHANDSAFETY_3"] = rdobtnlstQ19_2_3.SelectedValue;
                    row["PD_INITIALTRAINING_Q19_2_CHILDHEALTHANDSAFETY_4"] = rdobtnlstQ19_2_4.SelectedValue;
                    row["PD_INITIALTRAINING_Q19_2_CHILDHEALTHANDSAFETY_5"] = rdobtnlstQ19_2_5.SelectedValue;
                    row["PD_INITIALTRAINING_Q19_2_CHILDHEALTHANDSAFETY_6"] = rdobtnlstQ19_2_6.SelectedValue;
                    row["PD_INITIALTRAINING_Q19_2_CHILDHEALTHANDSAFETY_7"] = rdobtnlstQ19_2_7.SelectedValue;
                    row["PD_INITIALTRAINING_Q19_2_CHILDHEALTHANDSAFETY_8"] = rdobtnlstQ19_2_8.SelectedValue;
                    row["PD_INITIALTRAINING_Q19_2_CHILDHEALTHANDSAFETY_9"] = rdobtnlstQ19_2_9.SelectedValue;
                    row["PD_INITIALTRAINING_Q19_2_CHILDHEALTHANDSAFETY_10"] = rdobtnlstQ19_2_10.SelectedValue;
                    row["PD_INITIALTRAINING_Q19_2_CHILDHEALTHANDSAFETY_11"] = rdobtnlstQ19_2_11.SelectedValue;
                    row["PD_INITIALTRAINING_Q19_2_CHILDHEALTHANDSAFETY_12"] = rdobtnlstQ19_2_12.SelectedValue;
                    row["PD_INITIALTRAINING_Q19_2_CHILDHEALTHANDSAFETY_13"] = rdobtnlstQ19_2_13.SelectedValue;
                    row["PD_INITIALTRAINING_Q19_2_CHILDHEALTHANDSAFETY_14"] = rdobtnlstQ19_2_14.SelectedValue;
                    row["PD_INITIALTRAINING_Q19_2_CHILDHEALTHANDSAFETY_15"] = rdobtnlstQ19_2_15.SelectedValue;
                    row["PD_INITIALTRAINING_Q19_3_PARENTCHILDRELATINONSHIPS_1"] = rdobtnlstQ19_3_1.SelectedValue;
                    row["PD_INITIALTRAINING_Q19_3_PARENTCHILDRELATINONSHIPS_2"] = rdobtnlstQ19_3_2.SelectedValue;
                    row["PD_INITIALTRAINING_Q19_3_PARENTCHILDRELATINONSHIPS_3"] = rdobtnlstQ19_3_3.SelectedValue;
                    row["PD_INITIALTRAINING_Q19_3_PARENTCHILDRELATINONSHIPS_4"] = rdobtnlstQ19_3_4.SelectedValue;
                    row["PD_INITIALTRAINING_Q19_3_PARENTCHILDRELATINONSHIPS_5"] = rdobtnlstQ19_3_5.SelectedValue;
                    PD.Update(row);
                }
            }
        }
        protected void imgbtnForward5_Click(object sender, ImageClickEventArgs e)
        {
            saveallquestion4();
            MultiView1.ActiveViewIndex = 3;           
        }

        protected void imgbtnback6_Click(object sender, ImageClickEventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
        }
        protected void saveallquestion5()
        {
            
            string sqlquery = "SELECT [Question_ID], [Question], Label_ID FROM [ISBEPI_DEV].[dbo].[PROGRAM_DIRECTOR_SURVEY_QUESTIONS] WHERE [Label_ID] LIKE '%lblQ21%';";
            DataTable dt = DBHelper.GetDataTable(sqlquery);
            Label lblQ = new Label();
            for (int x = 0; x < dt.Rows.Count; x++)
            {
                lblQ = this.Master.FindControl("ContentPlaceHolder1").FindControl(dt.Rows[x]["Label_ID"].ToString().Trim()) as Label;
                lblQ.Text = dt.Rows[x]["Question"].ToString();
            }

            //inserting
            for (int r = 0; r < PD.GetData().Rows.Count; r++)
            {

                if (PD.GetData().Rows[r]["Schd_ID"].ToString() == hfSchdID.Value && hfStaffID.Value == PD.GetData().Rows[r]["Staff_ID"].ToString())
                {
                    row = PD.GetData().Rows[r];
                    row["PD_ONGOINGTRAINING_Q20_1_CHILDDEVELOPMENT_1"] = rdobtnlstQ20_1_1.SelectedValue;
                    row["PD_ONGOINGTRAINING_Q20_1_CHILDDEVELOPMENT_2"] = rdobtnlstQ20_1_2.SelectedValue;
                    row["PD_ONGOINGTRAINING_Q20_1_CHILDDEVELOPMENT_3"] = rdobtnlstQ20_1_3.SelectedValue;
                    row["PD_ONGOINGTRAINING_Q20_1_CHILDDEVELOPMENT_4"] = rdobtnlstQ20_1_4.SelectedValue;
                    row["PD_ONGOINGTRAINING_Q20_1_CHILDDEVELOPMENT_5"] = rdobtnlstQ20_1_5.SelectedValue;
                    row["PD_ONGOINGTRAINING_Q20_1_CHILDDEVELOPMENT_6"] = rdobtnlstQ20_1_6.SelectedValue;
                    row["PD_ONGOINGTRAINING_Q20_1_CHILDDEVELOPMENT_7"] = rdobtnlstQ20_1_7.SelectedValue;
                    row["PD_ONGOINGTRAINING_Q20_1_CHILDDEVELOPMENT_8"] = rdobtnlstQ20_1_8.SelectedValue;
                    row["PD_ONGOINGTRAINING_Q20_1_CHILDDEVELOPMENT_9"] = rdobtnlstQ20_1_9.SelectedValue;
                    row["PD_ONGOINGTRAINING_Q20_2_CHILDHEALTHANDSAFETY_1"] = rdobtnlstQ20_2_1.SelectedValue;
                    row["PD_ONGOINGTRAINING_Q20_2_CHILDHEALTHANDSAFETY_2"] = rdobtnlstQ20_2_2.SelectedValue;
                    row["PD_ONGOINGTRAINING_Q20_2_CHILDHEALTHANDSAFETY_3"] = rdobtnlstQ20_2_3.SelectedValue;
                    row["PD_ONGOINGTRAINING_Q20_2_CHILDHEALTHANDSAFETY_4"] = rdobtnlstQ20_2_4.SelectedValue;
                    row["PD_ONGOINGTRAINING_Q20_2_CHILDHEALTHANDSAFETY_5"] = rdobtnlstQ20_2_5.SelectedValue;
                    row["PD_ONGOINGTRAINING_Q20_2_CHILDHEALTHANDSAFETY_6"] = rdobtnlstQ20_2_6.SelectedValue;
                    row["PD_ONGOINGTRAINING_Q20_2_CHILDHEALTHANDSAFETY_7"] = rdobtnlstQ20_2_7.SelectedValue;
                    row["PD_ONGOINGTRAINING_Q20_2_CHILDHEALTHANDSAFETY_8"] = rdobtnlstQ20_2_8.SelectedValue;
                    row["PD_ONGOINGTRAINING_Q20_2_CHILDHEALTHANDSAFETY_9"] = rdobtnlstQ20_2_9.SelectedValue;
                    row["PD_ONGOINGTRAINING_Q20_2_CHILDHEALTHANDSAFETY_10"] = rdobtnlstQ20_2_10.SelectedValue;
                    row["PD_ONGOINGTRAINING_Q20_2_CHILDHEALTHANDSAFETY_11"] = rdobtnlstQ20_2_11.SelectedValue;
                    row["PD_ONGOINGTRAINING_Q20_2_CHILDHEALTHANDSAFETY_12"] = rdobtnlstQ20_2_12.SelectedValue;
                    row["PD_ONGOINGTRAINING_Q20_2_CHILDHEALTHANDSAFETY_13"] = rdobtnlstQ20_2_13.SelectedValue;
                    row["PD_ONGOINGTRAINING_Q20_2_CHILDHEALTHANDSAFETY_14"] = rdobtnlstQ20_2_14.SelectedValue;
                    row["PD_ONGOINGTRAINING_Q20_2_CHILDHEALTHANDSAFETY_15"] = rdobtnlstQ20_2_15.SelectedValue;
                    row["PD_ONGOINGTRAINING_Q20_3_PARENTCHILDRELATINONSHIPS_1"] = rdobtnlstQ20_3_1.SelectedValue;
                    row["PD_ONGOINGTRAINING_Q20_3_PARENTCHILDRELATINONSHIPS_2"] = rdobtnlstQ20_3_2.SelectedValue;
                    row["PD_ONGOINGTRAINING_Q20_3_PARENTCHILDRELATINONSHIPS_3"] = rdobtnlstQ20_3_3.SelectedValue;
                    row["PD_ONGOINGTRAINING_Q20_3_PARENTCHILDRELATINONSHIPS_4"] = rdobtnlstQ20_3_4.SelectedValue;
                    row["PD_ONGOINGTRAINING_Q20_3_PARENTCHILDRELATINONSHIPS_5"] = rdobtnlstQ20_3_5.SelectedValue;
                    PD.Update(row);
                }
            }
        }
        protected void imgbtnForward6_Click(object sender, ImageClickEventArgs e)
        {
            saveallquestion5();
            MultiView1.ActiveViewIndex = 4;
        }
        protected void saveallquestion6()
        {
            
            string sqlquery = "SELECT [Question_ID], [Question], Label_ID FROM [ISBEPI_DEV].[dbo].[PROGRAM_DIRECTOR_SURVEY_QUESTIONS] WHERE [Label_ID] BETWEEN 'lblQ22' AND 'lblQ26';";
            DataTable dt = DBHelper.GetDataTable(sqlquery);
            Label lblQ = new Label();
            for (int x = 0; x < dt.Rows.Count; x++)
            {
                lblQ = this.Master.FindControl("ContentPlaceHolder1").FindControl(dt.Rows[x]["Label_ID"].ToString().Trim()) as Label;
                lblQ.Text = dt.Rows[x]["Question"].ToString();
            }
            int count= 0;
            for (int i = DateTime.Today.Year; i > 1950; i--)
            {
                ddlYear.Items.Add(new ListItem(i.ToString(),count.ToString()));
                count++;
            }
                //inserting
                for (int r = 0; r < PD.GetData().Rows.Count; r++)
                {

                    if (PD.GetData().Rows[r]["Schd_ID"].ToString() == hfSchdID.Value && hfStaffID.Value == PD.GetData().Rows[r]["Staff_ID"].ToString())
                    {
                        row = PD.GetData().Rows[r];
                        row["PD_PROGRAMMATERIAL_Q21_1_CHILDDEVELOPMENT_1"] = rdobtnlstQ21_1_1.SelectedValue;
                        row["PD_PROGRAMMATERIAL_Q21_1_CHILDDEVELOPMENT_2"] = rdobtnlstQ21_1_2.SelectedValue;
                        row["PD_PROGRAMMATERIAL_Q21_1_CHILDDEVELOPMENT_3"] = rdobtnlstQ21_1_3.SelectedValue;
                        row["PD_PROGRAMMATERIAL_Q21_1_CHILDDEVELOPMENT_4"] = rdobtnlstQ21_1_4.SelectedValue;
                        row["PD_PROGRAMMATERIAL_Q21_1_CHILDDEVELOPMENT_5"] = rdobtnlstQ21_1_5.SelectedValue;
                        row["PD_PROGRAMMATERIAL_Q21_1_CHILDDEVELOPMENT_6"] = rdobtnlstQ21_1_6.SelectedValue;
                        row["PD_PROGRAMMATERIAL_Q21_1_CHILDDEVELOPMENT_7"] = rdobtnlstQ21_1_7.SelectedValue;
                        row["PD_PROGRAMMATERIAL_Q21_1_CHILDDEVELOPMENT_8"] = rdobtnlstQ21_1_8.SelectedValue;
                        row["PD_PROGRAMMATERIAL_Q21_1_CHILDDEVELOPMENT_9"] = rdobtnlstQ21_1_9.SelectedValue;
                        row["PD_PROGRAMMATERIAL_Q21_2_CHILDHEALTHANDSAFETY_1"] = rdobtnlstQ21_2_1.SelectedValue;
                        row["PD_PROGRAMMATERIAL_Q21_2_CHILDHEALTHANDSAFETY_2"] = rdobtnlstQ21_2_2.SelectedValue;
                        row["PD_PROGRAMMATERIAL_Q21_2_CHILDHEALTHANDSAFETY_3"] = rdobtnlstQ21_2_3.SelectedValue;
                        row["PD_PROGRAMMATERIAL_Q21_2_CHILDHEALTHANDSAFETY_4"] = rdobtnlstQ21_2_4.SelectedValue;
                        row["PD_PROGRAMMATERIAL_Q21_2_CHILDHEALTHANDSAFETY_5"] = rdobtnlstQ21_2_5.SelectedValue;
                        row["PD_PROGRAMMATERIAL_Q21_2_CHILDHEALTHANDSAFETY_6"] = rdobtnlstQ21_2_6.SelectedValue;
                        row["PD_PROGRAMMATERIAL_Q21_2_CHILDHEALTHANDSAFETY_7"] = rdobtnlstQ21_2_7.SelectedValue;
                        row["PD_PROGRAMMATERIAL_Q21_2_CHILDHEALTHANDSAFETY_8"] = rdobtnlstQ21_2_8.SelectedValue;
                        row["PD_PROGRAMMATERIAL_Q21_2_CHILDHEALTHANDSAFETY_9"] = rdobtnlstQ21_2_9.SelectedValue;
                        row["PD_PROGRAMMATERIAL_Q21_2_CHILDHEALTHANDSAFETY_10"] = rdobtnlstQ21_2_10.SelectedValue;
                        row["PD_PROGRAMMATERIAL_Q21_2_CHILDHEALTHANDSAFETY_11"] = rdobtnlstQ21_2_11.SelectedValue;
                        row["PD_PROGRAMMATERIAL_Q21_2_CHILDHEALTHANDSAFETY_12"] = rdobtnlstQ21_2_12.SelectedValue;
                        row["PD_PROGRAMMATERIAL_Q21_2_CHILDHEALTHANDSAFETY_13"] = rdobtnlstQ21_2_13.SelectedValue;
                        row["PD_PROGRAMMATERIAL_Q21_2_CHILDHEALTHANDSAFETY_14"] = rdobtnlstQ21_2_14.SelectedValue;
                        row["PD_PROGRAMMATERIAL_Q21_2_CHILDHEALTHANDSAFETY_15"] = rdobtnlstQ21_2_15.SelectedValue;
                        row["PD_PROGRAMMATERIAL_Q21_3_PARENTCHILDRELATINONSHIPS_1"] = rdobtnlstQ21_3_1.SelectedValue;
                        row["PD_PROGRAMMATERIAL_Q21_3_PARENTCHILDRELATINONSHIPS_2"] = rdobtnlstQ21_3_2.SelectedValue;
                        row["PD_PROGRAMMATERIAL_Q21_3_PARENTCHILDRELATINONSHIPS_3"] = rdobtnlstQ21_3_3.SelectedValue;
                        row["PD_PROGRAMMATERIAL_Q21_3_PARENTCHILDRELATINONSHIPS_4"] = rdobtnlstQ21_3_4.SelectedValue;
                        row["PD_PROGRAMMATERIAL_Q21_3_PARENTCHILDRELATINONSHIPS_5"] = rdobtnlstQ21_3_5.SelectedValue;

                        PD.Update(row);
                    }
                }
        }
        protected void imgbtnForward7_Click(object sender, ImageClickEventArgs e)
        {
            saveallquestion6();
            MultiView1.ActiveViewIndex = 5;
        }

        protected void imgbtnback7_Click(object sender, ImageClickEventArgs e)
        {
            MultiView1.ActiveViewIndex = 3;
        }
        protected void saveallquestion7()
        {
            check = false;

            if (rdobtnlstQ22.SelectedValue == "1")
            {                                                

                if (string.IsNullOrEmpty(chkbxlstQ23.SelectedValue))
                {
                    lblQ23Comment.Visible = true;
                    check = true;
                    lblQ23Comment.Text = "Required";
                }

                if (string.IsNullOrEmpty(rdobtnlstQ24.SelectedValue))
                {
                    check = true;
                    lblQ24Comment.Visible = true;
                    lblQ24Comment.Text = "Required";
                }
                if (ddlYear.SelectedItem.Text == "YEAR" && ddlMonth.SelectedItem.Text == "MONTH")
                {
                    check = true;
                    lblQ25Comment.Visible = true;
                    lblQ25Comment.Text = "Required";
                }
                else
                {
                    lblQ25Comment.Visible = false;
                }
            }            
            if (rdobtnlstQ26.SelectedValue == "1" && txtQ26Explain.Text.Length < 1)
            {
                check = true;
                lblQ26Comment.Visible = true;
                lblQ26Comment.Text = "Required";
            }
            if (check == false)
            {
                lblQ23Comment.Visible = false;
                lblQ26Comment.Visible = false;
                
                string sqlquery = "SELECT [Question_ID], [Question], Label_ID FROM [ISBEPI_DEV].[dbo].[PROGRAM_DIRECTOR_SURVEY_QUESTIONS] WHERE [Label_ID] BETWEEN 'lblQ27' AND 'lblQ35';";
                DataTable dt = DBHelper.GetDataTable(sqlquery);
                Label lblQ = new Label();
                for (int x = 0; x < dt.Rows.Count; x++)
                {
                    lblQ = this.Master.FindControl("ContentPlaceHolder1").FindControl(dt.Rows[x]["Label_ID"].ToString().Trim()) as Label;
                    lblQ.Text = dt.Rows[x]["Question"].ToString();
                }

                //inserting
                for (int r = 0; r < PD.GetData().Rows.Count; r++)
                {

                    if (PD.GetData().Rows[r]["Schd_ID"].ToString() == hfSchdID.Value && hfStaffID.Value == PD.GetData().Rows[r]["Staff_ID"].ToString())
                    {
                        row = PD.GetData().Rows[r];
                        //row["PD_WRITTENPOLICIESANDPROCEDURES_22"] = rdobtnlstQ22.SelectedValue;
                        if (rdobtnlstQ22.SelectedValue == "1")
                        {
                            row["PD_WRITTENPOLICIESANDPROCEDURES_22"] = true;
                            for (int x = 0; x < chkbxlstQ23.Items.Count; x++)
                            {
                                //if (chkbxlstQ23.Items[x].Selected)
                                //{
                                int add;
                                if (x == chkbxlstQ23.Items.Count)
                                {
                                    break;
                                }
                                else
                                {
                                    add = x + 1;
                                    row["PD_WRITTENPOLICIESANDPROCEDURES_Q23_" + add] = chkbxlstQ23.Items[x].Selected;
                                }

                                //}
                                //else
                                //{
                                //    int add;
                                //    add = x + 1;
                                //    row["PD_WRITTENPOLICIESANDPROCEDURES_Q23_" + add] = DBNull.Value;
                                //}

                            }

                            row["PD_WRITTENPOLICIESANDPROCEDURES_Q24"] = rdobtnlstQ24.SelectedValue;
                            row["PD_WRITTENPOLICIESANDPROCEDURES_Q25"] = ddlMonth.SelectedItem.Text + "," + ddlYear.SelectedItem.Text;
                        }
                        else
                        {
                            row["PD_WRITTENPOLICIESANDPROCEDURES_22"] = false;
                        }
                        if (rdobtnlstQ26.SelectedValue == "1")
                        {
                            row["PD_WRITTENPOLICIESANDPROCEDURES_Q26"] = true;
                            row["PD_WRITTENPOLICIESANDPROCEDURES_Q26_Describe"] = txtQ26Explain.Text;
                        }
                        else
                        {
                            row["PD_WRITTENPOLICIESANDPROCEDURES_Q26"] = false;
                            row["PD_WRITTENPOLICIESANDPROCEDURES_Q26_Describe"] = "N/A";
                        }

                        PD.Update(row);
                    }
                }
            }
        }
        protected void imgbtnForward8_Click(object sender, ImageClickEventArgs e)
        {
            saveallquestion7();
            if (check == false)
            {
                MultiView1.ActiveViewIndex = 6;
            }
        }

        protected void imgbtnback8_Click(object sender, ImageClickEventArgs e)
        {
            MultiView1.ActiveViewIndex = 4;
        }

        protected void imgbtnback9_Click(object sender, ImageClickEventArgs e)
        {
            MultiView1.ActiveViewIndex = 5;
        }

        protected void imgbtnHome0_Click(object sender, ImageClickEventArgs e)
        {            
            Response.Redirect("~/Home.aspx");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            check = false;
          
            if (chkbxlstQ27.SelectedValue.Length > 0 || chkbxlstQ27.SelectedValue.Length < 1)
            {
                if (chkbxlstQ27.SelectedValue.Length < 1)
                {
                    lblQ27Comment.Visible = true;
                    lblQ27Comment.Text = "Required";
                    check = true;
                }
                else
                {
                    for (int x = 0; x < chkbxlstQ27.Items.Count; x++)
                    {
                        if (chkbxlstQ27.Items[x].Selected)
                        {
                            if ((chkbxlstQ27.Items[x].Value == "4" && txtQ27Explain.Text.Length < 1))
                            {
                                lblQ28Comment.Visible = true;
                                lblQ27Comment.Text = "Required";
                                check = true;
                            }
                        }
                    }
                }
            }
            if (chkbxlstQ28.SelectedValue.Length < 1)
            {
                lblQ28Comment.Visible = true;
                lblQ28Comment.Text = "Required";
                check = true;
            }
            if (chkbxlstQ29.SelectedValue.Length < 1)
            {
                lblQ29Comment.Visible = true;
                lblQ29Comment.Text = "Required";
                check = true;
            }
            if (chkbxlstQ30.SelectedValue.Length < 1)
            {
                lblQ30Comment.Visible = true;
                lblQ30Comment.Text = "Required";
                check = true;
            }
            if (chkbxlstQ31.SelectedValue.Length < 1)
            {
                lblQ31Comment.Visible = true;
                lblQ31Comment.Text = "Required";
                check = true;
            }
            if (chkbxlstQ32.SelectedValue.Length < 1)
            {
                lblQ32Comment.Visible = true;
                lblQ32Comment.Text = "Required";
                check = true;
            }
            if (chkbxlstQ33.SelectedValue.Length < 1)
            {
                lblQ33Comment.Visible = true;
                lblQ33Comment.Text = "Required";
                check = true;
            }
            if (chkbxlstQ34.SelectedValue.Length < 1)
            {
                lblQ34Comment.Visible = true;
                lblQ34Comment.Text = "Required";
                check = true;
            }
            if (chkbxlstQ35.SelectedValue.Length < 1)
            {
                lblQ35Comment.Visible = true;
                lblQ35Comment.Text = "Required";
                check = true;
            }
            if (check == false)
            {
                lblQ27Comment.Visible = false;
                lblQ28Comment.Visible = false;
                lblQ29Comment.Visible = false;
                lblQ30Comment.Visible = false;
                lblQ31Comment.Visible = false;
                lblQ32Comment.Visible = false;
                lblQ33Comment.Visible = false;
                lblQ34Comment.Visible = false;
                lblQ35Comment.Visible = false;
                for (int r = 0; r < PD.GetData().Rows.Count; r++)
                {

                    if (PD.GetData().Rows[r]["Schd_ID"].ToString() == hfSchdID.Value && hfStaffID.Value == PD.GetData().Rows[r]["Staff_ID"].ToString())
                    {
                        row = PD.GetData().Rows[r];
                        //Q27
                        for (int x = 0; x < chkbxlstQ27.Items.Count; x++)
                        {
                            int add;
                            //if (chkbxlstQ27.Items[x].Selected)
                            //{

                                if (x == chkbxlstQ27.Items.Count)
                                {
                                    break;
                                }
                                else
                                {
                                    add = x + 1;
                                    row["PD_DataCollectionProcess_Q27_" + add] = chkbxlstQ27.Items[x].Selected;
                                }

                            //}
                            //else
                            //{
                            //    add = x + 1;
                            //    row["PD_DataCollectionProcess_Q27_" + add] = DBNull.Value;
                            //}

                        }
                        row["PD_DataCollectionProcess_Q27_other"] = txtQ27Explain.Text;

                        //Q28
                        for (int x = 0; x < chkbxlstQ28.Items.Count; x++)
                        {
                            int add;
                            //if (chkbxlstQ28.Items[x].Selected)
                            //{

                                if (x == chkbxlstQ28.Items.Count)
                                {
                                    break;
                                }
                                else
                                {
                                    add = x + 1;
                                    row["PD_DataCollectionProcess_Q28_" + add] = chkbxlstQ28.Items[x].Selected;
                                }

                            //}
                            //else
                            //{
                            //    add = x + 1;
                            //    row["PD_DataCollectionProcess_Q28_" + add] = DBNull.Value;
                            //}

                        }
                        //Q29
                        for (int x = 0; x < chkbxlstQ29.Items.Count; x++)
                        {
                            int add;
                            //if (chkbxlstQ29.Items[x].Selected)
                            //{

                                if (x == chkbxlstQ29.Items.Count)
                                {
                                    break;
                                }
                                else
                                {
                                    add = x + 1;
                                    row["PD_DataCollectionProcess_Q29_" + add] = chkbxlstQ29.Items[x].Selected;
                                }

                            //}
                            //else
                            //{
                            //    add = x + 1;
                            //    row["PD_DataCollectionProcess_Q29_" + add] = DBNull.Value;
                            //}

                        }
                        //Q30
                        for (int x = 0; x < chkbxlstQ30.Items.Count; x++)
                        {
                            int add;
                            //if (chkbxlstQ30.Items[x].Selected)
                            //{

                                if (x == chkbxlstQ30.Items.Count)
                                {
                                    break;
                                }
                                else
                                {
                                    add = x + 1;
                                    row["PD_DataCollectionProcess_Q30_" + add] = chkbxlstQ30.Items[x].Selected;
                                }

                            //}
                            //else
                            //{
                            //    add = x + 1;
                            //    row["PD_DataCollectionProcess_Q30_" + add] = DBNull.Value;
                            //}

                        }
                        //Q31
                        for (int x = 0; x < chkbxlstQ31.Items.Count; x++)
                        {
                            int add;
                            //if (chkbxlstQ31.Items[x].Selected)
                            //{

                                if (x == chkbxlstQ31.Items.Count)
                                {
                                    break;
                                }
                                else
                                {
                                    add = x + 1;
                                    row["PD_DataCollectionProcess_Q31_" + add] = chkbxlstQ31.Items[x].Selected;
                                }

                            //}
                            //else
                            //{
                            //    add = x + 1;
                            //    row["PD_DataCollectionProcess_Q31_" + add] = DBNull.Value;
                            //}

                        }
                        //Q32
                        for (int x = 0; x < chkbxlstQ32.Items.Count; x++)
                        {
                            int add;
                            //if (chkbxlstQ32.Items[x].Selected)
                            //{

                                if (x == chkbxlstQ32.Items.Count)
                                {
                                    break;
                                }
                                else
                                {
                                    add = x + 1;
                                    row["PD_DataCollectionProcess_Q32_" + add] = chkbxlstQ32.Items[x].Selected;
                                }

                            //}
                            //else
                            //{
                            //    add = x + 1;
                            //    row["PD_DataCollectionProcess_Q32_" + add] = DBNull.Value;
                            //}

                        }
                        //Q33
                        for (int x = 0; x < chkbxlstQ33.Items.Count; x++)
                        {
                            int add;
                            //if (chkbxlstQ33.Items[x].Selected)
                            //{

                                if (x == chkbxlstQ33.Items.Count)
                                {
                                    break;
                                }
                                else
                                {
                                    add = x + 1;
                                    row["PD_DataCollectionProcess_Q33_" + add] = chkbxlstQ33.Items[x].Selected;
                                }

                            //}
                            //else
                            //{
                            //    add = x + 1;
                            //    row["PD_DataCollectionProcess_Q33_" + add] = DBNull.Value;
                            //}

                        }
                        //Q34
                        for (int x = 0; x < chkbxlstQ34.Items.Count; x++)
                        {
                            int add;
                            //if (chkbxlstQ34.Items[x].Selected)
                            //{

                                if (x == chkbxlstQ34.Items.Count)
                                {
                                    break;
                                }
                                else
                                {
                                    add = x + 1;
                                    row["PD_DataCollectionProcess_Q34_" + add] = chkbxlstQ34.Items[x].Selected;
                                }

                            //}
                            //else
                            //{
                            //    add = x + 1;
                            //    row["PD_DataCollectionProcess_Q34_" + add] = DBNull.Value;
                            //}

                        }
                        //Q35
                        for (int x = 0; x < chkbxlstQ35.Items.Count; x++)
                        {
                            int add;
                            //if (chkbxlstQ35.Items[x].Selected)
                            //{

                                if (x == chkbxlstQ35.Items.Count)
                                {
                                    break;
                                }
                                else
                                {
                                    add = x + 1;
                                    row["PD_DataCollectionProcess_Q35_" + add] = chkbxlstQ35.Items[x].Selected;
                                }

                            //}
                            //else
                            //{
                            //    add = x + 1;
                            //    row["PD_DataCollectionProcess_Q35_" + add] = DBNull.Value;
                            //}

                        }
                        //row["Completed"] = "Completed";
                        //row["CompletedDate"] = DateTime.Now.ToShortDateString();
                        PD.Update(row);
                    }
                }
                toGetInfo getinfo = new toGetInfo();                
                getinfo.setSchdID(hfSchdID.Value );
                getinfo.setSiteID(hfSIteID.Value);
                Session["Staff_ID"] = hfStaffID.Value;
                Response.Redirect("~/ProgramDirector/PD_Review.aspx");               
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.Cache.SetExpires(DateTime.Now.AddDays(-1));
                Response.Cache.SetNoStore();
            }
        }

        protected void grdQ12_V2_RowEditing(object sender, GridViewEditEventArgs e)
        {            
            
            grdQ12_V2.EditIndex = e.NewEditIndex;
            bindGrid_grdV2_label();
        }

        protected void grdQ12_V2_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            DataTable updt = new DataTable();          
            updt.Columns.Add("PD_EDUCATIONANDEXPERIENCE_Q12_1");
            updt.Columns.Add("PD_EDUCATIONANDEXPERIENCE_Q12_2");
            updt.Columns.Add("PD_EDUCATIONANDEXPERIENCE_Q12_3");
            updt.Columns.Add("PD_EDUCATION_Q13");
            updt.Columns.Add("PD_EDUCATION_Q14");
            updt.Columns.Add("PD_EDUCATION_Q15");
            updt.Columns.Add("PD_EDUCATION_Q16");
            updt.Columns.Add("PD_EDUCATION_Q17");
            updt.Columns.Add("PD_EDUCATION_Q18"); 
           
            string rowid = (grdQ12_V2.Rows[e.RowIndex].FindControl("lblRowID") as Label).Text;
                      string sqlquery_Q12_1_lbl = "SELECT * FROM [ISBEPI_DEV].[dbo].[Program_Director_Survey_Q12toQ16_Education_And_Experience] "
                                        + "WHERE Schd_ID ='" + hfSchdID.Value + "' AND ID = '" + rowid + "'";
            dr = updt.NewRow();           
            dr["PD_EDUCATIONANDEXPERIENCE_Q12_1"] = (grdQ12_V2.Rows[e.RowIndex].FindControl("ddl_Q12_1_V2") as DropDownList).SelectedValue;
            dr["PD_EDUCATIONANDEXPERIENCE_Q12_2"] = (grdQ12_V2.Rows[e.RowIndex].FindControl("ddl_Q12_2_V2") as DropDownList).SelectedValue;
            dr["PD_EDUCATIONANDEXPERIENCE_Q12_3"] = (grdQ12_V2.Rows[e.RowIndex].FindControl("ddl_Q12_3_V2") as DropDownList).SelectedValue;
            dr["PD_EDUCATION_Q13"] = (grdQ12_V2.Rows[e.RowIndex].FindControl("ddl_Q13_V2") as DropDownList).SelectedValue;
            string ddlq13Value_to_check = (grdQ12_V2.Rows[e.RowIndex].FindControl("ddl_Q13_V2") as DropDownList).SelectedValue;
            if (ddlq13Value_to_check.ToString().Trim() == "1")
            {
                dr["PD_EDUCATION_Q14"] = (grdQ12_V2.Rows[e.RowIndex].FindControl("ddl_Q14_V2") as DropDownList).SelectedValue;
                dr["PD_EDUCATION_Q15"] = (grdQ12_V2.Rows[e.RowIndex].FindControl("ddl_Q15_V2") as DropDownList).SelectedValue;
                dr["PD_EDUCATION_Q16"] = (grdQ12_V2.Rows[e.RowIndex].FindControl("ddl_Q16_V2") as DropDownList).SelectedValue;
            }
            else
            {
                dr["PD_EDUCATION_Q14"] = 0;
                dr["PD_EDUCATION_Q15"] = 0;
                dr["PD_EDUCATION_Q16"] = 0; 
            }
            dr["PD_EDUCATION_Q17"] = (grdQ12_V2.Rows[e.RowIndex].FindControl("ddl_Q17_V2") as DropDownList).SelectedValue;
            dr["PD_EDUCATION_Q18"] = (grdQ12_V2.Rows[e.RowIndex].FindControl("ddl_Q18_V2") as DropDownList).SelectedValue;
            updt.Rows.Add(dr);
            int count = DBHelper.ExecuteSQLUpdate(updt, sqlquery_Q12_1_lbl);
            if (count > 0)
            {
                grdQ12_V2.EditIndex = -1;
                bindGrid_grdV2_label();
            }           

        }        

        protected void grdQ12_V2_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

            grdQ12_V2.EditIndex = -1;
            bindGrid_grdV2_label();
        }

        protected void grdQ12_V2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
           
            string rowid = (grdQ12_V2.Rows[e.RowIndex].FindControl("lblRowID") as Label).Text;
            string sqlquery_Q12_1_lbl = "DELETE FROM [ISBEPI_DEV].[dbo].[Program_Director_Survey_Q12toQ16_Education_And_Experience] "
                              + "WHERE Schd_ID ='" + hfSchdID.Value + "' AND ID = '" + rowid + "'";          

            int count = DBHelper.ExecuteSQL(sqlquery_Q12_1_lbl);
            if (count > 0)
            {
                grdQ12_V2.EditIndex = -1;
                bindGrid_grdV2_label();
            }           
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            saveallquestion1();
        }

        protected void btnSave2_Click(object sender, EventArgs e)
        {
            saveallquestion3();
        }

        protected void btnSave3_Click(object sender, EventArgs e)
        {
            saveallquestion4();
        }

        protected void btnSave4_Click(object sender, EventArgs e)
        {
            saveallquestion5();
        }

        protected void btnSave5_Click(object sender, EventArgs e)
        {
            saveallquestion6();
        }

        protected void btnsave6_Click(object sender, EventArgs e)
        {
            saveallquestion7();
        }

        protected void rdobtnlstQ22_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rdobtnlstQ22.SelectedValue == "1")
            {
                chkbxlstQ23.Enabled = true;
                rdobtnlstQ24.Enabled = true;                
                ddlYear.Enabled = true;
                ddlMonth.Enabled = true;
                Q23.Visible = true;
                Q24.Visible = true;
                Q25.Visible = true;
            }
            else
            {                
                chkbxlstQ23.Enabled = false;
                rdobtnlstQ24.Enabled = false;                
                ddlYear.Enabled = false;
                ddlMonth.Enabled = false;
                Q23.Visible = false;
                Q24.Visible = false;
                Q25.Visible = false;
            }
        }

        protected void ddl_Q13_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in grdQ12.Rows)
            {
                DropDownList ddl_Q13 = (DropDownList)row.FindControl("ddl_Q13");
                DropDownList ddl_Q14 = (DropDownList)row.FindControl("ddl_Q14");
                DropDownList ddl_Q15 = (DropDownList)row.FindControl("ddl_Q15");
                DropDownList ddl_Q16 = (DropDownList)row.FindControl("ddl_Q16");

                if (ddl_Q13.SelectedValue == "1")
                {
                    ddl_Q14.Enabled = true;
                    ddl_Q15.Enabled = true;
                    ddl_Q16.Enabled = true;
                    
                }
                else
                {
                    ddl_Q14.Enabled = false;
                    ddl_Q15.Enabled = false;
                    ddl_Q16.Enabled = false;                    
                }
            }

            
        }

        protected void rdobtnlst_Yes_or_No_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rdobtnlst_Yes_or_No.SelectedValue == "1")
            {
                lblQ5.Visible = true;
                txtQ5Explain.Visible = true;
                chkbxlstQ5.Visible = true;
            }
            else
            {
                lblQ5.Visible = false;
                txtQ5Explain.Visible = false;
                chkbxlstQ5.Visible = false;
            }
        }

    }
}