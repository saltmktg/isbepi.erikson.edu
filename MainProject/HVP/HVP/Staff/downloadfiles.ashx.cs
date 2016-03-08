using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;


namespace HVP.Staff
{
    /// <summary>
    /// Summary description for downloadfiles
    /// </summary>
    public class downloadfiles : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            int fileId = 0;
            string fileName = "";

            // get the ID from the querystring
            if (context.Request.QueryString["Id"] != null)
            {
                fileId = Convert.ToInt32(context.Request.QueryString["Id"].ToString());
            }
            // get the FileName from the querystring
            if (context.Request.QueryString["filename"] != null)
            {
                fileName = context.Request.QueryString["filename"].ToString();
            }
            string strQuery = "SELECT* FROM [ISBEPI_DEV].[dbo].[FileUpload] where id=" + fileId;
            SqlCommand cmd = new SqlCommand(strQuery);
            cmd.Parameters.Add(fileId.ToString(), SqlDbType.Int).Value = 1;
            DataTable dt = GetData(cmd);

            if (dt != null)
            {
                Byte[] bytes = (Byte[])dt.Rows[0]["Data"];
                context.Response.Buffer = true;
                context.Response.Charset = "";
                context.Response.Cache.SetCacheability(HttpCacheability.NoCache);
                context.Response.ContentType = dt.Rows[0]["ContentType"].ToString();
                context.Response.AddHeader("content-disposition", "attachment;filename=" + dt.Rows[0]["Name"].ToString());
                context.Response.BinaryWrite(bytes);
                context.Response.Flush();
                context.Response.End();
            }
        }
        private DataTable GetData(SqlCommand cmd)
        {

            DataTable dt = new DataTable();
            String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ISBEPI_DEV"].ConnectionString;
            SqlConnection con = new SqlConnection(strConnString);
            SqlDataAdapter sda = new SqlDataAdapter();
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            try
            {
                con.Open();
                sda.SelectCommand = cmd;
                sda.Fill(dt);
                return dt;
            }
            catch
            {
                return null;
            }

            finally
            {
                con.Close();
                sda.Dispose();
                con.Dispose();
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}