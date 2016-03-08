//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;
//using System.Data;
//using System.Collections;

//namespace HVP.PICCTool
//{
//    public partial class PICCTool : System.Web.UI.Page
//    {
//        ds ds = new ds();
//        DataRow drrow;
//        DataRow row;
//        bool checking;
//        bool insidecheck;
//        bool check;
//        StoreInfo gettopinfo = new StoreInfo();
//        dsTableAdapters.PiccToolTableAdapter piccTool = new dsTableAdapters.PiccToolTableAdapter();
//        dsTableAdapters.PiccSummary_EntryTableAdapter piccSummary = new dsTableAdapters.PiccSummary_EntryTableAdapter();
//        protected void Page_Load(object sender, EventArgs e)
//        {
//            if (!IsPostBack)
//            {
//                hfsiteid.Value = Session["Site_ID"] == null ? "" : Session["Site_ID"].ToString();
//                hfSchdId.Value = Session["Schd_Id"] == null ? "" : Session["Schd_Id"].ToString();
//                if (string.IsNullOrEmpty(hfSchdId.Value))
//                {
//                    //ClientScript.RegisterStartupScript(typeof(Page), "closePage", "<script type='text/JavaScript'>window.close();</script>");
//                    Response.Redirect("~/UnauthorizedAccess.aspx");
//                }
//                else
//                {
//                    BindQuestions();
//                    MultiView1.ActiveViewIndex = 0;
//                    DataTable dt = new DataTable();                   
//                    SqlDataSource1.DataBind();
//                    SqlDataSource2.DataBind();
//                    SqlDataSource3.DataBind();
//                    SqlDataSource4.DataBind();
//                    ddl_Docu_Q12_1.DataBind();
//                    ddlPicc_Compliance_Q13_1.DataBind();
//                    ddlPicc_Compliance_Q2_1_1.DataBind();
//                    ddlPicc_Docu_Q3_1.DataBind();
                   
                   
//                    SqlDataSource5.DataBind();
//                    dt = piccTool.GetData().Clone();
//                    foreach (DataRow row in piccTool.GetData().Rows)
//                    {
//                        if (hfSchdId.Value == row["Schd_ID"].ToString())
//                        {

//                            dt.ImportRow(row);
//                            getData(dt);
//                            DataTable SumDt = piccSummary.GetData().Clone();
//                            foreach (DataRow SumRow in piccSummary.GetData().Rows)
//                            {
//                                if (hfSchdId.Value == SumRow["Schd_ID"].ToString())
//                                {
//                                    SumDt.ImportRow(SumRow);
//                                    getSummaryData(SumDt);
//                                    break;
//                                }
//                            }
//                            break;
//                        }
//                    }                                  


//                }
               
//            }
//        }

//        protected void getSummaryData(DataTable dt)
//        {
//            //ArrayList arrayList = new ArrayList();
//            //int count = 0;
//            //foreach (DataRow dr in dt.Rows)
//            //{
//            //    arrayList.Add(dr["Picc" + count]);
//            //    count++;
//            //}
//            SqlDataSource5.DataBind();
//            Repeater1.DataBind();
//            int count = 0;
//            foreach (RepeaterItem item in this.Repeater1.Items)
//            {
//                TextBox txtaddcomments = (item.FindControl("txtNotes") as TextBox);
//                txtaddcomments.Text = dt.Rows[0]["Picc" + count].ToString();
//                count++;
//            }
//        }

//        protected void getData(DataTable dt)
//        {

