using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HVP.PIQRI_Tool
{
    public partial class _default : System.Web.UI.Page
    {        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Response.Write(Session.SessionID); for timeout testing purpose
                hfsiteid.Value = Session["Site_ID"] == null ? "" : Session["Site_ID"].ToString();
                hfSchdId.Value = Session["Schd_Id"] == null ? "" : Session["Schd_Id"].ToString();
                if (hfSchdId.Value.Length > 0)
                {
                    string sqlquery = "SELECT * FROM [ISBEPI_DEV].[dbo].[Sites] WHERE SiteID =" + hfsiteid.Value;
                    DataTable dtName = DBHelper.GetDataTable(sqlquery);
                    lblSitename.Text = dtName.Rows[0]["Sites"].ToString();
                    lblProgramId.Text = dtName.Rows[0]["Program_ID"].ToString();

                    Survey.setgetreview setdt = new Survey.setgetreview();
                    setdt.setSchdID(hfSchdId.Value);

                    String query = "SELECT ID ,Schd_ID FROM [ISBEPI_DEV].[dbo].[HomeVisitorInterview] WHERE Schd_ID =" + hfSchdId.Value + ";";
                    DataTable dt = DBHelper.GetDataTable(query);
                    int count = 0;
                    if (dt.Rows.Count > 0)
                    {
                        while (count < dt.Rows.Count)
                        {
                            string vw_name = "HV View " + count;
                            rdobtnlst_HVData.Items.Add(new ListItem(vw_name, dt.Rows[count]["ID"].ToString()));
                            count++;
                        }
                        rdobtnlst_HVData.DataBind();
                    }

                    string pd_query = " SELECT ID, Schd_ID FROM [ISBEPI_DEV].[dbo].[PDInterview] WHERE Schd_ID =" + hfSchdId.Value + ";";
                    DataTable pd_dt = DBHelper.GetDataTable(pd_query);
                    if (pd_dt.Rows.Count > 0)
                    {
                        rdobtnlst_PD.Items.Add(new ListItem("Completed", pd_dt.Rows[0]["ID"].ToString()));
                        rdobtnlst_PD.DataBind();
                    }

                }
                //DataTable dt =new DataTable();
                //DataSourceSelectArguments args = new DataSourceSelectArguments();
                //DataView view = (DataView)SqlDataSource2.Select(args);
                //dt = view.ToTable();
                //if (dt.Rows.Count == 0)
                //{
                //    hlHv.Visible = true;
                //}
            }
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            string sqlquery = "SELECT * FROM [ISBEPI_DEV].[dbo].[HomeVisitorInterview] WHERE ID =" + rdobtnlst_HVData.SelectedValue.ToString() + ";";
            DataTable dt = DBHelper.GetDataTable(sqlquery);
            Survey.setgetreview setdt = new Survey.setgetreview();
            setdt.setSchdID(hfSchdId.Value);
            setdt.setID(rdobtnlst_HVData.SelectedValue.ToString().Trim());
            setdt.setQuestions(dt);
            Response.Redirect("~/PIQRIInterview/HVPIQRITool.aspx");
        }

        protected void btnpdView_Click(object sender, EventArgs e)
        {
            //string sqlquery = "SELECT * FROM [ISBEPI_DEV].[dbo].[PDInterview] WHERE ID =" + rdobtnlst_PD.SelectedValue.ToString().Trim() + ";";
            //DataTable dt = DBHelper.GetDataTable(sqlquery);
            //Survey.setgetreview setdt = new Survey.setgetreview();
            //setdt.setSchdID(hfschd.Value);
            //setdt.setQuestions(dt);
            Session["checkRow"] = true;
            Session["schid"] = hfSchdId.Value;
            Response.Redirect("~/PIQRIInterview/PDPIQRITool.aspx"); 
        }

        protected void lnkHV_Click(object sender, EventArgs e)
        {
            Survey.setgetreview setdt = new Survey.setgetreview();
            setdt.setSchdID(hfSchdId.Value);           
            Response.Redirect("~/PIQRIInterview/HVPIQRITool.aspx");
        }

        protected void lnkPD_Click(object sender, EventArgs e)
        {
            //Survey.setgetreview setdt = new Survey.setgetreview();
            //setdt.setSchdID(hfschd.Value);
            Session["schid"] = hfSchdId.Value;
            Response.Redirect("~/PIQRIInterview/PDPIQRITool.aspx"); 
        }
    }
}