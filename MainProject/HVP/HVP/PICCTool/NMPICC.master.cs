using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HVP.PICCTool
{
    public partial class NMPICC : System.Web.UI.MasterPage
    {
        StoreInfo getinfo = new StoreInfo();       
        dsTableAdapters.PiccToolTableAdapter piccTool = new dsTableAdapters.PiccToolTableAdapter();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                hfsiteid.Value = Session["Site_ID"] == null ? "" : Session["Site_ID"].ToString();
                hfSchdId.Value = Session["Schd_Id"] == null ? "" : Session["Schd_Id"].ToString();
                if (!string.IsNullOrEmpty(hfSchdId.Value))
                {
                    string sqlquerySite = "SELECT ST.Program_ID,ST.Sites, (ST.Site_Address+','+ST.City+','+ST.State+','+ST.ZipCode) As SiteAddress, "
                   + "SCHD.VisitDate, UN.Name FROM Sites ST INNER JOIN Scheduling SCHD ON ST.SiteID = SCHD.SiteID "
                    + " LEFT JOIN UserNames UN ON SCHD.NameID = UN.NameID WHERE SCHD.Schd_ID =" + hfSchdId.Value;
                    DataTable dtSiteInfo = DBHelper.GetDataTable(sqlquerySite);


                    txtVisitDate.Text = dtSiteInfo.Rows[0]["VisitDate"].ToString();
                    txtAddress.Text = dtSiteInfo.Rows[0]["SiteAddress"].ToString();
                    txtprogramName.Text = dtSiteInfo.Rows[0]["Sites"].ToString();
                    txtAssessor.Text = dtSiteInfo.Rows[0]["Name"].ToString();
                    //txtId.Text = dtSiteInfo.Rows[0]["Program_ID"].ToString();
                }
                DataTable dt = new DataTable();
                //hfSchid.Value = getschd.getSchdID();
                dt = piccTool.GetData().Clone();

                foreach (DataRow row in piccTool.GetData().Rows)
                {
                    if (hfSchdId.Value == row["Schd_ID"].ToString())
                    {
                        dt.ImportRow(row);
                        txtAuthorizedOfficial.Text = dt.Rows[0]["Authorized_Official"].ToString();
                        txtRcdt.Text = dt.Rows[0]["RCDT"].ToString();
                        txtId.Text = dt.Rows[0]["Top_ID"].ToString();
                        txtNotes.Text = dt.Rows[0]["Top_Notes"].ToString();
                    }
                }
            }
        }

        protected void txtId_TextChanged(object sender, EventArgs e)
        {
            getinfo.setvalue_ID(txtId.Text.Trim());
        }

        protected void txtRcdt_TextChanged(object sender, EventArgs e)
        {
            getinfo.setvalue_RCDT(txtRcdt.Text.Trim());
        }

        protected void txtAuthorizedOfficial_TextChanged(object sender, EventArgs e)
        {
            getinfo.setvalue_AuthorizedOfficial(txtAuthorizedOfficial.Text.Trim());
        }

        protected void txtNotes_TextChanged(object sender, EventArgs e)
        {
            getinfo.setvalue_Notes(txtNotes.Text.Trim());
        }
    }
}