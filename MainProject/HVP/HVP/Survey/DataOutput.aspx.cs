using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HVP.Survey
{
    public partial class DataOutput : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.Now.AddDays(-1));
            Response.Cache.SetNoStore();
            if (!IsPostBack)
            {               
                DisplayFirst_SessionData();
                getDataOutput();
                SqlDataSource12.DataBind();
                DataView dv = (DataView)SqlDataSource12.Select(DataSourceSelectArguments.Empty);
                hfID.Value = Session["Id"].ToString();
                Session["Id"] = null;
                DataRowView drv = dv[0];
                lblSiteName.Text = drv["Sites"].ToString() + "-" +hfID.Value;
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

        public void getDataOutput()
        {

            Survey.setgetreview getdt = new setgetreview();
            DataTable dt = new DataTable();
            dt = getdt.getQuestions();
            if (dt.Rows.Count > 0)
            {
                hfSiteID.Value = dt.Rows[0]["siteID"].ToString();
                hfSchd_ID.Value = dt.Rows[0]["Schd_ID"].ToString();
                rdobtnlstQ1.SelectedValue = dt.Rows[0]["HV_DEMOGRAPHICS_Q1"].ToString();
                rdobtnlstQ2.SelectedValue = dt.Rows[0]["HV_DEMOGRAPHICS_Q2"].ToString();
                if (rdobtnlstQ2.SelectedValue != null)
                {
                    txtRace.Text = dt.Rows[0]["HV_DEMOGRAPHICS_Q2_Other"].ToString();
                }

                rdobtnlst_Yes_or_No.SelectedValue = dt.Rows[0]["HV_DEMOGRAPHICS_Q3_yesOrNO"].ToString();
                if (rdobtnlst_Yes_or_No.SelectedValue == "1")
                {
                    lblQ3.Visible = true;
                    chkLanguageQ3.Visible = true;
                    txtLanguage.Visible = true;
                    txtLanguage.Text = dt.Rows[0]["HV_DEMOGRAPHICS_Q3_Other"].ToString();
                    chkLanguageQ3.DataBind();
                    for (int x = 0; x < chkLanguageQ3.Items.Count; x++)
                    {
                        int add = x + 1;
                        if (!string.IsNullOrEmpty(dt.Rows[0]["HV_DEMOGRAPHICS_Q3_" + add].ToString()))
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
                rdobtnlstQ4.SelectedValue = dt.Rows[0]["HV_EDUCATION_Q4"].ToString();
                if ((dt.Rows[0]["HV_EDUCATION_Q4"].ToString() == "1") || (dt.Rows[0]["HV_EDUCATION_Q4"].ToString() == "2"))
                {

                    Q5_li.Visible = false;
                    rdobtnlstQ5.Visible = false;
                    lblQ5.Visible = false;
                    txtBestDescribesEducation.Visible = false;
                }
                else
                {
                    rdobtnlstQ5.DataBind();
                    Q5_li.Visible = true;
                    rdobtnlstQ5.Visible = true;
                    lblQ5.Visible = true;
                    txtBestDescribesEducation.Visible = true;
                    rdobtnlstQ5.SelectedValue = dt.Rows[0]["HV_EDUCATION_Q5"].ToString();
                    txtBestDescribesEducation.Text = dt.Rows[0]["HV_EDUCATION_Q5_other"].ToString();
                }
                rdobtnlstQ6_A.SelectedValue = dt.Rows[0]["HV_PROFESSIONALEXPERIENCE_Q6_A"].ToString();
                rdobtnlstQ6_B.SelectedValue = dt.Rows[0]["HV_PROFESSIONALEXPERIENCE_Q6_B"].ToString();
                txtQ7.Text = dt.Rows[0]["HV_PROFESSIONALEXPERIENCE_Q7"].ToString();
                txtQ8.Text = dt.Rows[0]["HV_PROFESSIONALEXPERIENCE_Q8"].ToString();
                txtQ9.Text = dt.Rows[0]["HV_PROFESSIONALEXPERIENCE_Q9"].ToString();
                txt10_1.Text = dt.Rows[0]["HV_PROFESSIONALEXPERIENCE_Q10_1"].ToString();
                txt10_2.Text = dt.Rows[0]["HV_PROFESSIONALEXPERIENCE_Q10_2"].ToString();
                txt10_3.Text = dt.Rows[0]["HV_PROFESSIONALEXPERIENCE_Q10_3"].ToString();
                txt10_4.Text = dt.Rows[0]["HV_PROFESSIONALEXPERIENCE_Q10_4"].ToString();
                txt10_5.Text = dt.Rows[0]["HV_PROFESSIONALEXPERIENCE_Q10_5"].ToString();
                txtQ10_total.Text = dt.Rows[0]["HV_PROFESSIONALEXPERIENCE_Q10_total"].ToString();
                txt11_1.Text = dt.Rows[0]["HV_PROFESSIONALEXPERIENCE_Q11_1"].ToString();
                txt11_2.Text = dt.Rows[0]["HV_PROFESSIONALEXPERIENCE_Q11_2"].ToString();
                txt11_3.Text = dt.Rows[0]["HV_PROFESSIONALEXPERIENCE_Q11_3"].ToString();
                txt11_4.Text = dt.Rows[0]["HV_PROFESSIONALEXPERIENCE_Q11_4"].ToString();
                txt11_5.Text = dt.Rows[0]["HV_PROFESSIONALEXPERIENCE_Q11_5"].ToString();
                txt11_6.Text = dt.Rows[0]["HV_PROFESSIONALEXPERIENCE_Q11_6"].ToString();
                txt11_7.Text = dt.Rows[0]["HV_PROFESSIONALEXPERIENCE_Q11_7"].ToString();
                txt11_Total.Text = dt.Rows[0]["HV_PROFESSIONALEXPERIENCE_Q11_total"].ToString();
                txtQ12.Text = dt.Rows[0]["HV_PROFESSIONALEXPERIENCE_Q12"].ToString();
                if (Convert.ToInt32(dt.Rows[0]["HV_PROFESSIONALEXPERIENCE_Q12"].ToString()) > 0)
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
                    rdobtnlstQ12_1.SelectedValue = dt.Rows[0]["HV_PROFESSIONALEXPERIENCE_Q12_1"].ToString();
                    rdobtnlstQ12_2.SelectedValue = dt.Rows[0]["HV_PROFESSIONALEXPERIENCE_Q12_2"].ToString();
                    rdobtnlstQ12_3.SelectedValue = dt.Rows[0]["HV_PROFESSIONALEXPERIENCE_Q12_3"].ToString();
                    rdobtnlstQ12_4.SelectedValue = dt.Rows[0]["HV_PROFESSIONALEXPERIENCE_Q12_4"].ToString();
                    rdobtnlstQ12_5.SelectedValue = dt.Rows[0]["HV_PROFESSIONALEXPERIENCE_Q12_5"].ToString();
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
                    rdobtnlstQ12_1.SelectedValue = dt.Rows[0]["HV_PROFESSIONALEXPERIENCE_Q12_1"].ToString();
                    rdobtnlstQ12_2.SelectedValue = dt.Rows[0]["HV_PROFESSIONALEXPERIENCE_Q12_2"].ToString();
                    rdobtnlstQ12_3.SelectedValue = dt.Rows[0]["HV_PROFESSIONALEXPERIENCE_Q12_3"].ToString();
                    rdobtnlstQ12_4.SelectedValue = dt.Rows[0]["HV_PROFESSIONALEXPERIENCE_Q12_4"].ToString();
                    rdobtnlstQ12_5.SelectedValue = dt.Rows[0]["HV_PROFESSIONALEXPERIENCE_Q12_5"].ToString();
                }
                Repeater1.DataBind();
                SqlDataRepeater1.DataBind();
                int count13 = 13;
                foreach (RepeaterItem item in this.Repeater1.Items)
                {
                    RadioButtonList rdbtnlst = item.FindControl("rdobtnlstQ13") as RadioButtonList;
                    rdbtnlst.SelectedValue = dt.Rows[0]["HV_COMMUNICATIONANDDECISIONMAKING_Q" + count13].ToString();
                    count13++;
                }
                Repeater2.DataBind();
                SqlDataRepeater2.DataBind();
                int count21 = 21;
                foreach (RepeaterItem item in this.Repeater2.Items)
                {
                    RadioButtonList rdbtnlst = item.FindControl("rdobtnlstQ21") as RadioButtonList;
                    rdbtnlst.SelectedValue = dt.Rows[0]["HV_SUPPORTIVEWORKENVIRONMENT_WAGESANDBENEFITS_Q" + count21].ToString();
                    count21++;
                }
                Repeater3.DataBind();
                SqlDataRepeater3.DataBind();
                int count25 = 25;
                foreach (RepeaterItem item in this.Repeater3.Items)
                {
                    RadioButtonList rdbtnlst = item.FindControl("rdobtnlstQ25") as RadioButtonList;
                    rdbtnlst.SelectedValue = dt.Rows[0]["HV_SUPPORTIVEWORKENVIRONMENT_STAFFMORALEANDSATISFACTION_Q" + count25].ToString();
                    count25++;
                }

                Repeater4.DataBind();
                SqlDataRepeater4.DataBind();
                int count29 = 29;
                foreach (RepeaterItem item in this.Repeater4.Items)
                {
                    RadioButtonList rdbtnlst = item.FindControl("rdobtnlstQ29") as RadioButtonList;
                    rdbtnlst.SelectedValue = dt.Rows[0]["HV_SUPPORTIVEWORKENVIRONMENT_MATERIALSANDPHYSICALENVIRONMENT_Q" + count29].ToString();
                    count29++;
                }
                Repeater5.DataBind();
                SqlDataRepeater5.DataBind();
                int count33 = 33;
                foreach (RepeaterItem item in this.Repeater5.Items)
                {
                    RadioButtonList rdbtnlst = item.FindControl("rdobtnlstQ33") as RadioButtonList;
                    rdbtnlst.SelectedValue = dt.Rows[0]["HV_SUPPORTIVEWORKENVIRONMENT_TECHNICALSUPPORT_Q" + count33].ToString();
                    count33++;
                }
                Repeater6.DataBind();
                SqlDataRepeater6.DataBind();
                int count37 = 37;
                foreach (RepeaterItem item in this.Repeater6.Items)
                {
                    RadioButtonList rdbtnlst = item.FindControl("rdobtnlstQ37") as RadioButtonList;
                    rdbtnlst.SelectedValue = dt.Rows[0]["HV_REFLECTIVESUPERVISION_Q" + count37].ToString();
                    count37++;
                }
                Repeater7.DataBind();
                SqlDataRepeater7.DataBind();
                int count57 = 57;
                foreach (RepeaterItem item in this.Repeater7.Items)
                {
                    RadioButtonList rdbtnlst = item.FindControl("rdobtnlstQ57") as RadioButtonList;
                    rdbtnlst.SelectedValue = dt.Rows[0]["HV_SUPERVISONCONTENT_Q" + count57].ToString();
                    count57++;
                }
                Repeater8.DataBind();
                SqlDataRepeater8.DataBind();
                int count60 = 60;
                foreach (RepeaterItem item in this.Repeater8.Items)
                {
                    RadioButtonList rdbtnlst = item.FindControl("rdobtnlstQ60") as RadioButtonList;
                    rdbtnlst.SelectedValue = dt.Rows[0]["HV_SUPERVISONCONTENT_Q" + count60].ToString();
                    count60++;
                }
                txtQ63.Text = dt.Rows[0]["HV_FAMILYINVOLVEMENT_Q63"].ToString();
                CheckBoxList64.DataBind();
                for (int x = 0; x < CheckBoxList64.Items.Count; x++)
                {
                    int add = x + 1;
                    if (!string.IsNullOrEmpty(dt.Rows[0]["HV_PROFESSIONALDEVELOPMENT_Q64_" + add].ToString()))
                    {
                        CheckBoxList64.Items[x].Selected = true;
                    }
                }

                txt_q64.Text = dt.Rows[0]["HV_PROFESSIONALDEVELOPMENT_Q64_Other"].ToString();
                rdobtnlstQ65.SelectedValue = dt.Rows[0]["HV_PROFESSIONALDEVELOPMENT_Q65"].ToString();
                rdobtnlstQ66.SelectedValue = dt.Rows[0]["HV_PROFESSIONALDEVELOPMENT_Q66"].ToString();

                Repeater9.DataBind();
                SqlDataSourceRepeater9.DataBind();
                int count67 = 1;
                foreach (RepeaterItem item in this.Repeater9.Items)
                {
                    RadioButtonList rdbtnlst = item.FindControl("rdobtnlstQ67") as RadioButtonList;
                    rdbtnlst.SelectedValue = dt.Rows[0]["HV_PROFESSIONALDEVELOPMENT_Q67_" + count67].ToString();
                    count67++;
                }
                Repeater10.DataBind();
                SqlDataSourceRepeater10.DataBind();
                int count68 = 1;
                foreach (RepeaterItem item in this.Repeater10.Items)
                {
                    RadioButtonList rdbtnlst = item.FindControl("rdobtnlstQ68") as RadioButtonList;
                    rdbtnlst.SelectedValue = dt.Rows[0]["HV_PROFESSIONALDEVELOPMENT_Q68_" + count68].ToString();
                    count68++;
                }
            }
            else
            {
                Response.Redirect("~/UnauthorizedAccess.aspx");
            }
        }               
    }
}