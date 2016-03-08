using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HVP.Staff
{
    public partial class PDSurveyOutput : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //SqlDataSource2.DataBind();
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
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataSource1.DataBind();
            rdobtnSelect.DataBind();
        }
        protected void btnClick_Click(object sender, EventArgs e)
        {        
            toGetInfo getinfo = new toGetInfo();
            getinfo.setSchdID(hfSchdId.Value);
            Session["siteID"] = hfsiteid.Value;
            Session["StaffID"] = rdobtnSelect.SelectedValue;
            Response.Redirect("~/Staff/DataOutput.aspx");
        }          
        
    }
}