//            chkPicc_Compliance_Q1_1_1.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q1_1_1"].ToString());
//            chkPicc_Compliance_Q1_1_2.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q1_1_2"].ToString());
//            chkPicc_Compliance_Q1_1_3.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q1_1_3"].ToString());
//            txtPicc_Compliance_Q1_1_1.Text = dt.Rows[0]["txtPicc_Compliance_Q1_1_1"].ToString();
//            txtPicc_Compliance_Q1_1_2.Text = dt.Rows[0]["txtPicc_Compliance_Q1_1_2"].ToString();
//            chkPicc_Compliance_Q1_2_1.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q1_2_1"].ToString());
//            txtPicc_Compliance_Q1_2_2.Text = dt.Rows[0]["txtPicc_Compliance_Q1_2_2"].ToString();
//            txtPicc_Docu_Q1_2.Text = dt.Rows[0]["txtPicc_Docu_Q1_2"].ToString();
//            txtPicc_Notes_Q1_2.Text = dt.Rows[0]["txtPicc_Notes_Q1_2"].ToString();
//            ddlPicc_Compliance_Q2_1_1.SelectedValue =  dt.Rows[0]["ddlPicc_Compliance_Q2_1_1"].ToString();
//            //ddlPicc_Compliance_Q2_1_1.DataBind();
//            chkPicc_Compliance_Q2_1_2.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q2_1_2"].ToString());
//            txtPicc_Docu_Q2_1.Text = dt.Rows[0]["txtPicc_Docu_Q2_1"].ToString();
//            txtPicc_Notes_Q2.Text = dt.Rows[0]["txtPicc_Notes_Q2"].ToString();
//            chkPicc_Compliance_Q3_1.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q3_1"].ToString());
//            ddlPicc_Docu_Q3_1.SelectedValue = dt.Rows[0]["ddlPicc_Docu_Q3_1"].ToString();
//            //ddlPicc_Docu_Q3_1.DataBind();
//            chkPicc_Docu_Q3_1.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Docu_Q3_1"].ToString());
//            txtPicc_Docu_Q3_1.Text = dt.Rows[0]["txtPicc_Docu_Q3_1"].ToString().Trim();
//            txtPicc_Notes_Q3.Text = dt.Rows[0]["txtPicc_Notes_Q3"].ToString().Trim();
//            chkPicc_Compliance_Q4_1.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q4_1"].ToString());
//            chkPicc_Compliance_Q4_1_1.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q4_1_1"].ToString());
//            chkPicc_Compliance_Q4_1_2.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q4_1_2"].ToString());
//            chkPicc_Docu_Q4.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Docu_Q4"].ToString());
//            txtPicc_Notes_Q4.Text = dt.Rows[0]["txtPicc_Notes_Q4"].ToString();
//            chkPicc_Compliance_Q5_1_1.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q5_1_1"].ToString());
//            txt_Docu_Q5_1.Text = dt.Rows[0]["txt_Docu_Q5_1"].ToString();
//            txtPicc_Notes_Q5_1.Text = dt.Rows[0]["txtPicc_Notes_Q5_1"].ToString();
//            chkPicc_Compliance_Q5_2_1.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q5_2_1"].ToString());
//            chk_Docu_Q5_2_1.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q5_2_1"].ToString());
//            chk_Docu_Q5_2_2.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q5_2_2"].ToString());
//            txt_Docu_Q5_2_2.Text = dt.Rows[0]["txt_Docu_Q5_2_2"].ToString();
//            txtPicc_Notes_Q5_2.Text = dt.Rows[0]["txtPicc_Notes_Q5_2"].ToString();
//            chkPicc_Compliance_Q6_1.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q6_1"].ToString());
//            chk_Docu_Q6_1_1.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q6_1_1"].ToString());
//            chk_Docu_Q6_1_2.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q6_1_2"].ToString());
//            chk_Docu_Q6_1_3.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q6_1_3"].ToString());
//            chk_Docu_Q6_1_4.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q6_1_4"].ToString());
//            txt_Docu_Q6_1_1.Text = dt.Rows[0]["txt_Docu_Q6_1_1"].ToString();
//            txt_Docu_Q6_1_2.Text = dt.Rows[0]["txt_Docu_Q6_1_2"].ToString();
//            txt_Docu_Q6_1_3.Text = dt.Rows[0]["txt_Docu_Q6_1_3"].ToString();
//            txt_Docu_Q6_1_4.Text = dt.Rows[0]["txt_Docu_Q6_1_4"].ToString();
//            txt_Docu_Q6_1_5.Text = dt.Rows[0]["txt_Docu_Q6_1_5"].ToString();
//            txt_Docu_Q6_1_6.Text = dt.Rows[0]["txt_Docu_Q6_1_6"].ToString();
//            txt_Docu_Q6_1_7.Text = dt.Rows[0]["txt_Docu_Q6_1_7"].ToString();
//            txt_Docu_Q6_1_8.Text = dt.Rows[0]["txt_Docu_Q6_1_8"].ToString();
//            txt_Docu_Q6_1_9.Text = dt.Rows[0]["txt_Docu_Q6_1_9"].ToString();
//            txt_Docu_Q6_1_10.Text = dt.Rows[0]["txt_Docu_Q6_1_10"].ToString();
//            txtPicc_Notes_Q6.Text = dt.Rows[0]["txtPicc_Notes_Q6"].ToString();
//            chkPicc_Compliance_Q7_1_1.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q7_1_1"].ToString());
//            chk_Docu_Q7_1_1.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q7_1_1"].ToString());
//            chk_Docu_Q7_1_2.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q7_1_2"].ToString());
//            chk_Docu_Q7_1_3.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q7_1_3"].ToString());
//            chk_Docu_Q7_1_4.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q7_1_4"].ToString());
//            txt_Docu_Q7_1_4.Text = dt.Rows[0]["txt_Docu_Q7_1_4"].ToString();
//            txtPicc_Notes_Q7_1.Text = dt.Rows[0]["txtPicc_Notes_Q7_1"].ToString();
//            chkPicc_Compliance_Q7_2_1.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q7_2_1"].ToString());
//            chkPicc_Compliance_Q7_2_2.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q7_2_2"].ToString());
//            chkPicc_Compliance_Q7_2_3.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q7_2_3"].ToString());
//            chkPicc_Compliance_Q7_2_4.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q7_2_4"].ToString());
//            chkPicc_Compliance_Q7_2_5.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q7_2_5"].ToString());
//            chkPicc_Compliance_Q7_2_6.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q7_2_6"].ToString());
//            chkPicc_Compliance_Q7_2_7.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q7_2_7"].ToString());
//            chkPicc_Compliance_Q7_2_8.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q7_2_8"].ToString());
//            chkPicc_Compliance_Q7_2_9.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q7_2_9"].ToString());
//            chkPicc_Compliance_Q7_2_10.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q7_2_10"].ToString());
//            chk_Docu_Q7_2_1.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q7_2_1"].ToString());
//            chk_Docu_Q7_2_2.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q7_2_2"].ToString());
//            chk_Docu_Q7_2_3.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q7_2_3"].ToString());
//            txt_Docu_Q7_2_3.Text = dt.Rows[0]["txt_Docu_Q7_2_3"].ToString();
//            txtPicc_Notes_Q7_2.Text = dt.Rows[0]["txtPicc_Notes_Q7_2"].ToString();
//            chkPicc_Compliance_Q7_3_1.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q7_3_1"].ToString());
//            chkPicc_Compliance_Q7_3_2.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q7_3_2"].ToString());
//            chkPicc_Compliance_Q7_3_3.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q7_3_3"].ToString());
//            chkPicc_Compliance_Q7_3_4.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q7_3_4"].ToString());
//            chkPicc_Compliance_Q7_3_5.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q7_3_5"].ToString());
//            chkPicc_Compliance_Q7_3_6.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q7_3_6"].ToString());
//            chkPicc_Compliance_Q7_3_7.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q7_3_7"].ToString());
//            chk_Docu_Q7_3_1.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q7_3_1"].ToString());
//            chk_Docu_Q7_3_2.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q7_3_2"].ToString());
//            chk_Docu_Q7_3_3.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q7_3_3"].ToString());
//            chk_Docu_Q7_3_4.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q7_3_4"].ToString());
//            txt_Docu_Q7_3_4.Text = dt.Rows[0]["txt_Docu_Q7_3_4"].ToString();
//            txtPicc_Notes_Q7_3.Text = dt.Rows[0]["txtPicc_Notes_Q7_3"].ToString();
//            chkPicc_Compliance_Q8_1.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q8_1"].ToString());
//            chk_Docu_Q8_1.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q8_1"].ToString());
//            txtPicc_Notes_Q8_1.Text = dt.Rows[0]["txtPicc_Notes_Q8_1"].ToString();
//            chkPicc_Compliance_Q8_2.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q8_2"].ToString());
//            chkPicc_Compliance_Q8_3.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q8_3"].ToString());
//            chkPicc_Compliance_Q8_4.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q8_4"].ToString());
//            chk_Docu_Q8_2.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q8_2"].ToString());
//            txtPicc_Notes_Q8_2.Text = dt.Rows[0]["chkPicc_Docu_Q4"].ToString();
//            chkPicc_Compliance_Q8_5.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q8_5"].ToString());
//            chkPicc_Compliance_Q8_6_1.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q8_6_1"].ToString());
//            chkPicc_Compliance_Q8_6_2.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q8_6_2"].ToString());
//            chkPicc_Compliance_Q8_6_3.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q8_6_3"].ToString());
//            chk_Docu_Q8_3_1.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q8_3_1"].ToString());    
//            chk_Docu_Q8_3_2.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q8_3_2"].ToString());
//            chk_Docu_Q8_3_3.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q8_3_3"].ToString());
//            txt_Docu_Q8_3_3.Text = dt.Rows[0]["txt_Docu_Q8_3_3"].ToString();
//            txtPicc_Notes_Q8_3.Text = dt.Rows[0]["txtPicc_Notes_Q8_3"].ToString();
//            chkPicc_Compliance_Q8_7.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q8_7"].ToString());
//            chkPicc_Compliance_Q8_7_1.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q8_7_1"].ToString());
//            chkPicc_Compliance_Q8_7_2.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q8_7_2"].ToString());
//            chkPicc_Compliance_Q8_7_3.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q8_7_3"].ToString());
//            chkPicc_Compliance_Q8_7_4.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q8_7_4"].ToString());
//            chkPicc_Compliance_Q8_7_5.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q8_7_5"].ToString());
//            chkPicc_Compliance_Q8_7_6.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q8_7_6"].ToString());
//            chk_Docu_Q8_7_1.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q8_7_1"].ToString());
//            chk_Docu_Q8_7_2.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q8_7_2"].ToString());
//            chk_Docu_Q8_7_3.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q8_7_3"].ToString());
//            chk_Docu_Q8_7_4.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q8_7_4"].ToString());
//            chk_Docu_Q8_7_5.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q8_7_5"].ToString());
//            chk_Docu_Q8_7_6.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q8_7_6"].ToString());
//            chk_Docu_Q8_7_7.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q8_7_7"].ToString());
//            txtPicc_Notes_Q8_7.Text = dt.Rows[0]["txtPicc_Notes_Q8_7"].ToString();
//            chkPicc_Compliance_Q8_8_1.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q8_8_1"].ToString());
//            chkPicc_Compliance_Q8_8_2.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q8_8_2"].ToString());
//            chkPicc_Compliance_Q8_8_3.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q8_8_3"].ToString());
//            chk_Docu_Q8_8_1.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q8_8_1"].ToString());
//            chk_Docu_Q8_8_2.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q8_8_2"].ToString());
//            chk_Docu_Q8_8_3.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q8_8_3"].ToString());
//            txt_Docu_Q8_8_3.Text = dt.Rows[0]["txt_Docu_Q8_8_3"].ToString();
//            txtPicc_Notes_Q8_8.Text = dt.Rows[0]["txtPicc_Notes_Q8_8"].ToString();
//            chkPicc_Compliance_Q8_9_1.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q8_9_1"].ToString());
//            chkPicc_Compliance_Q8_9_2.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q8_9_2"].ToString());
//            chk_Docu_Q8_9_1.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q8_9_1"].ToString());
//            chk_Docu_Q8_9_2.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q8_9_2"].ToString());
//            chk_Docu_Q8_9_3.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q8_9_3"].ToString());
//            txt_Docu_Q8_9_1.Text = dt.Rows[0]["txt_Docu_Q8_9_1"].ToString();
//            txtPicc_Notes_Q8_9.Text = dt.Rows[0]["txtPicc_Notes_Q8_9"].ToString();
//            chkPicc_Compliance_Q8_10_1.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q8_10_1"].ToString());
//            chkPicc_Compliance_Q8_10_2.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q8_10_2"].ToString());
//            chk_Docu_Q8_10_1.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q8_10_1"].ToString());
//            chk_Docu_Q8_10_2.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q8_10_2"].ToString());
//            chk_Docu_Q8_10_3.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q8_10_3"].ToString());
//            txt_Docu_Q8_10_3.Text = dt.Rows[0]["txt_Docu_Q8_10_3"].ToString();
//            txtPicc_Notes_Q8_10.Text = dt.Rows[0]["txtPicc_Notes_Q8_10"].ToString();
//            chkPicc_Compliance_Q9_1.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q9_1"].ToString());
//            txtPicc_Compliance_Q9_1_1.Text = dt.Rows[0]["txtPicc_Compliance_Q9_1_1"].ToString();
//            chk_Docu_Q9_1_1.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q9_1_1"].ToString());
//            chk_Docu_Q9_1_2.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q9_1_2"].ToString());
//            chk_Docu_Q9_1_3.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q9_1_3"].ToString());
//            txt_Docu_Q9_1_1.Text = dt.Rows[0]["txt_Docu_Q9_1_1"].ToString();
//            txtPicc_Notes_Q9_1.Text = dt.Rows[0]["txtPicc_Notes_Q9_1"].ToString();
//            chkPicc_Compliance_Q9_2.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q9_2"].ToString());
//            txtPicc_Compliance_Q9_2_1.Text = dt.Rows[0]["txtPicc_Compliance_Q9_2_1"].ToString();
//            txtPicc_Compliance_Q9_2_2.Text = dt.Rows[0]["txtPicc_Compliance_Q9_2_2"].ToString();
//            txtPicc_Compliance_Q9_2_3.Text = dt.Rows[0]["txtPicc_Compliance_Q9_2_3"].ToString();
//            txtPicc_Compliance_Q9_2_4.Text = dt.Rows[0]["txtPicc_Compliance_Q9_2_4"].ToString();
//            chk_Docu_Q9_2_1.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q9_2_1"].ToString());
//            chk_Docu_Q9_2_2.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q9_2_2"].ToString());
//            chk_Docu_Q9_2_3.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q9_2_3"].ToString());
//            txt_Docu_Q9_2_3.Text = dt.Rows[0]["txt_Docu_Q9_2_3"].ToString();
//            txtPicc_Notes_Q9_2.Text = dt.Rows[0]["txtPicc_Notes_Q9_2"].ToString();
//            chkPicc_Compliance_Q9_3.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q9_3"].ToString());
//            txtPicc_Compliance_Q9_3_1.Text = dt.Rows[0]["txtPicc_Compliance_Q9_3_1"].ToString();
//            txtPicc_Compliance_Q9_3_2.Text = dt.Rows[0]["txtPicc_Compliance_Q9_3_2"].ToString();
//            txtPicc_Compliance_Q9_3_3.Text = dt.Rows[0]["txtPicc_Compliance_Q9_3_3"].ToString();
//            chk_Docu_Q9_3_1.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q9_3_1"].ToString());
//            chk_Docu_Q9_3_2.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q9_3_2"].ToString());
//            chk_Docu_Q9_3_3.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q9_3_3"].ToString());
//            chk_Docu_Q9_3_4.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q9_3_4"].ToString());
//            chk_Docu_Q9_3_5.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q9_3_5"].ToString());
//            txt_Docu_Q9_3_5.Text = dt.Rows[0]["txt_Docu_Q9_3_5"].ToString();
//            txtPicc_Notes_Q9_3.Text = dt.Rows[0]["txtPicc_Notes_Q9_3"].ToString();
//            chkPicc_Compliance_Q10_1_1.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q10_1_1"].ToString());
//            chkPicc_Compliance_Q10_1_2.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q10_1_2"].ToString());
//            chkPicc_Compliance_Q10_1_3.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q10_1_3"].ToString());
//            chk_Docu_Q10_1_1.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q10_1_1"].ToString());
//            chk_Docu_Q10_1_2.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q10_1_2"].ToString());
//            chk_Docu_Q10_1_3.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q10_1_3"].ToString());
//            chk_Docu_Q10_1_4.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q10_1_4"].ToString());
//            txt_Docu_Q10_1_4.Text = dt.Rows[0]["txt_Docu_Q10_1_4"].ToString();
//            chk_Docu_Q10_1_5.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q10_1_5"].ToString());
//            chk_Docu_Q10_1_6.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q10_1_6"].ToString());
//            txt_Docu_Q10_1_6.Text = dt.Rows[0]["txt_Docu_Q10_1_6"].ToString();
//            chk_Docu_Q10_1_7.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q10_1_7"].ToString());
//            chk_Docu_Q10_1_8.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q10_1_8"].ToString());
//            chk_Docu_Q10_1_9.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q10_1_9"].ToString());
//            txt_Docu_Q10_1_9.Text = dt.Rows[0]["txt_Docu_Q10_1_9"].ToString();
//            txtPicc_Notes_Q10_1.Text = dt.Rows[0]["txtPicc_Notes_Q10_1"].ToString();
//            chkPicc_Compliance_Q10_2_1.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Docu_Q4"].ToString());
//            chk_Docu_Q10__2_1.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Docu_Q4"].ToString());
//            txtPicc_Notes_Q10_2.Text = dt.Rows[0]["txtPicc_Notes_Q10_2"].ToString();
//            chkPicc_Compliance_Q11_1_1.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q11_1_1"].ToString());
//            chkPicc_Compliance_Q11_2_1.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q11_2_1"].ToString());
//            txtPicc_Compliance_Q11_2_1.Text = dt.Rows[0]["txtPicc_Compliance_Q11_2_1"].ToString();
//            chkPicc_Compliance_Q11_3_1.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q11_3_1"].ToString());
//            txtPicc_Compliance_Q11_3_1.Text = dt.Rows[0]["txtPicc_Compliance_Q11_3_1"].ToString();
//            chk_Docu_Q11_1.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q11_1"].ToString());
//            chk_Docu_Q11_2.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q11_2"].ToString());
//            chk_Docu_Q11_3.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q11_3"].ToString());
//            chk_Docu_Q11_4.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q11_4"].ToString());
//            txt_Docu_Q11_4.Text = dt.Rows[0]["txt_Docu_Q11_4"].ToString();
//            txtPicc_Notes_Q11.Text = dt.Rows[0]["txtPicc_Notes_Q11"].ToString();
//            chkPicc_Compliance_Q12_1.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q12_1"].ToString());
//            chkPicc_Compliance_Q12_1_1.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q12_1_1"].ToString());
//            ddl_Docu_Q12_1.Text = dt.Rows[0]["chkPicc_Docu_Q4"].ToString();
//            //ddl_Docu_Q12_1.DataBind();
//            chk_Docu_Q12_1.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q12_1"].ToString());
//            txt_Docu_Q12_1.Text = dt.Rows[0]["txt_Docu_Q12_1"].ToString();
//            txtPicc_Notes_Q12_1.Text = dt.Rows[0]["txtPicc_Notes_Q12_1"].ToString();
//            chkPicc_Compliance_Q12_2_1.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q12_2_1"].ToString());
//            chkPicc_Compliance_Q12_2_2.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q12_2_2"].ToString());
//            chkPicc_Compliance_Q12_2_3.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q12_2_3"].ToString());
//            chkPicc_Compliance_Q12_2_1_1.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q12_2_1_1"].ToString());
//            chkPicc_Compliance_Q12_2_1_2.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q12_2_1_2"].ToString());
//            chkPicc_Compliance_Q12_2_1_3.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q12_2_1_3"].ToString());
//            chk_Docu_Q12_2.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q12_2"].ToString());
//            txtPicc_Notes_Q12_2.Text = dt.Rows[0]["txtPicc_Notes_Q12_2"].ToString();
//            ddlPicc_Compliance_Q13_1.SelectedValue = dt.Rows[0]["ddlPicc_Compliance_Q13_1"].ToString();
//            ////--------------
//            chkPicc_Compliance_Q13_1.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q13_1"].ToString());
//            txtPicc_Compliance_Q13_1.Text = dt.Rows[0]["txtPicc_Compliance_Q13_1"].ToString();
//            chkPicc_Compliance_Q13_2.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q13_2"].ToString());
//            chkPicc_Compliance_Q13_2_1.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q13_2_1"].ToString());
//            chkPicc_Compliance_Q13_2_2.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q13_2_2"].ToString());
//            chkPicc_Compliance_Q13_2_3.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q13_2_3"].ToString());
//            chk_Docu_Q13_1.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q13_1"].ToString());
//            chk_Docu_Q13_2.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q13_2"].ToString());
//            chk_Docu_Q13_3.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q13_3"].ToString());
//            chk_Docu_Q13_4.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q13_4"].ToString());
//            chk_Docu_Q13_5.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q13_5"].ToString());
//            txt_Docu_Q13_5.Text = dt.Rows[0]["txt_Docu_Q13_5"].ToString();
//            txtPicc_Notes_Q13.Text = dt.Rows[0]["txtPicc_Notes_Q13"].ToString();
//            chkPicc_Compliance_Q14_1.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q14_1"].ToString());
//            chkPicc_Compliance_Q14_2.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q14_2"].ToString());
//            chkPicc_Compliance_Q14_3.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q14_3"].ToString());
//            chkPicc_Compliance_Q14_4.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q14_4"].ToString());
//            chkPicc_Compliance_Q14_5.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q14_5"].ToString());
//            chkPicc_Compliance_Q14_6.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q14_6"].ToString());
//            chkPicc_Compliance_Q14_7.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q14_7"].ToString());
//            chkPicc_Compliance_Q14_8.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q14_8"].ToString());
//            chk_Docu_Q14_1.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q14_1"].ToString());
//            chk_Docu_Q14_2.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q14_2"].ToString());
//            chk_Docu_Q14_3.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q14_3"].ToString());
//            chk_Docu_Q14_4.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q14_4"].ToString());
//            chk_Docu_Q14_5.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q14_5"].ToString());
//            chk_Docu_Q14_6.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q14_6"].ToString());
//            chk_Docu_Q14_7.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q14_7"].ToString());
//            chk_Docu_Q14_8.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q14_8"].ToString());
//            txt_Docu_Q14_8.Text = dt.Rows[0]["txt_Docu_Q14_8"].ToString();
//            txtPicc_Notes_Q14.Text = dt.Rows[0]["txtPicc_Notes_Q14"].ToString();
//            txtPicc_Compliance_Q15_1.Text = dt.Rows[0]["txtPicc_Compliance_Q15_1"].ToString();
//            txtPicc_Compliance_Q15_2.Text = dt.Rows[0]["txtPicc_Compliance_Q15_2"].ToString();
//            txtPicc_Compliance_Q15_3.Text = dt.Rows[0]["txtPicc_Compliance_Q15_3"].ToString();
//            txtPicc_Compliance_Q15_4.Text = dt.Rows[0]["txtPicc_Compliance_Q15_4"].ToString();
//            chkPicc_Compliance_Q15_5.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q15_5"].ToString());
//            chkPicc_Compliance_Q15_5_1.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q15_5_1"].ToString());
//            chkPicc_Compliance_Q15_5_2.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q15_5_2"].ToString());
//            chkPicc_Compliance_Q15_5_3.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q15_5_3"].ToString());
//            chk_Docu_Q15_1.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q15_1"].ToString());
//            chk_Docu_Q15_2.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q15_2"].ToString());
//            chk_Docu_Q15_3.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q15_3"].ToString());
//            chk_Docu_Q15_4.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q15_4"].ToString());
//            chk_Docu_Q15_5.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q15_5"].ToString());
//            txt_Docu_Q15_1.Text = dt.Rows[0]["txt_Docu_Q15_1"].ToString();
//            txtPicc_Notes_Q15.Text = dt.Rows[0]["txtPicc_Notes_Q15"].ToString();
//            chkPicc_Compliance_Q16_1.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q16_1"].ToString());
//            chk_Docu_Q16_1.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q16_1"].ToString());
//            chk_Docu_Q16_2.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q16_2"].ToString());
//            chk_Docu_Q16_3.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q16_3"].ToString());
//            chk_Docu_Q16_4.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q16_4"].ToString());
//            txt_Docu_Q16_5.Text = dt.Rows[0]["txt_Docu_Q16_5"].ToString();
//            txtPicc_Notes_Q16_1.Text = dt.Rows[0]["txtPicc_Notes_Q16_1"].ToString();
//            chkPicc_Compliance_Q16_2_1.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q16_2_1"].ToString());
//            chkPicc_Compliance_Q16_2_2.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q16_2_2"].ToString());
//            chkPicc_Compliance_Q16_2_3.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q16_2_3"].ToString());
//            chk_Docu_Q16_2_1.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q16_2_1"].ToString());
//            chk_Docu_Q16_2_2.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q16_2_2"].ToString());
//            chk_Docu_Q16_2_3.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q16_2_3"].ToString());
//            chk_Docu_Q16_2_4.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q16_2_4"].ToString());
//            txt_Docu_Q16_2_4.Text = dt.Rows[0]["txt_Docu_Q16_2_4"].ToString();
//            txtPicc_Notes_Q16_2.Text = dt.Rows[0]["txtPicc_Notes_Q16_2"].ToString();
//            chkPicc_Compliance_Q16_2_1_1.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q16_2_1_1"].ToString());
//            chkPicc_Compliance_Q16_2_1_2.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q16_2_1_2"].ToString());
//            chkPicc_Compliance_Q16_2_1_3.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q16_2_1_3"].ToString());
//            chk_Docu_Q16_2_1_1.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q16_2_1_1"].ToString());
//            chk_Docu_Q16_2_1_2.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q16_2_1_2"].ToString());
//            chk_Docu_Q16_2_1_3.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q16_2_1_3"].ToString());
//            chk_Docu_Q16_2_1_4.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q16_2_1_4"].ToString());
//            txt_Docu_Q16_2_1_4.Text = dt.Rows[0]["txt_Docu_Q16_2_1_4"].ToString();
//            txtPicc_Notes_Q16_2_1.Text = dt.Rows[0]["txtPicc_Notes_Q16_2_1"].ToString();
//            chkPicc_Compliance_Q16_3_1.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q16_3_1"].ToString());
//            chkPicc_Compliance_Q16_3_2.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q16_3_2"].ToString());
//            chkPicc_Compliance_Q16_3_3.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q16_3_3"].ToString());
//            chk_Docu_Q16_3_1.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q16_3_1"].ToString());
//            chk_Docu_Q16_3_2.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q16_3_2"].ToString());
//            chk_Docu_Q16_3_3.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q16_3_3"].ToString());
//            chk_Docu_Q16_3_4.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q16_3_4"].ToString());
//            chk_Docu_Q16_3_5.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q16_3_5"].ToString());
//            txt_Docu_Q16_3_5.Text = dt.Rows[0]["txt_Docu_Q16_3_5"].ToString();
//            txtPicc_Notes_Q16_3.Text = dt.Rows[0]["txtPicc_Notes_Q16_3"].ToString();
//            chkPicc_Compliance_Q16_4_1.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q16_4_1"].ToString());
//            chkPicc_Compliance_Q16_4_2.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q16_4_2"].ToString());
//            chkPicc_Compliance_Q16_4_3.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q16_4_3"].ToString());
//            chk_Docu_Q16_4_1.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q16_4_1"].ToString());
//            chk_Docu_Q16_4_2.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q16_4_2"].ToString());
//            chk_Docu_Q16_4_3.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q16_4_3"].ToString());
//            chk_Docu_Q16_4_4.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q16_4_4"].ToString());
//            chk_Docu_Q16_4_5.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q16_4_5"].ToString());
//            txt_Docu_Q16_4_5.Text = dt.Rows[0]["txt_Docu_Q16_4_5"].ToString();
//            txtPicc_Notes_Q16_4.Text = dt.Rows[0]["txtPicc_Notes_Q16_4"].ToString();
//            chkPicc_Compliance_Q17_1.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q17_1"].ToString());
//            chkPicc_Compliance_Q17_2.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q17_2"].ToString());
//            chkPicc_Compliance_Q17_3.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q17_3"].ToString());
//            chkPicc_Compliance_Q17_4.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q17_4"].ToString());
//            chkPicc_Compliance_Q17_5.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q17_5"].ToString());
//            chk_Docu_Q17_1.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q17_1"].ToString());
//            chk_Docu_Q17_2.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q17_2"].ToString());
//            chk_Docu_Q17_3.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q17_3"].ToString());
//            chk_Docu_Q17_4.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q17_4"].ToString());
//            txt_Docu_Q17_4.Text = dt.Rows[0]["txt_Docu_Q17_4"].ToString();
//            txtPicc_Notes_Q17.Text = dt.Rows[0]["txtPicc_Notes_Q17"].ToString();
//            chkPicc_Compliance_Q18_1.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q18_1"].ToString());
//            chk_Docu_Q18_1_1.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q18_1_1"].ToString());
//            chk_Docu_Q18_1_2.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q18_1_2"].ToString());
//            txt_Docu_Q18_1_2.Text = dt.Rows[0]["txt_Docu_Q18_1_2"].ToString();
//            txtPicc_Notes_Q18_1.Text = dt.Rows[0]["txtPicc_Notes_Q18_1"].ToString();
//            chkPicc_Compliance_Q18_2_1.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q18_2_1"].ToString());
//            chkPicc_Compliance_Q18_2_2.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q18_2_2"].ToString());
//            chkPicc_Compliance_Q18_2_3.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q18_2_3"].ToString());
//            chkPicc_Compliance_Q18_2_4.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q18_2_4"].ToString());
//            chk_Docu_Q18_2_1.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q18_2_1"].ToString());
//            chk_Docu_Q18_2_2.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q18_2_2"].ToString());
//            txt_Docu_Q18_2_2.Text = dt.Rows[0]["txt_Docu_Q18_2_2"].ToString();
//            txtPicc_Notes_Q18_2.Text = dt.Rows[0]["txtPicc_Notes_Q18_2"].ToString();
//            chkPicc_Compliance_Q19.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q19"].ToString());
//            chk_Docu_Q19_1.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q19_1"].ToString());
//            chk_Docu_Q19_2.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q19_2"].ToString());
//            chk_Docu_Q19_3.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q19_3"].ToString());
//            chk_Docu_Q19_4.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q19_4"].ToString());
//            txt_Docu_Q19_4.Text = dt.Rows[0]["txt_Docu_Q19_4"].ToString();
//            txtPicc_Notes_Q19.Text = dt.Rows[0]["txtPicc_Notes_Q19"].ToString();
//            chkPicc_Compliance_Q20_1.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q20_1"].ToString());
//            chkPicc_Compliance_Q20_2.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q20_2"].ToString());
//            chk_Docu_Q20_1.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q20_1"].ToString());
//            txt_Docu_Q20_1.Text = dt.Rows[0]["txt_Docu_Q20_1"].ToString();
//            txt_Docu_Q20_2.Text = dt.Rows[0]["txt_Docu_Q20_2"].ToString();
//            chk_Docu_Q20_2.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q20_2"].ToString());
//            txtPicc_Notes_Q20.Text = dt.Rows[0]["txtPicc_Notes_Q20"].ToString();
//            chkPicc_Compliance_Q20_3.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q20_3"].ToString());
//            chkPicc_Compliance_Q20_4.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q20_4"].ToString());
//            chkPicc_Compliance_Q20_5.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q20_5"].ToString());
//            chkPicc_Compliance_Q20_6.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q20_6"].ToString());
//            txtPicc_Compliance_Q20_6.Text = dt.Rows[0]["txtPicc_Compliance_Q20_6"].ToString();
//            chk_Docu_Q20_6.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Docu_Q4"].ToString());
//            txt_Docu_Q20_6.Text = dt.Rows[0]["chk_Docu_Q20_6"].ToString();
//            txtPicc_Notes_Q20_2.Text = dt.Rows[0]["txtPicc_Notes_Q20_2"].ToString();
//            chkPicc_Compliance_Q21_1_1.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q21_1_1"].ToString());
//            chkPicc_Compliance_Q21_1_2.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q21_1_2"].ToString());
//            chkPicc_Compliance_Q21_1_3.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q21_1_3"].ToString());
//            txtPicc_Compliance_Q21_1_3.Text = dt.Rows[0]["txtPicc_Compliance_Q21_1_3"].ToString();
//            chkPicc_Compliance_Q21_2_1.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q21_2_1"].ToString());
//            chkPicc_Compliance_Q21_2_2.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q21_2_2"].ToString());
//            chk_Docu_Q21_1.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q21_1"].ToString());
//            chk_Docu_Q21_2.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q21_2"].ToString());
//            chk_Docu_Q21_3.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q21_3"].ToString());
//            chk_Docu_Q21_4.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q21_4"].ToString());
//            txt_Docu_Q21_4.Text = dt.Rows[0]["txt_Docu_Q21_4"].ToString();
//            txtPicc_Notes_Q21.Text = dt.Rows[0]["txtPicc_Notes_Q21"].ToString();
//            chkPicc_Compliance_Q22_1_1.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q22_1_1"].ToString());
//            txtPicc_Compliance_Q22_1_2.Text = dt.Rows[0]["txtPicc_Compliance_Q22_1_2"].ToString();
//            txtPicc_Compliance_Q22_1_3.Text = dt.Rows[0]["txtPicc_Compliance_Q22_1_3"].ToString();
//            txtPicc_Compliance_Q22_1_4.Text = dt.Rows[0]["txtPicc_Compliance_Q22_1_4"].ToString();
//            txtPicc_Compliance_Q22_1_5.Text = dt.Rows[0]["txtPicc_Compliance_Q22_1_5"].ToString();
//            txtPicc_Compliance_Q22_2_1.Text = dt.Rows[0]["txtPicc_Compliance_Q22_2_1"].ToString();
//            txtPicc_Compliance_Q22_2_2.Text = dt.Rows[0]["txtPicc_Compliance_Q22_2_2"].ToString();
//            txtPicc_Compliance_Q22_2_3.Text = dt.Rows[0]["txtPicc_Compliance_Q22_2_3"].ToString();
//            txtPicc_Compliance_Q22_2_4.Text = dt.Rows[0]["txtPicc_Compliance_Q22_2_4"].ToString();
//            txtPicc_Compliance_Q22_3_1.Text = dt.Rows[0]["txtPicc_Compliance_Q22_3_1"].ToString();
//            txtPicc_Compliance_Q22_3_2.Text = dt.Rows[0]["txtPicc_Compliance_Q22_3_2"].ToString();
//            txtPicc_Compliance_Q22_3_3.Text = dt.Rows[0]["txtPicc_Compliance_Q22_3_3"].ToString();
//            txtPicc_Compliance_Q22_3_4.Text = dt.Rows[0]["txtPicc_Compliance_Q22_3_4"].ToString();
//            txtPicc_Compliance_Q22_4_1.Text = dt.Rows[0]["txtPicc_Compliance_Q22_4_1"].ToString();
//            txtPicc_Compliance_Q22_4_2.Text = dt.Rows[0]["txtPicc_Compliance_Q22_4_2"].ToString();
//            txtPicc_Compliance_Q22_4_3.Text = dt.Rows[0]["txtPicc_Compliance_Q22_4_3"].ToString();
//            txtPicc_Compliance_Q22_4_4.Text = dt.Rows[0]["txtPicc_Compliance_Q22_4_4"].ToString();
//            chk_Docu_Q22_1.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q22_1"].ToString());
//            chk_Docu_Q22_2.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q22_2"].ToString());
//            chk_Docu_Q22_3.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q22_3"].ToString());
//            chk_Docu_Q22_4.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q22_4"].ToString());
//            txt_Docu_Q22_3.Text = dt.Rows[0]["txt_Docu_Q22_3"].ToString();
//            txtPicc_Notes_Q22.Text = dt.Rows[0]["txtPicc_Notes_Q22"].ToString();
//            chkPicc_Compliance_Q23.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q23"].ToString());
//            chk_Docu_Q23_1.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q23_1"].ToString());
//            chk_Docu_Q23_2.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q23_2"].ToString());
//            chk_Docu_Q23_3.Checked = Convert.ToBoolean(dt.Rows[0]["chk_Docu_Q23_3"].ToString());
//            txtPicc_Notes_Q23.Text = dt.Rows[0]["txtPicc_Notes_Q23"].ToString();
//            chkPicc_Compliance_Q24_1.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q24_1"].ToString());
//            chkPicc_Compliance_Q24_2.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q24_2"].ToString());
//            chkPicc_Compliance_Q24_3.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q24_3"].ToString());
//            chkPicc_Compliance_Q24_4.Checked = Convert.ToBoolean(dt.Rows[0]["chkPicc_Compliance_Q24_4"].ToString());
//            txtPicc_Compliance_Q24_5.Text = dt.Rows[0]["txtPicc_Compliance_Q24_5"].ToString();
//            txt_Docu_Q24.Text = dt.Rows[0]["txt_Docu_Q24"].ToString();
//            txtPicc_Notes_Q24.Text = dt.Rows[0]["txtPicc_Notes_Q24"].ToString();

