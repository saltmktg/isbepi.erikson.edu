using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace HVP.Survey
{
    public partial class HVSurveyOnline : System.Web.UI.Page
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
                Session["siteID"] = 69;
                if (Session["siteID"] == null)
                {
                    Response.Redirect("~/Survey/HomeVisitorCheckID.aspx");
                }
                else
                {
                    hfSiteId.Value = Session["siteID"].ToString();
                    //hsSchd_id.Value = Session["Schd_ID"].ToString();
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
                    txtq13_5_specify.Attributes.Add("autocomplete", "off");
                    txtQ64.Attributes.Add("autocomplete", "off");
                    txt_q65.Attributes.Add("autocomplete", "off");
                    if (Session["checkreview"] != null)
                    {
                        rdobtnlstQ4.DataBind();
                        rdobtnlstQ5.DataBind();
                        rdobtnlstQ6_A.DataBind();
                        rdobtnlstQ6_B.DataBind();
                        rdobtnlstQ60.DataBind();
                        rdobtnlstQ61.DataBind();
                        getData();
                    }
                }
            }
        }
        protected void DisplayFirst_SessionData()
        {
                string sqlquery = "SELECT [Question_ID], [Question], Label_ID FROM [ISBEPI_DEV].[dbo].[HomeVisitorSurveyQuestions] --WHERE [Label_ID] IN ( 'lblQ1','lblQ2','lblQ3');";
                DataTable dt = DBHelper.GetDataTable(sqlquery);

                Label lblQ1toQ3 = new Label();
                for (int x = 0; x < dt.Rows.Count; x++)
                {
                    //lblQ1toQ3 = this.Master.FindControl("ContentPlaceHolder1").FindControl(dt.Rows[x]["Label_ID"].ToString().Trim()) as Label;
                    //lblQ1toQ3.Text = dt.Rows[x]["Question"].ToString();
                }
                lblQ3_Yes_or_No.Text = "Do you speak any languages, other than English, that you speak fluently?";                      
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

            if ((txtQ12.Text != "0") && string.IsNullOrEmpty(rdobtnlstQ13_1.SelectedValue) && string.IsNullOrEmpty(rdobtnlstQ13_2.SelectedValue) &&
                string.IsNullOrEmpty(rdobtnlstQ13_3.SelectedValue) && string.IsNullOrEmpty(rdobtnlstQ13_5.SelectedValue))
            {
                check = true;
                lblcommentQ13_1.Visible = true;
                lblcommentQ13_2.Visible = true;
                lblcommentQ13_3.Visible = true;
                lblcommentQ13_4.Visible = true;

                lblcommentQ13.Visible = true;
                lblcommentQ13_1.Text = "Required";
                lblcommentQ13_2.Text = "Required";
                lblcommentQ13_3.Text = "Required";
                lblcommentQ13_4.Text = "Required";
            }
            else
            {
                if (((!string.IsNullOrEmpty(rdobtnlstQ13_5.SelectedValue) && string.IsNullOrEmpty(txtq13_5_specify.Text)) ||
                    ((string.IsNullOrEmpty(rdobtnlstQ13_5.SelectedValue) && !string.IsNullOrEmpty(txtq13_5_specify.Text)))))
                {
                    check = true;
                    if (string.IsNullOrEmpty(rdobtnlstQ13_5.SelectedValue))
                    {
                        lblcommentQ13_5_1.Visible = true;
                    }
                    else
                    {
                        lblcommentQ13_5.Visible = true;
                    }

                }
                else
                {
                    lblcommentQ13_5.Visible = false;
                    lblcommentQ13_5_1.Visible = false;
                    check = false;
                }
            }
            if (check == false)
            {
                lblcommentQ13_1.Visible = false;
                lblcommentQ13_2.Visible = false;
                lblcommentQ13_3.Visible = false;
                lblcommentQ13_4.Visible = false;
                lblcommentQ13.Visible = false;

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
            getDt.Columns.Add("Q13_1");
            getDt.Columns.Add("Q13_2");
            getDt.Columns.Add("Q13_3");
            getDt.Columns.Add("Q13_4");
            getDt.Columns.Add("Q13_5");
            getDt.Columns.Add("Q13_other");
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
            getDt.Columns.Add("Q59_1");
            getDt.Columns.Add("Q59_2");
            getDt.Columns.Add("Q59_3");
            getDt.Columns.Add("Q59_4");
            getDt.Columns.Add("Q59_5");
            getDt.Columns.Add("Q59_6");
            getDt.Columns.Add("Q59_7");
            getDt.Columns.Add("Q59_8");
            getDt.Columns.Add("Q59_9");
            getDt.Columns.Add("Q59_10");
            getDt.Columns.Add("Q59_11");
            getDt.Columns.Add("Q59_12");
            getDt.Columns.Add("Q59_13");
            getDt.Columns.Add("Q59_14");
            getDt.Columns.Add("Q59_other");
            getDt.Columns.Add("Q60");
            getDt.Columns.Add("Q61");
            getDt.Columns.Add("Q62_a");
            getDt.Columns.Add("Q62_b");
            getDt.Columns.Add("Q62_c");
            getDt.Columns.Add("Q62_d");
            getDt.Columns.Add("Q62_e");
            getDt.Columns.Add("Q63_a");
            getDt.Columns.Add("Q63_b");
            getDt.Columns.Add("Q63_c");
            getDt.Columns.Add("Q63_d");
            getDt.Columns.Add("Q63_e");
            getDt.Columns.Add("Q63_f");
            getDt.Columns.Add("Q63_g");
            getDt.Columns.Add("Q63_h");

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
                row["Q5"] = null;
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
            if (txtQ12.Text != "0")
            {
                row["Q13_1"] = rdobtnlstQ13_1.SelectedValue;
                row["Q13_2"] = rdobtnlstQ13_2.SelectedValue;
                row["Q13_3"] = rdobtnlstQ13_3.SelectedValue;
                row["Q13_4"] = rdobtnlstQ13_4.SelectedValue;

                if (!string.IsNullOrEmpty(rdobtnlstQ13_5.SelectedValue) && !string.IsNullOrEmpty(txtq13_5_specify.Text))
                {
                    row["Q13_other"] = txtq13_5_specify.Text;
                    row["Q13_5"] = rdobtnlstQ13_5.SelectedValue;
                }
            }
            row["Q14"] = rdobtnlstQ14.SelectedValue;
            row["Q15"] = rdobtnlstQ15.SelectedValue;
            row["Q16"] = rdobtnlstQ16.SelectedValue;
            row["Q17"] = rdobtnlstQ17.SelectedValue;
            row["Q18"] = rdobtnlstQ18.SelectedValue;
            row["Q19"] = rdobtnlstQ19.SelectedValue;
            row["Q20"] = rdobtnlstQ20.SelectedValue;
            row["Q21"] = rdobtnlstQ21.SelectedValue;
            row["Q22"] = rdobtnlstQ22.SelectedValue;
            row["Q23"] = rdobtnlstQ23.SelectedValue;
            row["Q24"] = rdobtnlstQ24.SelectedValue;
            row["Q25"] = rdobtnlstQ25.SelectedValue;
            row["Q26"] = rdobtnlstQ26.SelectedValue;
            row["Q27"] = rdobtnlstQ27.SelectedValue;
            row["Q28"] = rdobtnlstQ28.SelectedValue;
            row["Q29"] = rdobtnlstQ29.SelectedValue;
            row["Q30"] = rdobtnlstQ30.SelectedValue;
            row["Q31"] = rdobtnlstQ31.SelectedValue;
            row["Q32"] = rdobtnlstQ32.SelectedValue;
            row["Q33"] = rdobtnlstQ33.SelectedValue;
            row["Q34"] = rdobtnlstQ34.SelectedValue;
            row["Q35"] = rdobtnlstQ35.SelectedValue;
            row["Q36"] = rdobtnlstQ36.SelectedValue;
            row["Q37"] = rdobtnlstQ37.SelectedValue;
            row["Q38"] = rdobtnlstQ38.SelectedValue;
            row["Q39"] = rdobtnlstQ39.SelectedValue;
            row["Q40"] = rdobtnlstQ40.SelectedValue;
            row["Q41"] = rdobtnlstQ41.SelectedValue;
            row["Q42"] = rdobtnlstQ42.SelectedValue;
            row["Q43"] = rdobtnlstQ43.SelectedValue;
            row["Q44"] = rdobtnlstQ44.SelectedValue;
            row["Q45"] = rdobtnlstQ45.SelectedValue;
            row["Q46"] = rdobtnlstQ46.SelectedValue;
            row["Q47"] = rdobtnlstQ47.SelectedValue;
            row["Q48"] = rdobtnlstQ48.SelectedValue;
            row["Q49"] = rdobtnlstQ49.SelectedValue;
            row["Q50"] = rdobtnlstQ50.SelectedValue;
            row["Q51"] = rdobtnlstQ51.SelectedValue;
            row["Q52"] = rdobtnlstQ52.SelectedValue;
            row["Q53"] = rdobtnlstQ53.SelectedValue;
            row["Q54"] = rdobtnlstQ54.SelectedValue;
            row["Q55"] = rdobtnlstQ55.SelectedValue;
            row["Q56"] = rdobtnlstQ56.SelectedValue;
            row["Q57"] = rdobtnlstQ57.SelectedValue;
            row["Q58"] = txtQ64.Text;
            for (int x = 0; x < CbkbxQ65.Items.Count; x++)
            {
                if (CbkbxQ65.Items[x].Selected)
                {
                    int add = x + 1;
                    row["Q59_" + add] = CbkbxQ65.Items[x].Value;
                    if (CbkbxQ65.Items[x].Text.Trim() == "Other, please specify:")
                    {
                        row["Q59_Other"] = txt_q65.Text;
                    }

                }
            }
            row["Q60"] = rdobtnlstQ60.SelectedValue;
            row["Q61"] = rdobtnlstQ61.SelectedValue;
            row["Q62_a"] = rdobtnlstQ69_a.SelectedValue;
            row["Q62_b"] = rdobtnlstQ69_b.SelectedValue;
            row["Q62_c"] = rdobtnlstQ69_c.SelectedValue;
            row["Q62_d"] = rdobtnlstQ69_d.SelectedValue;
            row["Q62_e"] = rdobtnlstQ69_e.SelectedValue;

            row["Q63_a"] = rdobtnlstQ69_a.SelectedValue;
            row["Q63_b"] = rdobtnlstQ69_b.SelectedValue;
            row["Q63_c"] = rdobtnlstQ69_c.SelectedValue;
            row["Q63_d"] = rdobtnlstQ69_d.SelectedValue;
            row["Q63_e"] = rdobtnlstQ69_e.SelectedValue;
            row["Q63_f"] = rdobtnlstQ69_f.SelectedValue;
            row["Q63_g"] = rdobtnlstQ69_g.SelectedValue;
            row["Q63_h"] = rdobtnlstQ69_h.SelectedValue;

            getDt.Rows.Add(row);
            Survey.setgetreview setdt = new Survey.setgetreview();
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
            lblQ65Comment.Visible = false;
            if (CbkbxQ65.SelectedValue.Length < 1 || CbkbxQ65.SelectedValue.Length > 0)
            {
                for (int x = 0; x < CbkbxQ65.Items.Count; x++)
                {
                    if (string.IsNullOrEmpty(CbkbxQ65.SelectedValue))
                    {
                        lblQ65Comment.Text = "Required";
                        check = true;
                        lblQ65Comment.Visible = true;
                    }
                    else
                    {

                        if (CbkbxQ65.Items[x].Selected)
                        {

                            if (CbkbxQ65.Items[x].Value == "14" && txt_q65.Text.Length < 1)
                            {
                                lblQ65Comment.Text = "Required-please specify:";
                                check = true;
                                lblQ65Comment.Visible = true;
                            }
                            count++;
                        }

                    }

                }
            }
            if (count < 3)
            {
                lblQ65Comment1.Text = "-Required at least three Topics.";
                check = true;
                lblQ65Comment.Visible = true;

            }
            if (check == false)
            {
                lblQ65Comment.Visible = false;
                setdata();
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
                lblQ13.Visible = false;
                Q13_li.Visible = false;
            }
            else
            {
                lblQ13.Visible = true;
                Q13_li.Visible = true;
            }
        }
        protected void txtQ12_TextChanged(object sender, EventArgs e)
        {
            if (txtQ12.Text == "0")
            {
                lblQ13.Visible = false;
                lblQ13_1.Visible = false;
                lblQ13_2.Visible = false;
                lblQ13_3.Visible = false;
                lblQ13_4.Visible = false;
                lblQ13_5.Visible = false;
                Q13_li.Visible = false;
                txtq13_5_specify.Visible = false;
                rdobtnlstQ13_1.Visible = false;
                rdobtnlstQ13_2.Visible = false;
                rdobtnlstQ13_3.Visible = false;
                rdobtnlstQ13_4.Visible = false;
                rdobtnlstQ13_5.Visible = false;

            }
            else
            {
                lblQ13.Visible = true;
                lblQ13_1.Visible = true;
                lblQ13_2.Visible = true;
                lblQ13_3.Visible = true;
                lblQ13_4.Visible = true;
                lblQ13_5.Visible = true;
                Q13_li.Visible = true;
                txtq13_5_specify.Visible = true;
                rdobtnlstQ13_1.Visible = true;
                rdobtnlstQ13_2.Visible = true;
                rdobtnlstQ13_3.Visible = true;
                rdobtnlstQ13_4.Visible = true;
                rdobtnlstQ13_5.Visible = true;
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
                Q13_li.Visible = true;
                rdobtnlstQ13_1.Visible = true;
                rdobtnlstQ13_2.Visible = true;
                rdobtnlstQ13_3.Visible = true;
                rdobtnlstQ13_4.Visible = true;
                rdobtnlstQ13_5.Visible = true;
                //
                lblQ13_1.Visible = true;
                lblQ13_2.Visible = true;
                lblQ13_3.Visible = true;
                lblQ13_4.Visible = true;
                lblQ13_5.Visible = true;
                //
                txtq13_5_specify.Visible = true;

                rdobtnlstQ13_1.SelectedValue = dt.Rows[0]["Q13_1"].ToString();
                rdobtnlstQ13_2.SelectedValue = dt.Rows[0]["Q13_2"].ToString();
                rdobtnlstQ13_3.SelectedValue = dt.Rows[0]["Q13_3"].ToString();
                rdobtnlstQ13_4.SelectedValue = dt.Rows[0]["Q13_4"].ToString();
                rdobtnlstQ13_5.SelectedValue = dt.Rows[0]["Q13_5"].ToString();

                txtq13_5_specify.Text = dt.Rows[0]["Q13_other"].ToString();
            }
            else
            {
                Q13_li.Visible = false;
                rdobtnlstQ13_1.Visible = false;
                rdobtnlstQ13_2.Visible = false;
                rdobtnlstQ13_3.Visible = false;
                rdobtnlstQ13_4.Visible = false;
                rdobtnlstQ13_5.Visible = false;
                //
                lblQ13_1.Visible = false;
                lblQ13_2.Visible = false;
                lblQ13_3.Visible = false;
                lblQ13_4.Visible = false;
                lblQ13_5.Visible = false;
                //
                txtq13_5_specify.Visible = true;
            }

            rdobtnlstQ14.SelectedValue = dt.Rows[0]["Q14"].ToString();
            rdobtnlstQ15.SelectedValue = dt.Rows[0]["Q15"].ToString();
            rdobtnlstQ16.SelectedValue = dt.Rows[0]["Q16"].ToString();
            rdobtnlstQ17.SelectedValue = dt.Rows[0]["Q17"].ToString();
            rdobtnlstQ18.SelectedValue = dt.Rows[0]["Q18"].ToString();
            rdobtnlstQ19.SelectedValue = dt.Rows[0]["Q19"].ToString();
            rdobtnlstQ20.SelectedValue = dt.Rows[0]["Q20"].ToString();
            rdobtnlstQ21.SelectedValue = dt.Rows[0]["Q21"].ToString();
            rdobtnlstQ22.SelectedValue = dt.Rows[0]["Q22"].ToString();
            rdobtnlstQ23.SelectedValue = dt.Rows[0]["Q23"].ToString();
            rdobtnlstQ24.SelectedValue = dt.Rows[0]["Q24"].ToString();
            rdobtnlstQ25.SelectedValue = dt.Rows[0]["Q25"].ToString();
            rdobtnlstQ26.SelectedValue = dt.Rows[0]["Q26"].ToString();
            rdobtnlstQ27.SelectedValue = dt.Rows[0]["Q27"].ToString();
            rdobtnlstQ28.SelectedValue = dt.Rows[0]["Q28"].ToString();
            rdobtnlstQ29.SelectedValue = dt.Rows[0]["Q29"].ToString();
            rdobtnlstQ30.SelectedValue = dt.Rows[0]["Q30"].ToString();
            rdobtnlstQ31.SelectedValue = dt.Rows[0]["Q31"].ToString();
            rdobtnlstQ32.SelectedValue = dt.Rows[0]["Q32"].ToString();
            rdobtnlstQ33.SelectedValue = dt.Rows[0]["Q33"].ToString();
            rdobtnlstQ34.SelectedValue = dt.Rows[0]["Q34"].ToString();
            rdobtnlstQ35.SelectedValue = dt.Rows[0]["Q35"].ToString();
            rdobtnlstQ36.SelectedValue = dt.Rows[0]["Q36"].ToString();
            rdobtnlstQ37.SelectedValue = dt.Rows[0]["Q37"].ToString();
            rdobtnlstQ38.SelectedValue = dt.Rows[0]["Q38"].ToString();
            rdobtnlstQ39.SelectedValue = dt.Rows[0]["Q39"].ToString();
            rdobtnlstQ40.SelectedValue = dt.Rows[0]["Q40"].ToString();
            rdobtnlstQ41.SelectedValue = dt.Rows[0]["Q41"].ToString();
            rdobtnlstQ42.SelectedValue = dt.Rows[0]["Q42"].ToString();
            rdobtnlstQ43.SelectedValue = dt.Rows[0]["Q43"].ToString();
            rdobtnlstQ44.SelectedValue = dt.Rows[0]["Q44"].ToString();
            rdobtnlstQ45.SelectedValue = dt.Rows[0]["Q45"].ToString();
            rdobtnlstQ46.SelectedValue = dt.Rows[0]["Q46"].ToString();
            rdobtnlstQ47.SelectedValue = dt.Rows[0]["Q47"].ToString();
            rdobtnlstQ48.SelectedValue = dt.Rows[0]["Q48"].ToString();
            rdobtnlstQ49.SelectedValue = dt.Rows[0]["Q49"].ToString();
            rdobtnlstQ50.SelectedValue = dt.Rows[0]["Q50"].ToString();
            rdobtnlstQ51.SelectedValue = dt.Rows[0]["Q51"].ToString();
            rdobtnlstQ52.SelectedValue = dt.Rows[0]["Q52"].ToString();
            rdobtnlstQ53.SelectedValue = dt.Rows[0]["Q53"].ToString();
            rdobtnlstQ54.SelectedValue = dt.Rows[0]["Q54"].ToString();
            rdobtnlstQ55.SelectedValue = dt.Rows[0]["Q55"].ToString();
            rdobtnlstQ56.SelectedValue = dt.Rows[0]["Q56"].ToString();
            rdobtnlstQ57.SelectedValue = dt.Rows[0]["Q57"].ToString();
            txtQ64.Text = dt.Rows[0]["Q58"].ToString();

            //q59

            CbkbxQ65.DataBind();
            for (int x = 0; x < CbkbxQ65.Items.Count; x++)
            {
                int add = x + 1;
                if (!string.IsNullOrEmpty(dt.Rows[0]["Q59_" + add].ToString()))
                {
                    CbkbxQ65.Items[x].Selected = true;
                }
            }

            txt_q65.Text = dt.Rows[0]["Q59_other"].ToString();
            //q60
            rdobtnlstQ60.SelectedValue = dt.Rows[0]["Q60"].ToString();
            rdobtnlstQ61.SelectedValue = dt.Rows[0]["Q61"].ToString();
            rdobtnlstQ68_a.SelectedValue = dt.Rows[0]["Q62_a"].ToString();
            rdobtnlstQ68_b.SelectedValue = dt.Rows[0]["Q62_b"].ToString();
            rdobtnlstQ68_c.SelectedValue = dt.Rows[0]["Q62_c"].ToString();
            rdobtnlstQ68_d.SelectedValue = dt.Rows[0]["Q62_d"].ToString();
            rdobtnlstQ68_e.SelectedValue = dt.Rows[0]["Q62_e"].ToString();

            rdobtnlstQ69_a.SelectedValue = dt.Rows[0]["Q63_a"].ToString();
            rdobtnlstQ69_b.SelectedValue = dt.Rows[0]["Q63_b"].ToString();
            rdobtnlstQ69_c.SelectedValue = dt.Rows[0]["Q63_c"].ToString();
            rdobtnlstQ69_d.SelectedValue = dt.Rows[0]["Q63_d"].ToString();
            rdobtnlstQ69_e.SelectedValue = dt.Rows[0]["Q63_e"].ToString();
            rdobtnlstQ69_f.SelectedValue = dt.Rows[0]["Q63_f"].ToString();
            rdobtnlstQ69_g.SelectedValue = dt.Rows[0]["Q63_g"].ToString();
            rdobtnlstQ69_h.SelectedValue = dt.Rows[0]["Q63_h"].ToString();
        }

    }
}