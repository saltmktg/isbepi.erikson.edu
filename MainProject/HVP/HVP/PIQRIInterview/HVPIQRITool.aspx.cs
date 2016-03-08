using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HVP.PIQRIInterview
{
    public partial class HVPIQRITool : System.Web.UI.Page
    {
        ds ds = new ds();
        DataRow row;
        dsTableAdapters.vw_IndividualHomeVisitorInterviewQuestionsTableAdapter hviq = new dsTableAdapters.vw_IndividualHomeVisitorInterviewQuestionsTableAdapter();
        Label lbl = new Label();        
        bool insidecheck;
        bool check;
        Survey.setgetreview getdt = new Survey.setgetreview();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                hfschd.Value = getdt.getSchdID();
                getdt.setSchdID(null);
                hfID.Value = getdt.getID();
                getdt.setID(null);
                if (string.IsNullOrEmpty(hfschd.Value))
                {
                    //ClientScript.RegisterStartupScript(typeof(Page), "closePage", "<script type='text/JavaScript'>window.close();</script>");
                    Response.Redirect("~/UnauthorizedAccess.aspx");
                }
                else
                {
                    BindQuestionQestions();                    
                    DataTable dt = new DataTable();
                    dt = getdt.getQuestions();                    
                    if (dt.Rows.Count > 0)
                    {
                        getData(dt);
                        toGetInfo tocheck = new toGetInfo();
                        tocheck.setStarted(true);
                        getdt.getQuestions().Clear();
                    }
                }
            }
        }
        protected void getData(DataTable dt)
        {

            chkbx_PMQ1_1.Checked = Convert.ToBoolean(dt.Rows[0]["PMQ1_1"].ToString());
            chkbx_PMQ1_2.Checked = Convert.ToBoolean(dt.Rows[0]["PMQ1_2"].ToString());
            chkbx_PMQ1_3.Checked = Convert.ToBoolean(dt.Rows[0]["PMQ1_3"].ToString());
            chkbx_PMQ1_4.Checked = Convert.ToBoolean(dt.Rows[0]["PMQ1_4"].ToString());
            chkbx_PMQ1_4.Checked = Convert.ToBoolean(dt.Rows[0]["PMQ1_4"].ToString());

            switch(dt.Rows[0]["PMQ1_Score"].ToString())
            {
                case "1":
                    {
                        chkbxPMQ1_1.Checked = true;
                        break;
                    }
                case "3":
                    {
                        chkbxPMQ1_2.Checked = true;
                        break;
                    }
                case "5":
                    {
                        chkbxPMQ1_3.Checked = true;
                        break;
                    }
                case "7":
                    {
                        chkbxPMQ1_4.Checked = true;
                        break;
                    }
            }
            chkbx_CDQ2_1.Checked = Convert.ToBoolean(dt.Rows[0]["CDQ2_1"].ToString());
            chkbx_CDQ2_2.Checked = Convert.ToBoolean(dt.Rows[0]["CDQ2_2"].ToString());
            chkbx_CDQ2_3.Checked = Convert.ToBoolean(dt.Rows[0]["CDQ2_3"].ToString());
            txtName_CDQ2.Text = dt.Rows[0]["CDQ2_Name"].ToString();
            chkbx_CDQ2_4.Checked = Convert.ToBoolean(dt.Rows[0]["CDQ2_4"].ToString());
            chkbx_CDQ2_5.Checked = Convert.ToBoolean(dt.Rows[0]["CDQ2_5"].ToString());
            chkbx_CDQ2_6.Checked = Convert.ToBoolean(dt.Rows[0]["CDQ2_6"].ToString());
            chkbx_CDQ2_7.Checked = Convert.ToBoolean(dt.Rows[0]["CDQ2_7"].ToString());            
            chkbx_CDQ2_8.Checked = Convert.ToBoolean(dt.Rows[0]["CDQ2_8"].ToString());
            txt_CDQ2_Activity_1.Text = dt.Rows[0]["CDQ2_Activity_1"].ToString();
            txt_CDQ2_Activity_2.Text = dt.Rows[0]["CDQ2_Activity_2"].ToString();
            switch (dt.Rows[0]["CDQ2_Score"].ToString())
            {
                case "1":
                    {
                        chkbxCDQ2_1.Checked = true;
                        break;
                    }
                case "3":
                    {
                        chkbxCDQ2_2.Checked = true;
                        break;
                    }
                case "5":
                    {
                        chkbxCDQ2_3.Checked = true;
                        break;
                    }
                case "7":
                    {
                        chkbxCDQ2_4.Checked = true;
                        break;
                    }
            }
            chkbxCHWBQ3_1.Checked = Convert.ToBoolean(dt.Rows[0]["CHWBQ3_1"].ToString());
            chkbxCHWBQ3_2.Checked = Convert.ToBoolean(dt.Rows[0]["CHWBQ3_2"].ToString());
            chkbxCHWBQ3_3.Checked = Convert.ToBoolean(dt.Rows[0]["CHWBQ3_3"].ToString());
            chkbxCHWBQ3_4.Checked = Convert.ToBoolean(dt.Rows[0]["CHWBQ3_4"].ToString());
            chkbxCHWBQ3_5.Checked = Convert.ToBoolean(dt.Rows[0]["CHWBQ3_5"].ToString());
            chkbxCHWBQ3_6.Checked = Convert.ToBoolean(dt.Rows[0]["CHWBQ3_6"].ToString());
            chkbxCHWBQ3_7.Checked = Convert.ToBoolean(dt.Rows[0]["CHWBQ3_7"].ToString());
            chkbxCHWBQ3_8.Checked = Convert.ToBoolean(dt.Rows[0]["CHWBQ3_8"].ToString());
            chkbxCHWBQ3_9.Checked = Convert.ToBoolean(dt.Rows[0]["CHWBQ3_9"].ToString());
            chkbxCHWBQ3_10.Checked = Convert.ToBoolean(dt.Rows[0]["CHWBQ3_10"].ToString());
            chkbxCHWBQ3_11.Checked = Convert.ToBoolean(dt.Rows[0]["CHWBQ3_11"].ToString());
            chkbxCHWBQ3_12.Checked = Convert.ToBoolean(dt.Rows[0]["CHWBQ3_12"].ToString());
            txtCHWBQ3_1.Text = dt.Rows[0]["CHWBQ3_EX1"].ToString();
            txtCHWBQ3_2.Text = dt.Rows[0]["CHWBQ3_EX2"].ToString();            
            switch (dt.Rows[0]["CHWBQ3_Score"].ToString())
            {
                case "1":
                    {
                        chkbx_CHWBQ3_1.Checked = true;
                        break;
                    }
                case "3":
                    {
                        chkbx_CHWBQ3_2.Checked = true;
                        break;
                    }
                case "5":
                    {
                        chkbx_CHWBQ3_3.Checked = true;
                        break;
                    }
                case "7":
                    {
                        chkbx_CHWBQ3_4.Checked = true;
                        break;
                    }
            }
            chkbxPCRQ4_1.Checked = Convert.ToBoolean(dt.Rows[0]["PCRQ4_1"].ToString());
            chkbxPCRQ4_2.Checked = Convert.ToBoolean(dt.Rows[0]["PCRQ4_2"].ToString());
            chkbxPCRQ4_3.Checked = Convert.ToBoolean(dt.Rows[0]["PCRQ4_3"].ToString());
            chkbxPCRQ4_4.Checked = Convert.ToBoolean(dt.Rows[0]["PCRQ4_4"].ToString());
            chkbxPCRQ4_5.Checked = Convert.ToBoolean(dt.Rows[0]["PCRQ4_5"].ToString());
            chkbxPCRQ4_6.Checked = Convert.ToBoolean(dt.Rows[0]["PCRQ4_6"].ToString());
            chkbxPCRQ4_7.Checked = Convert.ToBoolean(dt.Rows[0]["PCRQ4_7"].ToString());
            txtPCRQ4.Text = dt.Rows[0]["PCRQ4_Name"].ToString();
            switch (dt.Rows[0]["PCRQ4_Score"].ToString())
            {
                case "1":
                    {
                        chkbx_PCRQ4_1.Checked = true;
                        break;
                    }
                case "3":
                    {
                        chkbx_PCRQ4_2.Checked = true;
                        break;
                    }
                case "5":
                    {
                        chkbx_PCRQ4_3.Checked = true;
                        break;
                    }
                case "7":
                    {
                        chkbx_PCRQ4_4.Checked = true;
                        break;
                    }
            }
            chkbxHRDQ5_1.Checked = Convert.ToBoolean(dt.Rows[0]["HRDQ5_1"].ToString());
            chkbxHRDQ5_2.Checked = Convert.ToBoolean(dt.Rows[0]["HRDQ5_2"].ToString());
            chkbxHRDQ5_3.Checked = Convert.ToBoolean(dt.Rows[0]["HRDQ5_3"].ToString());
            chkbxHRDQ5_4.Checked = Convert.ToBoolean(dt.Rows[0]["HRDQ5_4"].ToString());
            chkbxHRDQ5_5.Checked = Convert.ToBoolean(dt.Rows[0]["HRDQ5_5"].ToString());
            chkbxHRDQ5_6.Checked = Convert.ToBoolean(dt.Rows[0]["HRDQ5_6"].ToString());
            chkbxHRDQ5_7.Checked = Convert.ToBoolean(dt.Rows[0]["HRDQ5_7"].ToString());
            chkbxHRDQ5_8.Checked = Convert.ToBoolean(dt.Rows[0]["HRDQ5_8"].ToString());
            chkbxHRDQ5_9.Checked = Convert.ToBoolean(dt.Rows[0]["HRDQ5_9"].ToString());
            chkbxHRDQ5_10.Checked = Convert.ToBoolean(dt.Rows[0]["HRDQ5_10"].ToString());
            chkbxHRDQ5_11.Checked = Convert.ToBoolean(dt.Rows[0]["HRDQ5_11"].ToString());
            chkbxHRDQ5_12.Checked = Convert.ToBoolean(dt.Rows[0]["HRDQ5_12"].ToString());
            chkbxHRDQ5_13.Checked = Convert.ToBoolean(dt.Rows[0]["HRDQ5_13"].ToString());
            chkbxHRDQ5_14.Checked = Convert.ToBoolean(dt.Rows[0]["HRDQ5_14"].ToString());
            chkbxHRDQ5_15.Checked = Convert.ToBoolean(dt.Rows[0]["HRDQ5_15"].ToString());
            chkbxHRDQ5_16.Checked = Convert.ToBoolean(dt.Rows[0]["HRDQ5_16"].ToString());
            chkbxHRDQ5_17.Checked = Convert.ToBoolean(dt.Rows[0]["HRDQ5_17"].ToString());
            txt_HRDQ5_1.Text = dt.Rows[0]["HRDQ5_Note1"].ToString();
            txt_HRDQ5_2.Text = dt.Rows[0]["HRDQ5_Note2"].ToString();
            txt_HRDQ5_3.Text = dt.Rows[0]["HRDQ5_Note3"].ToString();
            txt_HRDQ5_4.Text = dt.Rows[0]["HRDQ5_Note4"].ToString();
            txt_HRDQ5_5.Text = dt.Rows[0]["HRDQ5_Note5"].ToString();
            switch (dt.Rows[0]["HRDQ5_Score"].ToString())
            {
                case "1":
                    {
                        chkbx_HRDQ5_1.Checked = true;
                        break;
                    }
                case "3":
                    {
                        chkbx_HRDQ5_2.Checked = true;
                        break;
                    }
                case "5":
                    {
                        chkbx_HRDQ5_3.Checked = true;
                        break;
                    }
                case "7":
                    {
                        chkbx_HRDQ5_4.Checked = true;
                        break;
                    }
            }
            chkbxIAQ6_1.Checked = Convert.ToBoolean(dt.Rows[0]["IAQ6_1"].ToString());
            chkbxIAQ6_2.Checked = Convert.ToBoolean(dt.Rows[0]["IAQ6_2"].ToString());
            chkbxIAQ6_3.Checked = Convert.ToBoolean(dt.Rows[0]["IAQ6_2"].ToString());
            switch (dt.Rows[0]["IAQ6_Score"].ToString())
            {
                case "1":
                    {
                        chkbx_IAQ6_1.Checked = true;
                        break;
                    }
                case "3":
                    {
                        chkbx_IAQ6_2.Checked = true;
                        break;
                    }
                case "5":
                    {
                        chkbx_IAQ6_3.Checked = true;
                        break;
                    }
                case "7":
                    {
                        chkbx_IAQ6_4.Checked = true;
                        break;
                    }
            }
            chkbxRCCQ7_1.Checked = Convert.ToBoolean(dt.Rows[0]["RCCQ7_1"].ToString());
            chkbxRCCQ7_3.Checked = Convert.ToBoolean(dt.Rows[0]["RCCQ7_7"].ToString());
            chkbxRCCQ7_EX_1.Checked = Convert.ToBoolean(dt.Rows[0]["RCCQ7_2"].ToString());
            chkbxRCCQ7_EX_2.Checked = Convert.ToBoolean(dt.Rows[0]["RCCQ7_3"].ToString());
            chkbxRCCQ7_EX_3.Checked = Convert.ToBoolean(dt.Rows[0]["RCCQ7_4"].ToString());
            chkbxRCCQ7_EX_4.Checked = Convert.ToBoolean(dt.Rows[0]["RCCQ7_5"].ToString());
            chkbxRCCQ7_EX_5.Checked = Convert.ToBoolean(dt.Rows[0]["RCCQ7_6"].ToString());
            txtRCCQ7.Text = dt.Rows[0]["RCCQ7_Note"].ToString();
            switch (dt.Rows[0]["RCCQ7_Score"].ToString())
            {
                case "1":
                    {
                        chkbx_RCCQ7_1.Checked = true;
                        break;
                    }
                case "3":
                    {
                        chkbx_RCCQ7_2.Checked = true;
                        break;
                    }
                case "5":
                    {
                        chkbx_RCCQ7_3.Checked = true;
                        break;
                    }
                case "7":
                    {
                        chkbx_RCCQ7_4.Checked = true;
                        break;
                    }
            }
            chkbxREFQ8_1.Checked = Convert.ToBoolean(dt.Rows[0]["REFQ8_1"].ToString());
            chkbxREFQ8_2.Checked = Convert.ToBoolean(dt.Rows[0]["REFQ8_2"].ToString());
            chkbxREFQ8_3.Checked = Convert.ToBoolean(dt.Rows[0]["REFQ8_3"].ToString());
            chkbxREFQ8_4.Checked = Convert.ToBoolean(dt.Rows[0]["REFQ8_4"].ToString());
            switch (dt.Rows[0]["REFQ8_Score"].ToString())
            {
                case "1":
                    {
                        chkbx_REFQ8_1.Checked = true;
                        break;
                    }
                case "3":
                    {
                        chkbx_REFQ8_2.Checked = true;
                        break;
                    }
                case "5":
                    {
                        chkbx_REFQ8_3.Checked = true;
                        break;
                    }
                case "7":
                    {
                        chkbx_REFQ8_4.Checked = true;
                        break;
                    }
            }           
            chkbxACRQ9_1.Checked = Convert.ToBoolean(dt.Rows[0]["ACRQ9_1"].ToString());
            chkbxACRQ9_2.Checked = Convert.ToBoolean(dt.Rows[0]["ACRQ9_2"].ToString());
            chkbxACRQ9_3.Checked = Convert.ToBoolean(dt.Rows[0]["ACRQ9_3"].ToString());
            chkbxACRQ9_4.Checked = Convert.ToBoolean(dt.Rows[0]["ACRQ9_4"].ToString());
            chkbxACRQ9_5.Checked = Convert.ToBoolean(dt.Rows[0]["ACRQ9_5"].ToString());
            txtACRQ9.Text = dt.Rows[0]["ACRQ9_EX"].ToString();
            switch (dt.Rows[0]["ACRQ9_Score"].ToString())
            {
                case "1":
                    {
                        chkbx_ACRQ9_1.Checked = true;
                        break;
                    }
                case "3":
                    {
                        chkbx_ACRQ9_2.Checked = true;
                        break;
                    }
                case "5":
                    {
                        chkbx_ACRQ9_3.Checked = true;
                        break;
                    }
                case "7":
                    {
                        chkbx_ACRQ9_4.Checked = true;
                        break;
                    }
            }
            chkbx_vignete_ChildDevelopment_1_1.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_ChildDevelopment_1_1"].ToString());
            chkbx_vignete_ChildDevelopment_1_2.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_ChildDevelopment_1_2"].ToString());
            chkbx_vignete_ChildDevelopment_1_3.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_ChildDevelopment_1_3"].ToString());
            chkbx_vignete_ChildDevelopment_2_1.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_ChildDevelopment_2_1"].ToString());
            chkbx_vignete_ChildDevelopment_2_2.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_ChildDevelopment_2_2"].ToString());
            chkbx_vignete_ChildDevelopment_2_3.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_ChildDevelopment_2_3"].ToString());
            chkbx_vignete_ChildDevelopment_3_1.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_ChildDevelopment_3_1"].ToString());
            chkbx_vignete_ChildDevelopment_3_2.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_ChildDevelopment_3_2"].ToString());
            chkbx_vignete_ChildDevelopment_3_3.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_ChildDevelopment_3_3"].ToString());

            switch (dt.Rows[0]["vignete_ChildDevelopment_Range"].ToString())
            {
                case "1":
                    {
                        lblVg_ChildDevelopment_final.Text = "1 responses = 3";
                        break;
                    }
                case "2":
                    {
                        lblVg_ChildDevelopment_final.Text = "2 responses = 5";
                        break;
                    }
                case "3":
                    {
                        lblVg_ChildDevelopment_final.Text = "3 responses = 7";
                        break;
                    }
                default:
                    {
                        lblVg_ChildDevelopment_final.Text = "0 responses = 1";
                        break;
                    }
            }
            //lblVg_ChildDevelopment_final.Text = dt.Rows[0]["vignete_ChildDevelopment_Range"].ToString();
            chkbx_ChildHealthWellBeing_1_1.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_ChildHealthWellBeing_1_1"].ToString());
            chkbx_ChildHealthWellBeing_1_2.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_ChildHealthWellBeing_1_2"].ToString());
            chkbx_ChildHealthWellBeing_1_2.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_ChildHealthWellBeing_1_3"].ToString());
            chkbx_ChildHealthWellBeing_2_1.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_ChildHealthWellBeing_2_1"].ToString());
            chkbx_ChildHealthWellBeing_2_2.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_ChildHealthWellBeing_2_2"].ToString());
            chkbx_ChildHealthWellBeing_2_3.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_ChildHealthWellBeing_2_3"].ToString());
            chkbx_ChildHealthWellBeing_3_1.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_ChildHealthWellBeing_3_1"].ToString());
            chkbx_ChildHealthWellBeing_3_2.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_ChildHealthWellBeing_3_2"].ToString());
            chkbx_ChildHealthWellBeing_3_3.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_ChildHealthWellBeing_3_3"].ToString());
            chkbx_ChildHealthWellBeing_4_1.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_ChildHealthWellBeing_4_1"].ToString());
            chkbx_ChildHealthWellBeing_4_2.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_ChildHealthWellBeing_4_2"].ToString());
            chkbx_ChildHealthWellBeing_4_3.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_ChildHealthWellBeing_4_3"].ToString());
            chkbx_ChildHealthWellBeing_5_1.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_ChildHealthWellBeing_5_1"].ToString());
            chkbx_ChildHealthWellBeing_5_2.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_ChildHealthWellBeing_5_2"].ToString());
            chkbx_ChildHealthWellBeing_5_3.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_ChildHealthWellBeing_5_3"].ToString());
            switch (dt.Rows[0]["vignete_ChildHealthWellBeing_Range"].ToString())
            {
                case "1":
                    {
                        chkbx_ChildHealthWellBeing_Final.Text = "1 responses = 3";
                        break;
                    }
                case "2":
                    {
                        chkbx_ChildHealthWellBeing_Final.Text = "2 responses = 5";
                        break;
                    }
                case "3":
                    {
                        chkbx_ChildHealthWellBeing_Final.Text = "3 responses = 7";
                        break;
                    }
                default:
                    {
                        chkbx_ChildHealthWellBeing_Final.Text = "0 responses = 1";
                        break;
                    }
            }
            //chkbx_ChildHealthWellBeing_Final.Text = dt.Rows[0]["vignete_ChildHealthWellBeing_Range"].ToString();
            chkbx_FocusParentChildRelationship_1_1.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_FocusParentChildRelationship_1_1"].ToString());
            chkbx_FocusParentChildRelationship_2_2.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_FocusParentChildRelationship_1_2"].ToString());
            chkbx_FocusParentChildRelationship_1_3.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_FocusParentChildRelationship_1_3"].ToString());
            chkbx_FocusParentChildRelationship_1_1.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_FocusParentChildRelationship_2_1"].ToString());
            chkbx_FocusParentChildRelationship_2_2.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_FocusParentChildRelationship_2_2"].ToString());
            chkbx_FocusParentChildRelationship_2_3.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_FocusParentChildRelationship_2_3"].ToString());

            switch (dt.Rows[0]["vignete_FocusParentChildRelationship_Range"].ToString())
            {
                case "1":
                    {
                        chkbx_FocusParentChildRelationship_Final.Text = "1 responses = 3";
                        break;
                    }
                case "2":
                    {
                        chkbx_FocusParentChildRelationship_Final.Text = "2 responses = 5";
                        break;
                    }
                case "3":
                    {
                        chkbx_FocusParentChildRelationship_Final.Text = "3 responses = 7";
                        break;
                    }
                default:
                    {
                        chkbx_FocusParentChildRelationship_Final.Text = "0 responses = 1";
                        break;
                    }
            }
            //chkbx_FocusParentChildRelationship_Final.Text = dt.Rows[0]["vignete_FocusParentChildRelationship_Range"].ToString();


            chkbx_WorkingWithFamilies_1_1.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_WorkingWithFamilies_1_1"].ToString());
            chkbx_WorkingWithFamilies_1_2.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_WorkingWithFamilies_1_2"].ToString());
            chkbx_WorkingWithFamilies_1_3.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_WorkingWithFamilies_1_3"].ToString());
            chkbx_WorkingWithFamilies_2_1.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_WorkingWithFamilies_2_1"].ToString());
            chkbx_WorkingWithFamilies_2_2.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_WorkingWithFamilies_2_2"].ToString());
            chkbx_WorkingWithFamilies_2_3.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_WorkingWithFamilies_2_3"].ToString());

            switch (dt.Rows[0]["vignete_WorkingWithFamilies_Range"].ToString())
            {
                case "1":
                    {
                        chkbx_WorkingWithFamilies_Final.Text = "1 responses = 3";
                        break;
                    }
                case "2":
                    {
                        chkbx_WorkingWithFamilies_Final.Text = "2 responses = 5";
                        break;
                    }
                case "3":
                    {
                        chkbx_WorkingWithFamilies_Final.Text = "3 responses = 7";
                        break;
                    }
                default:
                    {
                        chkbx_WorkingWithFamilies_Final.Text = "0 responses = 1";
                        break;
                    }
            }
            //chkbx_WorkingWithFamilies_Final.Text = dt.Rows[0]["vignete_WorkingWithFamilies_Range"].ToString();

            chkbx_IndividualizingApproach_1_1.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_IndividualizingApproach_1_1"].ToString());
            chkbx_IndividualizingApproach_1_2.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_IndividualizingApproach_1_2"].ToString());
            chkbx_IndividualizingApproach_1_3.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_IndividualizingApproach_1_3"].ToString());

            switch (dt.Rows[0]["vignete_IndividualizingApproach_Range"].ToString())
            {
                case "1":
                    {
                        chkbx_IndividualizingApproach_Final.Text = "1 responses = 3";
                        break;
                    }
                case "2":
                    {
                        chkbx_IndividualizingApproach_Final.Text = "2 responses = 5";
                        break;
                    }
                case "3":
                    {
                        chkbx_IndividualizingApproach_Final.Text = "3 responses = 7";
                        break;
                    }
                default:
                    {
                        chkbx_IndividualizingApproach_Final.Text = "0 responses = 1";
                        break;
                    }
            }
            //chkbx_IndividualizingApproach_Final.Text = dt.Rows[0]["vignete_IndividualizingApproach_Range"].ToString();

            chkbx_RecognizesCulturalConsiderations_1_1.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_RecognizesCulturalConsiderations_1_1"].ToString());
            chkbx_RecognizesCulturalConsiderations_1_2.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_RecognizesCulturalConsiderations_1_2"].ToString());
            chkbx_RecognizesCulturalConsiderations_1_3.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_RecognizesCulturalConsiderations_1_3"].ToString());
            chkbx_RecognizesCulturalConsiderations_2_1.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_RecognizesCulturalConsiderations_2_1"].ToString());
            chkbx_RecognizesCulturalConsiderations_2_2.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_RecognizesCulturalConsiderations_2_2"].ToString());
            chkbx_RecognizesCulturalConsiderations_2_3.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_RecognizesCulturalConsiderations_2_3"].ToString());

            switch (dt.Rows[0]["vignete_RecognizesCulturalConsiderations_Range"].ToString())
            {
                case "1":
                    {
                        chkbx_RecognizesCulturalConsiderations_Final.Text = "1 responses = 5";
                        break;
                    }
                case "2":
                    {
                        chkbx_RecognizesCulturalConsiderations_Final.Text = "2-3 responses = 7";
                        break;
                    }
                case "3":
                    {
                        chkbx_RecognizesCulturalConsiderations_Final.Text = "2-3 responses = 7";
                        break;
                    }
                default:
                    {
                        chkbx_RecognizesCulturalConsiderations_Final.Text = "0 responses = 3";
                        break;
                    }
            }
            //chkbx_RecognizesCulturalConsiderations_Final.Text = dt.Rows[0]["vignete_RecognizesCulturalConsiderations_Range"].ToString();

            chkbx_Referrals_1_1.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_Referrals_1_1"].ToString());
            chkbx_Referrals_1_2.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_Referrals_1_2"].ToString());
            chkbx_Referrals_1_3.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_Referrals_1_3"].ToString());
            chkbx_Referrals_2_1.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_Referrals_2_1"].ToString());
            chkbx_Referrals_2_2.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_Referrals_2_2"].ToString());
            chkbx_Referrals_2_3.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_Referrals_2_3"].ToString());
            chkbx_Referrals_3_1.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_Referrals_3_1"].ToString());
            chkbx_Referrals_2_2.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_Referrals_3_2"].ToString());
            chkbx_Referrals_3_3.Checked = Convert.ToBoolean(dt.Rows[0]["vignete_Referrals_3_3"].ToString());

            switch (dt.Rows[0]["vignete_Referrals_Range"].ToString())
            {
                case "1":
                    {
                        chkbx_Referrals_Final.Text = "1 responses = 3";
                        break;
                    }
                case "2":
                    {
                        chkbx_Referrals_Final.Text = "2 responses = 5";
                        break;
                    }
                case "3":
                    {
                        chkbx_Referrals_Final.Text = "3 responses = 7";
                        break;
                    }
                default:
                    {
                        chkbx_Referrals_Final.Text = "0 responses = 1";
                        break;
                    }
            }
            //chkbx_Referrals_Final.Text = dt.Rows[0]["vignete_Referrals_Range"].ToString();


        }
        protected void BindQuestionQestions()
        {
            DataTable dt = new DataTable();
            dt = hviq.GetData();
            for (int x = 0; x < dt.Rows.Count; x++)
            {                            
                lbl = this.Master.FindControl("ContentPlaceHolder1").FindControl(dt.Rows[x]["Label_ID"].ToString().Trim()) as Label;
                lbl.Text = dt.Rows[x]["Questions"].ToString().Trim();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            setData();
        }

        private void setData()
        {
            dsTableAdapters.HomeVisitorInterviewTableAdapter hvi = new dsTableAdapters.HomeVisitorInterviewTableAdapter();
            DataTable dt = new DataTable();
            dt = hvi.GetData();
            int count = dt.Rows.Count;           
            for (int r = 0; r < hvi.GetData().Rows.Count; r++)
            {
                if (hfID.Value == hvi.GetData().Rows[r]["ID"].ToString())
                {
                    insidecheck = true;
                    row = hvi.GetData().Rows[r];
                    break;
                    //getinfo.setSchdID(null);                       
                }
            }
            if (insidecheck != true)
            {
                row = ds.HomeVisitorInterview.NewRow();
                row["Schd_ID"] = hfschd.Value;
                check = true;
            }
            //DataTable dt = new DataTable();
            //dt = hviq.GetData();           


            row["CompletedDate"] = DateTime.Now;
            row["Completed"] = true;
            row["PMQ1_1"] = chkbx_PMQ1_1.Checked;
            row["PMQ1_2"] = chkbx_PMQ1_2.Checked;
            row["PMQ1_3"] = chkbx_PMQ1_3.Checked;
            row["PMQ1_4"] = chkbx_PMQ1_4.Checked;
            row["CDQ2_1"] = chkbx_CDQ2_1.Checked;
            if (chkbxPMQ1_1.Checked == true)
            {
                row["PMQ1_Score"] = 1;
            }
            else if (chkbxPMQ1_2.Checked == true)
            {
                row["PMQ1_Score"] = 3;
            }
            else if (chkbxPMQ1_3.Checked == true)
            {
                row["PMQ1_Score"] = 5;
            }
            else if (chkbxPMQ1_4.Checked == true)
            {
                row["PMQ1_Score"] = 7;
            }
            row["CDQ2_2"] = chkbx_CDQ2_2.Checked;
            row["CDQ2_3"] = chkbx_CDQ2_3.Checked;
            row["CDQ2_Name"] = txtName_CDQ2.Text;
            row["CDQ2_4"] = chkbx_CDQ2_4.Checked;
            row["CDQ2_5"] = chkbx_CDQ2_5.Checked;
            row["CDQ2_6"] = chkbx_CDQ2_6.Checked;
            row["CDQ2_7"] = chkbx_CDQ2_7.Checked;
            row["CDQ2_8"] = chkbx_CDQ2_8.Checked;
            row["CDQ2_Activity_1"] = txt_CDQ2_Activity_1.Text;
            row["CDQ2_Activity_2"] = txt_CDQ2_Activity_2.Text;

            if (chkbxCDQ2_1.Checked == true)
            {
                row["CDQ2_Score"] = 1;
            }
            else if (chkbxCDQ2_2.Checked == true)
            {
                row["CDQ2_Score"] = 3;
            }
            else if (chkbxCDQ2_3.Checked == true)
            {
                row["CDQ2_Score"] = 5;
            }
            else if (chkbxCDQ2_4.Checked == true)
            {
                row["CDQ2_Score"] = 7;
            }
            //row["CDQ2_Score"] = Convert.ToInt32(hf_CDQ2.Value);


            row["CHWBQ3_1"] = chkbxCHWBQ3_1.Checked;
            row["CHWBQ3_2"] = chkbxCHWBQ3_2.Checked;
            row["CHWBQ3_3"] = chkbxCHWBQ3_3.Checked;
            row["CHWBQ3_4"] = chkbxCHWBQ3_4.Checked;
            row["CHWBQ3_5"] = chkbxCHWBQ3_5.Checked;
            row["CHWBQ3_6"] = chkbxCHWBQ3_6.Checked;
            row["CHWBQ3_7"] = chkbxCHWBQ3_7.Checked;
            row["CHWBQ3_8"] = chkbxCHWBQ3_8.Checked;
            row["CHWBQ3_9"] = chkbxCHWBQ3_9.Checked;
            row["CHWBQ3_10"] = chkbxCHWBQ3_10.Checked;
            row["CHWBQ3_11"] = chkbxCHWBQ3_11.Checked;
            row["CHWBQ3_12"] = chkbxCHWBQ3_12.Checked;
            row["CHWBQ3_EX1"] = txtCHWBQ3_1.Text;
            row["CHWBQ3_EX2"] = txtCHWBQ3_2.Text;

            if (chkbx_CHWBQ3_1.Checked == true)
            {
                row["CHWBQ3_Score"] = 1;
            }
            else if (chkbx_CHWBQ3_2.Checked == true)
            {
                row["CHWBQ3_Score"] = 3;
            }
            else if (chkbx_CHWBQ3_3.Checked == true)
            {
                row["CHWBQ3_Score"] = 5;
            }
            else if (chkbx_CHWBQ3_4.Checked == true)
            {
                row["CHWBQ3_Score"] = 7;
            }
            //row["CHWBQ3_Score"] = Convert.ToInt32(hf_CHWBQ3.Value);
            row["PCRQ4_1"] = chkbxPCRQ4_1.Checked;
            row["PCRQ4_2"] = chkbxPCRQ4_2.Checked;
            row["PCRQ4_3"] = chkbxPCRQ4_3.Checked;
            row["PCRQ4_4"] = chkbxPCRQ4_4.Checked;
            row["PCRQ4_5"] = chkbxPCRQ4_5.Checked;
            row["PCRQ4_6"] = chkbxPCRQ4_6.Checked;
            row["PCRQ4_7"] = chkbxPCRQ4_7.Checked;
            row["PCRQ4_Name"] = txtPCRQ4.Text;

            if (chkbx_PCRQ4_1.Checked == true)
            {
                row["PCRQ4_Score"] = 1;
            }
            else if (chkbx_PCRQ4_2.Checked == true)
            {
                row["PCRQ4_Score"] = 3;
            }
            else if (chkbx_PCRQ4_3.Checked == true)
            {
                row["PCRQ4_Score"] = 5;
            }
            else if (chkbx_PCRQ4_4.Checked == true)
            {
                row["PCRQ4_Score"] = 7;
            }
            //row["PCRQ4_Score"] = Convert.ToInt32(hfPCRQ4.Value);
            row["HRDQ5_1"] = chkbxHRDQ5_1.Checked;
            row["HRDQ5_2"] = chkbxHRDQ5_2.Checked;
            row["HRDQ5_3"] = chkbxHRDQ5_3.Checked;
            row["HRDQ5_4"] = chkbxHRDQ5_4.Checked;
            row["HRDQ5_5"] = chkbxHRDQ5_5.Checked;
            row["HRDQ5_6"] = chkbxHRDQ5_6.Checked;
            row["HRDQ5_7"] = chkbxHRDQ5_7.Checked;
            row["HRDQ5_8"] = chkbxHRDQ5_8.Checked;
            row["HRDQ5_9"] = chkbxHRDQ5_9.Checked;
            row["HRDQ5_10"] = chkbxHRDQ5_10.Checked;
            row["HRDQ5_11"] = chkbxHRDQ5_11.Checked;
            row["HRDQ5_12"] = chkbxHRDQ5_12.Checked;
            row["HRDQ5_13"] = chkbxHRDQ5_13.Checked;
            row["HRDQ5_14"] = chkbxHRDQ5_14.Checked;
            row["HRDQ5_15"] = chkbxHRDQ5_15.Checked;
            row["HRDQ5_16"] = chkbxHRDQ5_16.Checked;
            row["HRDQ5_17"] = chkbxHRDQ5_17.Checked;
            row["HRDQ5_Note1"] = txt_HRDQ5_1.Text;
            row["HRDQ5_Note2"] = txt_HRDQ5_2.Text;
            row["HRDQ5_Note3"] = txt_HRDQ5_3.Text;
            row["HRDQ5_Note4"] = txt_HRDQ5_4.Text;
            row["HRDQ5_Note5"] = txt_HRDQ5_5.Text;


            if (chkbx_HRDQ5_1.Checked == true)
            {
                row["HRDQ5_Score"] = 1;
            }
            else if (chkbx_HRDQ5_2.Checked == true)
            {
                row["HRDQ5_Score"] = 3;
            }
            else if (chkbx_HRDQ5_3.Checked == true)
            {
                row["HRDQ5_Score"] = 5;
            }
            else if (chkbx_HRDQ5_4.Checked == true)
            {
                row["HRDQ5_Score"] = 7;
            }
            // row["HRDQ5_Score"] = Convert.ToInt32(hf_HRDQ5.Value);
            row["IAQ6_1"] = chkbxIAQ6_1.Checked;
            row["IAQ6_2"] = chkbxIAQ6_2.Checked;
            row["IAQ6_3"] = chkbxIAQ6_3.Checked;

            if (chkbx_IAQ6_1.Checked == true)
            {
                row["IAQ6_Score"] = 1;
            }
            else if (chkbx_IAQ6_2.Checked == true)
            {
                row["IAQ6_Score"] = 3;
            }
            else if (chkbx_IAQ6_3.Checked == true)
            {
                row["IAQ6_Score"] = 5;
            }
            else if (chkbx_IAQ6_4.Checked == true)
            {
                row["IAQ6_Score"] = 7;
            }
            // row["IAQ6_Score"] = Convert.ToInt32(hfIAQ6.Value);
            row["RCCQ7_1"] = chkbxRCCQ7_1.Checked;
            row["RCCQ7_7"] = chkbxRCCQ7_3.Checked;
            row["RCCQ7_2"] = chkbxRCCQ7_EX_1.Checked;
            row["RCCQ7_3"] = chkbxRCCQ7_EX_2.Checked;
            row["RCCQ7_4"] = chkbxRCCQ7_EX_3.Checked;
            row["RCCQ7_5"] = chkbxRCCQ7_EX_4.Checked;
            row["RCCQ7_6"] = chkbxRCCQ7_EX_5.Checked;
            row["RCCQ7_Note"] = txtRCCQ7.Text;

            if (chkbx_RCCQ7_1.Checked == true)
            {
                row["RCCQ7_Score"] = 1;
            }
            else if (chkbx_RCCQ7_2.Checked == true)
            {
                row["RCCQ7_Score"] = 3;
            }
            else if (chkbx_RCCQ7_3.Checked == true)
            {
                row["RCCQ7_Score"] = 5;
            }
            else if (chkbx_RCCQ7_4.Checked == true)
            {
                row["RCCQ7_Score"] = 7;
            }

            //row["RCCQ7_Score"] = Convert.ToInt32(hfRCCQ7.Value);
            row["REFQ8_1"] = chkbxREFQ8_1.Checked;
            row["REFQ8_2"] = chkbxREFQ8_2.Checked;
            row["REFQ8_3"] = chkbxREFQ8_3.Checked;
            row["REFQ8_4"] = chkbxREFQ8_4.Checked;

            if (chkbx_REFQ8_1.Checked == true)
            {
                row["REFQ8_Score"] = 1;
            }
            else if (chkbx_REFQ8_2.Checked == true)
            {
                row["REFQ8_Score"] = 3;
            }
            else if (chkbx_REFQ8_3.Checked == true)
            {
                row["REFQ8_Score"] = 5;
            }
            else if (chkbx_REFQ8_4.Checked == true)
            {
                row["REFQ8_Score"] = 7;
            }
            //row["REFQ8_Score"] = Convert.ToInt32(hfREFQ8.Value);
            row["ACRQ9_1"] = chkbxACRQ9_1.Checked;
            row["ACRQ9_2"] = chkbxACRQ9_2.Checked;
            row["ACRQ9_3"] = chkbxACRQ9_3.Checked;
            row["ACRQ9_4"] = chkbxACRQ9_4.Checked;
            row["ACRQ9_5"] = chkbxACRQ9_5.Checked;
            row["ACRQ9_EX"] = txtACRQ9.Text;

            if (chkbx_ACRQ9_1.Checked == true)
            {
                row["ACRQ9_Score"] = 1;
            }
            else if (chkbx_ACRQ9_2.Checked == true)
            {
                row["ACRQ9_Score"] = 3;
            }
            else if (chkbx_ACRQ9_3.Checked == true)
            {
                row["ACRQ9_Score"] = 5;
            }
            else if (chkbx_ACRQ9_4.Checked == true)
            {
                row["ACRQ9_Score"] = 7;
            }
            //row["ACRQ9_Score"] = Convert.ToInt32(hfACRQ9.Value);

            row["vignete_ChildDevelopment_1_1"] = chkbx_vignete_ChildDevelopment_1_1.Checked;
            row["vignete_ChildDevelopment_1_2"] = chkbx_vignete_ChildDevelopment_1_2.Checked;
            row["vignete_ChildDevelopment_1_3"] = chkbx_vignete_ChildDevelopment_1_3.Checked;
            row["vignete_ChildDevelopment_2_1"] = chkbx_vignete_ChildDevelopment_2_1.Checked;
            row["vignete_ChildDevelopment_2_2"] = chkbx_vignete_ChildDevelopment_2_2.Checked;
            row["vignete_ChildDevelopment_2_3"] = chkbx_vignete_ChildDevelopment_2_3.Checked;
            row["vignete_ChildDevelopment_3_1"] = chkbx_vignete_ChildDevelopment_3_1.Checked;
            row["vignete_ChildDevelopment_3_2"] = chkbx_vignete_ChildDevelopment_3_2.Checked;
            row["vignete_ChildDevelopment_3_3"] = chkbx_vignete_ChildDevelopment_3_3.Checked;
            if (!string.IsNullOrEmpty(hf_vignete_ChildDevelopment.Value))
            {
                row["vignete_ChildDevelopment_Range"] = Convert.ToInt32(hf_vignete_ChildDevelopment.Value);
            }

            row["vignete_ChildHealthWellBeing_1_1"] = chkbx_ChildHealthWellBeing_1_1.Checked;
            row["vignete_ChildHealthWellBeing_1_2"] = chkbx_ChildHealthWellBeing_1_2.Checked;
            row["vignete_ChildHealthWellBeing_1_3"] = chkbx_ChildHealthWellBeing_1_2.Checked;
            row["vignete_ChildHealthWellBeing_2_1"] = chkbx_ChildHealthWellBeing_2_1.Checked;
            row["vignete_ChildHealthWellBeing_2_2"] = chkbx_ChildHealthWellBeing_2_2.Checked;
            row["vignete_ChildHealthWellBeing_2_3"] = chkbx_ChildHealthWellBeing_2_3.Checked;
            row["vignete_ChildHealthWellBeing_3_1"] = chkbx_ChildHealthWellBeing_3_1.Checked;
            row["vignete_ChildHealthWellBeing_3_2"] = chkbx_ChildHealthWellBeing_3_2.Checked;
            row["vignete_ChildHealthWellBeing_3_3"] = chkbx_ChildHealthWellBeing_3_3.Checked;
            row["vignete_ChildHealthWellBeing_4_1"] = chkbx_ChildHealthWellBeing_4_1.Checked;
            row["vignete_ChildHealthWellBeing_4_2"] = chkbx_ChildHealthWellBeing_4_2.Checked;
            row["vignete_ChildHealthWellBeing_4_3"] = chkbx_ChildHealthWellBeing_4_3.Checked;
            row["vignete_ChildHealthWellBeing_5_1"] = chkbx_ChildHealthWellBeing_5_1.Checked;
            row["vignete_ChildHealthWellBeing_5_2"] = chkbx_ChildHealthWellBeing_5_2.Checked;
            row["vignete_ChildHealthWellBeing_5_3"] = chkbx_ChildHealthWellBeing_5_3.Checked;
            if (!string.IsNullOrEmpty(hf_vignete_ChildHealthWellBeing.Value))
            {
                row["vignete_ChildHealthWellBeing_Range"] = Convert.ToInt32(hf_vignete_ChildHealthWellBeing.Value);
            }

            row["vignete_FocusParentChildRelationship_1_1"] = chkbx_FocusParentChildRelationship_1_1.Checked;
            row["vignete_FocusParentChildRelationship_1_2"] = chkbx_FocusParentChildRelationship_2_2.Checked;
            row["vignete_FocusParentChildRelationship_1_3"] = chkbx_FocusParentChildRelationship_1_3.Checked;
            row["vignete_FocusParentChildRelationship_2_1"] = chkbx_FocusParentChildRelationship_1_1.Checked;
            row["vignete_FocusParentChildRelationship_2_2"] = chkbx_FocusParentChildRelationship_2_2.Checked;
            row["vignete_FocusParentChildRelationship_2_3"] = chkbx_FocusParentChildRelationship_2_3.Checked;
            if (!string.IsNullOrEmpty(hf_vignete_FocusParentChildRelationship.Value))
            {
                row["vignete_FocusParentChildRelationship_Range"] = Convert.ToInt32(hf_vignete_FocusParentChildRelationship.Value);
            }

            row["vignete_WorkingWithFamilies_1_1"] = chkbx_WorkingWithFamilies_1_1.Checked;
            row["vignete_WorkingWithFamilies_1_2"] = chkbx_WorkingWithFamilies_1_2.Checked;
            row["vignete_WorkingWithFamilies_1_3"] = chkbx_WorkingWithFamilies_1_3.Checked;
            row["vignete_WorkingWithFamilies_2_1"] = chkbx_WorkingWithFamilies_2_1.Checked;
            row["vignete_WorkingWithFamilies_2_2"] = chkbx_WorkingWithFamilies_2_2.Checked;
            row["vignete_WorkingWithFamilies_2_3"] = chkbx_WorkingWithFamilies_2_3.Checked;
            if (!string.IsNullOrEmpty(hf_vignete_WorkingWithFamilies.Value))
            {
                row["vignete_WorkingWithFamilies_Range"] = Convert.ToInt32(hf_vignete_WorkingWithFamilies.Value);
            }

            row["vignete_IndividualizingApproach_1_1"] = chkbx_IndividualizingApproach_1_1.Checked;
            row["vignete_IndividualizingApproach_1_2"] = chkbx_IndividualizingApproach_1_2.Checked;
            row["vignete_IndividualizingApproach_1_3"] = chkbx_IndividualizingApproach_1_3.Checked;
            if (!string.IsNullOrEmpty(hf_vignete_IndividualizingApproach.Value))
            {
                row["vignete_IndividualizingApproach_Range"] = Convert.ToInt32(hf_vignete_IndividualizingApproach.Value);
            }

            row["vignete_RecognizesCulturalConsiderations_1_1"] = chkbx_RecognizesCulturalConsiderations_1_1.Checked;
            row["vignete_RecognizesCulturalConsiderations_1_2"] = chkbx_RecognizesCulturalConsiderations_1_2.Checked;
            row["vignete_RecognizesCulturalConsiderations_1_3"] = chkbx_RecognizesCulturalConsiderations_1_3.Checked;
            row["vignete_RecognizesCulturalConsiderations_2_1"] = chkbx_RecognizesCulturalConsiderations_2_1.Checked;
            row["vignete_RecognizesCulturalConsiderations_2_2"] = chkbx_RecognizesCulturalConsiderations_2_2.Checked;
            row["vignete_RecognizesCulturalConsiderations_2_3"] = chkbx_RecognizesCulturalConsiderations_2_3.Checked;
            if (!string.IsNullOrEmpty(hf_vignete_RecognizesCulturalConsiderations.Value))
            {
                row["vignete_RecognizesCulturalConsiderations_Range"] = Convert.ToInt32(hf_vignete_RecognizesCulturalConsiderations.Value);
            }

            row["vignete_Referrals_1_1"] = chkbx_Referrals_1_1.Checked;
            row["vignete_Referrals_1_2"] = chkbx_Referrals_1_2.Checked;
            row["vignete_Referrals_1_3"] = chkbx_Referrals_1_3.Checked;
            row["vignete_Referrals_2_1"] = chkbx_Referrals_2_1.Checked;
            row["vignete_Referrals_2_2"] = chkbx_Referrals_2_2.Checked;
            row["vignete_Referrals_2_3"] = chkbx_Referrals_2_3.Checked;
            row["vignete_Referrals_3_1"] = chkbx_Referrals_3_1.Checked;
            row["vignete_Referrals_3_2"] = chkbx_Referrals_2_2.Checked;
            row["vignete_Referrals_3_3"] = chkbx_Referrals_3_3.Checked;
            if (!string.IsNullOrEmpty(hf_vignete_Referrals.Value))
            {
                
                row["vignete_Referrals_Range"] = Convert.ToInt32(hf_vignete_Referrals.Value);
            }
            if (check == true)
            {
                ds.HomeVisitorInterview.Rows.Add(row);
            }
            hvi.Update(row);
            DataTable dt_end = new DataTable();
            dt_end = hvi.GetData();
            int count_end = dt_end.Rows.Count;

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
     
        //protected void lblScore_PMQ1_Load(object sender, EventArgs e)
        //{
        //    lblScore_PMQ1.Text = "1";//hf_PMQ1.Value;
        //}

        //protected void lblScore_CDQ2_Load(object sender, EventArgs e)
        //{
        //    lblScore_CDQ2.Text = hf_CDQ2.Value;
        //}

        //protected void lblScore_CHWBQ3_Load(object sender, EventArgs e)
        //{
        //    lblScore_CHWBQ3.Text = hf_CHWBQ3.Value;
        //}

        //protected void lblScore_PCRQ4_Load(object sender, EventArgs e)
        //{
        //    lblScore_PCRQ4.Text = hfPCRQ4.Value;
        //}

        //protected void lblScore_HRDQ5_Load(object sender, EventArgs e)
        //{
        //    lblScore_HRDQ5.Text = hf_HRDQ5.Value;
        //}

        //protected void lblScore_IAQ6_Load(object sender, EventArgs e)
        //{
        //    lblScore_IAQ6.Text = hfIAQ6.Value;
        //}

        //protected void lblScore_RCCQ7_Load(object sender, EventArgs e)
        //{
        //    lblScore_RCCQ7.Text = hfRCCQ7.Value;
        //}

        //protected void lblScore_REFQ8_Load(object sender, EventArgs e)
        //{
        //    lblScore_REFQ8.Text = hfREFQ8.Value;
        //}

        //protected void lblScore_ACRQ9_Load(object sender, EventArgs e)
        //{
        //    lblScore_ACRQ9.Text = hfACRQ9.Value;
        //}      
                            
        
    }
}