//        }
//        protected void BindQuestions()
//        {
//            dsTableAdapters.Picc_QuestionsTableAdapter import_questions_ds = new dsTableAdapters.Picc_QuestionsTableAdapter();
//            DataTable dt = new DataTable();
//            dt = import_questions_ds.GetData();
//            Label lbl = new Label();
//            for (int x = 0; x < dt.Rows.Count; x++)
//            {
//                ContentPlaceHolder cp = this.Master.Master.FindControl("ContentPlaceHolder1") as ContentPlaceHolder;
//                ContentPlaceHolder cph = cp.FindControl("NesterContent") as ContentPlaceHolder;
//                //Content con = cph.FindControl("Content2") as Content;
//                lbl = cph.FindControl(dt.Rows[x]["Label_ID"].ToString().Trim()) as Label;
//                lbl.Text = dt.Rows[x]["Questions"].ToString().Trim();
//            }
//            //for (int x = 0; x < dt.Rows.Count; x++)
//            //{
//            //    lbl = this.Master.FindControl("ContentPlaceHolder1").FindControl(dt.Rows[x]["Label_ID"].ToString().Trim()) as Label;
//            //    lbl.Text = dt.Rows[x]["Questions"].ToString().Trim();
//            //}


//        }
//        protected void lnkPicc_Q1_Click1(object sender, EventArgs e)
//        {
//            MultiView1.ActiveViewIndex = 1;
//            setalldata();
//        }

