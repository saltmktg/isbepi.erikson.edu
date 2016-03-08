using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HVP.PICCTool
{
    public partial class PiccFinal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindQuestions();
                SqlDataSource1.DataBind();
                SqlDataSource2.DataBind();
                SqlDataSource3.DataBind();
                SqlDataSource4.DataBind();
                SqlDataSource5.DataBind();
                MultiView1.ActiveViewIndex = 0;
            }
        }
         protected void BindQuestions()
        {
            dsTableAdapters.Picc_QuestionsTableAdapter import_questions_ds = new dsTableAdapters.Picc_QuestionsTableAdapter();
            DataTable dt = new DataTable();
            dt = import_questions_ds.GetData();
            Label lbl = new Label();
            for (int x = 0; x < dt.Rows.Count; x++)
            {
                ContentPlaceHolder cp = this.Master.Master.FindControl("ContentPlaceHolder1") as ContentPlaceHolder;
                ContentPlaceHolder cph = cp.FindControl("NesterContent") as ContentPlaceHolder;
                //Content con = cph.FindControl("Content2") as Content;
                lbl = cph.FindControl(dt.Rows[x]["Label_ID"].ToString().Trim()) as Label;
                lbl.Text = dt.Rows[x]["Questions"].ToString().Trim();
            }         

        }
        protected void lnkPicc_Q1_Click_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }
        protected void lnkPicc_Q2_Click2(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
        }
        protected void lnkPicc_Q3_Click3(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 3;
        }
        protected void lnkPicc_Q4_Click4(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 4;
        }
        protected void lnkPicc_Q5_Click5(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 5;
        }
        protected void lnkPicc_Q6_Click6(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 6;
        }
        protected void lnkPicc_Q7_Click7(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 7;
        }
        protected void lnkPicc_Q8_Click8(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 8;
        }
        protected void lnkPicc_Q9_Click9(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 9;
        }
        protected void lnkPicc_Q10_Click10(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 10;
        }
        protected void lnkPicc_Q11_Click11(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 11;
        }
        protected void lnkPicc_Q12_Click12(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 12;
        }
        protected void lnkPicc_Q13_Click13(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 13;
        }
        protected void lnkPicc_Q14_Click14(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 14;
        }
        protected void lnkPicc_Q15_Click15(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 15;
        }
        protected void lnkPicc_Q16_Click16(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 16;
        }
        protected void lnkPicc_Q17_Click17(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 17;
        }
        protected void lnkPicc_Q18_Click18(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 18;
        }
        protected void lnkPicc_Q19_Click19(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 19;
        }
    }
}