using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HVP.Staff
{
    public partial class Surveyoutput : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {            
            //SqlDataSource2.DataBind();
            if (!IsPostBack)
            {
                hfsiteid.Value = Session["Site_ID"] == null ? "" : Session["Site_ID"].ToString();
                hfSchdId.Value = Session["Schd_Id"] == null ? "" : Session["Schd_Id"].ToString();
                if (hfSchdId.Value.Length > 0)
                {
                    string sqlquerySite = "SELECT Sites,Program_ID FROM Sites WHERE SiteID=" + hfsiteid.Value;
                    DataTable dt = DBHelper.GetDataTable(sqlquerySite);
                    lblSitename.Text = dt.Rows[0]["Sites"].ToString();
                    lblProgramId.Text = dt.Rows[0]["Program_ID"].ToString();
                }
            }

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataSource1.DataBind();
            rdobtnSelect.DataBind();

        }


        protected void btnClick_Click(object sender, EventArgs e)
        {
            if (rdobtnSelect.SelectedValue != null)
            {
                string sqlquery = "SELECT * FROM [HomeVisitorSiteVisitSurvey] WHERE ID ='" + rdobtnSelect.SelectedValue + "'";
                DataTable dt = DBHelper.GetDataTable(sqlquery);
                Survey.setgetreview setdt = new Survey.setgetreview();
                setdt.setQuestions(dt);
                Session["Id"] = rdobtnSelect.SelectedValue;
                Response.Redirect("~/Survey/DataOutput.aspx");
            }
        }
    }
}