//        protected void lnkPicc_Q2_Click2(object sender, EventArgs e)
//        {
//            MultiView1.ActiveViewIndex = 2;
//            setalldata();
//        }

//        protected void lnkPicc_Q3_Click3(object sender, EventArgs e)
//        {
//            MultiView1.ActiveViewIndex = 3;
//            setalldata();
//        }

//        protected void lnkPicc_Q4_Click4(object sender, EventArgs e)
//        {
//            MultiView1.ActiveViewIndex = 4;
//            setalldata();
//        }

//        protected void lnkPicc_Q5_Click5(object sender, EventArgs e)
//        {
//            MultiView1.ActiveViewIndex = 5;
//            setalldata();
//        }

//        protected void lnkPicc_Q6_Click6(object sender, EventArgs e)
//        {
//            MultiView1.ActiveViewIndex = 6;
//            setalldata();
//        }

//        protected void lnkPicc_Q7_Click7(object sender, EventArgs e)
//        {
//            MultiView1.ActiveViewIndex = 7;
//            setalldata();
//        }

//        protected void lnkPicc_Q8_Click8(object sender, EventArgs e)
//        {
//            MultiView1.ActiveViewIndex = 8;
//            setalldata();
//        }

//        protected void lnkPicc_Q9_Click9(object sender, EventArgs e)
//        {
//            MultiView1.ActiveViewIndex = 9;
//            setalldata();
//        }

//        protected void lnkPicc_Q10_Click10(object sender, EventArgs e)
//        {
//            MultiView1.ActiveViewIndex = 10;
//            setalldata();
//        }

//        protected void lnkPicc_Q11_Click11(object sender, EventArgs e)
//        {
//            MultiView1.ActiveViewIndex = 11;
//            setalldata();
//        }

//        protected void lnkPicc_Q12_Click12(object sender, EventArgs e)
//        {
//            MultiView1.ActiveViewIndex = 12;
//            setalldata();
//        }

//        protected void lnkPicc_Q13_Click13(object sender, EventArgs e)
//        {
//            MultiView1.ActiveViewIndex = 13;
//            setalldata();
//        }

//        protected void lnkPicc_Q14_Click14(object sender, EventArgs e)
//        {
//            MultiView1.ActiveViewIndex = 14;
//            setalldata();
//        }

//        protected void lnkPicc_Q15_Click15(object sender, EventArgs e)
//        {
//            MultiView1.ActiveViewIndex = 15;
//            setalldata();
//        }

//        protected void lnkPicc_Q16_Click16(object sender, EventArgs e)
//        {
//            MultiView1.ActiveViewIndex = 16;
//            setalldata();
//        }

//        protected void lnkPicc_Q17_Click17(object sender, EventArgs e)
//        {
//            MultiView1.ActiveViewIndex = 17;
//            setalldata();
//        }

//        protected void lnkPicc_Q18_Click18(object sender, EventArgs e)
//        {
//            MultiView1.ActiveViewIndex = 18;
//            setalldata();
//        }

//        protected void lnkPicc_Q19_Click19(object sender, EventArgs e)
//        {
//            MultiView1.Visible=false;
//            MultiView2.ActiveViewIndex = 0;
//            MultiView3.ActiveViewIndex = 0;
//            setalldata();
//        }

//        protected void lnkPicc_Q20_Click20(object sender, EventArgs e)
//        {
//            MultiView1.Visible = false;
//            MultiView2.ActiveViewIndex = 0;
//            MultiView3.ActiveViewIndex = 1;
//            setalldata();
//        }

//        protected void lnkPicc_Q21_Click21(object sender, EventArgs e)
//        {
//            MultiView1.Visible = false;
//            MultiView2.ActiveViewIndex = 0;
//            MultiView3.ActiveViewIndex = 2;
//            setalldata();
//        }

