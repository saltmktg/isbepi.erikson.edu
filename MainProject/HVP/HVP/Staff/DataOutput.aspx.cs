using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HVP.ProgramDirector
{
    public partial class DataOutput : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DisplayQuestions();
            getInsertData();
            setGridRow_grd12_v2();
            hfSIteID.Value = Session["siteID"].ToString();
            Session["siteID"] = null;
            //SqlDataSource12.DataBind();
            SqlDataSource12.DataBind();
            DataView dv = (DataView)SqlDataSource19.Select(DataSourceSelectArguments.Empty);
            DataRowView drv = dv[0];
            lblSiteName.Text = drv["Sites"].ToString() + "-" + hfSIteID.Value;
        }
        protected void DisplayQuestions()
        {
            string sqlquery = "SELECT [Question_ID], [Question], Label_ID FROM [ISBEPI_DEV].[dbo].[PROGRAM_DIRECTOR_SURVEY_QUESTIONS] WHERE [Label_ID] IN ( 'lblQ1','lblQ2','lblQ3','lblQ4','lblQ5','lblQ6','lblQ7','lblQ8','lblQ9','lblQ10','lblQ11');";
            DataTable dt = DBHelper.GetDataTable(sqlquery);
            Label lblQ = new Label();
            for (int x = 0; x < dt.Rows.Count; x++)
            {
                lblQ = this.Master.FindControl("ContentPlaceHolder1").FindControl(dt.Rows[x]["Label_ID"].ToString().Trim()) as Label;
                lblQ.Text = dt.Rows[x]["Question"].ToString();
            }
            lblQ5_Yes_or_No.Text = "Do you Speak any languages, other than English, that you speak fluently?";

            string sqlqueryQ19 = "SELECT [Question_ID], [Question], Label_ID FROM [ISBEPI_DEV].[dbo].[PROGRAM_DIRECTOR_SURVEY_QUESTIONS] WHERE [Label_ID] LIKE '%lblQ19%';";
            DataTable dt19 = DBHelper.GetDataTable(sqlqueryQ19);
            Label lblQ19 = new Label();
            for (int x = 0; x < dt19.Rows.Count; x++)
            {
                lblQ19 = this.Master.FindControl("ContentPlaceHolder1").FindControl(dt19.Rows[x]["Label_ID"].ToString().Trim()) as Label;
                lblQ19.Text = dt19.Rows[x]["Question"].ToString();
            }

            string sqlquery20 = "SELECT [Question_ID], [Question], Label_ID FROM [ISBEPI_DEV].[dbo].[PROGRAM_DIRECTOR_SURVEY_QUESTIONS] WHERE [Label_ID] LIKE '%lblQ20%';";
            DataTable dt20 = DBHelper.GetDataTable(sqlquery20);
            Label lblQ20 = new Label();
            for (int x = 0; x < dt20.Rows.Count; x++)
            {
                lblQ20 = this.Master.FindControl("ContentPlaceHolder1").FindControl(dt20.Rows[x]["Label_ID"].ToString().Trim()) as Label;
                lblQ20.Text = dt20.Rows[x]["Question"].ToString();
            }

            string sqlquery21 = "SELECT [Question_ID], [Question], Label_ID FROM [ISBEPI_DEV].[dbo].[PROGRAM_DIRECTOR_SURVEY_QUESTIONS] WHERE [Label_ID] LIKE '%lblQ21%';";
            DataTable dt21 = DBHelper.GetDataTable(sqlquery21);
            Label lblQ21 = new Label();
            for (int x = 0; x < dt21.Rows.Count; x++)
            {
                lblQ21 = this.Master.FindControl("ContentPlaceHolder1").FindControl(dt21.Rows[x]["Label_ID"].ToString().Trim()) as Label;
                lblQ21.Text = dt21.Rows[x]["Question"].ToString();
            }

            string sqlquery22_26 = "SELECT [Question_ID], [Question], Label_ID FROM [ISBEPI_DEV].[dbo].[PROGRAM_DIRECTOR_SURVEY_QUESTIONS] WHERE [Label_ID] BETWEEN 'lblQ22' AND 'lblQ26';";
            DataTable dt22_26 = DBHelper.GetDataTable(sqlquery22_26);
            Label lblQ22_26 = new Label();
            for (int x = 0; x < dt22_26.Rows.Count; x++)
            {
                lblQ22_26 = this.Master.FindControl("ContentPlaceHolder1").FindControl(dt22_26.Rows[x]["Label_ID"].ToString().Trim()) as Label;
                lblQ22_26.Text = dt22_26.Rows[x]["Question"].ToString();
            }
            int count = 0;
            for (int i = DateTime.Today.Year; i > 1950; i--)
            {
                ddlYear.Items.Add(new ListItem(i.ToString(), count.ToString()));
                count++;
            }

            string sqlquery27_35 = "SELECT [Question_ID], [Question], Label_ID FROM [ISBEPI_DEV].[dbo].[PROGRAM_DIRECTOR_SURVEY_QUESTIONS] WHERE [Label_ID] BETWEEN 'lblQ27' AND 'lblQ35';";
            DataTable dt27_35 = DBHelper.GetDataTable(sqlquery27_35);
            Label lblQ27_35 = new Label();
            for (int x = 0; x < dt27_35.Rows.Count; x++)
            {
                lblQ27_35 = this.Master.FindControl("ContentPlaceHolder1").FindControl(dt27_35.Rows[x]["Label_ID"].ToString().Trim()) as Label;
                lblQ27_35.Text = dt27_35.Rows[x]["Question"].ToString();
            }
        }
        protected void getInsertData()
        {
            toGetInfo getinfo = new toGetInfo();
            hfSchdID.Value = getinfo.getSchdID();
            hfStaffID.Value = Session["StaffID"].ToString();
            Session["StaffID"] = null;
            getinfo.setSchdID(null);

            string sqlquery = "SELECT * FROM [ISBEPI_DEV].[dbo].[Program_Director_Survey] WHERE [ISBEPI_DEV].[dbo].[Program_Director_Survey].[Schd_ID]='" + hfSchdID.Value + "' AND Staff_ID='" + hfStaffID.Value + "'";
            //string sqlquery = "SELECT * FROM [ISBEPI_DEV].[dbo].[Program_Director_Survey] WHERE [ISBEPI_DEV].[dbo].[Program_Director_Survey].[Schd_ID]='" + hfSchdID.Value + "'";
            DataTable dt = DBHelper.GetDataTable(sqlquery);

            if (!string.IsNullOrEmpty(hfSchdID.Value))
            {
                for (int r = 0; r < dt.Rows.Count; r++)
                {

                    if (dt.Rows[r]["Schd_ID"].ToString() == hfSchdID.Value && dt.Rows[r]["Staff_ID"].ToString() == hfStaffID.Value)
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

                        if (Convert.ToBoolean(dt.Rows[r]["PD_DEMOGRAPHICS_BASICPROGRAMINFORMATION_Q5_Yes_or_no"].ToString()))
                        {
                            rdobtnlst_Yes_or_No.SelectedValue = "1";
                        }
                        else
                        {
                            rdobtnlst_Yes_or_No.SelectedValue = "0";
                        }

                        //if (!string.IsNullOrEmpty(dt.Rows[r]["PD_DEMOGRAPHICS_BASICPROGRAMINFORMATION_Q5_Yes_or_no"].ToString()))
                        //{
                        //    rdobtnlst_Yes_or_No.SelectedValue = dt.Rows[r]["PD_DEMOGRAPHICS_BASICPROGRAMINFORMATION_Q5_Yes_or_no"].ToString();
                        //}

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
                            //if (!string.IsNullOrEmpty(dt.Rows[r]["PD_FAMILYINFORMATION_Q11_" + add].ToString()))
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

                        if (Convert.ToBoolean(dt.Rows[r]["PD_WRITTENPOLICIESANDPROCEDURES_22"].ToString()))
                        {
                            rdobtnlstQ22.DataBind();
                            rdobtnlstQ22.SelectedValue = "1";

                            if (rdobtnlstQ22.SelectedValue == "1")
                            {
                                chkbxlstQ23.Enabled = false;
                                rdobtnlstQ24.Enabled = false;
                                ddlYear.Enabled = false;
                                ddlMonth.Enabled = false;
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

                        //if (!string.IsNullOrEmpty(dt.Rows[r]["PD_WRITTENPOLICIESANDPROCEDURES_Q26"].ToString()))
                        //{
                        //    rdobtnlstQ26.DataBind();
                        //    rdobtnlstQ26.SelectedValue = dt.Rows[r]["PD_WRITTENPOLICIESANDPROCEDURES_Q26"].ToString();
                        //    if (rdobtnlstQ26.SelectedValue == "1")
                        //    {
                        //        txtQ26Explain.Text = dt.Rows[r]["PD_WRITTENPOLICIESANDPROCEDURES_Q26_Describe"].ToString();
                        //    }
                        //}
                        chkbxlstQ27.DataBind();
                        for (int x = 0; x < chkbxlstQ27.Items.Count; x++)
                        {
                            int add = x + 1;
                            chkbxlstQ27.Items[x].Selected = Convert.ToBoolean(dt.Rows[r]["PD_DataCollectionProcess_Q27_" + add].ToString());
                        }
                        if (!string.IsNullOrEmpty(dt.Rows[r]["PD_DataCollectionProcess_Q27_other"].ToString()))
                        {
                            txtQ27Explain.Text = dt.Rows[r]["PD_DataCollectionProcess_Q27_other"].ToString();
                        }

                        chkbxlstQ28.DataBind();
                        for (int x = 0; x < chkbxlstQ28.Items.Count; x++)
                        {
                            int add = x + 1;
                            chkbxlstQ28.Items[x].Selected = Convert.ToBoolean(dt.Rows[r]["PD_DataCollectionProcess_Q28_" + add].ToString()); 
                        }

                        chkbxlstQ29.DataBind();
                        for (int x = 0; x < chkbxlstQ29.Items.Count; x++)
                        {
                            int add = x + 1;
                            chkbxlstQ29.Items[x].Selected = Convert.ToBoolean(dt.Rows[r]["PD_DataCollectionProcess_Q29_" + add].ToString()); 
                        }

                        chkbxlstQ30.DataBind();
                        for (int x = 0; x < chkbxlstQ30.Items.Count; x++)
                        {
                            int add = x + 1;
                            chkbxlstQ30.Items[x].Selected = Convert.ToBoolean(dt.Rows[r]["PD_DataCollectionProcess_Q30_" + add].ToString()); 
                        }

                        chkbxlstQ31.DataBind();
                        for (int x = 0; x < chkbxlstQ31.Items.Count; x++)
                        {
                            int add = x + 1;
                            chkbxlstQ31.Items[x].Selected = Convert.ToBoolean(dt.Rows[r]["PD_DataCollectionProcess_Q31_" + add].ToString()); 
                        }

                        chkbxlstQ32.DataBind();
                        for (int x = 0; x < chkbxlstQ32.Items.Count; x++)
                        {
                            int add = x + 1;
                            chkbxlstQ32.Items[x].Selected = Convert.ToBoolean(dt.Rows[r]["PD_DataCollectionProcess_Q32_" + add].ToString());
                        }

                        chkbxlstQ33.DataBind();
                        for (int x = 0; x < chkbxlstQ33.Items.Count; x++)
                        {
                            int add = x + 1;
                            chkbxlstQ33.Items[x].Selected = Convert.ToBoolean(dt.Rows[r]["PD_DataCollectionProcess_Q33_" + add].ToString());
                        }

                        chkbxlstQ34.DataBind();
                        for (int x = 0; x < chkbxlstQ34.Items.Count; x++)
                        {
                            int add = x + 1;
                            chkbxlstQ34.Items[x].Selected = Convert.ToBoolean(dt.Rows[r]["PD_DataCollectionProcess_Q34_" + add].ToString());
                        }

                        chkbxlstQ35.DataBind();
                        for (int x = 0; x < chkbxlstQ35.Items.Count; x++)
                        {
                            int add = x + 1;
                            chkbxlstQ35.Items[x].Selected = Convert.ToBoolean(dt.Rows[r]["PD_DataCollectionProcess_Q35_" + add].ToString()); 
                        }
                    }
                }
            }
            else
            {
                Response.Redirect("~/Staff/PDSurveyOutput.aspx");
            }
        }
        private void setGridRow_grd12_v2()
        {
            string sqlquery_Q12_1_lbl = "SELECT * FROM [ISBEPI_DEV].[dbo].[Program_Director_Survey_Q12toQ16_Education_And_Experience] WHERE Schd_ID ='" + hfSchdID.Value + "'";
            DataTable dt_Q12_1_Education = DBHelper.GetDataTable(sqlquery_Q12_1_lbl);
            DataTable dt = new DataTable();
            DataRow row;
            dt.Columns.Add("Q12_1");
            dt.Columns.Add("Q12_2");
            dt.Columns.Add("Q12_3");
            dt.Columns.Add("Q13");
            dt.Columns.Add("Q14");
            dt.Columns.Add("Q15");
            dt.Columns.Add("Q16");
            dt.Columns.Add("Q17");
            dt.Columns.Add("Q18");
            
            for (int x = 0; x < dt_Q12_1_Education.Rows.Count; x++)
            {
                row = dt.NewRow();
                switch (dt_Q12_1_Education.Rows[x]["PD_EDUCATIONANDEXPERIENCE_Q12_1"].ToString().Trim())
                {
                    case "1":
                        {
                            row["Q12_1"] = "Program Director";
                        }
                        break;
                    case "2":
                        {
                            row["Q12_1"] = "Executive Director";
                        }
                        break;
                    case "3":
                        {
                            row["Q12_1"] = "Deputy Director";
                        }
                        break;
                    case "4":
                        {
                            row["Q12_1"] = "Assistant Director";
                        }
                        break;
                    case "5":
                        {
                            row["Q12_1"] = "Program Coordinator";
                        }
                        break;
                    case "6":
                        {
                            row["Q12_1"] = "Pogram Manager";
                        }
                        break;
                    case "7":
                        {
                            row["Q12_1"] = "Parent Educator Supervisor";
                        }
                        break;
                    case "8":
                        {
                            row["Q12_1"] = "Accountant";
                        }
                        break;
                    case "9":
                        {
                            row["Q12_1"] = "Other";
                        }
                        break;
                    default:
                        {
                            row["Q12_1"] = "N/A";
                            break;
                        }
                }


                switch (dt_Q12_1_Education.Rows[x]["PD_EDUCATIONANDEXPERIENCE_Q12_2"].ToString().Trim())
                {
                    case "1":
                        {
                            row["Q12_2"] = "Yes";
                            break;
                        }
                    case "2":
                        {
                            row["Q12_2"] = "No";
                            break;
                        }
                    default:
                        {
                            row["Q12_2"] = "N/A";
                            break;
                        }
                }



                switch (dt_Q12_1_Education.Rows[x]["PD_EDUCATIONANDEXPERIENCE_Q12_3"].ToString().Trim())
                {
                    case "1":
                        {
                            row["Q12_3"] = "Yes";
                            break;
                        }
                    case "2":
                        {
                            row["Q12_3"] = "No";
                            break;
                        }
                    default:
                        {
                            row["Q12_3"] = "N/A";
                            break;
                        }
                }


                switch (dt_Q12_1_Education.Rows[x]["PD_EDUCATION_Q13"].ToString().Trim())
                {
                    case "1":
                        {
                            row["Q13"] = "Yes";
                            break;
                        }
                    case "2":
                        {
                            row["Q13"] = "No";
                            break;
                        }
                    default:
                        {
                            row["Q13"] = "N/A";
                            break;
                        }
                }


                switch (dt_Q12_1_Education.Rows[x]["PD_EDUCATION_Q14"].ToString().Trim())
                {
                    case "1":
                        {
                            row["Q14"] = "Yes";
                            break;
                        }
                    case "2":
                        {
                            row["Q14"] = "No";
                            break;
                        }
                    default:
                        {
                            row["Q14"] = "N/A";
                            break;
                        }
                }


                switch (dt_Q12_1_Education.Rows[x]["PD_EDUCATION_Q15"].ToString().Trim())
                {
                    case "1":
                        {
                            row["Q15"] = "Yes";
                            break;
                        }
                    case "2":
                        {
                            row["Q15"] = "No";
                            break;
                        }
                    default:
                        {
                            row["Q15"] = "N/A";
                            break;
                        }
                }


                switch (dt_Q12_1_Education.Rows[x]["PD_EDUCATION_Q16"].ToString().Trim())
                {
                    case "1":
                        {
                            row["Q16"] = "Yes";
                            break;
                        }
                    case "2":
                        {
                            row["Q16"] = "No";
                            break;
                        }
                    default:
                        {
                            row["Q16"] = "N/A";
                            break;
                        }
                }

                switch (dt_Q12_1_Education.Rows[x]["PD_EDUCATION_Q17"].ToString().Trim())
                {
                    case "1":
                        {
                            row["Q17"] = "Less than 1 year";
                            break;
                        }
                    case "2":
                        {
                            row["Q17"] = "At least 1 year";
                            break;
                        }
                    case "3":
                        {
                            row["Q17"] = "At least 3 years";
                            break;
                        }
                    case "4":
                        {
                            row["Q17"] = "At least 5 years";
                            break;
                        }
                    case "5":
                        {
                            row["Q17"] = "More than 7 years";
                            break;
                        }
                    default:
                        {
                            row["Q17"] = "N/A";
                            break;
                        }
                }

                switch (dt_Q12_1_Education.Rows[x]["PD_EDUCATION_Q18"].ToString().Trim())
                {
                    case "1":
                        {
                            row["Q18"] = "Less than 1 year";
                            break;
                        }
                    case "2":
                        {
                            row["Q18"] = "At least 1 year";
                            break;
                        }
                    case "3":
                        {
                            row["Q18"] = "At least 3 years";
                            break;
                        }
                    case "4":
                        {
                            row["Q18"] = "At least 5 years";
                            break;
                        }
                    default:
                        {
                            row["Q18"] = "N/A";
                            break;
                        }
                }
                dt.Rows.Add(row);
            }
            
            DataTable dtGrid = new DataTable();
            dtGrid = dt;
            grdQ12_V2.DataSource = dtGrid;
            grdQ12_V2.DataBind();
            dt.Reset();
        }
    }
}