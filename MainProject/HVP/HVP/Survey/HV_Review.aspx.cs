using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HVP.Survey
{
    public partial class HV_Review : System.Web.UI.Page
    {
        HVP.HVSurvey hv = new HVP.HVSurvey();
        //HVSurvey hv = new HVSurvey();
        //HVSurvey hv = new HVSurvey();
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.Now.AddDays(-1));
            Response.Cache.SetNoStore();           
            if (!IsPostBack)
            {
                DisplayFirst_SessionData();                
                getData();                
            }
        }

        protected void DisplayFirst_SessionData()
        {
            string sqlquery = "SELECT [Question_ID], [Question], Label_ID FROM [ISBEPI_DEV].[dbo].[HomeVisitorSurveyQuestions] WHERE Question_ID NOT BETWEEN 'Q13' AND 'Q19' AND "
                                   + " Question_ID NOT BETWEEN 'Q20' AND 'Q29' AND Question_ID NOT BETWEEN 'Q30' AND 'Q39' AND Question_ID NOT BETWEEN 'Q40' "
                                 + " AND 'Q49' AND Question_ID NOT BETWEEN 'Q50' AND 'Q59' AND Question_ID NOT BETWEEN 'Q60' AND 'Q62' AND Question_ID NOT BETWEEN 'Q67_A' AND 'Q67_E' "
                               + "AND Question_ID NOT BETWEEN 'Q68_A' AND 'Q68_H' --WHERE [Label_ID] IN ( 'lblQ1','lblQ2','lblQ3');";
            DataTable dt = DBHelper.GetDataTable(sqlquery);

            Label lbl = new Label();

            for (int x = 0; x < dt.Rows.Count; x++)
            {
                lbl = this.Master.FindControl("ContentPlaceHolder1").FindControl(dt.Rows[x]["Label_ID"].ToString().Trim()) as Label;
                lbl.Text = dt.Rows[x]["Question"].ToString();
            }
           
        }

        public void getData()
        {            
            Survey.setgetreview getdt = new setgetreview();
            DataTable dt = new DataTable();
            dt = getdt.getQuestions();
            if (dt.Rows.Count > 0)
            {
                hfSiteID.Value = dt.Rows[0]["siteID"].ToString();
                hfSchd_ID.Value = dt.Rows[0]["Schd_ID"].ToString();
                rdobtnlstQ1.SelectedValue = dt.Rows[0]["Q1"].ToString();
                rdobtnlstQ2.SelectedValue = dt.Rows[0]["Q2"].ToString();
                if (rdobtnlstQ2.SelectedValue != null)
                {
                    txtRace.Text = dt.Rows[0]["Q2_Other"].ToString();
                }
                rdobtnlst_Yes_or_No.SelectedValue = dt.Rows[0]["Q3_yesOrNO"].ToString();
                if (rdobtnlst_Yes_or_No.SelectedValue == "1")
                {
                    lblQ3.Visible = true;
                    chkLanguageQ3.Visible = true;
                    txtLanguage.Visible = true;
                    txtLanguage.Text = dt.Rows[0]["Q3_Other"].ToString();
                    chkLanguageQ3.DataBind();
                    for (int x = 0; x < chkLanguageQ3.Items.Count; x++)
                    {
                        int add = x + 1;
                        if (!string.IsNullOrEmpty(dt.Rows[0]["Q3_" + add].ToString()))
                        {

                            chkLanguageQ3.Items[x].Selected = true;
                        }
                    }
                }
                else
                {
                    lblQ3.Visible = false;
                    chkLanguageQ3.Visible = false;
                    txtLanguage.Visible = false;
                }

                rdobtnlstQ4.DataBind();
                rdobtnlstQ4.SelectedValue = dt.Rows[0]["Q4"].ToString();
                if ((rdobtnlstQ4.SelectedValue == "1") || (rdobtnlstQ4.SelectedValue == "2"))
                {

                    Q5_li.Visible = false;
                    rdobtnlstQ5.Visible = false;
                    lblQ5.Visible = false;
                    txtBestDescribesEducation.Visible = false;
                }
                else
                {
                    Q5_li.Visible = true;
                    rdobtnlstQ5.Visible = true;
                    lblQ5.Visible = true;
                    txtBestDescribesEducation.Visible = true;
                    rdobtnlstQ5.SelectedValue = dt.Rows[0]["Q5"].ToString();
                    txtBestDescribesEducation.Text = dt.Rows[0]["Q5_other"].ToString();
                }
                rdobtnlstQ6_A.SelectedValue = dt.Rows[0]["Q6_A"].ToString();
                rdobtnlstQ6_B.SelectedValue = dt.Rows[0]["Q6_B"].ToString();
                txtQ7.Text = dt.Rows[0]["Q7"].ToString();
                txtQ8.Text = dt.Rows[0]["Q8"].ToString();
                txtQ9.Text = dt.Rows[0]["Q9"].ToString();
                txt10_1.Text = dt.Rows[0]["Q10_1"].ToString();
                txt10_2.Text = dt.Rows[0]["Q10_2"].ToString();
                txt10_3.Text = dt.Rows[0]["Q10_3"].ToString();
                txt10_4.Text = dt.Rows[0]["Q10_4"].ToString();
                txt10_5.Text = dt.Rows[0]["Q10_5"].ToString();
                txtQ10_total.Text = dt.Rows[0]["Q10_total"].ToString();
                txt11_1.Text = dt.Rows[0]["Q11_1"].ToString();
                txt11_2.Text = dt.Rows[0]["Q11_2"].ToString();
                txt11_3.Text = dt.Rows[0]["Q11_3"].ToString();
                txt11_4.Text = dt.Rows[0]["Q11_4"].ToString();
                txt11_5.Text = dt.Rows[0]["Q11_5"].ToString();
                txt11_6.Text = dt.Rows[0]["Q11_6"].ToString();
                txt11_7.Text = dt.Rows[0]["Q11_7"].ToString();
                txt11_Total.Text = dt.Rows[0]["Q11_total"].ToString();
                txtQ12.Text = dt.Rows[0]["Q12"].ToString();
                if (Convert.ToInt32(dt.Rows[0]["Q12"].ToString()) > 0)
                {
                    Q12_li.Visible = true;
                    rdobtnlstQ12_1.Visible = true;
                    rdobtnlstQ12_2.Visible = true;
                    rdobtnlstQ12_3.Visible = true;
                    rdobtnlstQ12_4.Visible = true;
                    rdobtnlstQ12_5.Visible = true;
                    //
                    lblQ12_1.Visible = true;
                    lblQ12_2.Visible = true;
                    lblQ12_3.Visible = true;
                    lblQ12_4.Visible = true;
                    lblQ12_5.Visible = true;
                    //
                    txtq12_5_specify.Visible = true;

                    rdobtnlstQ12_1.SelectedValue = dt.Rows[0]["Q12_1"].ToString();
                    rdobtnlstQ12_2.SelectedValue = dt.Rows[0]["Q12_2"].ToString();
                    rdobtnlstQ12_3.SelectedValue = dt.Rows[0]["Q12_3"].ToString();
                    rdobtnlstQ12_4.SelectedValue = dt.Rows[0]["Q12_4"].ToString();
                    rdobtnlstQ12_5.SelectedValue = dt.Rows[0]["Q12_5"].ToString();

                    txtq12_5_specify.Text = dt.Rows[0]["Q12_other"].ToString();
                }
                else
                {
                    Q12_li.Visible = false;
                    rdobtnlstQ12_1.Visible = false;
                    rdobtnlstQ12_2.Visible = false;
                    rdobtnlstQ12_3.Visible = false;
                    rdobtnlstQ12_4.Visible = false;
                    rdobtnlstQ12_5.Visible = false;
                    //
                    lblQ12_1.Visible = false;
                    lblQ12_2.Visible = false;
                    lblQ12_3.Visible = false;
                    lblQ12_4.Visible = false;
                    lblQ12_5.Visible = false;
                    //
                    txtq12_5_specify.Visible = true;

                    //rdobtnlstQ13_1.SelectedValue = dt.Rows[0]["Q13_1"].ToString();
                    //rdobtnlstQ13_2.SelectedValue = dt.Rows[0]["Q13_2"].ToString();
                    //rdobtnlstQ13_3.SelectedValue = dt.Rows[0]["Q13_3"].ToString();
                    //rdobtnlstQ13_4.SelectedValue = dt.Rows[0]["Q13_4"].ToString();
                    //rdobtnlstQ13_5.SelectedValue = dt.Rows[0]["Q13_5"].ToString();
                }
                Repeater1.DataBind();
                SqlDataRepeater1.DataBind();
                int count13 = 13;
                foreach (RepeaterItem item in this.Repeater1.Items)
                {
                    RadioButtonList rdbtnlst = item.FindControl("rdobtnlstQ13") as RadioButtonList;
                    rdbtnlst.SelectedValue = dt.Rows[0]["Q" + count13].ToString();
                    count13++;
                }
                Repeater2.DataBind();
                SqlDataRepeater2.DataBind();
                int count21 = 21;
                foreach (RepeaterItem item in this.Repeater2.Items)
                {
                    RadioButtonList rdbtnlst = item.FindControl("rdobtnlstQ21") as RadioButtonList;
                    rdbtnlst.SelectedValue = dt.Rows[0]["Q" + count21].ToString();
                    count21++;
                }
                Repeater3.DataBind();
                SqlDataRepeater3.DataBind();
                int count25 = 25;
                foreach (RepeaterItem item in this.Repeater3.Items)
                {
                    RadioButtonList rdbtnlst = item.FindControl("rdobtnlstQ25") as RadioButtonList;
                    rdbtnlst.SelectedValue = dt.Rows[0]["Q" + count25].ToString();
                    count25++;
                }

                Repeater4.DataBind();
                SqlDataRepeater4.DataBind();
                int count29 = 29;
                foreach (RepeaterItem item in this.Repeater4.Items)
                {
                    RadioButtonList rdbtnlst = item.FindControl("rdobtnlstQ29") as RadioButtonList;
                    rdbtnlst.SelectedValue = dt.Rows[0]["Q" + count29].ToString();
                    count29++;
                }
                Repeater5.DataBind();
                SqlDataRepeater5.DataBind();
                int count33 = 33;
                foreach (RepeaterItem item in this.Repeater5.Items)
                {
                    RadioButtonList rdbtnlst = item.FindControl("rdobtnlstQ33") as RadioButtonList;
                    rdbtnlst.SelectedValue = dt.Rows[0]["Q" + count33].ToString();
                    count33++;
                }
                Repeater6.DataBind();
                SqlDataRepeater6.DataBind();
                int count37 = 37;
                foreach (RepeaterItem item in this.Repeater6.Items)
                {
                    RadioButtonList rdbtnlst = item.FindControl("rdobtnlstQ37") as RadioButtonList;
                    rdbtnlst.SelectedValue = dt.Rows[0]["Q" + count37].ToString();
                    count37++;
                }
                Repeater7.DataBind();
                SqlDataRepeater7.DataBind();
                int count57 = 57;
                foreach (RepeaterItem item in this.Repeater7.Items)
                {
                    RadioButtonList rdbtnlst = item.FindControl("rdobtnlstQ57") as RadioButtonList;
                    rdbtnlst.SelectedValue = dt.Rows[0]["Q" + count57].ToString();
                    count57++;
                }
                Repeater8.DataBind();
                SqlDataRepeater8.DataBind();
                int count60 = 60;
                foreach (RepeaterItem item in this.Repeater8.Items)
                {
                    RadioButtonList rdbtnlst = item.FindControl("rdobtnlstQ60") as RadioButtonList;
                    rdbtnlst.SelectedValue = dt.Rows[0]["Q" + count60].ToString();
                    count60++;
                }
                txtQ63.Text = dt.Rows[0]["Q63"].ToString();
                CheckBoxList64.DataBind();
                for (int x = 0; x < CheckBoxList64.Items.Count; x++)
                {
                    int add = x + 1;
                    if (!string.IsNullOrEmpty(dt.Rows[0]["Q64_" + add].ToString()))
                    {
                        CheckBoxList64.Items[x].Selected = true;
                    }
                }

                txt_q64.Text = dt.Rows[0]["Q64_other"].ToString();
                rdobtnlstQ65.SelectedValue = dt.Rows[0]["Q65"].ToString();
                rdobtnlstQ66.SelectedValue = dt.Rows[0]["Q66"].ToString();

                Repeater9.DataBind();
                SqlDataSourceRepeater9.DataBind();
                int count67 = 1;
                foreach (RepeaterItem item in this.Repeater9.Items)
                {
                    RadioButtonList rdbtnlst = item.FindControl("rdobtnlstQ67") as RadioButtonList;
                    rdbtnlst.SelectedValue = dt.Rows[0]["Q67_" + count67].ToString();
                    count67++;
                }
                Repeater10.DataBind();
                SqlDataSourceRepeater10.DataBind();
                int count68 = 1;
                foreach (RepeaterItem item in this.Repeater10.Items)
                {
                    RadioButtonList rdbtnlst = item.FindControl("rdobtnlstQ68") as RadioButtonList;
                    rdbtnlst.SelectedValue = dt.Rows[0]["Q68_" + count68].ToString();
                    count68++;
                }
            }
            else
            {
                Response.Redirect("~/UnauthorizedAccess.aspx");
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Session["siteID"] = hfSiteID.Value;
            Session["Schd_ID"] = hfSchd_ID.Value;
            Session["checkreview"] = true;
            Response.Redirect("~/Survey/PIQRIHomeVisitorOnlineSurvey.aspx");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.Now.AddDays(-1));
            Response.Cache.SetNoStore();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string surveygetCount = "SELECT COUNT(*) SurveyCount FROM HomeVisitorSiteVisitSurvey WHERE Schd_ID =" + hfSchd_ID.Value;
            DataTable dtSurveyCount = DBHelper.GetDataTable(surveygetCount);
            int surveycount = Convert.ToInt32(dtSurveyCount.Rows[0]["SurveyCount"].ToString());
            DataRow row;
            row = hv.HomeVisitorSiteVisitSurvey.NewRow();
            row["SiteID"] = hfSiteID.Value;
            row["Schd_ID"] = hfSchd_ID.Value;
            row["Date"] = DateTime.Now;
            row["HV_DEMOGRAPHICS_Q1"] = rdobtnlstQ1.SelectedValue;
            row["HV_DEMOGRAPHICS_Q2"] = rdobtnlstQ2.SelectedValue;
            row["HV_DEMOGRAPHICS_Q2_Other"] = txtRace.Text;
            row["HV_DEMOGRAPHICS_Q3_yesOrNO"] = rdobtnlst_Yes_or_No.SelectedValue;
            if (rdobtnlst_Yes_or_No.SelectedValue == "1")
            {
                for (int x = 0; x < chkLanguageQ3.Items.Count; x++)
                {
                    if (chkLanguageQ3.Items[x].Selected)
                    {
                        int add = x + 1;
                        row["HV_DEMOGRAPHICS_Q3_" + add] = chkLanguageQ3.Items[x].Value;
                        if (chkLanguageQ3.Items[x].Text.Trim() == "Other, please specify:")
                        {
                            row["HV_DEMOGRAPHICS_Q3_Other"] = txtLanguage.Text;

                        }
                    }
                }
            }
            row["HV_EDUCATION_Q4"] = rdobtnlstQ4.SelectedItem.Value;
            if (!string.IsNullOrEmpty(rdobtnlstQ5.SelectedValue))
            {
                row["HV_EDUCATION_Q5"] = rdobtnlstQ5.SelectedValue;
                if (rdobtnlstQ5.SelectedItem.Text.Trim() == "Other, please specify:")
                {
                    row["HV_EDUCATION_Q5_other"] = txtBestDescribesEducation.Text;
                }
            }
            row["HV_PROFESSIONALEXPERIENCE_Q6_A"] = rdobtnlstQ6_A.SelectedValue;
            row["HV_PROFESSIONALEXPERIENCE_Q6_B"] = rdobtnlstQ6_B.SelectedValue;
            row["HV_PROFESSIONALEXPERIENCE_Q7"] = txtQ7.Text;
            row["HV_PROFESSIONALEXPERIENCE_Q8"] = txtQ8.Text;
            row["HV_PROFESSIONALEXPERIENCE_Q9"] = txtQ9.Text;
            row["HV_PROFESSIONALEXPERIENCE_Q10_1"] = txt10_1.Text;
            row["HV_PROFESSIONALEXPERIENCE_Q10_2"] = txt10_2.Text;
            row["HV_PROFESSIONALEXPERIENCE_Q10_3"] = txt10_3.Text;
            row["HV_PROFESSIONALEXPERIENCE_Q10_4"] = txt10_4.Text;
            row["HV_PROFESSIONALEXPERIENCE_Q10_5"] = txt10_5.Text;
            row["HV_PROFESSIONALEXPERIENCE_Q10_total"] = txtQ10_total.Text;
            row["HV_PROFESSIONALEXPERIENCE_Q11_1"] = txt11_1.Text;
            row["HV_PROFESSIONALEXPERIENCE_Q11_2"] = txt11_2.Text;
            row["HV_PROFESSIONALEXPERIENCE_Q11_3"] = txt11_3.Text;
            row["HV_PROFESSIONALEXPERIENCE_Q11_4"] = txt11_4.Text;
            row["HV_PROFESSIONALEXPERIENCE_Q11_5"] = txt11_5.Text;
            row["HV_PROFESSIONALEXPERIENCE_Q11_6"] = txt11_6.Text;
            row["HV_PROFESSIONALEXPERIENCE_Q11_7"] = txt11_7.Text;
            row["HV_PROFESSIONALEXPERIENCE_Q11_total"] = txt11_Total.Text;
            row["HV_PROFESSIONALEXPERIENCE_Q12"] = txtQ12.Text;
            if (txtQ12.Text != "0")
            {
                row["HV_PROFESSIONALEXPERIENCE_Q12_1"] = rdobtnlstQ12_1.SelectedValue;
                row["HV_PROFESSIONALEXPERIENCE_Q12_2"] = rdobtnlstQ12_2.SelectedValue;
                row["HV_PROFESSIONALEXPERIENCE_Q12_3"] = rdobtnlstQ12_3.SelectedValue;
                row["HV_PROFESSIONALEXPERIENCE_Q12_4"] = rdobtnlstQ12_4.SelectedValue;

                if (!string.IsNullOrEmpty(rdobtnlstQ12_5.SelectedValue) && !string.IsNullOrEmpty(txtq12_5_specify.Text))
                {
                    row["HV_PROFESSIONALEXPERIENCE_Q12_other"] = txtq12_5_specify.Text;
                    row["HV_PROFESSIONALEXPERIENCE_Q12_5"] = rdobtnlstQ12_5.SelectedValue;
                }
            }

            int countQ13 = 13;
            foreach (RepeaterItem item in this.Repeater1.Items)
            {
                RadioButtonList rdbtnlst = item.FindControl("rdobtnlstQ13") as RadioButtonList;
                row["HV_COMMUNICATIONANDDECISIONMAKING_Q" + countQ13] = rdbtnlst.SelectedValue;
                countQ13++;
            }
            int countQ21 = 21;
            foreach (RepeaterItem item in this.Repeater2.Items)
            {
                RadioButtonList rdbtnlst = item.FindControl("rdobtnlstQ21") as RadioButtonList;
                row["HV_SUPPORTIVEWORKENVIRONMENT_WAGESANDBENEFITS_Q" + countQ21] = rdbtnlst.SelectedValue;
                countQ21++;
            }

            int countQ25 = 25;
            foreach (RepeaterItem item in this.Repeater3.Items)
            {
                RadioButtonList rdbtnlst = item.FindControl("rdobtnlstQ25") as RadioButtonList;
                row["HV_SUPPORTIVEWORKENVIRONMENT_STAFFMORALEANDSATISFACTION_Q" + countQ25] = rdbtnlst.SelectedValue;
                countQ25++;
            }

            int count29 = 29;
            foreach (RepeaterItem item in this.Repeater4.Items)
            {
                RadioButtonList rdbtnlst = item.FindControl("rdobtnlstQ29") as RadioButtonList;
                row["HV_SUPPORTIVEWORKENVIRONMENT_MATERIALSANDPHYSICALENVIRONMENT_Q" + count29] = rdbtnlst.SelectedValue;
                count29++;
            }

            int count33 = 33;
            foreach (RepeaterItem item in this.Repeater5.Items)
            {

                RadioButtonList rdbtnlst = item.FindControl("rdobtnlstQ33") as RadioButtonList;
                row["HV_SUPPORTIVEWORKENVIRONMENT_TECHNICALSUPPORT_Q" + count33] = rdbtnlst.SelectedValue;
                count33++;
            }
            int count37 = 37;
            foreach (RepeaterItem item in this.Repeater6.Items)
            {
                RadioButtonList rdbtnlst = item.FindControl("rdobtnlstQ37") as RadioButtonList;
                row["HV_REFLECTIVESUPERVISION_Q" + count37] = rdbtnlst.SelectedValue;
                count37++;
            }

            int count57 = 57;
            foreach (RepeaterItem item in this.Repeater7.Items)
            {
                RadioButtonList rdbtnlst = item.FindControl("rdobtnlstQ57") as RadioButtonList;
                row["HV_SUPERVISONCONTENT_Q" + count57] = rdbtnlst.SelectedValue;
                count57++;
            }

            int count60 = 60;
            foreach (RepeaterItem item in this.Repeater8.Items)
            {
                RadioButtonList rdbtnlst = item.FindControl("rdobtnlstQ60") as RadioButtonList;
                row["HV_SUPERVISONCONTENT_Q" + count60] = rdbtnlst.SelectedValue;
                count60++;
            }

            row["HV_FAMILYINVOLVEMENT_Q63"] = txtQ63.Text;
            for (int x = 0; x < CheckBoxList64.Items.Count; x++)
            {
                if (CheckBoxList64.Items[x].Selected)
                {
                    int add = x + 1;
                    row["HV_PROFESSIONALDEVELOPMENT_Q64_" + add] = CheckBoxList64.Items[x].Value;
                    if (CheckBoxList64.Items[x].Text.Trim() == "Other, please specify:")
                    {
                        row["HV_PROFESSIONALDEVELOPMENT_Q64_Other"] = txt_q64.Text;
                    }

                }
            }
            row["HV_PROFESSIONALDEVELOPMENT_Q65"] = rdobtnlstQ65.SelectedValue;
            row["HV_PROFESSIONALDEVELOPMENT_Q66"] = rdobtnlstQ66.SelectedValue;

            int count67 = 1;
            foreach (RepeaterItem item in this.Repeater9.Items)
            {
                RadioButtonList rdbtnlst = item.FindControl("rdobtnlstQ67") as RadioButtonList;
                row["HV_PROFESSIONALDEVELOPMENT_Q67_" + count67] = rdbtnlst.SelectedValue;
                count67++;
            }

            int count68 = 1;
            foreach (RepeaterItem item in this.Repeater10.Items)
            {
                RadioButtonList rdbtnlst = item.FindControl("rdobtnlstQ68") as RadioButtonList;
                row["HV_PROFESSIONALDEVELOPMENT_Q68_" + count68] = rdbtnlst.SelectedValue;
                count68++;
            }


            hv.HomeVisitorSiteVisitSurvey.Rows.Add(row);
            HVSurveyTableAdapters.HomeVisitorSiteVisitSurveyTableAdapter HVD = new HVSurveyTableAdapters.HomeVisitorSiteVisitSurveyTableAdapter();
            HVD.Update(row);
            string surveygetCountfinal = "SELECT COUNT(*) SurveyCount FROM HomeVisitorSiteVisitSurvey WHERE Schd_ID =" + hfSchd_ID.Value;
            DataTable dtCountFinal = DBHelper.GetDataTable(surveygetCountfinal);
            int surveycountFinal = Convert.ToInt32(dtCountFinal.Rows[0]["SurveyCount"].ToString());
            if (surveycount < surveycountFinal)
            {
                Response.Redirect("~/Survey/CompleteMsg.aspx");
            }
            //string strMsg = "Thank you for completing the survey!";
            //System.Web.HttpContext.Current.Response.Write("<Script Language='JavaScript'>window.alert('" + strMsg + "');window.location.href='default.aspx';</script>");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.Now.AddDays(-1));
            Response.Cache.SetNoStore();
        }

       
          
      
    }
}