//        protected void lnkPicc_Q22_Click22(object sender, EventArgs e)
//        {
//            MultiView1.Visible = false;
//            MultiView2.ActiveViewIndex = 0;
//            MultiView3.ActiveViewIndex = 3;
//            setalldata();
//        }

//        protected void lnkPicc_Q23_Click23(object sender, EventArgs e)
//        {
//            MultiView1.Visible = false;
//            MultiView2.ActiveViewIndex = 0;
//            MultiView3.ActiveViewIndex = 4;
//            setalldata();
//        }

//        protected void lnkPicc_Q24_Click24(object sender, EventArgs e)
//        {
//            MultiView1.Visible = false;
//            MultiView4.ActiveViewIndex = 0;
//            MultiView3.Visible = false;
//            MultiView2.Visible = false;
//            setalldata();
//        }

//        protected void lnkbtnAddComments_Click(object sender, EventArgs e)
//        {
//            //string[] arr = new string[19];
//            int count = 0;
//            for (int r = 0; r < piccSummary.GetData().Rows.Count; r++)
//            {
//                if (hfSchdId.Value == piccSummary.GetData().Rows[r]["Schd_ID"].ToString())
//                {
//                    drrow = piccSummary.GetData().Rows[r];
//                    checking = true;
//                    break;
//                    //getinfo.setSchdID(null);                       
//                }
//                else
//                {
//                    drrow = ds.PiccSummary_Entry.NewRow();
//                    drrow["Schd_ID"] = hfSchdId.Value;
//                    checking = false;
//                }
//            }
//            foreach (RepeaterItem item in this.Repeater1.Items)
//            {
//                TextBox txtaddcomments = (item.FindControl("txtNotes") as TextBox);
//                drrow["Picc" + count] = txtaddcomments.Text;
//                //arr[count] = txtaddcomments.Text;
//                count++;
//            }
//            if (checking == false)
//            {
//                ds.PiccSummary_Entry.Rows.Add(drrow);
//            }
//            piccSummary.Update(drrow);
            
           

           
//            //foreach (string value in arr)
//            //{
                               
//            //    drrow["Picc"+Array.IndexOf(arr,value)] = value;
//            //}
            
           

//        }

