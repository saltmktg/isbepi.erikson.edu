using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HVP.Staff
{
    public partial class HVInterviewtoExcel : System.Web.UI.Page
    {
        DataRow r;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private void BindData()
        {
            SqlDataSource1.DataBind();          
            DataTable dt = new DataTable();
            DataSourceSelectArguments args = new DataSourceSelectArguments();
            DataView view = (DataView)SqlDataSource2.Select(args);
            dt = view.ToTable();
            DataSet ds = new DataSet();
            ds.Tables.Add(dt);
            DataSet new_ds = FlipDataSet(ds); // Flip the DataSet
            DataView my_DataView = new_ds.Tables[0].DefaultView;
            this.DataGrid1.DataSource = my_DataView;
            this.DataGrid1.DataBind();
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

        protected void btnView_Click1(object sender, EventArgs e)
        {
            BindData();
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
            Response.Write(stringWrite.ToString());
            Response.End();


        }
    }
}