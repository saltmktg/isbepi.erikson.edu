using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HVP.Survey
{
    public partial class PDtoExcel : System.Web.UI.Page
    {
        DataRow r;
        protected void Page_Load(object sender, EventArgs e)
        {
            hfsiteid.Value = Session["Site_ID"] == null ? "" : Session["Site_ID"].ToString();
            hfSchdId.Value = Session["Schd_Id"] == null ? "" : Session["Schd_Id"].ToString();
            if (!IsPostBack)
            {
                if (hfSchdId.Value.Length > 0)
                {
                    string sqlquerySite = "SELECT Sites,Program_ID FROM Sites WHERE SiteID=" + hfsiteid.Value;
                    DataTable dt = DBHelper.GetDataTable(sqlquerySite);
                    lblSitename.Text = dt.Rows[0]["Sites"].ToString();
                    lblProgramId.Text = dt.Rows[0]["Program_ID"].ToString();
                    BindData();
                    h4.Visible = true;
                    btnExcel.Visible = true;
                }
            }
        }
        private void BindData()
        {
            SqlDataSource1.DataBind();
            //string sqlquery = "SELECT * FROM [ISBEPI_DEV].[dbo].[HomeVisitorSiteVisitSurvey] WHERE Schd_ID = 16";
            DataTable dt = new DataTable();
            DataSourceSelectArguments args = new DataSourceSelectArguments();
            DataView view = (DataView)SqlDataSource1.Select(args);
            dt = view.ToTable();
            DataSet ds = new DataSet();
            ds.Tables.Add(dt);
            DataSet new_ds = FlipDataSet(ds); // Flip the DataSet
            DataView my_DataView = new_ds.Tables[0].DefaultView;
            this.DataGrid1.DataSource = my_DataView;
            this.DataGrid1.DataBind();

            DataTable dt2 = new DataTable();
            DataSourceSelectArguments args2 = new DataSourceSelectArguments();
            DataView view2 = (DataView)SqlDataSource2.Select(args2);
            dt2 = view2.ToTable();
            DataSet ds2 = new DataSet();
            ds2.Tables.Add(dt2);
            DataSet new_ds2 = FlipDataSet(ds2); // Flip the DataSet
            DataView my_DataView2 = new_ds2.Tables[0].DefaultView;
            this.DataGrid2.DataSource = my_DataView2;
            this.DataGrid2.DataBind();
        }


        public DataSet FlipDataSet(DataSet my_DataSet)
        {
            DataSet ds = new DataSet();
            DataTable table = new DataTable();

            foreach (DataTable dt in my_DataSet.Tables)
            {

                for (int i = 0; i <= dt.Rows.Count; i++)
                {
                    table.Columns.Add(Convert.ToString(i));
                }

                for (int k = 0; k < dt.Columns.Count; k++)
                {
                    r = table.NewRow();
                    r[0] = dt.Columns[k].ToString();
                    for (int j = 1; j <= dt.Rows.Count; j++)
                        r[j] = dt.Rows[j - 1][k];
                    table.Rows.Add(r);
                }

                ds.Tables.Add(table);
            }

            return ds;
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            BindData();
            h4.Visible = true;
            btnExcel.Visible = true;
        }

        protected void btnExcel_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.AddHeader("content-disposition", "attachment;filename=TempExportData.xls");
            Response.Charset = "";
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.xls";

            System.IO.StringWriter stringWrite = new System.IO.StringWriter();
            System.Web.UI.HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);

            DataGrid1.RenderControl(htmlWrite);
            DataGrid2.RenderControl(htmlWrite);
            Response.Write(stringWrite.ToString());
            Response.End();

           
        }
    }
}