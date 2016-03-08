using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HVP.Admin
{
    public partial class AddSite : System.Web.UI.Page
    {
        public DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MultiView1.ActiveViewIndex = 0;
            }
        }

        protected void btnCheckSite_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtSiteID.Text) && string.IsNullOrEmpty(txtSiteName.Text))
            {
                string strMsg = "Please Enter Something!";
                System.Web.HttpContext.Current.Response.Write("<Script Language='JavaScript'>window.alert('" + strMsg + "');</script>");
            }
            else if (txtSiteID.Text != string.Empty && txtSiteName.Text != string.Empty)
            {
                string sqlquery = "SELECT * FROM SiteName WHERE DistrictRCDT LIKE  '%" + txtSiteID.Text + "%' AND DistrictName  LIKE'%" + txtSiteName.Text + "%';";
                dt = DBHelper.GetDataTable(sqlquery);
                if (dt.Rows.Count > 0)
                {
                    MultiView1.ActiveViewIndex = 1;
                    grdViewSite.DataSource = dt;
                    grdViewSite.DataBind();
                }
                else if (dt.Rows.Count < 1)
                {
                    MultiView1.ActiveViewIndex = 2;
                    string strMsg = "NO DATA FOUND...Please ADD A  NEW SITE!";
                    System.Web.HttpContext.Current.Response.Write("<Script Language='JavaScript'>window.alert('" + strMsg + "');</script>");
                }

            }
            else if (txtSiteID.Text != string.Empty)
            {
                string sqlquery = "SELECT * FROM SiteName WHERE DistrictRCDT LIKE '%" + txtSiteID.Text + "%';";
                dt = DBHelper.GetDataTable(sqlquery);
                if (dt.Rows.Count > 0)
                {
                    MultiView1.ActiveViewIndex = 1;
                    grdViewSite.DataSource = dt;
                    grdViewSite.DataBind();
                }
                else if (dt.Rows.Count < 1)
                {
                    MultiView1.ActiveViewIndex = 2;
                    string strMsg = "NO DATA FOUND...Please ADD A  NEW SITE!";
                    System.Web.HttpContext.Current.Response.Write("<Script Language='JavaScript'>window.alert('" + strMsg + "');</script>");
                }

            }
            else if (txtSiteName.Text != string.Empty)
            {
                string sqlquery = "SELECT * FROM SiteName WHERE DistrictName LIKE '%" + txtSiteName.Text + "%';";
                dt = DBHelper.GetDataTable(sqlquery);
                if (dt.Rows.Count > 0)
                {
                    MultiView1.ActiveViewIndex = 1;
                    grdViewSite.DataSource = dt;
                    grdViewSite.DataBind();
                }
                else if (dt.Rows.Count < 1)
                {
                    MultiView1.ActiveViewIndex = 2;
                    string strMsg = "NO DATA FOUND...Please ADD A  NEW SITE!";
                    System.Web.HttpContext.Current.Response.Write("<Script Language='JavaScript'>window.alert('" + strMsg + "');</script>");
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/default.aspx");
        }

        protected void btnReturnV2_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void btnCancelV3_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }
    }
}