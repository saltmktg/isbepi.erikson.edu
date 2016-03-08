using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;

namespace HVP.ProgramDirector
{
    public partial class uploadDcumentation : System.Web.UI.Page
    {
        Label lblMessage = new Label();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                hfsiteid.Value = Session["Site_ID"] == null ? "" : Session["Site_ID"].ToString();
                hfSchdId.Value = Session["Schd_Id"] == null ? "" : Session["Schd_Id"].ToString();
            }
        }

        /// <summary>
        /// Upload button for saving file to database
        /// </summary>         
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            // Read the file and convert it to Byte Array
            string filePath = FileUpload1.PostedFile.FileName;
            string filename = Path.GetFileName(filePath);
            string ext = Path.GetExtension(filename);
            string contenttype = String.Empty;

            //Set the contenttype based on File Extension
            switch (ext)
            {
                case ".doc":
                    contenttype = "application/vnd.ms-word";
                    break;
                case ".docx":
                    contenttype = "application/vnd.ms-word";
                    break;
                case ".xls":
                    contenttype = "application/vnd.ms-excel";
                    break;
                case ".xlsx":
                    contenttype = "application/vnd.ms-excel";
                    break;
                case ".jpg":
                    contenttype = "image/jpg";
                    break;
                case ".png":
                    contenttype = "image/png";
                    break;
                case ".gif":
                    contenttype = "image/gif";
                    break;
                case ".pdf":
                    contenttype = "application/pdf";
                    break;
            }
            if (contenttype != String.Empty)
            {
                if (FileUpload1.HasFile)
                {

                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    lblMessage.Text = databaseFilePut(FileUpload1.PostedFile.FileName, FileUpload1.FileName, contenttype);
                    PlaceHolder1.Controls.Add(lblMessage);
                    GridView1.DataBind();
                }            
            }
            else
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "File format not recognised. Upload Image/Word/PDF/Excel formats";
                PlaceHolder1.Controls.Add(lblMessage);
            }
        }

        private string databaseFilePut(string varFilePath, string Name, string ContentType)
        {
            byte[] file;
            using (var stream = new FileStream(varFilePath, FileMode.Open, FileAccess.Read))
            {
                using (var reader = new BinaryReader(stream))
                {
                    file = reader.ReadBytes((int)stream.Length);

                }
            }
            string name = Page.User.Identity.Name;
            string userID = Membership.GetUser(name).ProviderUserKey.ToString();
            string nameidQuery = "SELECT * FROM [ISBEPI_DEV].[dbo].[UserNames] WHERE UserId ='"+userID+"'";
            DataTable dtName =  DBHelper.GetDataTable(nameidQuery);
            string strQuery = "INSERT INTO FileUpload(Name, ContentType, Data, Schd_ID, SiteID, EnteredDate, NameID) "
                + " VALUES (@Name, @ContentType, @Data, @Schd_ID, @SiteID, @EnteredDate, @NameID)";
            using (var varConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ISBEPI_DEV"].ToString()))
            using (var sqlWrite = new SqlCommand(strQuery, varConnection))
            {
                try
                {
                    sqlWrite.Parameters.AddWithValue("@Name", Name);
                    sqlWrite.Parameters.AddWithValue("@ContentType", ContentType);
                    sqlWrite.Parameters.Add("@Data", SqlDbType.VarBinary, file.Length).Value = file;
                    sqlWrite.Parameters.AddWithValue("@Schd_ID", Convert.ToInt32(hfSchdId.Value));
                    sqlWrite.Parameters.AddWithValue("@SiteID", Convert.ToInt32(hfsiteid.Value));
                    sqlWrite.Parameters.AddWithValue("@EnteredDate", DateTime.Now);
                    sqlWrite.Parameters.AddWithValue("@NameID", Convert.ToInt32(dtName.Rows[0]["NameID"].ToString()));                    
                    sqlWrite.Connection = varConnection;
                    varConnection.Open();
                    sqlWrite.ExecuteNonQuery();
                    varConnection.Close();
                    sqlWrite.Dispose();
                    varConnection.Dispose();
                    return "File stored Successfully!!!";
                }
                catch (Exception ex)
                {
                    return ex.Message;
                }
            }

        }       
    }
}