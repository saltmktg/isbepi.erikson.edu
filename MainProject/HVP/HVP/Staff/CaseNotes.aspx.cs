using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Security;

namespace HVP.Staff
{
    public partial class CaseNotes : System.Web.UI.Page
    {
        Label lblMessage = new Label();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                hfsiteid.Value = Session["Site_ID"] == null ? "" : Session["Site_ID"].ToString();
                hfSchdId.Value = Session["Schd_Id"] == null ? "" : Session["Schd_Id"].ToString();

                if (hfsiteid.Value.Length > 0)
                {
                    string sqlquery = "SELECT * FROM [ISBEPI_DEV].[dbo].[Sites] WHERE SiteID =" + hfsiteid.Value;
                    DataTable dt = DBHelper.GetDataTable(sqlquery);
                    txtSiteName.Text = dt.Rows[0]["Sites"].ToString();
                    string userID = Membership.GetUser(Page.User.Identity.Name).ProviderUserKey.ToString();
                    string sqlNameQuery = " SELECT CASE WHEN UN.Name IS NULL THEN 'NONE' ELSE UN.Name END AS Name, NameID FROM UserNames UN "
                                        +" RIGHT JOIN aspnet_Users U ON UN.UserId = U.UserId WHERE U.UserId ='" + userID + "'";
                    DataTable dtName = DBHelper.GetDataTable(sqlNameQuery);
                    txtUserName.Text = dtName.Rows[0]["Name"].ToString();
                }
            }
        }

        protected void lnkSubmit_Click(object sender, EventArgs e)
        {
            string userID = Membership.GetUser(Page.User.Identity.Name).ProviderUserKey.ToString();
            string sqlNameQuery = " SELECT CASE WHEN UN.Name IS NULL THEN 'NONE' ELSE UN.Name END AS Name, NameID FROM UserNames UN "
                                + " RIGHT JOIN aspnet_Users U ON UN.UserId = U.UserId WHERE U.UserId ='" + userID + "'";
            DataTable dtName = DBHelper.GetDataTable(sqlNameQuery);
            string sqlInsert = string.Format("INSERT INTO [ISBEPI_DEV].[dbo].[SiteNotes] ([SiteID],[NameID],[Entered_Date],[Note],[Subject] )"
                    + "VALUES('{0}', '{1}', '{2}','{3}','{4}')", hfsiteid.Value, 
                            dtName.Rows[0]["NameID"].ToString(), DateTime.Now, txtNotes.Text.Replace("'","''"), txtSubject.Text);
              int count = DBHelper.ExecuteSQL(sqlInsert);

              if (count == 1)
              {
                  lblMessage.ForeColor = System.Drawing.Color.Green;
                  lblMessage.Text = "Successfully updated";
                  PlaceHolder1.Controls.Add(lblMessage);
                  Repeater1.DataBind();
                  Response.Redirect(Request.RawUrl);
              }
              else
              {                 
                  lblMessage.ForeColor = System.Drawing.Color.Red;
                  lblMessage.Text = "Not Successfully updated";
                  PlaceHolder1.Controls.Add(lblMessage);
              }
        }
    }
}