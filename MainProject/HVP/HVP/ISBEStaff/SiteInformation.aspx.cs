using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;

namespace HVP.ISBEStaff
{
    public partial class SiteInformation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                hfsiteid.Value = Session["Site_ID"] == null ? "" : Session["Site_ID"].ToString();
                hfSchdId.Value = Session["Schd_Id"] == null ? "" : Session["Schd_Id"].ToString();
                getinfo();
            }
        }

        private void getinfo()
        {
            if (hfsiteid.Value.Length > 0)
            {
                string sqlquery = "SELECT * FROM [ISBEPI_DEV].[dbo].[Sites] WHERE SiteID =" + hfsiteid.Value;
                DataTable dt = DBHelper.GetDataTable(sqlquery);
                txtEmail_Edit.Text = dt.Rows[0]["Email_address"].ToString();
                txtMainPhone_Edit.Text = dt.Rows[0]["Main_PhoneNumber"].ToString();
                txtPhone_Edit.Text = dt.Rows[0]["PhoneNumber"].ToString();
                txtSiteAddress_Edit.Text = dt.Rows[0]["Site_Address"].ToString();
                txtCity_Edit.Text = dt.Rows[0]["City"].ToString();
                txtState_Edit.Text = dt.Rows[0]["State"].ToString();
                txtZip_Edit.Text = dt.Rows[0]["ZipCode"].ToString();
                txtNum_Hv_Visitor_Edit.Text = dt.Rows[0]["Num_of_HV"].ToString();
                lblSitename.Text = dt.Rows[0]["Sites"].ToString();
                lblProgramId.Text = dt.Rows[0]["Program_ID"].ToString();
                chkMiechv_Edit.Checked = Convert.ToBoolean(object.Equals(dt.Rows[0]["MICEHV"].ToString(), 0));
                chkMiHope_Edit.Checked = Convert.ToBoolean(object.Equals(dt.Rows[0]["MiHope"].ToString(), 0));
                chkPilot_Edit.Checked = Convert.ToBoolean(object.Equals(dt.Rows[0]["Pilot"].ToString(), 0));
                chkValidation_research_Edit.Checked = Convert.ToBoolean(object.Equals(dt.Rows[0]["Validation_Research"].ToString(), 0));
            }
        }
    }
}
