using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HVP.PIQRIInterview
{
    public partial class PDPIQRITool : System.Web.UI.Page
    {
        bool checkrow;
        Label lbl = new Label();
        DataRow row;
        ds ds = new ds(); 
        dsTableAdapters.vw_PDInterviewQuestionsTableAdapter pdi = new dsTableAdapters.vw_PDInterviewQuestionsTableAdapter();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                Survey.setgetreview getdt = new Survey.setgetreview();             
               
                hfschd.Value = Session["schid"].ToString();//getdt.getSchdID();
                Session["schid"] = null;
                bool checkDTRow = Convert.ToBoolean(Session["checkRow"]);
                Session["checkRow"] = null;
                //getdt.setSchdID(null);
                if (string.IsNullOrEmpty(hfschd.Value))
                {
                    //ClientScript.RegisterStartupScript(typeof(Page), "closePage", "<script type='text/JavaScript'>window.close();</script>");
                    Response.Redirect("~/UnauthorizedAccess.aspx");
                }
                else
                {
                    string sqlquery = "SELECT * FROM [ISBEPI_DEV].[dbo].[PDInterview] WHERE Schd_ID =" + hfschd.Value.Trim() + ";";
                    DataTable dt_Id = DBHelper.GetDataTable(sqlquery);

                    BindQuestionQestions();                 
                    //DataTable dt = new DataTable();
                    //dt = getdt.getQuestions();
                    //if (dt.Rows.Count > 0)
                    //{
                    //    getData(dt);
                    //    //toGetInfo tocheck = new toGetInfo();
                    //    //tocheck.setStarted(true);
                    //}                   
                    if (checkDTRow == false && dt_Id.Rows.Count != 0)
                    {
                        string strMsg = "Sorry, Already completed!";
                        System.Web.HttpContext.Current.Response.Write("<Script Language='JavaScript'>window.alert('" + strMsg + "');window.location.href='/PIQRIInterview/default.aspx';</script>");
                        //Response.Redirect("~/PIQRIInterview/default.aspx");
                    }
                    else if(checkDTRow == true && dt_Id.Rows.Count != 0)
                    {
                        getData(dt_Id);
                    }
                    //getdt.getQuestions().Clear();
                    //Page.RegisterClientScriptBlock("Myscript", "<script language=javascript src ='JavaScript1.js'>");
                }
            }
        }
        protected void BindQuestionQestions()
        {
            DataTable dt = new DataTable();
            dt = pdi.GetData();
            for (int x = 0; x < dt.Rows.Count; x++)
            {
                lbl = this.Master.FindControl("ContentPlaceHolder1").FindControl(dt.Rows[x]["Label_ID"].ToString().Trim()) as Label;
                lbl.Text = dt.Rows[x]["Questions"].ToString().Trim();
            }
        }
        protected void getData(DataTable dt)
        {
            chk_EBPM_Q1_1.Checked = Convert.ToBoolean(dt.Rows[0]["EBPM_Q1_1"].ToString());
            chk_EBPM_Q1_2.Checked = Convert.ToBoolean(dt.Rows[0]["EBPM_Q1_2"].ToString());
            chk_EBPM_Q1_3.Checked = Convert.ToBoolean(dt.Rows[0]["EBPM_Q1_3"].ToString());
            chk_EBPM_Q1_4.Checked = Convert.ToBoolean(dt.Rows[0]["EBPM_Q1_4"].ToString());
            chk_EBPM_Q1_5.Checked = Convert.ToBoolean(dt.Rows[0]["EBPM_Q1_5"].ToString());
            chk_EBPM_Q1_6.Checked = Convert.ToBoolean(dt.Rows[0]["EBPM_Q1_6"].ToString());
            chk_EBPM_Q1_7.Checked = Convert.ToBoolean(dt.Rows[0]["EBPM_Q1_7"].ToString());
            
            //chkScore_EBPM_Q1.SelectedValue = dt.Rows[0]["Score_EBPM_Q1"].ToString().Trim();
            switch (dt.Rows[0]["Score_EBPM_Q1"].ToString().Trim())
            {
                case "1":
                    {
                        chkScore_EBPM_Q1_1.Checked = true;
                        break;
                    }
                case "3":
                    {
                        chkScore_EBPM_Q1_2.Checked = true;
                        break;
                    }
                case "5":
                    {
                        chkScore_EBPM_Q1_3.Checked = true;
                        break;
                    }
                case "7":
                    {
                        chkScore_EBPM_Q1_4.Checked = true;
                        break;
                    }
            }
            chk_PO_Q2_1.Checked = Convert.ToBoolean(dt.Rows[0]["PO_Q2_1"].ToString());
            chk_PO_Q2_2.Checked = Convert.ToBoolean(dt.Rows[0]["PO_Q2_2"].ToString());
            chk_PO_Q2_3.Checked = Convert.ToBoolean(dt.Rows[0]["PO_Q2_3"].ToString());
            chk_PO_Q2_4.Checked = Convert.ToBoolean(dt.Rows[0]["PO_Q2_4"].ToString());
            chk_PO_Q2_5.Checked = Convert.ToBoolean(dt.Rows[0]["PO_Q2_5"].ToString());
            chk_PO_Q2_6.Checked = Convert.ToBoolean(dt.Rows[0]["PO_Q2_6"].ToString());
            chk_PO_Q2_7.Checked = Convert.ToBoolean(dt.Rows[0]["PO_Q2_7"].ToString());
            chk_PO_Q2_8.Checked = Convert.ToBoolean(dt.Rows[0]["PO_Q2_8"].ToString());
            //chkScore_PO_Q2.SelectedValue = dt.Rows[0]["Score_PO_Q2"].ToString().Trim();
            switch (dt.Rows[0]["Score_PO_Q2"].ToString().Trim())
            {
                case "1":
                    {
                        chkScore_PO_Q2_1.Checked = true;
                        break;
                    }
                case "3":
                    {
                        chkScore_PO_Q2_2.Checked = true;
                        break;
                    }
                case "5":
                    {
                        chkScore_PO_Q2_3.Checked = true;
                        break;
                    }
                case "7":
                    {
                        chkScore_PO_Q2_4.Checked = true;
                        break;
                    }
            }
            chk_COPRO_Q3_1.Checked = Convert.ToBoolean(dt.Rows[0]["COPRO_Q3_1"].ToString());
            chk_COPRO_Q3_2.Checked = Convert.ToBoolean(dt.Rows[0]["COPRO_Q3_2"].ToString());
            chk_COPRO_Q3_3.Checked = Convert.ToBoolean(dt.Rows[0]["COPRO_Q3_3"].ToString());
            chk_COPRO_Q3_4.Checked = Convert.ToBoolean(dt.Rows[0]["COPRO_Q3_4"].ToString());
            chk_COPRO_Q3_5.Checked = Convert.ToBoolean(dt.Rows[0]["COPRO_Q3_5"].ToString());
            chk_COPRO_Q3_6.Checked = Convert.ToBoolean(dt.Rows[0]["COPRO_Q3_6"].ToString());
            //chkScore_COPRO_Q3.SelectedValue = dt.Rows[0]["Score_COPRO_Q3"].ToString().Trim();
            switch (dt.Rows[0]["Score_COPRO_Q3"].ToString().Trim())
            {
                case "1":
                    {
                        chkScore_COPRO_Q3_1.Checked = true;
                        break;
                    }
                case "3":
                    {
                        chkScore_COPRO_Q3_2.Checked = true;
                        break;
                    }
                case "5":
                    {
                        chkScore_COPRO_Q3_3.Checked = true;
                        break;
                    }
                case "7":
                    {
                        chkScore_COPRO_Q3_4.Checked = true;
                        break;
                    }
            }
            chk_DMS_Q4_1.Checked = Convert.ToBoolean(dt.Rows[0]["DMS_Q4_1"].ToString());
            chk_DMS_Q4_2.Checked = Convert.ToBoolean(dt.Rows[0]["DMS_Q4_2"].ToString());
            chk_DMS_Q4_3.Checked = Convert.ToBoolean(dt.Rows[0]["DMS_Q4_3"].ToString());
            chk_DMS_Q4_4.Checked = Convert.ToBoolean(dt.Rows[0]["DMS_Q4_4"].ToString());
            chk_DMS_Q4_5.Checked = Convert.ToBoolean(dt.Rows[0]["DMS_Q4_5"].ToString());
            chk_DMS_Q4_6.Checked = Convert.ToBoolean(dt.Rows[0]["DMS_Q4_6"].ToString());
            chk_DMS_Q4_7.Checked = Convert.ToBoolean(dt.Rows[0]["DMS_Q4_7"].ToString());
            chk_DMS_Q4_8.Checked = Convert.ToBoolean(dt.Rows[0]["DMS_Q4_8"].ToString());
            chk_DMS_Q4_9.Checked = Convert.ToBoolean(dt.Rows[0]["DMS_Q4_9"].ToString());
            chk_DMS_Q4_10.Checked = Convert.ToBoolean(dt.Rows[0]["DMS_Q4_10"].ToString());
            chk_DMS_Q4_11.Checked = Convert.ToBoolean(dt.Rows[0]["DMS_Q4_11"].ToString());
            chk_DMS_Q4_12.Checked = Convert.ToBoolean(dt.Rows[0]["DMS_Q4_12"].ToString());
            chk_DMS_Q4_13.Checked = Convert.ToBoolean(dt.Rows[0]["DMS_Q4_13"].ToString());
            //chkScore_DMS_Q4.SelectedValue = dt.Rows[0]["Score_DMS_Q4"].ToString().Trim();
            switch (dt.Rows[0]["Score_DMS_Q4"].ToString().Trim())
            {
                case "1":
                    {
                        chkScore_DMS_Q4_1.Checked = true;
                        break;
                    }
                case "3":
                    {
                        chkScore_DMS_Q4_2.Checked = true;
                        break;
                    }
                case "5":
                    {
                        chkScore_DMS_Q4_3.Checked = true;
                        break;
                    }
                case "7":
                    {
                        chkScore_DMS_Q4_4.Checked = true;
                        break;
                    }
            }
            chk_UOPD_Q5_1.Checked = Convert.ToBoolean(dt.Rows[0]["UOPD_Q5_1"].ToString());
            chk_UOPD_Q5_2.Checked = Convert.ToBoolean(dt.Rows[0]["UOPD_Q5_2"].ToString());
            chk_UOPD_Q5_3.Checked = Convert.ToBoolean(dt.Rows[0]["UOPD_Q5_3"].ToString());
            chk_UOPD_Q5_4.Checked = Convert.ToBoolean(dt.Rows[0]["UOPD_Q5_4"].ToString());
            chk_UOPD_Q5_5.Checked = Convert.ToBoolean(dt.Rows[0]["UOPD_Q5_5"].ToString());
            chk_UOPD_Q5_6.Checked = Convert.ToBoolean(dt.Rows[0]["UOPD_Q5_6"].ToString());
            chk_UOPD_Q5_7.Checked = Convert.ToBoolean(dt.Rows[0]["UOPD_Q5_7"].ToString());
            chk_UOPD_Q5_8.Checked = Convert.ToBoolean(dt.Rows[0]["UOPD_Q5_8"].ToString());
            chk_UOPD_Q5_9.Checked = Convert.ToBoolean(dt.Rows[0]["UOPD_Q5_9"].ToString());
            //chkScore_UOPD_Q5.SelectedValue = dt.Rows[0]["Score_UOPD_Q5"].ToString().Trim();
            switch (dt.Rows[0]["Score_UOPD_Q5"].ToString().Trim())
            {
                case "1":
                    {
                        chkScore_UOPD_Q5_1.Checked = true;
                        break;
                    }
                case "3":
                    {
                        chkScore_UOPD_Q5_2.Checked = true;
                        break;
                    }
                case "5":
                    {
                        chkScore_UOPD_Q5_3.Checked = true;
                        break;
                    }
                case "7":
                    {
                        chkScore_UOPD_Q5_4.Checked = true;
                        break;
                    }
            }

            chk_FTPM_Q6_1.Checked = Convert.ToBoolean(dt.Rows[0]["FTPM_Q6_1"].ToString());
            chk_FTPM_Q6_2.Checked = Convert.ToBoolean(dt.Rows[0]["FTPM_Q6_2"].ToString());
            chk_FTPM_Q6_3.Checked = Convert.ToBoolean(dt.Rows[0]["FTPM_Q6_3"].ToString());
            chk_FTPM_Q6_4.Checked = Convert.ToBoolean(dt.Rows[0]["FTPM_Q6_4"].ToString());
            chk_FTPM_Q6_5.Checked = Convert.ToBoolean(dt.Rows[0]["FTPM_Q6_5"].ToString());
            chk_FTPM_Q6_6.Checked = Convert.ToBoolean(dt.Rows[0]["FTPM_Q6_6"].ToString());
            chk_FTPM_Q6_7.Checked = Convert.ToBoolean(dt.Rows[0]["FTPM_Q6_7"].ToString());
            //chkScore_FTPM_Q6.SelectedValue = dt.Rows[0]["Score_FTPM_Q6"].ToString().Trim();
            switch (dt.Rows[0]["Score_FTPM_Q6"].ToString().Trim())
            {
                case "1":
                    {
                        chkScore_FTPM_Q6_1.Checked = true;
                        break;
                    }
                case "3":
                    {
                        chkScore_FTPM_Q6_2.Checked = true;
                        break;
                    }
                case "5":
                    {
                        chkScore_FTPM_Q6_3.Checked = true;
                        break;
                    }
                case "7":
                    {
                        chkScore_FTPM_Q6_4.Checked = true;
                        break;
                    }
            }
            chk_PPAI_Q7_1.Checked = Convert.ToBoolean(dt.Rows[0]["PPAI_Q7_1"].ToString());
            chk_PPAI_Q7_2.Checked = Convert.ToBoolean(dt.Rows[0]["PPAI_Q7_2"].ToString());
            chk_PPAI_Q7_3.Checked = Convert.ToBoolean(dt.Rows[0]["PPAI_Q7_3"].ToString());
            chk_PPAI_Q7_4.Checked = Convert.ToBoolean(dt.Rows[0]["PPAI_Q7_4"].ToString());
            chk_PPAI_Q7_5.Checked = Convert.ToBoolean(dt.Rows[0]["PPAI_Q7_5"].ToString());
            chk_PPAI_Q7_6.Checked = Convert.ToBoolean(dt.Rows[0]["PPAI_Q7_6"].ToString());
            chk_PPAI_Q7_7.Checked = Convert.ToBoolean(dt.Rows[0]["PPAI_Q7_7"].ToString());
            chk_PPAI_Q7_8.Checked = Convert.ToBoolean(dt.Rows[0]["PPAI_Q7_8"].ToString());
            chk_PPAI_Q7_9.Checked = Convert.ToBoolean(dt.Rows[0]["PPAI_Q7_9"].ToString());
            chk_PPAI_Q7_10.Checked = Convert.ToBoolean(dt.Rows[0]["PPAI_Q7_10"].ToString());
            chk_PPAI_Q7_11.Checked = Convert.ToBoolean(dt.Rows[0]["PPAI_Q7_11"].ToString());
            chk_PPAI_Q7_12.Checked = Convert.ToBoolean(dt.Rows[0]["PPAI_Q7_12"].ToString());
            chk_PPAI_Q7_13.Checked = Convert.ToBoolean(dt.Rows[0]["PPAI_Q7_13"].ToString());
            chk_PPAI_Q7_14.Checked = Convert.ToBoolean(dt.Rows[0]["PPAI_Q7_14"].ToString());
            //chkScore_PPAI_Q7.SelectedValue = dt.Rows[0]["Score_PPAI_Q7"].ToString().Trim();
            switch (dt.Rows[0]["Score_PPAI_Q7"].ToString().Trim())
            {
                case "1":
                    {
                        chkScore_PPAI_Q7_1.Checked = true;
                        break;
                    }
                case "3":
                    {
                        chkScore_PPAI_Q7_2.Checked = true;
                        break;
                    }
                case "5":
                    {
                        chkScore_PPAI_Q7_3.Checked = true;
                        break;
                    }
                case "7":
                    {
                        chkScore_PPAI_Q7_4.Checked = true;
                        break;
                    }
            }

            chk_GFTSP_Q8_1.Checked = Convert.ToBoolean(dt.Rows[0]["GFTSP_Q8_1"].ToString());
            chk_GFTSP_Q8_2.Checked = Convert.ToBoolean(dt.Rows[0]["GFTSP_Q8_2"].ToString());
            chk_GFTSP_Q8_3.Checked = Convert.ToBoolean(dt.Rows[0]["GFTSP_Q8_3"].ToString());
            chk_GFTSP_Q8_4.Checked = Convert.ToBoolean(dt.Rows[0]["GFTSP_Q8_4"].ToString());
            chk_GFTSP_Q8_5.Checked = Convert.ToBoolean(dt.Rows[0]["GFTSP_Q8_5"].ToString());
            chk_GFTSP_Q8_6.Checked = Convert.ToBoolean(dt.Rows[0]["GFTSP_Q8_6"].ToString());
            chk_GFTSP_Q8_7.Checked = Convert.ToBoolean(dt.Rows[0]["GFTSP_Q8_7"].ToString());
            chk_GFTSP_Q8_8.Checked = Convert.ToBoolean(dt.Rows[0]["GFTSP_Q8_8"].ToString());
            //chkScore_GFTSP_Q8.SelectedValue = dt.Rows[0]["Score_GFTSP_Q8"].ToString().Trim();
            switch (dt.Rows[0]["Score_GFTSP_Q8"].ToString().Trim())
            {
                case "1":
                    {
                        chkScore_GFTSP_Q8_1.Checked = true;
                        break;
                    }
                case "3":
                    {
                        chkScore_GFTSP_Q8_2.Checked = true;
                        break;
                    }
                case "5":
                    {
                        chkScore_GFTSP_Q8_3.Checked = true;
                        break;
                    }
                case "7":
                    {
                        chkScore_GFTSP_Q8_4.Checked = true;
                        break;
                    }
            }

            chk_AIFN_Q9_1.Checked = Convert.ToBoolean(dt.Rows[0]["AIFN_Q9_1"].ToString());
            chk_AIFN_Q9_2.Checked = Convert.ToBoolean(dt.Rows[0]["AIFN_Q9_2"].ToString());
            chk_AIFN_Q9_3.Checked = Convert.ToBoolean(dt.Rows[0]["AIFN_Q9_3"].ToString());
            chk_AIFN_Q9_4.Checked = Convert.ToBoolean(dt.Rows[0]["AIFN_Q9_4"].ToString());
            chk_AIFN_Q9_5.Checked = Convert.ToBoolean(dt.Rows[0]["AIFN_Q9_5"].ToString());
            chk_AIFN_Q9_6.Checked = Convert.ToBoolean(dt.Rows[0]["AIFN_Q9_6"].ToString());
            chk_AIFN_Q9_7.Checked = Convert.ToBoolean(dt.Rows[0]["AIFN_Q9_7"].ToString());
            chk_AIFN_Q9_8.Checked = Convert.ToBoolean(dt.Rows[0]["AIFN_Q9_8"].ToString());
            //chkScore_AIFN_Q9.SelectedValue = dt.Rows[0]["Score_AIFN_Q9"].ToString().Trim();
            switch (dt.Rows[0]["Score_AIFN_Q9"].ToString().Trim())
            {
                case "1":
                    {
                        chkScore_AIFN_Q9_1.Checked = true;
                        break;
                    }
                case "3":
                    {
                        chkScore_AIFN_Q9_2.Checked = true;
                        break;
                    }
                case "5":
                    {
                        chkScore_AIFN_Q9_3.Checked = true;
                        break;
                    }
                case "7":
                    {
                        chkScore_AIFN_Q9_4.Checked = true;
                        break;
                    }
            }
            chk_GFSI_Q10_1.Checked = Convert.ToBoolean(dt.Rows[0]["GFSI_Q10_1"].ToString());
            chk_GFSI_Q10_2.Checked = Convert.ToBoolean(dt.Rows[0]["GFSI_Q10_2"].ToString());
            chk_GFSI_Q10_3.Checked = Convert.ToBoolean(dt.Rows[0]["GFSI_Q10_3"].ToString());
            chk_GFSI_Q10_4.Checked = Convert.ToBoolean(dt.Rows[0]["GFSI_Q10_4"].ToString());
            chk_GFSI_Q10_5.Checked = Convert.ToBoolean(dt.Rows[0]["GFSI_Q10_5"].ToString());
            //chkScore_GFSI_Q10.SelectedValue = dt.Rows[0]["Score_GFSI_Q10"].ToString().Trim();

            switch (dt.Rows[0]["Score_GFSI_Q10"].ToString().Trim())
            {
                case "1":
                    {
                        chkScore_GFSI_Q10_1.Checked = true;
                        break;
                    }
                case "3":
                    {
                        chkScore_GFSI_Q10_2.Checked = true;
                        break;
                    }
                case "5":
                    {
                        chkScore_GFSI_Q10_3.Checked = true;
                        break;
                    }
                case "7":
                    {
                        chkScore_GFSI_Q10_4.Checked = true;
                        break;
                    }
            }
            chk_SI_Q11_1.Checked = Convert.ToBoolean(dt.Rows[0]["SI_Q11_1"].ToString());
            chk_SI_Q11_2.Checked = Convert.ToBoolean(dt.Rows[0]["SI_Q11_2"].ToString());
            chk_SI_Q11_3.Checked = Convert.ToBoolean(dt.Rows[0]["SI_Q11_3"].ToString());
            chk_SI_Q11_4.Checked = Convert.ToBoolean(dt.Rows[0]["SI_Q11_4"].ToString());
            chk_SI_Q11_5.Checked = Convert.ToBoolean(dt.Rows[0]["SI_Q11_5"].ToString());
            chk_SI_Q11_6.Checked = Convert.ToBoolean(dt.Rows[0]["SI_Q11_6"].ToString());
            chk_SI_Q11_7.Checked = Convert.ToBoolean(dt.Rows[0]["SI_Q11_7"].ToString());
            //chkScore_SI_Q11.SelectedValue = dt.Rows[0]["Score_SI_Q11"].ToString().Trim();

            switch (dt.Rows[0]["Score_SI_Q11"].ToString().Trim())
            {
                case "1":
                    {
                        chkScore_SI_Q11_1.Checked = true;
                        break;
                    }
                case "3":
                    {
                        chkScore_SI_Q11_2.Checked = true;
                        break;
                    }
                case "5":
                    {
                        chkScore_SI_Q11_3.Checked = true;
                        break;
                    }
                case "7":
                    {
                        chkScore_SI_Q11_4.Checked = true;
                        break;
                    }
            }
            chk_PS_Q12_1.Checked = Convert.ToBoolean(dt.Rows[0]["PS_Q12_1"].ToString());
            chk_PS_Q12_2.Checked = Convert.ToBoolean(dt.Rows[0]["PS_Q12_2"].ToString());
            chk_PS_Q12_3.Checked = Convert.ToBoolean(dt.Rows[0]["PS_Q12_3"].ToString());
            chk_PS_Q12_4.Checked = Convert.ToBoolean(dt.Rows[0]["PS_Q12_4"].ToString());
            chk_PS_Q12_5.Checked = Convert.ToBoolean(dt.Rows[0]["PS_Q12_5"].ToString());
            //chkScore_PS_Q12.SelectedValue = dt.Rows[0]["Score_PS_Q12"].ToString().Trim();

            switch (dt.Rows[0]["Score_PS_Q12"].ToString().Trim())
            {
                case "1":
                    {
                        chkScore_PS_Q12_1.Checked = true;
                        break;
                    }
                case "3":
                    {
                        chkScore_PS_Q12_2.Checked = true;
                        break;
                    }
                case "5":
                    {
                        chkScore_PS_Q12_3.Checked = true;
                        break;
                    }
                case "7":
                    {
                        chkScore_PS_Q12_4.Checked = true;
                        break;
                    }
            }

            chk_POFEP_Q13_1.Checked = Convert.ToBoolean(dt.Rows[0]["POFEP_Q13_1"].ToString());
            chk_POFEP_Q13_2.Checked = Convert.ToBoolean(dt.Rows[0]["POFEP_Q13_2"].ToString());
            chk_POFEP_Q13_3.Checked = Convert.ToBoolean(dt.Rows[0]["POFEP_Q13_3"].ToString());
            chk_POFEP_Q13_4.Checked = Convert.ToBoolean(dt.Rows[0]["POFEP_Q13_4"].ToString());
            chk_POFEP_Q13_5.Checked = Convert.ToBoolean(dt.Rows[0]["POFEP_Q13_5"].ToString());
            //chkScore_POFEP_Q13.SelectedValue = dt.Rows[0]["Score_POFEP_Q13"].ToString().Trim();
            switch (dt.Rows[0]["Score_POFEP_Q13"].ToString().Trim())
            {
                case "1":
                    {
                        chkScore_POFEP_Q13_1.Checked = true;
                        break;
                    }
                case "3":
                    {
                        chkScore_POFEP_Q13_2.Checked = true;
                        break;
                    }
                case "5":
                    {
                        chkScore_POFEP_Q13_3.Checked = true;
                        break;
                    }
                case "7":
                    {
                        chkScore_POFEP_Q13_4.Checked = true;
                        break;
                    }
            }
            chk_FOV_Q14_1.Checked = Convert.ToBoolean(dt.Rows[0]["FOV_Q14_1"].ToString());
            //chk_FOV_Q14_2.Checked = Convert.ToBoolean(dt.Rows[0]["FOV_Q14_2"].ToString());
            chk_FOV_Q14_3.Checked = Convert.ToBoolean(dt.Rows[0]["FOV_Q14_3"].ToString());
            chk_FOV_Q14_4.Checked = Convert.ToBoolean(dt.Rows[0]["FOV_Q14_4"].ToString());
            chk_FOV_Q14_5.Checked = Convert.ToBoolean(dt.Rows[0]["FOV_Q14_5"].ToString());
            chk_FOV_Q14_6.Checked = Convert.ToBoolean(dt.Rows[0]["FOV_Q14_6"].ToString());
            //chkScore_FOV_Q14.SelectedValue = dt.Rows[0]["Score_FOV_Q14"].ToString().Trim();

            switch (dt.Rows[0]["Score_FOV_Q14"].ToString().Trim())
            {
                case "1":
                    {
                        chkScore_FOV_Q14_1.Checked = true;
                        break;
                    }
                case "3":
                    {
                        chkScore_FOV_Q14_2.Checked = true;
                        break;
                    }
                case "5":
                    {
                        chkScore_FOV_Q14_3.Checked = true;
                        break;
                    }
                case "7":
                    {
                        chkScore_FOV_Q14_4.Checked = true;
                        break;
                    }
            }

            chk_POIVC_Q15_1.Checked = Convert.ToBoolean(dt.Rows[0]["POIVC_Q15_1"].ToString());
            chk_POIVC_Q15_2.Checked = Convert.ToBoolean(dt.Rows[0]["POIVC_Q15_2"].ToString());
            chk_POIVC_Q15_3.Checked = Convert.ToBoolean(dt.Rows[0]["POIVC_Q15_3"].ToString());
            chk_POIVC_Q15_4.Checked = Convert.ToBoolean(dt.Rows[0]["POIVC_Q15_4"].ToString());
            chk_POIVC_Q15_5.Checked = Convert.ToBoolean(dt.Rows[0]["POIVC_Q15_5"].ToString());
            chk_POIVC_Q15_6.Checked = Convert.ToBoolean(dt.Rows[0]["POIVC_Q15_6"].ToString());

            //chkScore_POIVC_Q15.SelectedValue = dt.Rows[0]["Score_POIVC_Q15"].ToString().Trim();
            switch (dt.Rows[0]["Score_POIVC_Q15"].ToString().Trim())
            {
                case "1":
                    {
                        chkScore_POIVC_Q15_1.Checked = true;
                        break;
                    }
                case "3":
                    {
                        chkScore_POIVC_Q15_2.Checked = true;
                        break;
                    }
                case "5":
                    {
                        chkScore_POIVC_Q15_3.Checked = true;
                        break;
                    }
                case "7":
                    {
                        chkScore_POIVC_Q15_4.Checked = true;
                        break;
                    }
            }
            chk_LOE_Q16_1.Checked = Convert.ToBoolean(dt.Rows[0]["LOE_Q16_1"].ToString());
            chk_LOE_Q16_2.Checked = Convert.ToBoolean(dt.Rows[0]["LOE_Q16_2"].ToString());
            chk_LOE_Q16_3.Checked = Convert.ToBoolean(dt.Rows[0]["LOE_Q16_3"].ToString());
            chk_LOE_Q16_4.Checked = Convert.ToBoolean(dt.Rows[0]["LOE_Q16_4"].ToString());
            chk_LOE_Q16_5.Checked = Convert.ToBoolean(dt.Rows[0]["LOE_Q16_5"].ToString());
            chk_LOE_Q16_6.Checked = Convert.ToBoolean(dt.Rows[0]["LOE_Q16_6"].ToString());
            chk_LOE_Q16_7.Checked = Convert.ToBoolean(dt.Rows[0]["LOE_Q16_7"].ToString());
            chk_LOE_Q16_8.Checked = Convert.ToBoolean(dt.Rows[0]["LOE_Q16_8"].ToString());
            //chkScore_LOE_Q16.SelectedValue = dt.Rows[0]["Score_LOE_Q16"].ToString().Trim();
            switch (dt.Rows[0]["Score_LOE_Q16"].ToString().Trim())
            {
                case "1":
                    {
                        chkScore_LOE_Q16_1.Checked = true;
                        break;
                    }
                case "3":
                    {
                        chkScore_LOE_Q16_2.Checked = true;
                        break;
                    }
                case "5":
                    {
                        chkScore_LOE_Q16_3.Checked = true;
                        break;
                    }
                case "7":
                    {
                        chkScore_LOE_Q16_4.Checked = true;
                        break;
                    }
            }
            chk_GAPFTP_Q17_1.Checked = Convert.ToBoolean(dt.Rows[0]["GAPFTP_Q17_1"].ToString());
            chk_GAPFTP_Q17_2.Checked = Convert.ToBoolean(dt.Rows[0]["GAPFTP_Q17_2"].ToString());
            chk_GAPFTP_Q17_3.Checked = Convert.ToBoolean(dt.Rows[0]["GAPFTP_Q17_3"].ToString());
            chk_GAPFTP_Q17_4.Checked = Convert.ToBoolean(dt.Rows[0]["GAPFTP_Q17_4"].ToString());
            //chkScore_GAPFTP_Q17.SelectedValue = dt.Rows[0]["Score_GAPFTP_Q17"].ToString().Trim();

            switch (dt.Rows[0]["Score_GAPFTP_Q17"].ToString().Trim())
            {
                case "1":
                    {
                        chkScore_GAPFTP_Q17_1.Checked = true;
                        break;
                    }
                case "3":
                    {
                        chkScore_GAPFTP_Q17_2.Checked = true;
                        break;
                    }
                case "5":
                    {
                        chkScore_GAPFTP_Q17_3.Checked = true;
                        break;
                    }
                case "7":
                    {
                        chkScore_GAPFTP_Q17_4.Checked = true;
                        break;
                    }
            }
            chk_NOTP_Q18_1.Checked = Convert.ToBoolean(dt.Rows[0]["NOTP_Q18_1"].ToString());
            chk_NOTP_Q18_2.Checked = Convert.ToBoolean(dt.Rows[0]["NOTP_Q18_2"].ToString());
            chk_NOTP_Q18_3.Checked = Convert.ToBoolean(dt.Rows[0]["NOTP_Q18_3"].ToString());
            chk_NOTP_Q18_4.Checked = Convert.ToBoolean(dt.Rows[0]["NOTP_Q18_4"].ToString());
            chk_NOTP_Q18_5.Checked = Convert.ToBoolean(dt.Rows[0]["NOTP_Q18_5"].ToString());
            chk_NOTP_Q18_6.Checked = Convert.ToBoolean(dt.Rows[0]["NOTP_Q18_6"].ToString());
            chk_NOTP_Q18_7.Checked = Convert.ToBoolean(dt.Rows[0]["NOTP_Q18_7"].ToString());
            chk_NOTP_Q18_8.Checked = Convert.ToBoolean(dt.Rows[0]["NOTP_Q18_8"].ToString());
            chk_NOTP_Q18_9.Checked = Convert.ToBoolean(dt.Rows[0]["NOTP_Q18_9"].ToString());
            //chk_NOTP_Q18_8.Checked = Convert.ToBoolean(dt.Rows[0]["NOTP_Q18_10"].ToString());
            //chk_NOTP_Q18_8.Checked = Convert.ToBoolean(dt.Rows[0]["NOTP_Q18_11"].ToString());
            //chkScore_NOTP_Q18.SelectedValue = dt.Rows[0]["Score_NOTP_Q18"].ToString().Trim();
            switch (dt.Rows[0]["Score_NOTP_Q18"].ToString().Trim())
            {
                case "1":
                    {
                        chkScore_NOTP_Q18_1.Checked = true;
                        break;
                    }
                case "3":
                    {
                        chkScore_NOTP_Q18_2.Checked = true;
                        break;
                    }
                case "5":
                    {
                        chkScore_NOTP_Q18_3.Checked = true;
                        break;
                    }
                case "7":
                    {
                        chkScore_NOTP_Q18_4.Checked = true;
                        break;
                    }
            }
            chk_CASE_Q19_1.Checked = Convert.ToBoolean(dt.Rows[0]["CASE_Q19_1"].ToString());
            chk_CASE_Q19_2.Checked = Convert.ToBoolean(dt.Rows[0]["CASE_Q19_2"].ToString());
            chk_CASE_Q19_3.Checked = Convert.ToBoolean(dt.Rows[0]["CASE_Q19_3"].ToString());
            chk_CASE_Q19_4.Checked = Convert.ToBoolean(dt.Rows[0]["CASE_Q19_4"].ToString());
            chk_CASE_Q19_5.Checked = Convert.ToBoolean(dt.Rows[0]["CASE_Q19_5"].ToString());
            chk_CASE_Q19_6.Checked = Convert.ToBoolean(dt.Rows[0]["CASE_Q19_6"].ToString());
            //chkScore_CASE_Q19.SelectedValue = dt.Rows[0]["Score_CASE_Q19"].ToString().Trim();

            switch (dt.Rows[0]["Score_CASE_Q19"].ToString().Trim())
            {
                case "1":
                    {
                        chkScore_CASE_Q19_1.Checked = true;
                        break;
                    }
                case "3":
                    {
                        chkScore_CASE_Q19_2.Checked = true;
                        break;
                    }
                case "5":
                    {
                        chkScore_CASE_Q19_3.Checked = true;
                        break;
                    }
                case "7":
                    {
                        chkScore_CASE_Q19_4.Checked = true;
                        break;
                    }
            }
            chk_PM_Q20_1.Checked = Convert.ToBoolean(dt.Rows[0]["PM_Q20_1"].ToString());
            chk_PM_Q20_2.Checked = Convert.ToBoolean(dt.Rows[0]["PM_Q20_2"].ToString());
            chk_PM_Q20_3.Checked = Convert.ToBoolean(dt.Rows[0]["PM_Q20_3"].ToString());
            chk_PM_Q20_4.Checked = Convert.ToBoolean(dt.Rows[0]["PM_Q20_4"].ToString());
            chk_PM_Q20_5.Checked = Convert.ToBoolean(dt.Rows[0]["PM_Q20_5"].ToString());
            chk_PM_Q20_6.Checked = Convert.ToBoolean(dt.Rows[0]["PM_Q20_6"].ToString());
            chk_PM_Q20_7.Checked = Convert.ToBoolean(dt.Rows[0]["PM_Q20_7"].ToString());
            chk_PM_Q20_8.Checked = Convert.ToBoolean(dt.Rows[0]["PM_Q20_8"].ToString());
            chk_PM_Q20_9.Checked = Convert.ToBoolean(dt.Rows[0]["PM_Q20_9"].ToString());
            //chkScore_PM_Q20.SelectedValue = dt.Rows[0]["Score_PM_Q20"].ToString().Trim();
            switch (dt.Rows[0]["Score_PM_Q20"].ToString().Trim())
            {
                case "1":
                    {
                        chkScore_PM_Q20_1.Checked = true;
                        break;
                    }
                case "3":
                    {
                        chkScore_PM_Q20_2.Checked = true;
                        break;
                    }
                case "5":
                    {
                        chkScore_PM_Q20_3.Checked = true;
                        break;
                    }
                case "7":
                    {
                        chkScore_PM_Q20_4.Checked = true;
                        break;
                    }
            }
            chk_MOHR_Q21_1.Checked = Convert.ToBoolean(dt.Rows[0]["MOHR_Q21_1"].ToString());
            chk_MOHR_Q21_2.Checked = Convert.ToBoolean(dt.Rows[0]["MOHR_Q21_2"].ToString());
            chk_MOHR_Q21_3.Checked = Convert.ToBoolean(dt.Rows[0]["MOHR_Q21_3"].ToString());
            chk_MOHR_Q21_4.Checked = Convert.ToBoolean(dt.Rows[0]["MOHR_Q21_4"].ToString());
            chk_MOHR_Q21_5.Checked = Convert.ToBoolean(dt.Rows[0]["MOHR_Q21_5"].ToString());
            chk_MOHR_Q21_6.Checked = Convert.ToBoolean(dt.Rows[0]["MOHR_Q21_6"].ToString());
            chk_MOHR_Q21_7.Checked = Convert.ToBoolean(dt.Rows[0]["MOHR_Q21_7"].ToString());
            //chkScore_MOHR_Q21.SelectedValue = dt.Rows[0]["Score_MOHR_Q21"].ToString().Trim();
            switch (dt.Rows[0]["Score_MOHR_Q21"].ToString().Trim())
            {
                case "1":
                    {
                        chkScore_MOHR_Q21_1.Checked = true;
                        break;
                    }
                case "3":
                    {
                        chkScore_MOHR_Q21_2.Checked = true;
                        break;
                    }
                case "5":
                    {
                        chkScore_MOHR_Q21_3.Checked = true;
                        break;
                    }
                case "7":
                    {
                        chkScore_MOHR_Q21_4.Checked = true;
                        break;
                    }
            }
            chk_APMDFN_Q22_1.Checked = Convert.ToBoolean(dt.Rows[0]["APMDFN_Q22_1"].ToString());
            chk_APMDFN_Q22_2.Checked = Convert.ToBoolean(dt.Rows[0]["APMDFN_Q22_2"].ToString());
            chk_APMDFN_Q22_3.Checked = Convert.ToBoolean(dt.Rows[0]["APMDFN_Q22_3"].ToString());
            chk_APMDFN_Q22_4.Checked = Convert.ToBoolean(dt.Rows[0]["APMDFN_Q22_4"].ToString());
            chk_APMDFN_Q22_5.Checked = Convert.ToBoolean(dt.Rows[0]["APMDFN_Q22_5"].ToString());
            chk_APMDFN_Q22_6.Checked = Convert.ToBoolean(dt.Rows[0]["APMDFN_Q22_6"].ToString());
            chk_APMDFN_Q22_7.Checked = Convert.ToBoolean(dt.Rows[0]["APMDFN_Q22_7"].ToString());
            //chkScore_APMDFN_Q22.SelectedValue = dt.Rows[0]["Score_APMDFN_Q22"].ToString().Trim();

            switch (dt.Rows[0]["Score_APMDFN_Q22"].ToString().Trim())
            {
                case "1":
                    {
                        chkScore_APMDFN_Q22_1.Checked = true;
                        break;
                    }
                case "3":
                    {
                        chkScore_APMDFN_Q22_2.Checked = true;
                        break;
                    }
                case "5":
                    {
                        chkScore_APMDFN_Q22_3.Checked = true;
                        break;
                    }
                case "7":
                    {
                        chkScore_APMDFN_Q22_4.Checked = true;
                        break;
                    }
            }
            chk_FEBHV_23_1.Checked = Convert.ToBoolean(dt.Rows[0]["FEBHV_Q23_1"].ToString());
            chk_FEBHV_23_2.Checked = Convert.ToBoolean(dt.Rows[0]["FEBHV_Q23_2"].ToString());
            chk_FEBHV_23_3.Checked = Convert.ToBoolean(dt.Rows[0]["FEBHV_Q23_3"].ToString());
            chk_FEBHV_23_4.Checked = Convert.ToBoolean(dt.Rows[0]["FEBHV_Q23_4"].ToString());
            chk_FEBHV_23_5.Checked = Convert.ToBoolean(dt.Rows[0]["FEBHV_Q23_5"].ToString());
            chk_FEBHV_23_6.Checked = Convert.ToBoolean(dt.Rows[0]["FEBHV_Q23_6"].ToString());
            //chkScore_FEBHV_23.SelectedValue = dt.Rows[0]["Score_FEBHV_Q23"].ToString().Trim();

            switch (dt.Rows[0]["Score_FEBHV_Q23"].ToString().Trim())
            {
                case "1":
                    {
                        chkScore_FEBHV_23_1.Checked = true;
                        break;
                    }
                case "3":
                    {
                        chkScore_FEBHV_23_2.Checked = true;
                        break;
                    }
                case "5":
                    {
                        chkScore_FEBHV_23_3.Checked = true;
                        break;
                    }
                case "7":
                    {
                        chkScore_FEBHV_23_4.Checked = true;
                        break;
                    }
            }
            chk_FIBHVSFV_Q24_1.Checked = Convert.ToBoolean(dt.Rows[0]["FIBHVSFV_Q24_1"].ToString());
            chk_FIBHVSFV_Q24_2.Checked = Convert.ToBoolean(dt.Rows[0]["FIBHVSFV_Q24_2"].ToString());
            chk_FIBHVSFV_Q24_3.Checked = Convert.ToBoolean(dt.Rows[0]["FIBHVSFV_Q24_3"].ToString());
            chk_FIBHVSFV_Q24_4.Checked = Convert.ToBoolean(dt.Rows[0]["FIBHVSFV_Q24_4"].ToString());
            //chkScore_FIBHVSFV_Q24.SelectedValue = dt.Rows[0]["Score_FIBHVSFV_Q24"].ToString().Trim();

            switch (dt.Rows[0]["Score_FIBHVSFV_Q24"].ToString().Trim())
            {
                case "1":
                    {
                        chkScore_FIBHVSFV_Q24_1.Checked = true;
                        break;
                    }
                case "3":
                    {
                        chkScore_FIBHVSFV_Q24_2.Checked = true;
                        break;
                    }
                case "5":
                    {
                        chkScore_FIBHVSFV_Q24_3.Checked = true;
                        break;
                    }
                case "7":
                    {
                        chkScore_FIBHVSFV_Q24_4.Checked = true;
                        break;
                    }
            }
            chk_FRM_Q25_1.Checked = Convert.ToBoolean(dt.Rows[0]["FRM_Q25_1"].ToString());
            chk_FRM_Q25_2.Checked = Convert.ToBoolean(dt.Rows[0]["FRM_Q25_2"].ToString());
            chk_FRM_Q25_3.Checked = Convert.ToBoolean(dt.Rows[0]["FRM_Q25_3"].ToString());
            chk_FRM_Q25_4.Checked = Convert.ToBoolean(dt.Rows[0]["FRM_Q25_4"].ToString());
            chk_FRM_Q25_5.Checked = Convert.ToBoolean(dt.Rows[0]["FRM_Q25_5"].ToString());
            chk_FRM_Q25_6.Checked = Convert.ToBoolean(dt.Rows[0]["FRM_Q25_6"].ToString());
            chk_FRM_Q25_7.Checked = Convert.ToBoolean(dt.Rows[0]["FRM_Q25_7"].ToString());
            chk_FRM_Q25_8.Checked = Convert.ToBoolean(dt.Rows[0]["FRM_Q25_8"].ToString());
            chk_FRM_Q25_9.Checked = Convert.ToBoolean(dt.Rows[0]["FRM_Q25_9"].ToString());
            //chkScore_FRM_Q25.SelectedValue = dt.Rows[0]["Score_FRM_Q25"].ToString().Trim();
            switch (dt.Rows[0]["Score_FRM_Q25"].ToString().Trim())
            {
                case "1":
                    {
                        chkScore_FRM_Q25_1.Checked = true;
                        break;
                    }
                case "3":
                    {
                        chkScore_FRM_Q25_2.Checked = true;
                        break;
                    }
                case "5":
                    {
                        chkScore_FRM_Q25_3.Checked = true;
                        break;
                    }
                case "7":
                    {
                        chkScore_FRM_Q25_4.Checked = true;
                        break;
                    }
            }

            chk_SAI_Q26_1.Checked = Convert.ToBoolean(dt.Rows[0]["SAI_Q26_1"].ToString());
            chk_SAI_Q26_2.Checked = Convert.ToBoolean(dt.Rows[0]["SAI_Q26_2"].ToString());
            chk_SAI_Q26_3.Checked = Convert.ToBoolean(dt.Rows[0]["SAI_Q26_3"].ToString());
            chk_SAI_Q26_4.Checked = Convert.ToBoolean(dt.Rows[0]["SAI_Q26_4"].ToString());
            chk_SAI_Q26_5.Checked = Convert.ToBoolean(dt.Rows[0]["SAI_Q26_5"].ToString());
            //chkScore_SAI_Q26.SelectedValue = dt.Rows[0]["Score_SAI_Q26"].ToString().Trim();
            switch (dt.Rows[0]["Score_SAI_Q26"].ToString().Trim())
            {
                case "1":
                    {
                        chkScore_SAI_Q26_1.Checked = true;
                        break;
                    }
                case "3":
                    {
                        chkScore_SAI_Q26_2.Checked = true;
                        break;
                    }
                case "5":
                    {
                        chkScore_SAI_Q26_3.Checked = true;
                        break;
                    }
                case "7":
                    {
                        chkScore_SAI_Q26_4.Checked = true;
                        break;
                    }
            }
            chk_FREQUENCY_Q27_1.Checked = Convert.ToBoolean(dt.Rows[0]["FREQUENCY_Q27_1"].ToString());
            chk_FREQUENCY_Q27_2.Checked = Convert.ToBoolean(dt.Rows[0]["FREQUENCY_Q27_2"].ToString());
            chk_FREQUENCY_Q27_3.Checked = Convert.ToBoolean(dt.Rows[0]["FREQUENCY_Q27_3"].ToString());
            chk_FREQUENCY_Q27_4.Checked = Convert.ToBoolean(dt.Rows[0]["FREQUENCY_Q27_4"].ToString());
            chk_FREQUENCY_Q27_5.Checked = Convert.ToBoolean(dt.Rows[0]["FREQUENCY_Q27_5"].ToString());
            chk_FREQUENCY_Q27_6.Checked = Convert.ToBoolean(dt.Rows[0]["FREQUENCY_Q27_6"].ToString());
            chk_FREQUENCY_Q27_7.Checked = Convert.ToBoolean(dt.Rows[0]["FREQUENCY_Q27_7"].ToString());
            //chkScore_FREQUENCY_Q27.SelectedValue = dt.Rows[0]["Score_FREQUENCY_Q27"].ToString().Trim();

            switch (dt.Rows[0]["Score_FREQUENCY_Q27"].ToString().Trim())
            {
                case "1":
                    {
                        chkScore_FREQUENCY_Q27_1.Checked = true;
                        break;
                    }
                case "3":
                    {
                        chkScore_FREQUENCY_Q27_2.Checked = true;
                        break;
                    }
                case "5":
                    {
                        chkScore_FREQUENCY_Q27_3.Checked = true;
                        break;
                    }
                case "7":
                    {
                        chkScore_FREQUENCY_Q27_4.Checked = true;
                        break;
                    }
            }
            chk_GPS_Q28_1.Checked = Convert.ToBoolean(dt.Rows[0]["GPS_Q28_1"].ToString());
            chk_GPS_Q28_2.Checked = Convert.ToBoolean(dt.Rows[0]["GPS_Q28_2"].ToString());
            chk_GPS_Q28_3.Checked = Convert.ToBoolean(dt.Rows[0]["GPS_Q28_3"].ToString());
            chk_GPS_Q28_4.Checked = Convert.ToBoolean(dt.Rows[0]["GPS_Q28_4"].ToString());
            //chkScore_GPS_Q28.SelectedValue = dt.Rows[0]["Score_GPS_Q28"].ToString().Trim();

            switch (dt.Rows[0]["Score_GPS_Q28"].ToString().Trim())
            {
                case "1":
                    {
                        chkScore_GPS_Q28_1.Checked = true;
                        break;
                    }
                case "3":
                    {
                        chkScore_GPS_Q28_2.Checked = true;
                        break;
                    }
                case "5":
                    {
                        chkScore_GPS_Q28_3.Checked = true;
                        break;
                    }
                case "7":
                    {
                        chkScore_GPS_Q28_4.Checked = true;
                        break;
                    }
            }
            chk_STSR_Q29_1.Checked = Convert.ToBoolean(dt.Rows[0]["STSR_Q29_1"].ToString());
            chk_STSR_Q29_2.Checked = Convert.ToBoolean(dt.Rows[0]["STSR_Q29_2"].ToString());
            chk_STSR_Q29_3.Checked = Convert.ToBoolean(dt.Rows[0]["STSR_Q29_3"].ToString());
            chk_STSR_Q29_4.Checked = Convert.ToBoolean(dt.Rows[0]["STSR_Q29_4"].ToString());
            //chkScore_STSR_Q29.SelectedValue = dt.Rows[0]["Score_STSR_Q29"].ToString().Trim();

            switch (dt.Rows[0]["Score_STSR_Q29"].ToString().Trim())
            {
                case "1":
                    {
                        chkScore_STSR_Q29_1.Checked = true;
                        break;
                    }
                case "3":
                    {
                        chkScore_STSR_Q29_2.Checked = true;
                        break;
                    }
                case "5":
                    {
                        chkScore_STSR_Q29_3.Checked = true;
                        break;
                    }
                case "7":
                    {
                        chkScore_STSR_Q29_4.Checked = true;
                        break;
                    }
            }
            chk_SO_Q30_1.Checked = Convert.ToBoolean(dt.Rows[0]["SO_Q30_1"].ToString());
            chk_SO_Q30_2.Checked = Convert.ToBoolean(dt.Rows[0]["SO_Q30_2"].ToString());
            chk_SO_Q30_3.Checked = Convert.ToBoolean(dt.Rows[0]["SO_Q30_3"].ToString());
            chk_SO_Q30_4.Checked = Convert.ToBoolean(dt.Rows[0]["SO_Q30_4"].ToString());
            chk_SO_Q30_5.Checked = Convert.ToBoolean(dt.Rows[0]["SO_Q30_5"].ToString());
            chk_SO_Q30_6.Checked = Convert.ToBoolean(dt.Rows[0]["SO_Q30_6"].ToString());
            chk_SO_Q30_7.Checked = Convert.ToBoolean(dt.Rows[0]["SO_Q30_7"].ToString());
            chk_SO_Q30_8.Checked = Convert.ToBoolean(dt.Rows[0]["SO_Q30_8"].ToString());
            //chkScore_SO_Q30.SelectedValue = dt.Rows[0]["Score_SO_Q30"].ToString().Trim();
            switch (dt.Rows[0]["Score_SO_Q30"].ToString().Trim())
            {
                case "1":
                    {
                        chkScore_SO_Q30_1.Checked = true;
                        break;
                    }
                case "3":
                    {
                        chkScore_SO_Q30_2.Checked = true;
                        break;
                    }
                case "5":
                    {
                        chkScore_SO_Q30_3.Checked = true;
                        break;
                    }
                case "7":
                    {
                        chkScore_SO_Q30_4.Checked = true;
                        break;
                    }
            }
            chk_MIIPD_Q31_1.Checked = Convert.ToBoolean(dt.Rows[0]["MIIPD_Q31_1"].ToString());
            chk_MIIPD_Q31_2.Checked = Convert.ToBoolean(dt.Rows[0]["MIIPD_Q31_2"].ToString());
            chk_MIIPD_Q31_3.Checked = Convert.ToBoolean(dt.Rows[0]["MIIPD_Q31_3"].ToString());
            chk_MIIPD_Q31_4.Checked = Convert.ToBoolean(dt.Rows[0]["MIIPD_Q31_4"].ToString());
            chk_MIIPD_Q31_5.Checked = Convert.ToBoolean(dt.Rows[0]["MIIPD_Q31_5"].ToString());
            //chkScore_MIIPD_Q31.SelectedValue = dt.Rows[0]["Score_MIIPD_Q31"].ToString().Trim();
            switch (dt.Rows[0]["Score_MIIPD_Q31"].ToString().Trim())
            {
                case "1":
                    {
                        chkScore_MIIPD_Q31_1.Checked = true;
                        break;
                    }
                case "3":
                    {
                        chkScore_MIIPD_Q31_2.Checked = true;
                        break;
                    }
                case "5":
                    {
                        chkScore_MIIPD_Q31_3.Checked = true;
                        break;
                    }
                case "7":
                    {
                        chkScore_MIIPD_Q31_4.Checked = true;
                        break;
                    }
            }
            chk_CP_Q32_1.Checked = Convert.ToBoolean(dt.Rows[0]["CP_Q32_1"].ToString());
            chk_CP_Q32_2.Checked = Convert.ToBoolean(dt.Rows[0]["CP_Q32_2"].ToString());
            chk_CP_Q32_3.Checked = Convert.ToBoolean(dt.Rows[0]["CP_Q32_3"].ToString());
            chk_CP_Q32_4.Checked = Convert.ToBoolean(dt.Rows[0]["CP_Q32_4"].ToString());
            chk_CP_Q32_5.Checked = Convert.ToBoolean(dt.Rows[0]["CP_Q32_5"].ToString());
            chk_CP_Q32_6.Checked = Convert.ToBoolean(dt.Rows[0]["CP_Q32_6"].ToString());
            chk_CP_Q32_7.Checked = Convert.ToBoolean(dt.Rows[0]["CP_Q32_7"].ToString());
            chk_CP_Q32_8.Checked = Convert.ToBoolean(dt.Rows[0]["CP_Q32_8"].ToString());
            chk_CP_Q32_9.Checked = Convert.ToBoolean(dt.Rows[0]["CP_Q32_9"].ToString());
            chk_CP_Q32_10.Checked = Convert.ToBoolean(dt.Rows[0]["CP_Q32_10"].ToString());
            chk_CP_Q32_11.Checked = Convert.ToBoolean(dt.Rows[0]["CP_Q32_11"].ToString());
            chk_CP_Q32_12.Checked = Convert.ToBoolean(dt.Rows[0]["CP_Q32_12"].ToString());
            txt_CP_Q32_11.Text = dt.Rows[0]["txt_CP_Q32_11"].ToString();
            //chkScore_CP_Q32.SelectedValue = dt.Rows[0]["Score_CP_Q32"].ToString().Trim();
            switch (dt.Rows[0]["Score_CP_Q32"].ToString().Trim())
            {
                case "1":
                    {
                        chkScore_CP_Q32_1.Checked = true;
                        break;
                    }
                case "3":
                    {
                        chkScore_CP_Q32_2.Checked = true;
                        break;
                    }
                case "5":
                    {
                        chkScore_CP_Q32_3.Checked = true;
                        break;
                    }
                case "7":
                    {
                        chkScore_CP_Q32_4.Checked = true;
                        break;
                    }
            }
            chk_RAAR_Q33_1.Checked = Convert.ToBoolean(dt.Rows[0]["RAAR_Q33_1"].ToString());
            chk_RAAR_Q33_2.Checked = Convert.ToBoolean(dt.Rows[0]["RAAR_Q33_2"].ToString());
            chk_RAAR_Q33_3.Checked = Convert.ToBoolean(dt.Rows[0]["RAAR_Q33_3"].ToString());
            chk_RAAR_Q33_4.Checked = Convert.ToBoolean(dt.Rows[0]["RAAR_Q33_4"].ToString());
            chk_RAAR_Q33_5.Checked = Convert.ToBoolean(dt.Rows[0]["RAAR_Q33_5"].ToString());
            chk_RAAR_Q33_6.Checked = Convert.ToBoolean(dt.Rows[0]["RAAR_Q33_6"].ToString());
            chk_RAAR_Q33_7.Checked = Convert.ToBoolean(dt.Rows[0]["RAAR_Q33_7"].ToString());
            //chk_RAAR_Q33_8.Checked = Convert.ToBoolean(dt.Rows[0]["RAAR_Q33_8"].ToString());
            chk_RAAR_Q33_8.Checked = Convert.ToBoolean(dt.Rows[0]["RAAR_Q33_9"].ToString());
            chk_RAAR_Q33_9.Checked = Convert.ToBoolean(dt.Rows[0]["RAAR_Q33_10"].ToString());
            chk_RAAR_Q33_10.Checked = Convert.ToBoolean(dt.Rows[0]["RAAR_Q33_11"].ToString());
            chk_RAAR_Q33_11.Checked = Convert.ToBoolean(dt.Rows[0]["RAAR_Q33_12"].ToString());
            chk_RAAR_Q33_12.Checked = Convert.ToBoolean(dt.Rows[0]["RAAR_Q33_13"].ToString());
            chk_RAAR_Q33_13.Checked = Convert.ToBoolean(dt.Rows[0]["RAAR_Q33_14"].ToString());
            txt_RAAR_Q33_13.Text = dt.Rows[0]["txt_RAAR_Q33_14"].ToString();
            //chkScore_RAAR_Q33.SelectedValue = dt.Rows[0]["Score_RAAR_Q33"].ToString().Trim();
            switch (dt.Rows[0]["Score_RAAR_Q33"].ToString().Trim())
            {
                case "1":
                    {
                        chkScore_RAAR_Q33_1.Checked = true;
                        break;
                    }
                case "3":
                    {
                        chkScore_RAAR_Q33_2.Checked = true;
                        break;
                    }
                case "5":
                    {
                        chkScore_RAAR_Q33_3.Checked = true;
                        break;
                    }
                case "7":
                    {
                        chkScore_RAAR_Q33_4.Checked = true;
                        break;
                    }
            }

            chk_POPP_Q34_1.Checked = Convert.ToBoolean(dt.Rows[0]["POPP_Q34_1"].ToString());
            chk_POPP_Q34_2.Checked = Convert.ToBoolean(dt.Rows[0]["POPP_Q34_2"].ToString());
            chk_POPP_Q34_3.Checked = Convert.ToBoolean(dt.Rows[0]["POPP_Q34_3"].ToString());
            chk_POPP_Q34_4.Checked = Convert.ToBoolean(dt.Rows[0]["POPP_Q34_4"].ToString());
            chk_POPP_Q34_5.Checked = Convert.ToBoolean(dt.Rows[0]["POPP_Q34_5"].ToString());
            chk_POPP_Q34_6.Checked = Convert.ToBoolean(dt.Rows[0]["POPP_Q34_6"].ToString());
            chk_POPP_Q34_7.Checked = Convert.ToBoolean(dt.Rows[0]["POPP_Q34_7"].ToString());
            //chkScore_POPP_Q34.SelectedValue = dt.Rows[0]["Score_POPP_Q34"].ToString().Trim();
            switch (dt.Rows[0]["Score_POPP_Q34"].ToString().Trim())
            {
                case "1":
                    {
                        chkScore_POPP_Q34_1.Checked = true;
                        break;
                    }
                case "3":
                    {
                        chkScore_POPP_Q34_2.Checked = true;
                        break;
                    }
                case "5":
                    {
                        chkScore_POPP_Q34_3.Checked = true;
                        break;
                    }
                case "7":
                    {
                        chkScore_POPP_Q34_4.Checked = true;
                        break;
                    }
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
           
            dsTableAdapters.PDInterviewTableAdapter pdInterview = new dsTableAdapters.PDInterviewTableAdapter();
            //DataTable dt = new DataTable();
            int count = pdInterview.GetData().Rows.Count;
            //int count = dt.Rows.Count;
           //oGetInfo getinfo = new toGetInfo();
           

            //if (getinfo.getStarted() == true)
            //{
                for (int r = 0; r < pdInterview.GetData().Rows.Count; r++)
                {
                    if (hfschd.Value == pdInterview.GetData().Rows[r]["Schd_ID"].ToString())
                    //if (getinfo.getSchdID() == pdInterview.GetData().Rows[r]["Schd_ID"].ToString())
                    {
                        row = pdInterview.GetData().Rows[r];
                        checkrow = true;
                        break;
                        //getinfo.setSchdID(null);                       
                    }
                }
            //}
            if(checkrow == false)
            {
                row = ds.PDInterview.NewRow();
                row["Schd_ID"] = hfschd.Value;
            }            
            
            row["CompletedDate"] = DateTime.Now;
            row["Completed"] = true;
            row["EBPM_Q1_1"]  = chk_EBPM_Q1_1.Checked;
            row["EBPM_Q1_2"]  = chk_EBPM_Q1_2.Checked;
            row["EBPM_Q1_2"] = chk_EBPM_Q1_2.Checked;
            row["EBPM_Q1_3"] = chk_EBPM_Q1_3.Checked;
            row["EBPM_Q1_4"] = chk_EBPM_Q1_4.Checked;
            row["EBPM_Q1_5"] = chk_EBPM_Q1_5.Checked;
            row["EBPM_Q1_6"] = chk_EBPM_Q1_6.Checked;
            row["EBPM_Q1_7"] = chk_EBPM_Q1_7.Checked;
           
            //row["Score_EBPM_Q1"] = chkScore_EBPM_Q1.SelectedValue;
            if (chkScore_EBPM_Q1_1.Checked == true)
            {
                row["Score_EBPM_Q1"] = 1;
            }
            else if (chkScore_EBPM_Q1_2.Checked == true)
            {
                row["Score_EBPM_Q1"] = 3;
            }
            else if (chkScore_EBPM_Q1_3.Checked == true)
            {
                row["Score_EBPM_Q1"] = 5;
            }
            else if (chkScore_EBPM_Q1_4.Checked == true)
            {
                row["Score_EBPM_Q1"] = 7;
            }

            row["PO_Q2_1"] = chk_PO_Q2_1.Checked;
            row["PO_Q2_2"] = chk_PO_Q2_2.Checked;
            row["PO_Q2_3"] = chk_PO_Q2_3.Checked;
            row["PO_Q2_4"] = chk_PO_Q2_4.Checked;
            row["PO_Q2_5"] = chk_PO_Q2_5.Checked;
            row["PO_Q2_6"] = chk_PO_Q2_6.Checked;
            row["PO_Q2_7"] = chk_PO_Q2_7.Checked;
            row["PO_Q2_8"] = chk_PO_Q2_8.Checked;
           // row["Score_PO_Q2"] = chkScore_PO_Q2.SelectedValue; 
            if (chkScore_PO_Q2_1.Checked == true)
            {
                row["Score_PO_Q2"] = 1;
            }
            else if (chkScore_PO_Q2_2.Checked == true)
            {
                row["Score_PO_Q2"] = 3;
            }
            else if (chkScore_PO_Q2_3.Checked == true)
            {
                row["Score_PO_Q2"] = 5;
            }
            else if (chkScore_PO_Q2_4.Checked == true)
            {
                row["Score_PO_Q2"] = 7;
            }

            row["COPRO_Q3_1"] = chk_COPRO_Q3_1.Checked;
            row["COPRO_Q3_2"] = chk_COPRO_Q3_2.Checked;
            row["COPRO_Q3_3"] = chk_COPRO_Q3_3.Checked;
            row["COPRO_Q3_4"] = chk_COPRO_Q3_4.Checked;
            row["COPRO_Q3_5"] = chk_COPRO_Q3_5.Checked;
            row["COPRO_Q3_6"] = chk_COPRO_Q3_6.Checked;
            //row["Score_COPRO_Q3"] = chkScore_COPRO_Q3.SelectedValue;

            if (chkScore_COPRO_Q3_1.Checked == true)
            {
                row["Score_COPRO_Q3"] = 1;
            }
            else if (chkScore_COPRO_Q3_2.Checked == true)
            {
                row["Score_COPRO_Q3"] = 3;
            }
            else if (chkScore_COPRO_Q3_3.Checked == true)
            {
                row["Score_COPRO_Q3"] = 5;
            }
            else if (chkScore_COPRO_Q3_4.Checked == true)
            {
                row["Score_COPRO_Q3"] = 7;
            }

            row["DMS_Q4_1"] = chk_DMS_Q4_1.Checked;
            row["DMS_Q4_2"] = chk_DMS_Q4_2.Checked;
            row["DMS_Q4_3"] = chk_DMS_Q4_3.Checked;
            row["DMS_Q4_4"] = chk_DMS_Q4_4.Checked;
            row["DMS_Q4_5"] = chk_DMS_Q4_5.Checked;
            row["DMS_Q4_6"] = chk_DMS_Q4_6.Checked;
            row["DMS_Q4_7"] = chk_DMS_Q4_7.Checked;
            row["DMS_Q4_8"] = chk_DMS_Q4_8.Checked;
            row["DMS_Q4_9"] = chk_DMS_Q4_9.Checked;
            row["DMS_Q4_10"] = chk_DMS_Q4_10.Checked;
            row["DMS_Q4_11"] = chk_DMS_Q4_11.Checked;
            row["DMS_Q4_12"] = chk_DMS_Q4_12.Checked;
            row["DMS_Q4_13"] = chk_DMS_Q4_13.Checked;
            //row["Score_DMS_Q4"] = chkScore_DMS_Q4.SelectedValue;
            if (chkScore_DMS_Q4_1.Checked == true)
            {
                row["Score_DMS_Q4"] = 1;
            }
            else if (chkScore_DMS_Q4_2.Checked == true)
            {
                row["Score_DMS_Q4"] = 3;
            }
            else if (chkScore_DMS_Q4_3.Checked == true)
            {
                row["Score_DMS_Q4"] = 5;
            }
            else if (chkScore_DMS_Q4_4.Checked == true)
            {
                row["Score_DMS_Q4"] = 7;
            }

            row["UOPD_Q5_1"] = chk_UOPD_Q5_1.Checked;
            row["UOPD_Q5_2"] = chk_UOPD_Q5_2.Checked;
            row["UOPD_Q5_3"] = chk_UOPD_Q5_3.Checked;
            row["UOPD_Q5_4"] = chk_UOPD_Q5_4.Checked;
            row["UOPD_Q5_5"] = chk_UOPD_Q5_5.Checked;
            row["UOPD_Q5_6"] = chk_UOPD_Q5_6.Checked;
            row["UOPD_Q5_7"] = chk_UOPD_Q5_7.Checked;
            row["UOPD_Q5_8"] = chk_UOPD_Q5_8.Checked;
            row["UOPD_Q5_9"] = chk_UOPD_Q5_9.Checked;
            //row["Score_UOPD_Q5"] = chkScore_UOPD_Q5.SelectedValue;
            if (chkScore_UOPD_Q5_1.Checked == true)
            {
                row["Score_UOPD_Q5"] = 1;
            }
            else if (chkScore_UOPD_Q5_2.Checked == true)
            {
                row["Score_UOPD_Q5"] = 3;
            }
            else if (chkScore_UOPD_Q5_3.Checked == true)
            {
                row["Score_UOPD_Q5"] = 5;
            }
            else if (chkScore_UOPD_Q5_4.Checked == true)
            {
                row["Score_UOPD_Q5"] = 7;
            }

            row["FTPM_Q6_1"] = chk_FTPM_Q6_1.Checked;
            row["FTPM_Q6_2"] = chk_FTPM_Q6_2.Checked;
            row["FTPM_Q6_3"] = chk_FTPM_Q6_3.Checked;
            row["FTPM_Q6_4"] = chk_FTPM_Q6_4.Checked;
            row["FTPM_Q6_5"] = chk_FTPM_Q6_5.Checked;
            row["FTPM_Q6_6"] = chk_FTPM_Q6_6.Checked;
            row["FTPM_Q6_7"] = chk_FTPM_Q6_7.Checked;
            //row["Score_FTPM_Q6"] = chkScore_FTPM_Q6.SelectedValue;
            if (chkScore_FTPM_Q6_1.Checked == true)
            {
                row["Score_FTPM_Q6"] = 1;
            }
            else if (chkScore_FTPM_Q6_2.Checked == true)
            {
                row["Score_FTPM_Q6"] = 3;
            }
            else if (chkScore_FTPM_Q6_3.Checked == true)
            {
                row["Score_FTPM_Q6"] = 5;
            }
            else if (chkScore_FTPM_Q6_4.Checked == true)
            {
                row["Score_FTPM_Q6"] = 7;
            }

            row["PPAI_Q7_1"] = chk_PPAI_Q7_1.Checked;
            row["PPAI_Q7_2"] = chk_PPAI_Q7_2.Checked;
            row["PPAI_Q7_3"] = chk_PPAI_Q7_3.Checked;
            row["PPAI_Q7_4"] = chk_PPAI_Q7_4.Checked;
            row["PPAI_Q7_5"] = chk_PPAI_Q7_5.Checked;
            row["PPAI_Q7_6"] = chk_PPAI_Q7_6.Checked;
            row["PPAI_Q7_7"] = chk_PPAI_Q7_7.Checked;
            row["PPAI_Q7_8"] = chk_PPAI_Q7_8.Checked;
            row["PPAI_Q7_9"] = chk_PPAI_Q7_9.Checked;
            row["PPAI_Q7_10"] = chk_PPAI_Q7_10.Checked;
            row["PPAI_Q7_11"] = chk_PPAI_Q7_11.Checked;
            row["PPAI_Q7_12"] = chk_PPAI_Q7_12.Checked;
            row["PPAI_Q7_13"] = chk_PPAI_Q7_13.Checked;
            row["PPAI_Q7_14"] = chk_PPAI_Q7_14.Checked;
            //row["Score_PPAI_Q7"] = chkScore_PPAI_Q7.SelectedValue;
            if (chkScore_PPAI_Q7_1.Checked == true)
            {
                row["Score_PPAI_Q7"] = 1;
            }
            else if (chkScore_PPAI_Q7_2.Checked == true)
            {
                row["Score_PPAI_Q7"] = 3;
            }
            else if (chkScore_PPAI_Q7_3.Checked == true)
            {
                row["Score_PPAI_Q7"] = 5;
            }
            else if (chkScore_PPAI_Q7_4.Checked == true)
            {
                row["Score_PPAI_Q7"] = 7;
            }

            row["GFTSP_Q8_1"] = chk_GFTSP_Q8_1.Checked;
            row["GFTSP_Q8_2"] = chk_GFTSP_Q8_2.Checked;
            row["GFTSP_Q8_3"] = chk_GFTSP_Q8_3.Checked;
            row["GFTSP_Q8_4"] = chk_GFTSP_Q8_4.Checked;
            row["GFTSP_Q8_5"] = chk_GFTSP_Q8_5.Checked;
            row["GFTSP_Q8_6"] = chk_GFTSP_Q8_6.Checked;
            row["GFTSP_Q8_7"] = chk_GFTSP_Q8_7.Checked;
            row["GFTSP_Q8_8"] = chk_GFTSP_Q8_8.Checked;
            //row["Score_GFTSP_Q8"] = chkScore_GFTSP_Q8.SelectedValue;
            if (chkScore_GFTSP_Q8_1.Checked == true)
            {
                row["Score_GFTSP_Q8"] = 1;
            }
            else if (chkScore_GFTSP_Q8_2.Checked == true)
            {
                row["Score_GFTSP_Q8"] = 3;
            }
            else if (chkScore_GFTSP_Q8_3.Checked == true)
            {
                row["Score_GFTSP_Q8"] = 5;
            }
            else if (chkScore_GFTSP_Q8_4.Checked == true)
            {
                row["Score_GFTSP_Q8"] = 7;
            }

            row["AIFN_Q9_1"] = chk_AIFN_Q9_1.Checked;
            row["AIFN_Q9_2"] = chk_AIFN_Q9_2.Checked;
            row["AIFN_Q9_3"] = chk_AIFN_Q9_3.Checked;
            row["AIFN_Q9_4"] = chk_AIFN_Q9_4.Checked;
            row["AIFN_Q9_5"] = chk_AIFN_Q9_5.Checked;
            row["AIFN_Q9_6"] = chk_AIFN_Q9_6.Checked;
            row["AIFN_Q9_7"] = chk_AIFN_Q9_7.Checked;
            row["AIFN_Q9_8"] = chk_AIFN_Q9_8.Checked;
            //row["Score_AIFN_Q9"] = chkScore_AIFN_Q9.SelectedValue;
            if (chkScore_AIFN_Q9_1.Checked == true)
            {
                row["Score_AIFN_Q9"] = 1;
            }
            else if (chkScore_AIFN_Q9_2.Checked == true)
            {
                row["Score_AIFN_Q9"] = 3;
            }
            else if (chkScore_AIFN_Q9_3.Checked == true)
            {
                row["Score_AIFN_Q9"] = 5;
            }
            else if (chkScore_AIFN_Q9_4.Checked == true)
            {
                row["Score_AIFN_Q9"] = 7;
            }

            row["GFSI_Q10_1"] = chk_GFSI_Q10_1.Checked;
            row["GFSI_Q10_2"] = chk_GFSI_Q10_2.Checked;
            row["GFSI_Q10_3"] = chk_GFSI_Q10_3.Checked;
            row["GFSI_Q10_4"] = chk_GFSI_Q10_4.Checked;
            row["GFSI_Q10_5"] = chk_GFSI_Q10_5.Checked;
            //row["Score_GFSI_Q10"] = chkScore_GFSI_Q10.SelectedValue;
            if (chkScore_GFSI_Q10_1.Checked == true)
            {
                row["Score_GFSI_Q10"] = 1;
            }
            else if (chkScore_GFSI_Q10_2.Checked == true)
            {
                row["Score_GFSI_Q10"] = 3;
            }
            else if (chkScore_GFSI_Q10_3.Checked == true)
            {
                row["Score_GFSI_Q10"] = 5;
            }
            else if (chkScore_GFSI_Q10_4.Checked == true)
            {
                row["Score_GFSI_Q10"] = 7;
            }

            row["SI_Q11_1"] = chk_SI_Q11_1.Checked;
            row["SI_Q11_2"] = chk_SI_Q11_2.Checked;
            row["SI_Q11_3"] = chk_SI_Q11_3.Checked;
            row["SI_Q11_4"] = chk_SI_Q11_4.Checked;
            row["SI_Q11_5"] = chk_SI_Q11_5.Checked;
            row["SI_Q11_6"] = chk_SI_Q11_6.Checked;
            row["SI_Q11_7"] = chk_SI_Q11_7.Checked;
            //row["Score_SI_Q11"] = chkScore_SI_Q11.SelectedValue;
            if (chkScore_SI_Q11_1.Checked == true)
            {
                row["Score_SI_Q11"] = 1;
            }
            else if (chkScore_SI_Q11_2.Checked == true)
            {
                row["Score_SI_Q11"] = 3;
            }
            else if (chkScore_SI_Q11_3.Checked == true)
            {
                row["Score_SI_Q11"] = 5;
            }
            else if (chkScore_SI_Q11_4.Checked == true)
            {
                row["Score_SI_Q11"] = 7;
            }

            row["PS_Q12_1"] = chk_PS_Q12_1.Checked;
            row["PS_Q12_2"] = chk_PS_Q12_2.Checked;
            row["PS_Q12_3"] = chk_PS_Q12_3.Checked;
            row["PS_Q12_4"] = chk_PS_Q12_4.Checked;
            row["PS_Q12_5"] = chk_PS_Q12_5.Checked;
            //row["Score_PS_Q12"] = chkScore_PS_Q12.SelectedValue;
            if (chkScore_PS_Q12_1.Checked == true)
            {
                row["Score_PS_Q12"] = 1;
            }
            else if (chkScore_PS_Q12_2.Checked == true)
            {
                row["Score_PS_Q12"] = 3;
            }
            else if (chkScore_PS_Q12_3.Checked == true)
            {
                row["Score_PS_Q12"] = 5;
            }
            else if (chkScore_PS_Q12_4.Checked == true)
            {
                row["Score_PS_Q12"] = 7;
            }

            row["POFEP_Q13_1"] = chk_POFEP_Q13_1.Checked;
            row["POFEP_Q13_2"] = chk_POFEP_Q13_2.Checked;
            row["POFEP_Q13_3"] = chk_POFEP_Q13_3.Checked;
            row["POFEP_Q13_4"] = chk_POFEP_Q13_4.Checked;
            row["POFEP_Q13_5"] = chk_POFEP_Q13_5.Checked;
            //row["Score_POFEP_Q13"] = chkScore_POFEP_Q13.SelectedValue;
            if (chkScore_POFEP_Q13_1.Checked == true)
            {
                row["Score_POFEP_Q13"] = 1;
            }
            else if (chkScore_POFEP_Q13_2.Checked == true)
            {
                row["Score_POFEP_Q13"] = 3;
            }
            else if (chkScore_POFEP_Q13_3.Checked == true)
            {
                row["Score_POFEP_Q13"] = 5;
            }
            else if (chkScore_POFEP_Q13_4.Checked == true)
            {
                row["Score_POFEP_Q13"] = 7;
            }

            row["FOV_Q14_1"] = chk_FOV_Q14_1.Checked;
            //row["FOV_Q14_2"] = chk_FOV_Q14_2.Checked;
            row["FOV_Q14_3"] = chk_FOV_Q14_3.Checked;
            row["FOV_Q14_4"] = chk_FOV_Q14_4.Checked;
            row["FOV_Q14_5"] = chk_FOV_Q14_5.Checked;
            row["FOV_Q14_6"] = chk_FOV_Q14_6.Checked;
            //row["Score_FOV_Q14"] = chkScore_FOV_Q14.SelectedValue;
            if (chkScore_FOV_Q14_1.Checked == true)
            {
                row["Score_FOV_Q14"] = 1;
            }
            else if (chkScore_FOV_Q14_2.Checked == true)
            {
                row["Score_FOV_Q14"] = 3;
            }
            else if (chkScore_FOV_Q14_3.Checked == true)
            {
                row["Score_FOV_Q14"] = 5;
            }
            else if (chkScore_FOV_Q14_4.Checked == true)
            {
                row["Score_FOV_Q14"] = 7;
            }

            row["POIVC_Q15_1"] = chk_POIVC_Q15_1.Checked;
            row["POIVC_Q15_2"] = chk_POIVC_Q15_2.Checked;
            row["POIVC_Q15_3"] = chk_POIVC_Q15_3.Checked;
            row["POIVC_Q15_4"] = chk_POIVC_Q15_4.Checked;
            row["POIVC_Q15_5"] = chk_POIVC_Q15_5.Checked;
            row["POIVC_Q15_6"] = chk_POIVC_Q15_6.Checked;
            //row["Score_POIVC_Q15"] = chkScore_POIVC_Q15.SelectedValue;
            if (chkScore_POIVC_Q15_1.Checked == true)
            {
                row["Score_POIVC_Q15"] = 1;
            }
            else if (chkScore_POIVC_Q15_2.Checked == true)
            {
                row["Score_POIVC_Q15"] = 3;
            }
            else if (chkScore_POIVC_Q15_3.Checked == true)
            {
                row["Score_POIVC_Q15"] = 5;
            }
            else if (chkScore_POIVC_Q15_4.Checked == true)
            {
                row["Score_POIVC_Q15"] = 7;
            }

            row["LOE_Q16_1"] = chk_LOE_Q16_1.Checked;
            row["LOE_Q16_2"] = chk_LOE_Q16_2.Checked;
            row["LOE_Q16_3"] = chk_LOE_Q16_3.Checked;
            row["LOE_Q16_4"] = chk_LOE_Q16_4.Checked;
            row["LOE_Q16_5"] = chk_LOE_Q16_5.Checked;
            row["LOE_Q16_6"] = chk_LOE_Q16_6.Checked;
            row["LOE_Q16_7"] = chk_LOE_Q16_7.Checked;
            row["LOE_Q16_8"] = chk_LOE_Q16_8.Checked;
            //row["Score_LOE_Q16"] = chkScore_LOE_Q16.SelectedValue;
            if (chkScore_LOE_Q16_1.Checked == true)
            {
                row["Score_LOE_Q16"] = 1;
            }
            else if (chkScore_LOE_Q16_2.Checked == true)
            {
                row["Score_LOE_Q16"] = 3;
            }
            else if (chkScore_LOE_Q16_3.Checked == true)
            {
                row["Score_LOE_Q16"] = 5;
            }
            else if (chkScore_LOE_Q16_4.Checked == true)
            {
                row["Score_LOE_Q16"] = 7;
            }

            row["GAPFTP_Q17_1"] = chk_GAPFTP_Q17_1.Checked;
            row["GAPFTP_Q17_2"] = chk_GAPFTP_Q17_2.Checked;
            row["GAPFTP_Q17_3"] = chk_GAPFTP_Q17_3.Checked;
            row["GAPFTP_Q17_4"] = chk_GAPFTP_Q17_4.Checked;
            //row["Score_GAPFTP_Q17"] = chkScore_GAPFTP_Q17.SelectedValue;
            if (chkScore_GAPFTP_Q17_1.Checked == true)
            {
                row["Score_GAPFTP_Q17"] = 1;
            }
            else if (chkScore_GAPFTP_Q17_2.Checked == true)
            {
                row["Score_GAPFTP_Q17"] = 3;
            }
            else if (chkScore_GAPFTP_Q17_3.Checked == true)
            {
                row["Score_GAPFTP_Q17"] = 5;
            }
            else if (chkScore_GAPFTP_Q17_4.Checked == true)
            {
                row["Score_GAPFTP_Q17"] = 7;
            }

            row["NOTP_Q18_1"] = chk_NOTP_Q18_1.Checked;
            row["NOTP_Q18_2"] = chk_NOTP_Q18_2.Checked;
            row["NOTP_Q18_3"] = chk_NOTP_Q18_3.Checked;
            row["NOTP_Q18_4"] = chk_NOTP_Q18_4.Checked;
            row["NOTP_Q18_5"] = chk_NOTP_Q18_5.Checked;
            row["NOTP_Q18_6"] = chk_NOTP_Q18_6.Checked;
            row["NOTP_Q18_7"] = chk_NOTP_Q18_7.Checked;
            row["NOTP_Q18_8"] = chk_NOTP_Q18_8.Checked;
            row["NOTP_Q18_9"] = chk_NOTP_Q18_9.Checked;
            //row["NOTP_Q18_10"] = chk_NOTP_Q18_10.Checked;
            //row["NOTP_Q18_11"] = chk_NOTP_Q18_11.Checked;
            //row["Score_NOTP_Q18"] = chkScore_NOTP_Q18.SelectedValue;
            if (chkScore_NOTP_Q18_1.Checked == true)
            {
                row["Score_NOTP_Q18"] = 1;
            }
            else if (chkScore_NOTP_Q18_2.Checked == true)
            {
                row["Score_NOTP_Q18"] = 3;
            }
            else if (chkScore_NOTP_Q18_3.Checked == true)
            {
                row["Score_NOTP_Q18"] = 5;
            }
            else if (chkScore_NOTP_Q18_4.Checked == true)
            {
                row["Score_NOTP_Q18"] = 7;
            }

            row["CASE_Q19_1"] = chk_CASE_Q19_1.Checked;
            row["CASE_Q19_2"] = chk_CASE_Q19_2.Checked;
            row["CASE_Q19_3"] = chk_CASE_Q19_3.Checked;
            row["CASE_Q19_4"] = chk_CASE_Q19_4.Checked;
            row["CASE_Q19_5"] = chk_CASE_Q19_5.Checked;
            row["CASE_Q19_6"] = chk_CASE_Q19_6.Checked;
            //row["Score_CASE_Q19"] = chkScore_CASE_Q19.SelectedValue;
            if (chkScore_CASE_Q19_1.Checked == true)
            {
                row["Score_CASE_Q19"] = 1;
            }
            else if (chkScore_CASE_Q19_2.Checked == true)
            {
                row["Score_CASE_Q19"] = 3;
            }
            else if (chkScore_CASE_Q19_3.Checked == true)
            {
                row["Score_CASE_Q19"] = 5;
            }
            else if (chkScore_CASE_Q19_4.Checked == true)
            {
                row["Score_CASE_Q19"] = 7;
            }
            row["PM_Q20_1"] = chk_PM_Q20_1.Checked;
            row["PM_Q20_2"] = chk_PM_Q20_2.Checked;
            row["PM_Q20_3"] = chk_PM_Q20_3.Checked;
            row["PM_Q20_4"] = chk_PM_Q20_4.Checked;
            row["PM_Q20_5"] = chk_PM_Q20_5.Checked;
            row["PM_Q20_6"] = chk_PM_Q20_6.Checked;
            row["PM_Q20_7"] = chk_PM_Q20_7.Checked;
            row["PM_Q20_8"] = chk_PM_Q20_8.Checked;
            row["PM_Q20_9"] = chk_PM_Q20_9.Checked;
            //row["Score_PM_Q20"] = chkScore_PM_Q20.SelectedValue;
            if (chkScore_PM_Q20_1.Checked == true)
            {
                row["Score_PM_Q20"] = 1;
            }
            else if (chkScore_PM_Q20_2.Checked == true)
            {
                row["Score_PM_Q20"] = 3;
            }
            else if (chkScore_PM_Q20_3.Checked == true)
            {
                row["Score_PM_Q20"] = 5;
            }
            else if (chkScore_PM_Q20_4.Checked == true)
            {
                row["Score_PM_Q20"] = 7;
            }

            row["MOHR_Q21_1"] = chk_MOHR_Q21_1.Checked;
            row["MOHR_Q21_2"] = chk_MOHR_Q21_2.Checked;
            row["MOHR_Q21_3"] = chk_MOHR_Q21_3.Checked;
            row["MOHR_Q21_4"] = chk_MOHR_Q21_4.Checked;
            row["MOHR_Q21_5"] = chk_MOHR_Q21_5.Checked;
            row["MOHR_Q21_6"] = chk_MOHR_Q21_6.Checked;
            row["MOHR_Q21_7"] = chk_MOHR_Q21_7.Checked;
            //row["Score_MOHR_Q21"] = chkScore_MOHR_Q21.SelectedValue;
            if (chkScore_MOHR_Q21_1.Checked == true)
            {
                row["Score_MOHR_Q21"] = 1;
            }
            else if (chkScore_MOHR_Q21_2.Checked == true)
            {
                row["Score_MOHR_Q21"] = 3;
            }
            else if (chkScore_MOHR_Q21_3.Checked == true)
            {
                row["Score_MOHR_Q21"] = 5;
            }
            else if (chkScore_MOHR_Q21_4.Checked == true)
            {
                row["Score_MOHR_Q21"] = 7;
            }

            row["APMDFN_Q22_1"] = chk_APMDFN_Q22_1.Checked;
            row["APMDFN_Q22_2"] = chk_APMDFN_Q22_2.Checked;
            row["APMDFN_Q22_3"] = chk_APMDFN_Q22_3.Checked;
            row["APMDFN_Q22_4"] = chk_APMDFN_Q22_4.Checked;
            row["APMDFN_Q22_5"] = chk_APMDFN_Q22_5.Checked;
            row["APMDFN_Q22_6"] = chk_APMDFN_Q22_6.Checked;
            row["APMDFN_Q22_7"] = chk_APMDFN_Q22_7.Checked;
            //row["Score_APMDFN_Q22"] = chkScore_APMDFN_Q22.SelectedValue;
            if (chkScore_APMDFN_Q22_1.Checked == true)
            {
                row["Score_APMDFN_Q22"] = 1;
            }
            else if (chkScore_APMDFN_Q22_2.Checked == true)
            {
                row["Score_APMDFN_Q22"] = 3;
            }
            else if (chkScore_APMDFN_Q22_3.Checked == true)
            {
                row["Score_APMDFN_Q22"] = 5;
            }
            else if (chkScore_APMDFN_Q22_4.Checked == true)
            {
                row["Score_APMDFN_Q22"] = 7;
            }

            row["FEBHV_Q23_1"] = chk_FEBHV_23_1.Checked;
            row["FEBHV_Q23_2"] = chk_FEBHV_23_2.Checked;
            row["FEBHV_Q23_3"] = chk_FEBHV_23_3.Checked;
            row["FEBHV_Q23_4"] = chk_FEBHV_23_4.Checked;
            row["FEBHV_Q23_5"] = chk_FEBHV_23_5.Checked;
            row["FEBHV_Q23_6"] = chk_FEBHV_23_6.Checked;
            //row["Score_FEBHV_Q23"] = chkScore_FEBHV_23.SelectedValue;
            if (chkScore_FEBHV_23_1.Checked == true)
            {
                row["Score_FEBHV_Q23"] = 1;
            }
            else if (chkScore_FEBHV_23_2.Checked == true)
            {
                row["Score_FEBHV_Q23"] = 3;
            }
            else if (chkScore_FEBHV_23_3.Checked == true)
            {
                row["Score_FEBHV_Q23"] = 5;
            }
            else if (chkScore_FEBHV_23_4.Checked == true)
            {
                row["Score_FEBHV_Q23"] = 7;
            }

            row["FIBHVSFV_Q24_1"] = chk_FIBHVSFV_Q24_1.Checked;
            row["FIBHVSFV_Q24_2"] = chk_FIBHVSFV_Q24_2.Checked;
            row["FIBHVSFV_Q24_3"] = chk_FIBHVSFV_Q24_3.Checked;
            row["FIBHVSFV_Q24_4"] = chk_FIBHVSFV_Q24_4.Checked;
            //row["Score_FIBHVSFV_Q24"] = chkScore_FIBHVSFV_Q24.SelectedValue;
            if (chkScore_FIBHVSFV_Q24_1.Checked == true)
            {
                row["Score_FIBHVSFV_Q24"] = 1;
            }
            else if (chkScore_FIBHVSFV_Q24_2.Checked == true)
            {
                row["Score_FIBHVSFV_Q24"] = 3;
            }
            else if (chkScore_FIBHVSFV_Q24_3.Checked == true)
            {
                row["Score_FIBHVSFV_Q24"] = 5;
            }
            else if (chkScore_FIBHVSFV_Q24_4.Checked == true)
            {
                row["Score_FIBHVSFV_Q24"] = 7;
            }

            row["FRM_Q25_1"] = chk_FRM_Q25_1.Checked;
            row["FRM_Q25_2"] = chk_FRM_Q25_2.Checked;
            row["FRM_Q25_3"] = chk_FRM_Q25_3.Checked;
            row["FRM_Q25_4"] = chk_FRM_Q25_4.Checked;
            row["FRM_Q25_5"] = chk_FRM_Q25_5.Checked;
            row["FRM_Q25_6"] = chk_FRM_Q25_6.Checked;
            row["FRM_Q25_7"] = chk_FRM_Q25_7.Checked;
            row["FRM_Q25_8"] = chk_FRM_Q25_8.Checked;
            row["FRM_Q25_9"] = chk_FRM_Q25_9.Checked;
            //row["Score_FRM_Q25"] = chkScore_FRM_Q25.SelectedValue;
            if (chkScore_FRM_Q25_1.Checked == true)
            {
                row["Score_FRM_Q25"] = 1;
            }
            else if (chkScore_FRM_Q25_2.Checked == true)
            {
                row["Score_FRM_Q25"] = 3;
            }
            else if (chkScore_FRM_Q25_3.Checked == true)
            {
                row["Score_FRM_Q25"] = 5;
            }
            else if (chkScore_FRM_Q25_4.Checked == true)
            {
                row["Score_FRM_Q25"] = 7;
            }
            row["SAI_Q26_1"] = chk_SAI_Q26_1.Checked;
            row["SAI_Q26_2"] = chk_SAI_Q26_2.Checked;
            row["SAI_Q26_3"] = chk_SAI_Q26_3.Checked;
            row["SAI_Q26_4"] = chk_SAI_Q26_4.Checked;
            row["SAI_Q26_5"] = chk_SAI_Q26_5.Checked;
            //row["Score_SAI_Q26"] = chkScore_SAI_Q26.SelectedValue;
            if (chkScore_SAI_Q26_1.Checked == true)
            {
                row["Score_SAI_Q26"] = 1;
            }
            else if (chkScore_SAI_Q26_2.Checked == true)
            {
                row["Score_SAI_Q26"] = 3;
            }
            else if (chkScore_SAI_Q26_3.Checked == true)
            {
                row["Score_SAI_Q26"] = 5;
            }
            else if (chkScore_SAI_Q26_4.Checked == true)
            {
                row["Score_SAI_Q26"] = 7;
            }
            row["FREQUENCY_Q27_1"] = chk_FREQUENCY_Q27_1.Checked;
            row["FREQUENCY_Q27_2"] = chk_FREQUENCY_Q27_2.Checked;
            row["FREQUENCY_Q27_3"] = chk_FREQUENCY_Q27_3.Checked;
            row["FREQUENCY_Q27_4"] = chk_FREQUENCY_Q27_4.Checked;
            row["FREQUENCY_Q27_5"] = chk_FREQUENCY_Q27_5.Checked;
            row["FREQUENCY_Q27_6"] = chk_FREQUENCY_Q27_6.Checked;
            row["FREQUENCY_Q27_7"] = chk_FREQUENCY_Q27_7.Checked;
            //row["Score_FREQUENCY_Q27"] = chkScore_FREQUENCY_Q27.SelectedValue;
            if (chkScore_FREQUENCY_Q27_1.Checked == true)
            {
                row["Score_FREQUENCY_Q27"] = 1;
            }
            else if (chkScore_FREQUENCY_Q27_2.Checked == true)
            {
                row["Score_FREQUENCY_Q27"] = 3;
            }
            else if (chkScore_FREQUENCY_Q27_3.Checked == true)
            {
                row["Score_FREQUENCY_Q27"] = 5;
            }
            else if (chkScore_FREQUENCY_Q27_4.Checked == true)
            {
                row["Score_FREQUENCY_Q27"] = 7;
            }

            row["GPS_Q28_1"] = chk_GPS_Q28_1.Checked;
            row["GPS_Q28_2"] = chk_GPS_Q28_2.Checked;
            row["GPS_Q28_3"] = chk_GPS_Q28_3.Checked;
            row["GPS_Q28_4"] = chk_GPS_Q28_4.Checked;
            //row["Score_GPS_Q28"] = chkScore_GPS_Q28.SelectedValue;
            if (chkScore_GPS_Q28_1.Checked == true)
            {
                row["Score_GPS_Q28"] = 1;
            }
            else if (chkScore_GPS_Q28_2.Checked == true)
            {
                row["Score_GPS_Q28"] = 3;
            }
            else if (chkScore_GPS_Q28_3.Checked == true)
            {
                row["Score_GPS_Q28"] = 5;
            }
            else if (chkScore_GPS_Q28_4.Checked == true)
            {
                row["Score_GPS_Q28"] = 7;
            }

            row["STSR_Q29_1"] = chk_STSR_Q29_1.Checked;
            row["STSR_Q29_2"] = chk_STSR_Q29_2.Checked;
            row["STSR_Q29_3"] = chk_STSR_Q29_3.Checked;
            row["STSR_Q29_4"] = chk_STSR_Q29_4.Checked;
            //row["Score_STSR_Q29"] = chkScore_STSR_Q29.SelectedValue;
            if (chkScore_STSR_Q29_1.Checked == true)
            {
                row["Score_STSR_Q29"] = 1;
            }
            else if (chkScore_STSR_Q29_2.Checked == true)
            {
                row["Score_STSR_Q29"] = 3;
            }
            else if (chkScore_STSR_Q29_3.Checked == true)
            {
                row["Score_STSR_Q29"] = 5;
            }
            else if (chkScore_STSR_Q29_4.Checked == true)
            {
                row["Score_STSR_Q29"] = 7;
            }
            row["SO_Q30_1"] = chk_SO_Q30_1.Checked;
            row["SO_Q30_2"] = chk_SO_Q30_2.Checked;
            row["SO_Q30_3"] = chk_SO_Q30_3.Checked;
            row["SO_Q30_4"] = chk_SO_Q30_4.Checked;
            row["SO_Q30_5"] = chk_SO_Q30_5.Checked;
            row["SO_Q30_6"] = chk_SO_Q30_6.Checked;
            row["SO_Q30_7"] = chk_SO_Q30_7.Checked;
            row["SO_Q30_8"] = chk_SO_Q30_8.Checked;
            //row["Score_SO_Q30"] = chkScore_SO_Q30.SelectedValue;
            if (chkScore_SO_Q30_1.Checked == true)
            {
                row["Score_SO_Q30"] = 1;
            }
            else if (chkScore_SO_Q30_2.Checked == true)
            {
                row["Score_SO_Q30"] = 3;
            }
            else if (chkScore_SO_Q30_3.Checked == true)
            {
                row["Score_SO_Q30"] = 5;
            }
            else if (chkScore_SO_Q30_4.Checked == true)
            {
                row["Score_SO_Q30"] = 7;
            }

            row["MIIPD_Q31_1"] = chk_MIIPD_Q31_1.Checked;
            row["MIIPD_Q31_2"] = chk_MIIPD_Q31_2.Checked;
            row["MIIPD_Q31_3"] = chk_MIIPD_Q31_3.Checked;
            row["MIIPD_Q31_4"] = chk_MIIPD_Q31_4.Checked;
            row["MIIPD_Q31_5"] = chk_MIIPD_Q31_5.Checked;
            //row["Score_MIIPD_Q31"] = chkScore_MIIPD_Q31.SelectedValue;
            if (chkScore_MIIPD_Q31_1.Checked == true)
            {
                row["Score_MIIPD_Q31"] = 1;
            }
            else if (chkScore_MIIPD_Q31_2.Checked == true)
            {
                row["Score_MIIPD_Q31"] = 3;
            }
            else if (chkScore_MIIPD_Q31_3.Checked == true)
            {
                row["Score_MIIPD_Q31"] = 5;
            }
            else if (chkScore_MIIPD_Q31_4.Checked == true)
            {
                row["Score_MIIPD_Q31"] = 7;
            }

            row["CP_Q32_1"] = chk_CP_Q32_1.Checked;
            row["CP_Q32_2"] = chk_CP_Q32_2.Checked;
            row["CP_Q32_3"] = chk_CP_Q32_3.Checked;
            row["CP_Q32_4"] = chk_CP_Q32_4.Checked;
            row["CP_Q32_5"] = chk_CP_Q32_5.Checked;
            row["CP_Q32_6"] = chk_CP_Q32_6.Checked;
            row["CP_Q32_7"] = chk_CP_Q32_7.Checked;
            row["CP_Q32_8"] = chk_CP_Q32_8.Checked;
            row["CP_Q32_9"] = chk_CP_Q32_9.Checked;
            row["CP_Q32_10"] = chk_CP_Q32_10.Checked;
            row["CP_Q32_11"] = chk_CP_Q32_11.Checked;
            row["CP_Q32_12"] = chk_CP_Q32_12.Checked;
            row["txt_CP_Q32_11"] = txt_CP_Q32_11.Text;
            //row["Score_CP_Q32"] = chkScore_CP_Q32.SelectedValue;
            if (chkScore_CP_Q32_1.Checked == true)
            {
                row["Score_CP_Q32"] = 1;
            }
            else if (chkScore_CP_Q32_2.Checked == true)
            {
                row["Score_CP_Q32"] = 3;
            }
            else if (chkScore_CP_Q32_3.Checked == true)
            {
                row["Score_CP_Q32"] = 5;
            }
            else if (chkScore_CP_Q32_4.Checked == true)
            {
                row["Score_CP_Q32"] = 7;
            }

            row["RAAR_Q33_1"] = chk_RAAR_Q33_1.Checked;
            row["RAAR_Q33_2"] = chk_RAAR_Q33_2.Checked;
            row["RAAR_Q33_3"] = chk_RAAR_Q33_3.Checked;
            row["RAAR_Q33_4"] = chk_RAAR_Q33_4.Checked;
            row["RAAR_Q33_5"] = chk_RAAR_Q33_5.Checked;
            row["RAAR_Q33_6"] = chk_RAAR_Q33_6.Checked;
            row["RAAR_Q33_7"] = chk_RAAR_Q33_7.Checked;
            //row["RAAR_Q33_8"] = chk_RAAR_Q33_8.Checked;
            row["RAAR_Q33_9"] = chk_RAAR_Q33_8.Checked;
            row["RAAR_Q33_10"] = chk_RAAR_Q33_9.Checked;
            row["RAAR_Q33_11"] = chk_RAAR_Q33_10.Checked;
            row["RAAR_Q33_12"] = chk_RAAR_Q33_11.Checked;
            row["RAAR_Q33_13"] = chk_RAAR_Q33_12.Checked;
            row["RAAR_Q33_14"] = chk_RAAR_Q33_13.Checked;
            row["txt_RAAR_Q33_14"] = txt_RAAR_Q33_13.Text;
            //row["Score_RAAR_Q33"] = chkScore_RAAR_Q33.SelectedValue;
            if (chkScore_RAAR_Q33_1.Checked == true)
            {
                row["Score_RAAR_Q33"] = 1;
            }
            else if (chkScore_RAAR_Q33_2.Checked == true)
            {
                row["Score_RAAR_Q33"] = 3;
            }
            else if (chkScore_RAAR_Q33_3.Checked == true)
            {
                row["Score_RAAR_Q33"] = 5;
            }
            else if (chkScore_RAAR_Q33_4.Checked == true)
            {
                row["Score_RAAR_Q33"] = 7;
            }

            row["POPP_Q34_1"] = chk_POPP_Q34_1.Checked;
            row["POPP_Q34_2"] = chk_POPP_Q34_2.Checked;
            row["POPP_Q34_3"] = chk_POPP_Q34_3.Checked;
            row["POPP_Q34_4"] = chk_POPP_Q34_4.Checked;
            row["POPP_Q34_5"] = chk_POPP_Q34_5.Checked;
            row["POPP_Q34_6"] = chk_POPP_Q34_6.Checked;
            row["POPP_Q34_7"] = chk_POPP_Q34_7.Checked;
            //row["Score_POPP_Q34"] = chkScore_POPP_Q34.SelectedValue;
            if (chkScore_POPP_Q34_1.Checked == true)
            {
                row["Score_POPP_Q34"] = 1;
            }
            else if (chkScore_POPP_Q34_2.Checked == true)
            {
                row["Score_POPP_Q34"] = 3;
            }
            else if (chkScore_POPP_Q34_3.Checked == true)
            {
                row["Score_POPP_Q34"] = 5;
            }
            else if (chkScore_POPP_Q34_4.Checked == true)
            {
                row["Score_POPP_Q34"] = 7;
            }
             if(checkrow == false)            
            //if (getinfo.getStarted() != true)
            {
                ds.PDInterview.Rows.Add(row);
            }
           
            pdInterview.Update(row);            
            //taTable dt_end = new DataTable();
            //_end = pdInterview.GetData();
            int count_end = pdInterview.GetData().Rows.Count;

            if (count_end >= count)
            {
                Response.Redirect("~/PIQRIInterview/Completed_msg.aspx");
            }
            else
            {
                string strMsg = "An error has occurred. We apologise for any inconvenience this may have caused you. Please try again later.";
                System.Web.HttpContext.Current.Response.Write("<Script Language='JavaScript'>window.alert('" + strMsg + "');window.location.href='default.aspx';</script>");
            }
        }

    }
}