using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HVP.PICCTool
{
    public partial class Picc : System.Web.UI.MasterPage
    {
        StoreInfo getinfo = new StoreInfo();
        toGetInfo getschd = new toGetInfo();
        dsTableAdapters.PiccToolTableAdapter piccTool = new dsTableAdapters.PiccToolTableAdapter();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtVisitDate.Text = getinfo.getvalue_VisitDate();
                txtAddress.Text = getinfo.getvalue_Address();
                txtprogramName.Text = getinfo.getvalue_ProgramName();
                txtAssessor.Text = getinfo.getvalue_Assessor();
                DataTable dt = new DataTable();
                hfSchid.Value = getschd.getSchdID();
                dt = piccTool.GetData().Clone();

                foreach (DataRow row in piccTool.GetData().Rows)
                {
                    if (hfSchid.Value == row["Schd_ID"].ToString())
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