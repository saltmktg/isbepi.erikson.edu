using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HVP
{
    public partial class PIQRI_Home_Visitor_Online_Survey : System.Web.UI.Page
    {

        HVSurvey hv = new HVSurvey();
        DataRow row;

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.Now.AddDays(-1));
            Response.Cache.SetNoStore();
            if (!IsPostBack)
            {
                //MultiView1.ActiveViewIndex = 0;



                if (Session["siteID"] == null || Session["siteID"].ToString().Length == 0)
                {
                    Response.Redirect("~/Survey/HomeVisitorCheckID.aspx");
                }
                else
                {
                    hfSiteId.Value = Session["siteID"].ToString();
                    hsSchd_id.Value = Session["Schd_ID"].ToString();
                    DisplayFirst_SessionData();
                    Session["siteID"] = null;
                    Session["Schd_ID"] = null;
                    HttpContext.Current.Response.Cache.SetExpires(DateTime.UtcNow.AddDays(-1));
                    HttpContext.Current.Response.Cache.SetValidUntilExpires(false);
                    HttpContext.Current.Response.Cache.SetRevalidation(HttpCacheRevalidation.AllCaches);
                    HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    HttpContext.Current.Response.Cache.SetNoStore();
                    MultiView1.ActiveViewIndex = 0;

                    txtRace.Attributes.Add("autocomplete", "off");
                    txt10_1.Attributes.Add("autocomplete", "off");
                    txt10_2.Attributes.Add("autocomplete", "off");
                    txt10_3.Attributes.Add("autocomplete", "off");
                    txt10_4.Attributes.Add("autocomplete", "off");
                    txt10_5.Attributes.Add("autocomplete", "off");
                    txtLanguage.Attributes.Add("autocomplete", "off");
                    txtBestDescribesEducation.Attributes.Add("autocomplete", "off");
                    txtQ7.Attributes.Add("autocomplete", "off");
                    txtQ8.Attributes.Add("autocomplete", "off");
                    txtQ9.Attributes.Add("autocomplete", "off");
                    txt11_1.Attributes.Add("autocomplete", "off");
                    txt11_2.Attributes.Add("autocomplete", "off");
                    txt11_3.Attributes.Add("autocomplete", "off");
                    txt11_4.Attributes.Add("autocomplete", "off");
                    txt11_5.Attributes.Add("autocomplete", "off");
                    txt11_6.Attributes.Add("autocomplete", "off");
                    txt11_7.Attributes.Add("autocomplete", "off");
                    txtQ12.Attributes.Add("autocomplete", "off");
                    txtq12_5_specify.Attributes.Add("autocomplete", "off");
                    txtQ63.Attributes.Add("autocomplete", "off");
                    txt_q64.Attributes.Add("autocomplete", "off");
                    if (Session["checkreview"] != null)
                    {
                        rdobtnlstQ4.DataBind();
                        rdobtnlstQ5.DataBind();
                        rdobtnlstQ6_A.DataBind();
                        rdobtnlstQ6_B.DataBind();
                        rdobtnlstQ65.DataBind();
                        rdobtnlstQ66.DataBind();
                        getData();
                    }
                    ////string strInsert = "INSERT INTO [ISBEPI_DEV].[dbo].[HomeVisitorSiteVisitSurvey] ([SiteID]) VALUES(" + siteID + ")";
                    //int count = DBHelper.ExecuteSQL(strInsert);
                    //if (count > 0)
                    //{                    

                    //}
                    //else
                    //{
                    //    //Error
                    //}
                }

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

        protected void imgbtnForward0_Click(object sender, ImageClickEventArgs e)
        {
            bool check = false;
            lblQ2Comment.Visible = true;
            lblQ3Comment.Visible = true;
            if (rdobtnlstQ2.SelectedItem.Text.Trim() == "Other (Please specify)" && txtRace.Text.Trim().Length < 1)
            {
                lblQ2Comment.Text = "Required";
                check = true;
            }
            if (rdobtnlst_Yes_or_No.SelectedValue == "1")
            {
                if (chkLanguageQ3.SelectedValue.Length > 0)
                {
                    for (int x = 0; x < chkLanguageQ3.Items.Count; x++)
                    {

                        if (chkLanguageQ3.Items[x].Selected)
                        {
                            if (chkLanguageQ3.Items[x].Text.Trim() == "Other, please specify:".Trim() && txtLanguage.Text.Length < 1)
                            {
                                lblQ3Comment.Visible = false;
                                lblQ3Comment.Text = "Required";
                                check = true;
                            }
                            else
                            {
                                lblQ3Comment.Visible = false;
                            }
                        }
                    }
                }
                else
                {
                    lblQ3Comment.Text = "Required";
                    check = true;
                }
            }

            if (check == false)
            {
                lblQ2Comment.Visible = false;
                lblQ3Comment.Visible = false;
                MultiView1.ActiveViewIndex = 1;
            }
        }

        protected void imgbtnForward1_Click(object sender, ImageClickEventArgs e)
        {
            bool check = false;
            lblQ5Comment.Visible = true;

            if (((rdobtnlstQ4.SelectedItem.Text.Trim() == "Bachelors degree or currently working towards bachelors degree") ||
                (rdobtnlstQ4.SelectedItem.Text.Trim() == "Beyond bachelors degree")) && (string.IsNullOrEmpty(rdobtnlstQ5.SelectedValue)))
            {
                check = true;
                lblQ5Comment.Text = "Required";
            }
            if (!string.IsNullOrEmpty(rdobtnlstQ5.SelectedValue))
            {
                if ((rdobtnlstQ5.SelectedItem.Text.Trim() == "Other, please specify:") && (string.IsNullOrEmpty(txtBestDescribesEducation.Text.Trim())))
                {
                    check = true;
                    lblQ5Comment.Text = "Required";
                }
            }

            if (check == false)
            {
                lblQ5Comment.Visible = false;
                MultiView1.ActiveViewIndex = 2;
            }
        }


        protected void imgbtnback1_Click(object sender, ImageClickEventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void imgV3F_Click(object sender, ImageClickEventArgs e)
        {
            bool check = false;

            if ((txtQ12.Text != "0") && string.IsNullOrEmpty(rdobtnlstQ12_1.SelectedValue) && string.IsNullOrEmpty(rdobtnlstQ12_2.SelectedValue) &&
                string.IsNullOrEmpty(rdobtnlstQ12_3.SelectedValue) && string.IsNullOrEmpty(rdobtnlstQ12_5.SelectedValue))
            {
                check = true;
                lblcommentQ12_1.Visible = true;
                lblcommentQ12_2.Visible = true;
                lblcommentQ12_3.Visible = true;
                lblcommentQ12_4.Visible = true;

                lblcommentQ12.Visible = true;
                lblcommentQ12_1.Text = "Required";
                lblcommentQ12_2.Text = "Required";
                lblcommentQ12_3.Text = "Required";
                lblcommentQ12_4.Text = "Required";
            }
            else
            {
                if (((!string.IsNullOrEmpty(rdobtnlstQ12_5.SelectedValue) && string.IsNullOrEmpty(txtq12_5_specify.Text)) ||
                    ((string.IsNullOrEmpty(rdobtnlstQ12_5.SelectedValue) && !string.IsNullOrEmpty(txtq12_5_specify.Text)))))
                {
                    check = true;
                    if (string.IsNullOrEmpty(rdobtnlstQ12_5.SelectedValue))
                    {
                        lblcommentQ12_5_1.Visible = true;
                    }
                    else
                    {
                        lblcommentQ12_5.Visible = true;
                    }

                }
                else
                {
                    lblcommentQ12_5.Visible = false;
                    lblcommentQ12_5_1.Visible = false;
                    check = false;
                }
            }
            if (check == false)
            {
                lblcommentQ12_1.Visible = false;
                lblcommentQ12_2.Visible = false;
                lblcommentQ12_3.Visible = false;
                lblcommentQ12_4.Visible = false;
                lblcommentQ12.Visible = false;

                toGetInfo getinfo = new toGetInfo();
                getinfo.Set_total_1(Convert.ToInt32(txt10_1.Text) + Convert.ToInt32(txt10_2.Text) + Convert.ToInt32(txt10_3.Text) + Convert.ToInt32(txt10_4.Text) + Convert.ToInt32(txt10_5.Text));
                txtQ10_total.Text = getinfo.Get_total_1().ToString();
                getinfo.Set_total_2(Convert.ToInt32(txt11_1.Text) + Convert.ToInt32(txt11_2.Text) + Convert.ToInt32(txt11_3.Text) + Convert.ToInt32(txt11_4.Text) + Convert.ToInt32(txt11_5.Text) + Convert.ToInt32(txt11_6.Text) + Convert.ToInt32(txt11_7.Text));
                txt11_Total.Text = getinfo.Get_total_2().ToString();
                MultiView1.ActiveViewIndex = 3;
            }

        }

        protected void imgV3B_Click(object sender, ImageClickEventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void imgbtnV4F_Click(object sender, ImageClickEventArgs e)
        {
            MultiView1.ActiveViewIndex = 4;
        }

        protected void imgbtnV4B_Click(object sender, ImageClickEventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
        }

        protected void imgbtnV5F_Click(object sender, ImageClickEventArgs e)
        {
            MultiView1.ActiveViewIndex = 5;
        }

        protected void imgbtnV5B_Click(object sender, ImageClickEventArgs e)
        {
            MultiView1.ActiveViewIndex = 3;
        }

        protected void imgbtnV6F_Click(object sender, ImageClickEventArgs e)
        {
            MultiView1.ActiveViewIndex = 6;
        }

        protected void imgbtnV6B_Click(object sender, ImageClickEventArgs e)
        {
            MultiView1.ActiveViewIndex = 4;
        }

        protected void imgbtnV7F_Click(object sender, ImageClickEventArgs e)
        {
            MultiView1.ActiveViewIndex = 7;
        }

        protected void imgbtnV7B_Click(object sender, ImageClickEventArgs e)
        {
            MultiView1.ActiveViewIndex = 5;
        }
        protected void imgbtnV8F_Click(object sender, ImageClickEventArgs e)
        {
            MultiView1.ActiveViewIndex = 8;
        }

        protected void imgbtnV8B_Click(object sender, ImageClickEventArgs e)
        {
            MultiView1.ActiveViewIndex = 6;
        }

        protected void imgbtnV9F_Click(object sender, ImageClickEventArgs e)
        {
            MultiView1.ActiveViewIndex = 9;
        }

        protected void imgbtnV9B_Click(object sender, ImageClickEventArgs e)
        {
            MultiView1.ActiveViewIndex = 7;
        }
        protected void imgbtnV10F_Click(object sender, ImageClickEventArgs e)
        {
            MultiView1.ActiveViewIndex = 10;
        }

        protected void imgbtnV10B_Click(object sender, ImageClickEventArgs e)
        {
            MultiView1.ActiveViewIndex = 8;
        }
        protected void imgbtnV11F_Click(object sender, ImageClickEventArgs e)
        {
            MultiView1.ActiveViewIndex = 11;
        }

        protected void imgbtnV11B_Click(object sender, ImageClickEventArgs e)
        {
            MultiView1.ActiveViewIndex = 9;
        }

        protected void imgbtnV12B_Click(object sender, ImageClickEventArgs e)
        {
            MultiView1.ActiveViewIndex = 10;

        }



        public void setdata()
        {
            DataTable getDt = new DataTable();
            getDt.Columns.Add("siteID");
            getDt.Columns.Add("Schd_ID");
            getDt.Columns.Add("Q1");
            getDt.Columns.Add("Q2");
            getDt.Columns.Add("Q2_Other");
            getDt.Columns.Add("Q3_yesOrNO");
            getDt.Columns.Add("Q3_1");
            getDt.Columns.Add("Q3_2");
            getDt.Columns.Add("Q3_3");
            getDt.Columns.Add("Q3_4");
            getDt.Columns.Add("Q3_5");
            getDt.Columns.Add("Q3_Other");
            getDt.Columns.Add("Q4");
            getDt.Columns.Add("Q5");
            getDt.Columns.Add("Q5_other");
            getDt.Columns.Add("Q6_A");
            getDt.Columns.Add("Q6_B");
            getDt.Columns.Add("Q7");
            getDt.Columns.Add("Q8");
            getDt.Columns.Add("Q9");
            getDt.Columns.Add("Q10_1");
            getDt.Columns.Add("Q10_2");
            getDt.Columns.Add("Q10_3");
            getDt.Columns.Add("Q10_4");
            getDt.Columns.Add("Q10_5");
            getDt.Columns.Add("Q10_total");
            getDt.Columns.Add("Q11_1");
            getDt.Columns.Add("Q11_2");
            getDt.Columns.Add("Q11_3");
            getDt.Columns.Add("Q11_4");
            getDt.Columns.Add("Q11_5");
            getDt.Columns.Add("Q11_6");
            getDt.Columns.Add("Q11_7");
            getDt.Columns.Add("Q11_total");
            getDt.Columns.Add("Q12");
            getDt.Columns.Add("Q12_1");
            getDt.Columns.Add("Q12_2");
            getDt.Columns.Add("Q12_3");
            getDt.Columns.Add("Q12_4");
            getDt.Columns.Add("Q12_5");
            getDt.Columns.Add("Q12_other");
            getDt.Columns.Add("Q13");
            getDt.Columns.Add("Q14");
            getDt.Columns.Add("Q15");
            getDt.Columns.Add("Q16");
            getDt.Columns.Add("Q17");
            getDt.Columns.Add("Q18");
            getDt.Columns.Add("Q19");
            getDt.Columns.Add("Q20");
            getDt.Columns.Add("Q21");
            getDt.Columns.Add("Q22");
            getDt.Columns.Add("Q23");
            getDt.Columns.Add("Q24");
            getDt.Columns.Add("Q25");
            getDt.Columns.Add("Q26");
            getDt.Columns.Add("Q27");
            getDt.Columns.Add("Q28");
            getDt.Columns.Add("Q29");
            getDt.Columns.Add("Q30");
            getDt.Columns.Add("Q31");
            getDt.Columns.Add("Q32");
            getDt.Columns.Add("Q33");
            getDt.Columns.Add("Q34");
            getDt.Columns.Add("Q35");
            getDt.Columns.Add("Q36");
            getDt.Columns.Add("Q37");
            getDt.Columns.Add("Q38");
            getDt.Columns.Add("Q39");
            getDt.Columns.Add("Q40");
            getDt.Columns.Add("Q41");
            getDt.Columns.Add("Q42");
            getDt.Columns.Add("Q43");
            getDt.Columns.Add("Q44");
            getDt.Columns.Add("Q45");
            getDt.Columns.Add("Q46");
            getDt.Columns.Add("Q47");
            getDt.Columns.Add("Q48");
            getDt.Columns.Add("Q49");
            getDt.Columns.Add("Q50");
            getDt.Columns.Add("Q51");
            getDt.Columns.Add("Q52");
            getDt.Columns.Add("Q53");
            getDt.Columns.Add("Q54");
            getDt.Columns.Add("Q55");
            getDt.Columns.Add("Q56");
            getDt.Columns.Add("Q57");
            getDt.Columns.Add("Q58");
            getDt.Columns.Add("Q59");
            getDt.Columns.Add("Q60");
            getDt.Columns.Add("Q61");
            getDt.Columns.Add("Q62");
            getDt.Columns.Add("Q63");
            getDt.Columns.Add("Q64_1");
            getDt.Columns.Add("Q64_2");
            getDt.Columns.Add("Q64_3");
            getDt.Columns.Add("Q64_4");
            getDt.Columns.Add("Q64_5");
            getDt.Columns.Add("Q64_6");
            getDt.Columns.Add("Q64_7");
            getDt.Columns.Add("Q64_8");
            getDt.Columns.Add("Q64_9");
            getDt.Columns.Add("Q64_10");
            getDt.Columns.Add("Q64_11");
            getDt.Columns.Add("Q64_12");
            getDt.Columns.Add("Q64_13");
            getDt.Columns.Add("Q64_14");
            getDt.Columns.Add("Q64_other");
            getDt.Columns.Add("Q65");
            getDt.Columns.Add("Q66");
            getDt.Columns.Add("Q67_1");
            getDt.Columns.Add("Q67_2");
            getDt.Columns.Add("Q67_3");
            getDt.Columns.Add("Q67_4");
            getDt.Columns.Add("Q67_5");
            getDt.Columns.Add("Q68_1");
            getDt.Columns.Add("Q68_2");
            getDt.Columns.Add("Q68_3");
            getDt.Columns.Add("Q68_4");
            getDt.Columns.Add("Q68_5");
            getDt.Columns.Add("Q68_6");
            getDt.Columns.Add("Q68_7");
            getDt.Columns.Add("Q68_8");

            row = getDt.NewRow();

            row["siteID"] = hfSiteId.Value;
            row["Schd_id"] = hsSchd_id.Value;
            //row["Date"] = DateTime.Now;            
            row["Q1"] = rdobtnlstQ1.SelectedValue;
            row["Q2"] = rdobtnlstQ2.SelectedValue;
            row["Q2_Other"] = txtRace.Text;
            row["Q3_yesOrNO"] = rdobtnlst_Yes_or_No.SelectedValue;
            if (rdobtnlst_Yes_or_No.SelectedValue == "1")
            {
                for (int x = 0; x < chkLanguageQ3.Items.Count; x++)
                {
                    if (chkLanguageQ3.Items[x].Selected)
                    {
                        int add = x + 1;
                        row["Q3_" + add] = chkLanguageQ3.Items[x].Value;
                        if (chkLanguageQ3.Items[x].Text.Trim() == "Other, please specify:")
                        {
                            row["Q3_Other"] = txtLanguage.Text;

                        }
                    }
                }
            }
            row["Q4"] = rdobtnlstQ4.SelectedItem.Value;
            if ((rdobtnlstQ4.SelectedValue == "1") || (rdobtnlstQ4.SelectedValue == "2"))
            {
                row["Q5"] = 0;
            }
            else
            {
                if (!string.IsNullOrEmpty(rdobtnlstQ5.SelectedValue))
                {
                    row["Q5"] = rdobtnlstQ5.SelectedValue;
                    if (rdobtnlstQ5.SelectedItem.Text.Trim() == "Other, please specify:")
                    {
                        row["Q5_other"] = txtBestDescribesEducation.Text;
                    }
                }
            }

            row["Q6_A"] = rdobtnlstQ6_A.SelectedValue;
            row["Q6_B"] = rdobtnlstQ6_B.SelectedValue;
            row["Q7"] = txtQ7.Text;
            row["Q8"] = txtQ8.Text;
            row["Q9"] = txtQ9.Text;
            row["Q10_1"] = txt10_1.Text;
            row["Q10_2"] = txt10_2.Text;
            row["Q10_3"] = txt10_3.Text;
            row["Q10_4"] = txt10_4.Text;
            row["Q10_5"] = txt10_5.Text;
            row["Q10_total"] = txtQ10_total.Text;
            row["Q11_1"] = txt11_1.Text;
            row["Q11_2"] = txt11_2.Text;
            row["Q11_3"] = txt11_3.Text;
            row["Q11_4"] = txt11_4.Text;
            row["Q11_5"] = txt11_5.Text;
            row["Q11_6"] = txt11_6.Text;
            row["Q11_7"] = txt11_7.Text;
            row["Q11_total"] = txt11_Total.Text;
            row["Q12"] = txtQ12.Text;
            if (Convert.ToInt32(txtQ12.Text) != 0)
            {
                row["Q12_1"] = rdobtnlstQ12_1.SelectedValue;
                row["Q12_2"] = rdobtnlstQ12_2.SelectedValue;
                row["Q12_3"] = rdobtnlstQ12_3.SelectedValue;
                row["Q12_4"] = rdobtnlstQ12_4.SelectedValue;

                if (!string.IsNullOrEmpty(rdobtnlstQ12_5.SelectedValue) && !string.IsNullOrEmpty(txtq12_5_specify.Text))
                {
                    row["Q12_other"] = txtq12_5_specify.Text;
                    row["Q12_5"] = rdobtnlstQ12_5.SelectedValue;
                }
            }
            int countQ13 = 13;
            foreach (RepeaterItem item in this.Repeater1.Items)
            {               
                RadioButtonList rdbtnlst = item.FindControl("rdobtnlstQ13") as RadioButtonList;
                row["Q" + countQ13] = rdbtnlst.SelectedValue;
                countQ13++;
            }
            int countQ21 = 21;
            foreach (RepeaterItem item in this.Repeater2.Items)
            {
                RadioButtonList rdbtnlst = item.FindControl("rdobtnlstQ21") as RadioButtonList;
                row["Q" + countQ21] = rdbtnlst.SelectedValue;
                countQ21++;
            }

            int countQ25 = 25;
            foreach (RepeaterItem item in this.Repeater3.Items)
            {                
                RadioButtonList rdbtnlst = item.FindControl("rdobtnlstQ25") as RadioButtonList;
                row["Q" + countQ25] = rdbtnlst.SelectedValue;
                countQ25++;
            }

            int count29 = 29;
            foreach (RepeaterItem item in this.Repeater4.Items)
            {                
                RadioButtonList rdbtnlst = item.FindControl("rdobtnlstQ29") as RadioButtonList;
                row["Q" + count29] = rdbtnlst.SelectedValue;
                count29++;
            }

            int count33 = 33;
            foreach (RepeaterItem item in this.Repeater5.Items)
            {
                
                RadioButtonList rdbtnlst = item.FindControl("rdobtnlstQ33") as RadioButtonList;
                row["Q" + count33] = rdbtnlst.SelectedValue;
                count33++;
            }
            int count37 = 37;
            foreach (RepeaterItem item in this.Repeater6.Items)
            {                
                RadioButtonList rdbtnlst = item.FindControl("rdobtnlstQ37") as RadioButtonList;
                row["Q" + count37] = rdbtnlst.SelectedValue;
                count37++;
            }

            int count57 = 57;
            foreach (RepeaterItem item in this.Repeater7.Items)
            {                
                RadioButtonList rdbtnlst = item.FindControl("rdobtnlstQ57") as RadioButtonList;
                row["Q" + count57] = rdbtnlst.SelectedValue;
                count57++;
            }

            int count60 = 60;
            foreach (RepeaterItem item in this.Repeater8.Items)
            {               
                RadioButtonList rdbtnlst = item.FindControl("rdobtnlstQ60") as RadioButtonList;
                row["Q" + count60] = rdbtnlst.SelectedValue;
                count60++;
            }

            row["Q63"] = txtQ63.Text;
            for (int x = 0; x < CheckBoxList64.Items.Count; x++)
            {
                if (CheckBoxList64.Items[x].Selected)
                {
                    int add = x + 1;
                    row["Q64_" + add] = CheckBoxList64.Items[x].Value;
                    if (CheckBoxList64.Items[x].Text.Trim() == "Other, please specify:")
                    {
                        row["Q64_Other"] = txt_q64.Text;
                    }

                }
            }
            row["Q65"] = rdobtnlstQ65.SelectedValue;
            row["Q66"] = rdobtnlstQ66.SelectedValue;

            int count67 = 1;
            foreach (RepeaterItem item in this.Repeater9.Items)
            {                
                RadioButtonList rdbtnlst = item.FindControl("rdobtnlstQ67") as RadioButtonList;
                row["Q67_" + count67] = rdbtnlst.SelectedValue;
                count67++;
            }

            int count68 = 1;
            foreach (RepeaterItem item in this.Repeater10.Items)
            {                
                RadioButtonList rdbtnlst = item.FindControl("rdobtnlstQ68") as RadioButtonList;
                row["Q68_" + count68] = rdbtnlst.SelectedValue;
                count68++;
            }



            getDt.Rows.Add(row);
            Survey.setgetreview setdt = new Survey.setgetreview();
            //setdt.setQuestions(getDt);

            // hv.HomeVisitorSiteVisitSurvey.Rows.Add(row);
            //HVSurveyTableAdapters.HomeVisitorSiteVisitSurveyTableAdapter HVD = new HVSurveyTableAdapters.HomeVisitorSiteVisitSurveyTableAdapter();
            //HVD.Update(row);

            //string strMsg = "Thank you for completing the survey!";
            //System.Web.HttpContext.Current.Response.Write("<Script Language='JavaScript'>window.alert('" + strMsg + "');window.location.href='default.aspx';</script>");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.Now.AddDays(-1));
            Response.Cache.SetNoStore();

            setdt.setQuestions(getDt);
            Response.Redirect("~/Survey/HV_Review.aspx");
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {          
            int count = 0;
            bool check = false;
            lblQ64Comment.Visible = false;
            if (CheckBoxList64.SelectedValue.Length < 1 || CheckBoxList64.SelectedValue.Length > 0)
            {
                for (int x = 0; x < CheckBoxList64.Items.Count; x++)
                {
                    if (string.IsNullOrEmpty(CheckBoxList64.SelectedValue))
                    {
                        lblQ64Comment.Text = "Required";
                        check = true;
                        lblQ64Comment.Visible = true;
                    }
                    else
                    {

                        if (CheckBoxList64.Items[x].Selected)
                        {

                            if (CheckBoxList64.Items[x].Value == "14" && txt_q64.Text.Length < 1)
                            {
                                lblQ64Comment.Text = "Required-please specify:";
                                check = true;
                                lblQ64Comment.Visible = true;
                            }
                            count++;
                        }

                    }

                }
            }
            if (count < 3)
            {
                lblQ64Comment1.Text = "-Required at least three Topics.";
                check = true;
                lblQ64Comment.Visible = true;

            }
            if (check == false)
            {
                lblQ64Comment.Visible = false;
                setdata();
                //Response.Redirect("~/Survey/HV_Review.aspx");
            }
        }

        protected void rdobtnlstQ4_SelectedIndexChanged(object sender, EventArgs e)
        {
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
            }
        }

        protected void MainScriptManager_Navigate(object sender, HistoryEventArgs e)
        {
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
            }

            if (txtQ12.Text == "0")
            {
                lblQ12_B.Visible = false;
                Q12_li.Visible = false;
            }
            else
            {
                lblQ12_B.Visible = true;
                Q12_li.Visible = true;
            }
        }


        protected void txtQ12_TextChanged(object sender, EventArgs e)
        {
            if (txtQ12.Text == "0")
            {
                //ScriptManager sm = ScriptManager.GetCurrent(this);                
                //sm.SetFocus(txtQ12);
                lblQ12_B.Visible = false;
                lblQ12_1.Visible = false;
                lblQ12_2.Visible = false;
                lblQ12_3.Visible = false;
                lblQ12_4.Visible = false;
                lblQ12_5.Visible = false;
                Q12_li.Visible = false;
                txtq12_5_specify.Visible = false;
                rdobtnlstQ12_1.Visible = false;
                rdobtnlstQ12_2.Visible = false;
                rdobtnlstQ12_3.Visible = false;
                rdobtnlstQ12_4.Visible = false;
                rdobtnlstQ12_5.Visible = false;

            }
            else
            {
                //ScriptManager sm = ScriptManager.GetCurrent(this);
                //sm.SetFocus(Q13_li);
                lblQ12_B.Visible = true;
                lblQ12_1.Visible = true;
                lblQ12_2.Visible = true;
                lblQ12_3.Visible = true;
                lblQ12_4.Visible = true;
                lblQ12_5.Visible = true;
                Q12_li.Visible = true;
                txtq12_5_specify.Visible = true;
                rdobtnlstQ12_1.Visible = true;
                rdobtnlstQ12_2.Visible = true;
                rdobtnlstQ12_3.Visible = true;
                rdobtnlstQ12_4.Visible = true;
                rdobtnlstQ12_5.Visible = true;
            }
        }

        protected void rdobtnlst_Yes_or_No_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rdobtnlst_Yes_or_No.SelectedValue == "1")
            {
                lblQ3.Visible = true;
                chkLanguageQ3.Visible = true;
                txtLanguage.Visible = true;
            }
            else
            {
                lblQ3.Visible = false;
                chkLanguageQ3.Visible = false;
                txtLanguage.Visible = false;
            }
        }

        protected void getData()
        {

            Survey.setgetreview getdt = new Survey.setgetreview();
            DataTable dt = new DataTable();
            dt = getdt.getQuestions();

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
    }
}