//        protected void lnkPicc_Q25_Click25(object sender, EventArgs e)
//        {
//            MultiView1.Visible = false;
//            MultiView4.ActiveViewIndex = 1;
//            MultiView3.Visible = false;
//            MultiView2.Visible = false;
//            setalldata();
//        }
//        protected void setalldata()
//        {            
//            for (int r = 0; r < piccTool.GetData().Rows.Count; r++)
//            {
//                if (hfSchdId.Value == piccTool.GetData().Rows[r]["Schd_ID"].ToString())
//                {
//                    row = piccTool.GetData().Rows[r];
//                    insidecheck = true;
//                    break;
//                    //getinfo.setSchdID(null);                              
//                }               
//            }
//            if (insidecheck == false)
//            {
//                row = ds.PiccTool.NewRow();
//                row["Schd_ID"] = hfSchdId.Value;
//                check = true;
//            }
//            //if (piccTool.GetData().Rows.Count < 1)
//            //{
//            //    row = ds.PiccTool.NewRow();
//            //    row["Schd_ID"] = hfSchid.Value;
//            //    check = true;
//            //}
//            row["CompletedDate"] = DateTime.Now;
//            row["chkPicc_Compliance_Q1_1_1"] = chkPicc_Compliance_Q1_1_1.Checked;
//            row["chkPicc_Compliance_Q1_1_2"] = chkPicc_Compliance_Q1_1_2.Checked;
//            row["chkPicc_Compliance_Q1_1_3"] = chkPicc_Compliance_Q1_1_3.Checked;
//            row["txtPicc_Compliance_Q1_1_1"] = txtPicc_Compliance_Q1_1_1.Text;
//            row["txtPicc_Compliance_Q1_1_2"] = txtPicc_Compliance_Q1_1_2.Text;
//            row["chkPicc_Compliance_Q1_2_1"] = chkPicc_Compliance_Q1_2_1.Checked;
//            row["txtPicc_Compliance_Q1_2_2"] = txtPicc_Compliance_Q1_2_2.Text;
//            row["txtPicc_Docu_Q1_2"] = txtPicc_Docu_Q1_2.Text;
//            row["txtPicc_Notes_Q1_2"] = txtPicc_Notes_Q1_2.Text;
//            if (ddlPicc_Compliance_Q2_1_1.SelectedValue.Length > 0)
//            {
//                row["ddlPicc_Compliance_Q2_1_1"] = ddlPicc_Compliance_Q2_1_1.SelectedValue;
//            }
//            row["chkPicc_Compliance_Q2_1_2"] = chkPicc_Compliance_Q2_1_2.Checked;
//            row["txtPicc_Docu_Q2_1"] = txtPicc_Docu_Q2_1.Text;
//            row["txtPicc_Notes_Q2"] = txtPicc_Notes_Q2.Text;
//            row["chkPicc_Compliance_Q3_1"] = chkPicc_Compliance_Q3_1.Checked;
//            if (ddlPicc_Docu_Q3_1.SelectedValue.Length > 0)
//            {
//                row["ddlPicc_Docu_Q3_1"] = ddlPicc_Docu_Q3_1.SelectedValue;
//            }
//            row["chkPicc_Docu_Q3_1"] = chkPicc_Docu_Q3_1.Checked;
//            row["txtPicc_Docu_Q3_1"] = txtPicc_Docu_Q3_1.Text;
//            row["txtPicc_Notes_Q3"] = txtPicc_Notes_Q3.Text;
//            row["chkPicc_Compliance_Q4_1"] = chkPicc_Compliance_Q4_1.Checked;
//            row["chkPicc_Compliance_Q4_1_1"] = chkPicc_Compliance_Q4_1_1.Checked;
//            row["chkPicc_Compliance_Q4_1_2"] = chkPicc_Compliance_Q4_1_2.Checked;
//            row["chkPicc_Docu_Q4"] = chkPicc_Docu_Q4.Checked;
//            row["txtPicc_Notes_Q4"] = txtPicc_Notes_Q4.Text;
//            row["chkPicc_Compliance_Q5_1_1"] = chkPicc_Compliance_Q5_1_1.Checked;
//            row["txt_Docu_Q5_1"] = txt_Docu_Q5_1.Text;
//            row["txtPicc_Notes_Q5_1"] = txtPicc_Notes_Q5_1.Text;
//            row["chkPicc_Compliance_Q5_2_1"] = chkPicc_Compliance_Q5_2_1.Checked;
//            row["chk_Docu_Q5_2_1"] = chk_Docu_Q5_2_1.Checked;
//            row["chk_Docu_Q5_2_2"] = chk_Docu_Q5_2_2.Checked;
//            row["txt_Docu_Q5_2_2"] = txt_Docu_Q5_2_2.Text;
//            row["txtPicc_Notes_Q5_2"] = txtPicc_Notes_Q5_2.Text;
//            row["chkPicc_Compliance_Q6_1"] = chkPicc_Compliance_Q6_1.Checked;
//            row["chk_Docu_Q6_1_1"] = chk_Docu_Q6_1_1.Checked;
//            row["chk_Docu_Q6_1_2"] = chk_Docu_Q6_1_2.Checked;
//            row["chk_Docu_Q6_1_3"] = chk_Docu_Q6_1_3.Checked;
//            row["chk_Docu_Q6_1_4"] = chk_Docu_Q6_1_4.Checked;
//            row["txt_Docu_Q6_1_1"] = txt_Docu_Q6_1_1.Text;
//            row["txt_Docu_Q6_1_2"] = txt_Docu_Q6_1_2.Text;
//            row["txt_Docu_Q6_1_3"] = txt_Docu_Q6_1_3.Text;
//            row["txt_Docu_Q6_1_4"] = txt_Docu_Q6_1_4.Text;
//            row["txt_Docu_Q6_1_5"] = txt_Docu_Q6_1_5.Text;
//            row["txt_Docu_Q6_1_6"] = txt_Docu_Q6_1_6.Text;
//            row["txt_Docu_Q6_1_7"] = txt_Docu_Q6_1_7.Text;
//            row["txt_Docu_Q6_1_8"] = txt_Docu_Q6_1_8.Text;
//            row["txt_Docu_Q6_1_9"] = txt_Docu_Q6_1_9.Text;
//            row["txt_Docu_Q6_1_10"] = txt_Docu_Q6_1_10.Text;
//            row["txtPicc_Notes_Q6"] = txtPicc_Notes_Q6.Text;
//            row["chkPicc_Compliance_Q7_1_1"] = chkPicc_Compliance_Q7_1_1.Checked;
//            row["chk_Docu_Q7_1_1"] = chk_Docu_Q7_1_1.Checked;
//            row["chk_Docu_Q7_1_2"] = chk_Docu_Q7_1_2.Checked;
//            row["chk_Docu_Q7_1_3"] = chk_Docu_Q7_1_3.Checked;
//            row["chk_Docu_Q7_1_4"] = chk_Docu_Q7_1_4.Checked;
//            row["txt_Docu_Q7_1_4"] = txt_Docu_Q7_1_4.Text;
//            row["txtPicc_Notes_Q7_1"] = txtPicc_Notes_Q7_1.Text;
//            row["chkPicc_Compliance_Q7_2_1"] = chkPicc_Compliance_Q7_2_1.Checked;
//            row["chkPicc_Compliance_Q7_2_2"] = chkPicc_Compliance_Q7_2_2.Checked;
//            row["chkPicc_Compliance_Q7_2_3"] = chkPicc_Compliance_Q7_2_3.Checked;
//            row["chkPicc_Compliance_Q7_2_4"] = chkPicc_Compliance_Q7_2_4.Checked;
//            row["chkPicc_Compliance_Q7_2_5"] = chkPicc_Compliance_Q7_2_5.Checked;
//            row["chkPicc_Compliance_Q7_2_6"] = chkPicc_Compliance_Q7_2_6.Checked;
//            row["chkPicc_Compliance_Q7_2_7"] = chkPicc_Compliance_Q7_2_7.Checked;
//            row["chkPicc_Compliance_Q7_2_8"] = chkPicc_Compliance_Q7_2_8.Checked;
//            row["chkPicc_Compliance_Q7_2_9"] = chkPicc_Compliance_Q7_2_9.Checked;
//            row["chkPicc_Compliance_Q7_2_10"] = chkPicc_Compliance_Q7_2_10.Checked;
//            row["chk_Docu_Q7_2_1"] = chk_Docu_Q7_2_1.Checked;
//            row["chk_Docu_Q7_2_2"] = chk_Docu_Q7_2_2.Checked;
//            row["chk_Docu_Q7_2_3"] = chk_Docu_Q7_2_3.Checked;
//            row["txt_Docu_Q7_2_3"] = txt_Docu_Q7_2_3.Text;
//            row["txtPicc_Notes_Q7_2"] = txtPicc_Notes_Q7_2.Text;
//            row["chkPicc_Compliance_Q7_3_1"] = chkPicc_Compliance_Q7_3_1.Checked;
//            row["chkPicc_Compliance_Q7_3_2"] = chkPicc_Compliance_Q7_3_2.Checked;
//            row["chkPicc_Compliance_Q7_3_3"] = chkPicc_Compliance_Q7_3_3.Checked;
//            row["chkPicc_Compliance_Q7_3_4"] = chkPicc_Compliance_Q7_3_4.Checked;
//            row["chkPicc_Compliance_Q7_3_5"] = chkPicc_Compliance_Q7_3_5.Checked;
//            row["chkPicc_Compliance_Q7_3_6"] = chkPicc_Compliance_Q7_3_6.Checked;
//            row["chkPicc_Compliance_Q7_3_7"] = chkPicc_Compliance_Q7_3_7.Checked;
//            row["chk_Docu_Q7_3_1"] = chk_Docu_Q7_3_1.Checked;
//            row["chk_Docu_Q7_3_2"] = chk_Docu_Q7_3_2.Checked;
//            row["chk_Docu_Q7_3_3"] = chk_Docu_Q7_3_3.Checked;
//            row["chk_Docu_Q7_3_4"] = chk_Docu_Q7_3_4.Checked;
//            row["txt_Docu_Q7_3_4"] = txt_Docu_Q7_3_4.Text;
//            row["txtPicc_Notes_Q7_3"] = txtPicc_Notes_Q7_3.Text;
//            row["chkPicc_Compliance_Q8_1"] = chkPicc_Compliance_Q8_1.Checked;
//            row["chk_Docu_Q8_1"] = chk_Docu_Q8_1.Checked;            
//            row["txtPicc_Notes_Q8_1"] = txtPicc_Notes_Q8_1.Text;
//            row["chkPicc_Compliance_Q8_2"] = chkPicc_Compliance_Q8_2.Checked;
//            row["chkPicc_Compliance_Q8_3"] = chkPicc_Compliance_Q8_3.Checked;
//            row["chkPicc_Compliance_Q8_4"] = chkPicc_Compliance_Q8_4.Checked;
//            row["chk_Docu_Q8_2"] = chk_Docu_Q8_2.Checked;
//            row["txtPicc_Notes_Q8_2"] = txtPicc_Notes_Q8_2.Text;
//            row["chkPicc_Compliance_Q8_5"] = chkPicc_Compliance_Q8_5.Checked;
//            row["chkPicc_Compliance_Q8_6_1"] = chkPicc_Compliance_Q8_6_1.Checked;
//            row["chkPicc_Compliance_Q8_6_2"] = chkPicc_Compliance_Q8_6_2.Checked;
//            row["chkPicc_Compliance_Q8_6_3"] = chkPicc_Compliance_Q8_6_3.Checked;
//            row["chk_Docu_Q8_3_1"] = chk_Docu_Q8_3_1.Checked;
//            row["chk_Docu_Q8_3_2"] = chk_Docu_Q8_3_2.Checked;
//            row["chk_Docu_Q8_3_3"] =chk_Docu_Q8_3_3.Checked;
//            row["txt_Docu_Q8_3_3"] = txt_Docu_Q8_3_3.Text;
//            row["txtPicc_Notes_Q8_3"] = txtPicc_Notes_Q8_3.Text;
//            row["chkPicc_Compliance_Q8_7"] = chkPicc_Compliance_Q8_7.Checked;
//            row["chkPicc_Compliance_Q8_7_1"] = chkPicc_Compliance_Q8_7_1.Checked;
//            row["chkPicc_Compliance_Q8_7_2"] = chkPicc_Compliance_Q8_7_2.Checked;
//            row["chkPicc_Compliance_Q8_7_3"] = chkPicc_Compliance_Q8_7_3.Checked;
//            row["chkPicc_Compliance_Q8_7_4"] = chkPicc_Compliance_Q8_7_4.Checked;
//            row["chkPicc_Compliance_Q8_7_5"] = chkPicc_Compliance_Q8_7_5.Checked;
//            row["chkPicc_Compliance_Q8_7_6"] = chkPicc_Compliance_Q8_7_6.Checked;
//            row["chk_Docu_Q8_7_1"] = chk_Docu_Q8_7_1.Checked;
//            row["chk_Docu_Q8_7_2"] = chk_Docu_Q8_7_2.Checked;
//            row["chk_Docu_Q8_7_3"] = chk_Docu_Q8_7_3.Checked;
//            row["chk_Docu_Q8_7_4"] = chk_Docu_Q8_7_4.Checked;
//            row["chk_Docu_Q8_7_5"] = chk_Docu_Q8_7_5.Checked;
//            row["chk_Docu_Q8_7_6"] = chk_Docu_Q8_7_6.Checked;
//            row["chk_Docu_Q8_7_7"] = chk_Docu_Q8_7_7.Checked;
//            row["txtPicc_Notes_Q8_7"] = txtPicc_Notes_Q8_7.Text;
//            row["chkPicc_Compliance_Q8_8_1"] = chkPicc_Compliance_Q8_8_1.Checked;
//            row["chkPicc_Compliance_Q8_8_2"] = chkPicc_Compliance_Q8_8_2.Checked;
//            row["chkPicc_Compliance_Q8_8_3"] = chkPicc_Compliance_Q8_8_3.Checked;
//            row["chk_Docu_Q8_8_1"] = chk_Docu_Q8_8_1.Checked;
//            row["chk_Docu_Q8_8_2"] = chk_Docu_Q8_8_2.Checked;
//            row["chk_Docu_Q8_8_3"] = chk_Docu_Q8_8_3.Checked;
//            row["txt_Docu_Q8_8_3"] = txt_Docu_Q8_8_3.Text;
//            row["txtPicc_Notes_Q8_8"] = txtPicc_Notes_Q8_8.Text;
//            row["chkPicc_Compliance_Q8_9_1"] = chkPicc_Compliance_Q8_9_1.Checked;
//            row["chkPicc_Compliance_Q8_9_2"] = chkPicc_Compliance_Q8_9_2.Checked;
//            row["chk_Docu_Q8_9_1"] = chk_Docu_Q8_9_1.Checked;
//            row["chk_Docu_Q8_9_2"] = chk_Docu_Q8_9_2.Checked;
//            row["chk_Docu_Q8_9_3"] = chk_Docu_Q8_9_3.Checked;
//            row["txt_Docu_Q8_9_1"] = txt_Docu_Q8_9_1.Text;
//            row["txtPicc_Notes_Q8_9"] = txtPicc_Notes_Q8_9.Text;
//            row["chkPicc_Compliance_Q8_10_1"] = chkPicc_Compliance_Q8_10_1.Checked;
//            row["chkPicc_Compliance_Q8_10_2"] = chkPicc_Compliance_Q8_10_2.Checked;
//            row["chk_Docu_Q8_10_1"] = chk_Docu_Q8_10_1.Checked;
//            row["chk_Docu_Q8_10_2"] = chk_Docu_Q8_10_2.Checked;
//            row["chk_Docu_Q8_10_3"] = chk_Docu_Q8_10_3.Checked;
//            row["txt_Docu_Q8_10_3"] = txt_Docu_Q8_10_3.Text;
//            row["txtPicc_Notes_Q8_10"] = txtPicc_Notes_Q8_10.Text;
//            row["chkPicc_Compliance_Q9_1"] = chkPicc_Compliance_Q9_1.Checked;
//            row["txtPicc_Compliance_Q9_1_1"] = txtPicc_Compliance_Q9_1_1.Text;
//            row["chk_Docu_Q9_1_1"] = chk_Docu_Q9_1_1.Checked;
//            row["chk_Docu_Q9_1_2"] = chk_Docu_Q9_1_2.Checked;
//            row["chk_Docu_Q9_1_3"] = chk_Docu_Q9_1_3.Checked;
//            row["txt_Docu_Q9_1_1"] = txt_Docu_Q9_1_1.Text;
//            row["txtPicc_Notes_Q9_1"] = txtPicc_Notes_Q9_1.Text;
//            row["chkPicc_Compliance_Q9_2"] = chkPicc_Compliance_Q9_2.Checked;
//            row["txtPicc_Compliance_Q9_2_1"] = txtPicc_Compliance_Q9_2_1.Text;
//            row["txtPicc_Compliance_Q9_2_2"] = txtPicc_Compliance_Q9_2_2.Text;
//            row["txtPicc_Compliance_Q9_2_3"] = txtPicc_Compliance_Q9_2_3.Text;
//            row["txtPicc_Compliance_Q9_2_4"] = txtPicc_Compliance_Q9_2_4.Text;
//            row["chk_Docu_Q9_2_1"] = chk_Docu_Q9_2_1.Checked;
//            row["chk_Docu_Q9_2_2"] = chk_Docu_Q9_2_2.Checked;
//            row["chk_Docu_Q9_2_3"] = chk_Docu_Q9_2_3.Checked;
//            row["txt_Docu_Q9_2_3"] = txt_Docu_Q9_2_3.Text;
//            row["txtPicc_Notes_Q9_2"] = txtPicc_Notes_Q9_2.Text;
//            row["chkPicc_Compliance_Q9_3"] = chkPicc_Compliance_Q9_3.Checked;
//            row["txtPicc_Compliance_Q9_3_1"] = txtPicc_Compliance_Q9_3_1.Text;
//            row["txtPicc_Compliance_Q9_3_2"] = txtPicc_Compliance_Q9_3_2.Text;
//            row["txtPicc_Compliance_Q9_3_3"] = txtPicc_Compliance_Q9_3_3.Text;
//            row["chk_Docu_Q9_3_1"] = chk_Docu_Q9_3_1.Checked;
//            row["chk_Docu_Q9_3_2"] = chk_Docu_Q9_3_2.Checked;
//            row["chk_Docu_Q9_3_3"] = chk_Docu_Q9_3_3.Checked;
//            row["chk_Docu_Q9_3_4"] = chk_Docu_Q9_3_4.Checked;
//            row["chk_Docu_Q9_3_5"] = chk_Docu_Q9_3_5.Checked;
//            row["txt_Docu_Q9_3_5"] = txt_Docu_Q9_3_5.Text;
//            row["txtPicc_Notes_Q9_3"] = txtPicc_Notes_Q9_3.Text;
//            row["chkPicc_Compliance_Q10_1_1"] = chkPicc_Compliance_Q10_1_1.Checked;
//            row["chkPicc_Compliance_Q10_1_2"] = chkPicc_Compliance_Q10_1_2.Checked;
//            row["chkPicc_Compliance_Q10_1_3"] = chkPicc_Compliance_Q10_1_3.Checked;
//            row["chk_Docu_Q10_1_1"] = chk_Docu_Q10_1_1.Checked;
//            row["chk_Docu_Q10_1_2"] = chk_Docu_Q10_1_2.Checked;
//            row["chk_Docu_Q10_1_3"] = chk_Docu_Q10_1_3.Checked;
//            row["chk_Docu_Q10_1_4"] = chk_Docu_Q10_1_4.Checked;
//            row["txt_Docu_Q10_1_4"] = txt_Docu_Q10_1_4.Text;
//            row["chk_Docu_Q10_1_5"] = chk_Docu_Q10_1_5.Checked;
//            row["chk_Docu_Q10_1_6"] = chk_Docu_Q10_1_6.Checked;
//            row["txt_Docu_Q10_1_6"] = txt_Docu_Q10_1_6.Text;
//            row["chk_Docu_Q10_1_7"] = chk_Docu_Q10_1_7.Checked;
//            row["chk_Docu_Q10_1_8"] = chk_Docu_Q10_1_8.Checked;
//            row["chk_Docu_Q10_1_9"] = chk_Docu_Q10_1_9.Checked;
//            row["txt_Docu_Q10_1_9"] = txt_Docu_Q10_1_9.Text;
//            row["txtPicc_Notes_Q10_1"] = txtPicc_Notes_Q10_1.Text;
//            row["chkPicc_Compliance_Q10_2_1"] = chkPicc_Compliance_Q10_2_1.Checked;
//            row["chk_Docu_Q10__2_1"] = chk_Docu_Q10__2_1.Checked;
//            row["txtPicc_Notes_Q10_2"] = txtPicc_Notes_Q10_2.Text;
//            row["chkPicc_Compliance_Q11_1_1"] = chkPicc_Compliance_Q11_1_1.Checked;
//            row["chkPicc_Compliance_Q11_2_1"] = chkPicc_Compliance_Q11_2_1.Checked;
//            row["txtPicc_Compliance_Q11_2_1"] = txtPicc_Compliance_Q11_2_1.Text;
//            row["chkPicc_Compliance_Q11_3_1"] = chkPicc_Compliance_Q11_3_1.Checked;
//            row["txtPicc_Compliance_Q11_3_1"] = txtPicc_Compliance_Q11_3_1.Text;
//            row["chk_Docu_Q11_1"] = chk_Docu_Q11_1.Checked;
//            row["chk_Docu_Q11_2"] = chk_Docu_Q11_2.Checked;
//            row["chk_Docu_Q11_3"] = chk_Docu_Q11_3.Checked;
//            row["chk_Docu_Q11_4"] = chk_Docu_Q11_4.Checked;
//            row["txt_Docu_Q11_4"] = txt_Docu_Q11_4.Text;
//            row["txtPicc_Notes_Q11"] = txtPicc_Notes_Q11.Text;
//            row["chkPicc_Compliance_Q12_1"] = chkPicc_Compliance_Q12_1.Checked;
//            row["chkPicc_Compliance_Q12_1_1"] = chkPicc_Compliance_Q12_1_1.Checked;
//            if (ddl_Docu_Q12_1.SelectedValue.Length > 0)
//            {
//                row["ddl_Docu_Q12_1"] = ddl_Docu_Q12_1.SelectedValue;
//            }
//            row["chk_Docu_Q12_1"] = chk_Docu_Q12_1.Checked;
//            row["txt_Docu_Q12_1"] = txt_Docu_Q12_1.Text;
//            row["txtPicc_Notes_Q12_1"] = txtPicc_Notes_Q12_1.Text;
//            row["chkPicc_Compliance_Q12_2_1"] = chkPicc_Compliance_Q12_2_1.Checked;
//            row["chkPicc_Compliance_Q12_2_2"] = chkPicc_Compliance_Q12_2_2.Checked;
//            row["chkPicc_Compliance_Q12_2_3"] = chkPicc_Compliance_Q12_2_3.Checked;
//            row["chkPicc_Compliance_Q12_2_1_1"] = chkPicc_Compliance_Q12_2_1_1.Checked;
//            row["chkPicc_Compliance_Q12_2_1_2"] = chkPicc_Compliance_Q12_2_1_2.Checked;
//            row["chkPicc_Compliance_Q12_2_1_3"] = chkPicc_Compliance_Q12_2_1_3.Checked;
//            row["chk_Docu_Q12_2"] = chk_Docu_Q12_2.Checked;
//            row["txtPicc_Notes_Q12_2"] = txtPicc_Notes_Q12_2.Text;
//            if (ddlPicc_Compliance_Q13_1.SelectedValue.Length > 0)
//            {
//                row["ddlPicc_Compliance_Q13_1"] = ddlPicc_Compliance_Q13_1.SelectedValue;
//            }
//            row["chkPicc_Compliance_Q13_1"] = chkPicc_Compliance_Q13_1.Checked;
//            row["txtPicc_Compliance_Q13_1"] = txtPicc_Compliance_Q13_1.Text;
//            row["chkPicc_Compliance_Q13_2"] = chkPicc_Compliance_Q13_2.Checked;
//            row["chkPicc_Compliance_Q13_2_1"] = chkPicc_Compliance_Q13_2_1.Checked;
//            row["chkPicc_Compliance_Q13_2_2"] = chkPicc_Compliance_Q13_2_2.Checked;
//            row["chkPicc_Compliance_Q13_2_3"] = chkPicc_Compliance_Q13_2_3.Checked;
//            row["chk_Docu_Q13_1"] = chk_Docu_Q13_1.Checked;
//            row["chk_Docu_Q13_2"] = chk_Docu_Q13_2.Checked;
//            row["chk_Docu_Q13_3"] = chk_Docu_Q13_3.Checked;
//            row["chk_Docu_Q13_4"] = chk_Docu_Q13_4.Checked;
//            row["chk_Docu_Q13_5"] = chk_Docu_Q13_5.Checked;
//            row["txt_Docu_Q13_5"] = txt_Docu_Q13_5.Text;
//            row["txtPicc_Notes_Q13"] = txtPicc_Notes_Q13.Text;
//            row["chkPicc_Compliance_Q14_1"] = chkPicc_Compliance_Q14_1.Checked;
//            row["chkPicc_Compliance_Q14_2"] = chkPicc_Compliance_Q14_2.Checked;
//            row["chkPicc_Compliance_Q14_3"] = chkPicc_Compliance_Q14_3.Checked;
//            row["chkPicc_Compliance_Q14_4"] = chkPicc_Compliance_Q14_4.Checked;
//            row["chkPicc_Compliance_Q14_5"] = chkPicc_Compliance_Q14_5.Checked;
//            row["chkPicc_Compliance_Q14_6"] = chkPicc_Compliance_Q14_6.Checked;
//            row["chkPicc_Compliance_Q14_7"] = chkPicc_Compliance_Q14_7.Checked;
//            row["chkPicc_Compliance_Q14_8"] = chkPicc_Compliance_Q14_8.Checked;
//            row["chk_Docu_Q14_1"] = chk_Docu_Q14_1.Checked;
//            row["chk_Docu_Q14_2"] = chk_Docu_Q14_2.Checked;
//            row["chk_Docu_Q14_3"] = chk_Docu_Q14_3.Checked;
//            row["chk_Docu_Q14_4"] = chk_Docu_Q14_4.Checked;
//            row["chk_Docu_Q14_5"] = chk_Docu_Q14_5.Checked;
//            row["chk_Docu_Q14_6"] = chk_Docu_Q14_6.Checked;
//            row["chk_Docu_Q14_7"] = chk_Docu_Q14_7.Checked;
//            row["chk_Docu_Q14_8"] = chk_Docu_Q14_8.Checked;
//            row["txt_Docu_Q14_8"] = txt_Docu_Q14_8.Text;
//            row["txtPicc_Notes_Q14"] = txtPicc_Notes_Q14.Text;
//            row["txtPicc_Compliance_Q15_1"] = txtPicc_Compliance_Q15_1.Text;
//            row["txtPicc_Compliance_Q15_2"] = txtPicc_Compliance_Q15_2.Text;
//            row["txtPicc_Compliance_Q15_3"] = txtPicc_Compliance_Q15_3.Text;
//            row["txtPicc_Compliance_Q15_4"] = txtPicc_Compliance_Q15_4.Text;
//            row["chkPicc_Compliance_Q15_5"] = chkPicc_Compliance_Q15_5.Checked;
//            row["chkPicc_Compliance_Q15_5_1"] = chkPicc_Compliance_Q15_5_1.Checked;
//            row["chkPicc_Compliance_Q15_5_2"] = chkPicc_Compliance_Q15_5_2.Checked;
//            row["chkPicc_Compliance_Q15_5_3"] = chkPicc_Compliance_Q15_5_3.Checked;
//            row["chk_Docu_Q15_1"] = chk_Docu_Q15_1.Checked;
//            row["chk_Docu_Q15_2"] = chk_Docu_Q15_2.Checked;
//            row["chk_Docu_Q15_3"] = chk_Docu_Q15_3.Checked;
//            row["chk_Docu_Q15_4"] = chk_Docu_Q15_4.Checked;
//            row["chk_Docu_Q15_5"] = chk_Docu_Q15_5.Checked;
//            row["txt_Docu_Q15_1"] = txt_Docu_Q15_1.Text;
//            row["txtPicc_Notes_Q15"] = txtPicc_Notes_Q15.Text;
//            row["chkPicc_Compliance_Q16_1"] = chkPicc_Compliance_Q16_1.Checked;
//            row["chk_Docu_Q16_1"] = chk_Docu_Q16_1.Checked;
//            row["chk_Docu_Q16_2"] = chk_Docu_Q16_2.Checked;
//            row["chk_Docu_Q16_3"] = chk_Docu_Q16_3.Checked;
//            row["chk_Docu_Q16_4"] = chk_Docu_Q16_4.Checked;
//            row["txt_Docu_Q16_5"] = txt_Docu_Q16_5.Text;
//            row["txtPicc_Notes_Q16_1"] = txtPicc_Notes_Q16_1.Text;
//            row["chkPicc_Compliance_Q16_2_1"] = chkPicc_Compliance_Q16_2_1.Checked;
//            row["chkPicc_Compliance_Q16_2_2"] = chkPicc_Compliance_Q16_2_2.Checked;
//            row["chkPicc_Compliance_Q16_2_3"] = chkPicc_Compliance_Q16_2_3.Checked;
//            row["chk_Docu_Q16_2_1"] = chk_Docu_Q16_2_1.Checked;
//            row["chk_Docu_Q16_2_2"] = chk_Docu_Q16_2_2.Checked;
//            row["chk_Docu_Q16_2_3"] = chk_Docu_Q16_2_3.Checked;
//            row["chk_Docu_Q16_2_4"] = chk_Docu_Q16_2_4.Checked;
//            row["txt_Docu_Q16_2_4"] = txt_Docu_Q16_2_4.Text;
//            row["txtPicc_Notes_Q16_2"] = txtPicc_Notes_Q16_2.Text;
//            row["chkPicc_Compliance_Q16_2_1_1"] = chkPicc_Compliance_Q16_2_1_1.Checked;
//            row["chkPicc_Compliance_Q16_2_1_2"] = chkPicc_Compliance_Q16_2_1_2.Checked;
//            row["chkPicc_Compliance_Q16_2_1_3"] = chkPicc_Compliance_Q16_2_1_3.Checked;
//            row["chk_Docu_Q16_2_1_1"] = chk_Docu_Q16_2_1_1.Checked;
//            row["chk_Docu_Q16_2_1_2"] = chk_Docu_Q16_2_1_2.Checked;
//            row["chk_Docu_Q16_2_1_3"] = chk_Docu_Q16_2_1_3.Checked;
//            row["chk_Docu_Q16_2_1_4"] = chk_Docu_Q16_2_1_4.Checked;
//            row["txt_Docu_Q16_2_1_4"] = txt_Docu_Q16_2_1_4.Text;
//            row["txtPicc_Notes_Q16_2_1"] = txtPicc_Notes_Q16_2_1.Text;
//            row["chkPicc_Compliance_Q16_3_1"] = chkPicc_Compliance_Q16_3_1.Checked;
//            row["chkPicc_Compliance_Q16_3_2"] = chkPicc_Compliance_Q16_3_2.Checked;
//            row["chkPicc_Compliance_Q16_3_3"] = chkPicc_Compliance_Q16_3_3.Checked;
//            row["chk_Docu_Q16_3_1"] = chk_Docu_Q16_3_1.Checked;
//            row["chk_Docu_Q16_3_2"] = chk_Docu_Q16_3_2.Checked;
//            row["chk_Docu_Q16_3_3"] = chk_Docu_Q16_3_3.Checked;
//            row["chk_Docu_Q16_3_4"] = chk_Docu_Q16_3_4.Checked;
//            row["chk_Docu_Q16_3_5"] = chk_Docu_Q16_3_5.Checked;
//            row["txt_Docu_Q16_3_5"] = txt_Docu_Q16_3_5.Text;
//            row["txtPicc_Notes_Q16_3"] = txtPicc_Notes_Q16_3.Text;
//            row["chkPicc_Compliance_Q16_4_1"] = chkPicc_Compliance_Q16_4_1.Checked;
//            row["chkPicc_Compliance_Q16_4_2"] = chkPicc_Compliance_Q16_4_2.Checked;
//            row["chkPicc_Compliance_Q16_4_3"] = chkPicc_Compliance_Q16_4_3.Checked;
//            row["chk_Docu_Q16_4_1"] = chk_Docu_Q16_4_1.Checked;
//            row["chk_Docu_Q16_4_2"] = chk_Docu_Q16_4_2.Checked;
//            row["chk_Docu_Q16_4_3"] = chk_Docu_Q16_4_3.Checked;
//            row["chk_Docu_Q16_4_4"] = chk_Docu_Q16_4_4.Checked;
//            row["chk_Docu_Q16_4_5"] = chk_Docu_Q16_4_5.Checked;
//            row["txt_Docu_Q16_4_5"] = txt_Docu_Q16_4_5.Text;
//            row["txtPicc_Notes_Q16_4"] = txtPicc_Notes_Q16_4.Text;
//            row["chkPicc_Compliance_Q17_1"] = chkPicc_Compliance_Q17_1.Checked;
//            row["chkPicc_Compliance_Q17_2"] = chkPicc_Compliance_Q17_2.Checked;
//            row["chkPicc_Compliance_Q17_3"] = chkPicc_Compliance_Q17_3.Checked;
//            row["chkPicc_Compliance_Q17_4"] = chkPicc_Compliance_Q17_4.Checked;
//            row["chkPicc_Compliance_Q17_5"] = chkPicc_Compliance_Q17_5.Checked;
//            row["chk_Docu_Q17_1"] = chk_Docu_Q17_1.Checked;
//            row["chk_Docu_Q17_2"] = chk_Docu_Q17_2.Checked;
//            row["chk_Docu_Q17_3"] = chk_Docu_Q17_3.Checked;
//            row["chk_Docu_Q17_4"] = chk_Docu_Q17_4.Checked;
//            row["txt_Docu_Q17_4"] = txt_Docu_Q17_4.Text;
//            row["txtPicc_Notes_Q17"] = txtPicc_Notes_Q17.Text;
//            row["chkPicc_Compliance_Q18_1"] = chkPicc_Compliance_Q18_1.Checked;
//            row["chk_Docu_Q18_1_1"] = chk_Docu_Q18_1_1.Checked;
//            row["chk_Docu_Q18_1_2"] = chk_Docu_Q18_1_2.Checked;
//            row["txt_Docu_Q18_1_2"] = txt_Docu_Q18_1_2.Text;
//            row["txtPicc_Notes_Q18_1"] = txtPicc_Notes_Q18_1.Text;
//            row["chkPicc_Compliance_Q18_2_1"] = chkPicc_Compliance_Q18_2_1.Checked;
//            row["chkPicc_Compliance_Q18_2_2"] = chkPicc_Compliance_Q18_2_2.Checked;
//            row["chkPicc_Compliance_Q18_2_3"] = chkPicc_Compliance_Q18_2_3.Checked;
//            row["chkPicc_Compliance_Q18_2_4"] = chkPicc_Compliance_Q18_2_4.Checked;
//            row["chk_Docu_Q18_2_1"] = chk_Docu_Q18_2_1.Checked;
//            row["chk_Docu_Q18_2_2"] = chk_Docu_Q18_2_2.Checked;
//            row["txt_Docu_Q18_2_2"] = txt_Docu_Q18_2_2.Text;
//            row["txtPicc_Notes_Q18_2"] = txtPicc_Notes_Q18_2.Text;
//            row["chkPicc_Compliance_Q19"] = chkPicc_Compliance_Q19.Checked;
//            row["chk_Docu_Q19_1"] = chk_Docu_Q19_1.Checked;
//            row["chk_Docu_Q19_2"] = chk_Docu_Q19_2.Checked;
//            row["chk_Docu_Q19_3"] = chk_Docu_Q19_3.Checked;
//            row["chk_Docu_Q19_4"] = chk_Docu_Q19_4.Checked;
//            row["txt_Docu_Q19_4"] = txt_Docu_Q19_4.Text;
//            row["txtPicc_Notes_Q19"] = txtPicc_Notes_Q19.Text;
//            row["chkPicc_Compliance_Q20_1"] = chkPicc_Compliance_Q20_1.Checked;
//            row["chkPicc_Compliance_Q20_2"] = chkPicc_Compliance_Q20_2.Checked;
//            row["chk_Docu_Q20_1"] = chk_Docu_Q20_1.Checked;
//            row["txt_Docu_Q20_1"] = txt_Docu_Q20_1.Text;
//            row["txt_Docu_Q20_2"] = txt_Docu_Q20_2.Text;
//            row["chk_Docu_Q20_2"] = chk_Docu_Q20_2.Checked;
//            row["txtPicc_Notes_Q20"] = txtPicc_Notes_Q20.Text;
//            row["chkPicc_Compliance_Q20_3"] = chkPicc_Compliance_Q20_3.Checked;
//            row["chkPicc_Compliance_Q20_4"] = chkPicc_Compliance_Q20_4.Checked;
//            row["chkPicc_Compliance_Q20_5"] = chkPicc_Compliance_Q20_5.Checked;
//            row["chkPicc_Compliance_Q20_6"] = chkPicc_Compliance_Q20_6.Checked;
//            row["txtPicc_Compliance_Q20_6"] = txtPicc_Compliance_Q20_6.Text;
//            row["chk_Docu_Q20_6"] = chk_Docu_Q20_6.Checked;
//            row["txt_Docu_Q20_6"] = txt_Docu_Q20_6.Text;
//            row["txtPicc_Notes_Q20_2"] = txtPicc_Notes_Q20_2.Text;
//            row["chkPicc_Compliance_Q21_1_1"] = chkPicc_Compliance_Q21_1_1.Checked;
//            row["chkPicc_Compliance_Q21_1_2"] = chkPicc_Compliance_Q21_1_2.Checked;
//            row["chkPicc_Compliance_Q21_1_3"] = chkPicc_Compliance_Q21_1_3.Checked;
//            row["txtPicc_Compliance_Q21_1_3"] = txtPicc_Compliance_Q21_1_3.Text;
//            row["chkPicc_Compliance_Q21_2_1"] = chkPicc_Compliance_Q21_2_1.Checked;
//            row["chkPicc_Compliance_Q21_2_2"] = chkPicc_Compliance_Q21_2_2.Checked;
//            row["chk_Docu_Q21_1"] = chk_Docu_Q21_1.Checked;
//            row["chk_Docu_Q21_2"] = chk_Docu_Q21_2.Checked;
//            row["chk_Docu_Q21_3"] = chk_Docu_Q21_3.Checked;
//            row["chk_Docu_Q21_4"] = chk_Docu_Q21_4.Checked;
//            row["txt_Docu_Q21_4"] = txt_Docu_Q21_4.Text;
//            row["txtPicc_Notes_Q21"] = txtPicc_Notes_Q21.Text;
//            row["chkPicc_Compliance_Q22_1_1"] = chkPicc_Compliance_Q22_1_1.Checked;
//            row["txtPicc_Compliance_Q22_1_2"] = txtPicc_Compliance_Q22_1_2.Text;
//            row["txtPicc_Compliance_Q22_1_3"] = txtPicc_Compliance_Q22_1_3.Text;
//            row["txtPicc_Compliance_Q22_1_4"] = txtPicc_Compliance_Q22_1_4.Text;
//            row["txtPicc_Compliance_Q22_1_5"] = txtPicc_Compliance_Q22_1_5.Text;
//            row["txtPicc_Compliance_Q22_2_1"] = txtPicc_Compliance_Q22_2_1.Text;
//            row["txtPicc_Compliance_Q22_2_2"] = txtPicc_Compliance_Q22_2_2.Text;
//            row["txtPicc_Compliance_Q22_2_3"] = txtPicc_Compliance_Q22_2_3.Text;
//            row["txtPicc_Compliance_Q22_2_4"] = txtPicc_Compliance_Q22_2_4.Text;
//            row["txtPicc_Compliance_Q22_3_1"] = txtPicc_Compliance_Q22_3_1.Text;
//            row["txtPicc_Compliance_Q22_3_2"] = txtPicc_Compliance_Q22_3_2.Text;
//            row["txtPicc_Compliance_Q22_3_3"] = txtPicc_Compliance_Q22_3_3.Text;
//            row["txtPicc_Compliance_Q22_3_4"] = txtPicc_Compliance_Q22_3_4.Text;
//            row["txtPicc_Compliance_Q22_4_1"] = txtPicc_Compliance_Q22_4_1.Text;
//            row["txtPicc_Compliance_Q22_4_2"] = txtPicc_Compliance_Q22_4_2.Text;
//            row["txtPicc_Compliance_Q22_4_3"] = txtPicc_Compliance_Q22_4_3.Text;
//            row["txtPicc_Compliance_Q22_4_4"] = txtPicc_Compliance_Q22_4_4.Text;
//            row["chk_Docu_Q22_1"] = chk_Docu_Q22_1.Checked;
//            row["chk_Docu_Q22_2"] = chk_Docu_Q22_2.Checked;
//            row["chk_Docu_Q22_3"] = chk_Docu_Q22_3.Checked;
//            row["chk_Docu_Q22_4"] = chk_Docu_Q22_4.Checked;
//            row["txt_Docu_Q22_3"] = txt_Docu_Q22_3.Text;
//            row["txtPicc_Notes_Q22"] = txtPicc_Notes_Q22.Text;
//            row["chkPicc_Compliance_Q23"] = chkPicc_Compliance_Q23.Checked;
//            row["chk_Docu_Q23_1"] = chk_Docu_Q23_1.Checked;
//            row["chk_Docu_Q23_2"] = chk_Docu_Q23_2.Checked;
//            row["chk_Docu_Q23_3"] = chk_Docu_Q23_3.Checked;
//            row["txtPicc_Notes_Q23"] = txtPicc_Notes_Q23.Text;
//            row["chkPicc_Compliance_Q24_1"] = chkPicc_Compliance_Q24_1.Checked;
//            row["chkPicc_Compliance_Q24_2"] = chkPicc_Compliance_Q24_2.Checked;
//            row["chkPicc_Compliance_Q24_3"] = chkPicc_Compliance_Q24_3.Checked;
//            row["chkPicc_Compliance_Q24_4"] = chkPicc_Compliance_Q24_4.Checked;
//            row["txtPicc_Compliance_Q24_5"] = txtPicc_Compliance_Q24_5.Text;
//            row["txt_Docu_Q24"] = txt_Docu_Q24.Text;
//            row["txtPicc_Notes_Q24"] = txtPicc_Notes_Q24.Text;

//            if (!string.IsNullOrEmpty(gettopinfo.getvalue_ID()))
//            {
//                row["Top_ID"] = gettopinfo.getvalue_ID();
//                gettopinfo.setvalue_ID(null);
//            }
//            if (!string.IsNullOrEmpty(gettopinfo.getvalue_RCDT()))
//            {
//                row["RCDT"] = gettopinfo.getvalue_RCDT();
//                gettopinfo.setvalue_RCDT(null);
//            }
//            if (!string.IsNullOrEmpty(gettopinfo.getvalue_AuthorizedOfficial()))
//            {
//                row["Authorized_Official"] = gettopinfo.getvalue_AuthorizedOfficial();
//                gettopinfo.setvalue_AuthorizedOfficial(null);
//            }
//            if (!string.IsNullOrEmpty(gettopinfo.getvalue_Notes()))
//            {
//                row["Top_Notes"] = gettopinfo.getvalue_Notes();
//                gettopinfo.setvalue_Notes(null);
//            }
//            if (check == true)
//            {
//                ds.PiccTool.Rows.Add(row);
//            }
//            piccTool.Update(row);








//        }
       
       
//    }
//}