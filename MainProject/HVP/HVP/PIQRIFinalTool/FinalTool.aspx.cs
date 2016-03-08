using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Security;

namespace HVP.PIQRIFinalTool
{
    public partial class FinalTool : System.Web.UI.Page
    {
        ds ds = new ds();     
        DataRow row;
        protected void Page_Load(object sender, EventArgs e)
        {           
            if (!IsPostBack)
            {
                if ((Roles.IsUserInRole(Page.User.Identity.Name, "Program Site Director")))
                {
                    string name = Page.User.Identity.Name;
                    string userID = Membership.GetUser(name).ProviderUserKey.ToString();
                    string sqlquerysiteID = " Select  PD.SiteID From [ISBEPI_DEV].[dbo].[ProgramDirector] PD RIGHT JOIN " +
                                            "[ISBEPI_DEV].[dbo].Staff ST " +
                                            "ON PD.Staff_ID = ST.Staff_ID WHERE ST.UserId ='" + userID + "' ;";
                    DataTable dtsiteID = DBHelper.GetDataTable(sqlquerysiteID);
                    if (dtsiteID.Rows.Count > 0)
                    {
                        string siteID = dtsiteID.Rows[0]["SiteID"].ToString();
                        string sqlquery = "SELECT SCHD.Schd_ID   FROM Scheduling SCHD WHERE SCHD.SiteID='" + siteID + "' ";
                        DataTable dtGetTable = DBHelper.GetDataTable(sqlquery);
                        if (dtGetTable.Rows.Count > 0)
                        {
                            hfSchdId.Value = dtGetTable.Rows[0]["Schd_ID"].ToString();
                            BindQuestions();
                        }
                        else
                        {
                            Response.Redirect("~/UnauthorizedAccess.aspx");
                        }
                        
                    }
                    else
                    {
                        Response.Redirect("~/UnauthorizedAccess.aspx");
                    }
                }
                else
                {
                    hfsiteid.Value = Session["Site_ID"] == null ? "" : Session["Site_ID"].ToString();
                    hfSchdId.Value = Session["Schd_Id"] == null ? "" : Session["Schd_Id"].ToString();
                    if (string.IsNullOrEmpty(hfSchdId.Value))
                    {
                        //ClientScript.RegisterStartupScript(typeof(Page), "closePage", "<script type='text/JavaScript'>window.close();</script>");
                        if ((Roles.IsUserInRole(Page.User.Identity.Name, "Administrator")))
                        {
                            Response.Redirect("~/Admin/managesite.aspx");
                        }
                        else if ((Roles.IsUserInRole(Page.User.Identity.Name, "Staff")))
                        {
                            Response.Redirect("~/Staff/ViewSchdList.aspx");
                        }
                        else
                        {
                            Response.Redirect("~/UnauthorizedAccess.aspx");
                        }
                    }
                    else
                    {
                        BindQuestions();
                        getData();
                    }
                }
            }
        }
        protected void getData()
        {
            MultiView1.ActiveViewIndex = 0;
            SqlDataSource23.DataBind();
            DataTable dt = new DataTable();
            DataSourceSelectArguments args = new DataSourceSelectArguments();
            DataView view = (DataView)SqlDataSource23.Select(args);
            dt = view.ToTable();
            bool checkRow_isempty = false;
            if (dt.Rows.Count > 0)
            {
                foreach (var value in dt.Rows[0].ItemArray)
                {
                    if (!string.IsNullOrEmpty(value.ToString()))
                    {
                        checkRow_isempty = true;
                    }
                    else
                    {
                        checkRow_isempty = false;
                        break;
                    }
                }
                if (checkRow_isempty)
                {
                    if (Convert.ToInt32(dt.Rows[0]["SchID"].ToString()) == Convert.ToInt32(hfSchdId.Value))
                    {
                        foreach (DataColumn column in dt.Columns)
                        {
                            if ((column.ColumnName.Equals("SchID")) || (column.ColumnName.Equals("HV_Survey")) || (column.ColumnName.Equals("HV_Interview")))
                            {

                            }
                            else
                            {
                                string colName = column.ColumnName.Substring(0, 2);
                                ContentPlaceHolder cp = this.Master.Master.FindControl("ContentPlaceHolder1") as ContentPlaceHolder;
                                ContentPlaceHolder cph = cp.FindControl("NesterContent") as ContentPlaceHolder;
                                if (column.ColumnName == colName + "_S")
                                {
                                    int ColName_value = Convert.ToInt32(dt.Rows[0][column.ColumnName].ToString());
                                    switch (ColName_value)
                                    {
                                        case 1:
                                            {
                                                CheckBox chkBxName = cph.FindControl("Chkbx_score_" + colName + "_1") as CheckBox;
                                                chkBxName.Checked = true;
                                                break;
                                            }
                                        case 2:
                                            {
                                                CheckBox chkBxName = cph.FindControl("Chkbx_score_" + colName + "_2") as CheckBox;
                                                chkBxName.Checked = true;
                                                break;
                                            }
                                        case 3:
                                            {
                                                CheckBox chkBxName = cph.FindControl("Chkbx_score_" + colName + "_3") as CheckBox;
                                                chkBxName.Checked = true;
                                                break;
                                            }
                                        case 4:
                                            {
                                                CheckBox chkBxName = cph.FindControl("Chkbx_score_" + colName + "_4") as CheckBox;
                                                chkBxName.Checked = true;
                                                break;
                                            }
                                        case 5:
                                            {
                                                CheckBox chkBxName = cph.FindControl("Chkbx_score_" + colName + "_5") as CheckBox;
                                                chkBxName.Checked = true;
                                                break;
                                            }
                                        case 6:
                                            {
                                                CheckBox chkBxName = cph.FindControl("Chkbx_score_" + colName + "_6") as CheckBox;
                                                chkBxName.Checked = true;
                                                break;
                                            }
                                        case 7:
                                            {
                                                CheckBox chkBxName = cph.FindControl("Chkbx_score_" + colName + "_7") as CheckBox;
                                                chkBxName.Checked = true;
                                                break;
                                            }
                                    }
                                }
                                else
                                {
                                    int ColName_value = Convert.ToInt32(dt.Rows[0][column.ColumnName].ToString());
                                    int colCount = Convert.ToInt32(column.ColumnName.Substring(2, 1));
                                    switch (ColName_value)
                                    {
                                        case 1:
                                            {
                                                CheckBox chkBxName = cph.FindControl("Chkbx_" + colName + "_" + colCount + "_1") as CheckBox;
                                                chkBxName.Checked = true;
                                                break;
                                            }
                                        case 3:
                                            {
                                                CheckBox chkBxName = cph.FindControl("Chkbx_" + colName + "_" + colCount + "_2") as CheckBox;
                                                chkBxName.Checked = true;
                                                break;
                                            }
                                        case 5:
                                            {
                                                CheckBox chkBxName = cph.FindControl("Chkbx_" + colName + "_" + colCount + "_3") as CheckBox;
                                                chkBxName.Checked = true;
                                                break;
                                            }
                                        case 7:
                                            {
                                                CheckBox chkBxName = cph.FindControl("Chkbx_" + colName + "_" + colCount + "_4") as CheckBox;
                                                chkBxName.Checked = true;
                                                break;
                                            }
                                    }
                                }
                            }
                        }
                    }
                }
                else
                {
                    MultiView1.ActiveViewIndex = 1;
                    Label lblmsg = new Label();
                    lblmsg.Text = "<h2>Sorry, Compile Failed! There are no records to display. Thank You!</h2>";
                    PlaceHolder1.Controls.Add(lblmsg);
                }
            }
            else
            {
                MultiView1.ActiveViewIndex = 1;
                Label lblmsg = new Label();
                lblmsg.Text = "<h2>Sorry, Compile Failed! There are no records to display. Thank You!</h2>";
                PlaceHolder1.Controls.Add(lblmsg);
            }
        }

        private void lnkbtnClick(object sender, EventArgs e)
        {
            Response.Redirect("~/EnterData/default.aspx");
        }

        protected void BindQuestions()
        {
            Piqri_dsTableAdapters.PIQRIToolQuestionTableAdapter import_questions_ds = new Piqri_dsTableAdapters.PIQRIToolQuestionTableAdapter();
             DataTable dt = new DataTable();
             dt = import_questions_ds.GetData();
             Label lbl = new Label();
             for (int x = 0; x < dt.Rows.Count; x++)
             {
                 ContentPlaceHolder cp = this.Master.Master.FindControl("ContentPlaceHolder1") as ContentPlaceHolder;
                 ContentPlaceHolder cph = cp.FindControl("NesterContent") as ContentPlaceHolder;
                 //Content con = cph.FindControl("Content2") as Content;
                 lbl = cph.FindControl(dt.Rows[x]["LabelID"].ToString().Trim()) as Label;
                 lbl.Text = dt.Rows[x]["Question"].ToString().Trim();
             }
        }

        protected void commentInsert(string sqlName, string txtCommentName, string txtErrorName)
        {
            ContentPlaceHolder cp = this.Master.Master.FindControl("ContentPlaceHolder1") as ContentPlaceHolder;
            ContentPlaceHolder cph = cp.FindControl("NesterContent") as ContentPlaceHolder;
            var CommentBx = cph.FindControl(txtCommentName) as TextBox;
            var placeholdError = cph.FindControl(txtErrorName) as PlaceHolder;
            Label ErrorBx = new Label();
            string sqlquerycheckrow = "  SELECT Schd_id FROM [ISBEPI_DEV].[dbo].[PIQRI_Comments] WHERE Schd_ID ='" + hfSchdId.Value + "'";
            DataTable dt = DBHelper.GetDataTable(sqlquerycheckrow);
            if (dt.Rows.Count < 1)
            {
                dsTableAdapters.PIQRI_CommentsTableAdapter CommentsTA = new dsTableAdapters.PIQRI_CommentsTableAdapter();
                row = ds.PIQRI_Comments.NewRow();
                row["Schd_ID"] = hfSchdId.Value;
                ds.PIQRI_Comments.Rows.Add(row);
                CommentsTA.Update(row);
            }
            if ((Roles.IsUserInRole(Page.User.Identity.Name, "Administrator")) || (Roles.IsUserInRole(Page.User.Identity.Name, "Staff")))
            {
                string sqlInsert = "UPDATE [ISBEPI_DEV].[dbo].[PIQRI_Comments] SET [ErikosnDate_"+sqlName+"]='" + DateTime.Now + "',"
                + " EriksonComments_" + sqlName + "='" + CommentBx.Text + "' WHERE [Schd_ID] ='" + hfSchdId.Value + "';";
                int count = DBHelper.ExecuteSQL(sqlInsert);
                if (count == 1)
                {                   
                    string msg = "<h4 style='background-color:green; color:white; width:initial; text-align:center;'>Success! Your message has been updated/submitted</h4>";
                    ErrorBx.Text = msg;
                    placeholdError.Controls.Add(ErrorBx);
                }
                else
                {                    
                    string strMsg = "<h4 style='background-color:red; color:white; width:inherit; text-align:center;'>An error has occurred. We apologise for any inconvenience this may have caused you. Please try again later.</h4>";
                    ErrorBx.Text = strMsg;
                    placeholdError.Controls.Add(ErrorBx);
                }
            }
            else if ((Roles.IsUserInRole(Page.User.Identity.Name, "ISBE Consultant")))
            {
                string sqlInsert = "UPDATE [ISBEPI_DEV].[dbo].[PIQRI_Comments] SET [ISBEDate_" + sqlName + "] ='" + DateTime.Now + "',"
               + " [ISBEComments_" + sqlName + "] ='" + CommentBx.Text + "' WHERE [Schd_ID] ='" + hfSchdId.Value + "';";
                int count = DBHelper.ExecuteSQL(sqlInsert);
                if (count == 1)
                {                   
                    string msg = "<h4 style='background-color:green; color:white; width:inherit; text-align:center;'>Success! Your message has been updated/submitted</h4>";
                    ErrorBx.Text = msg;
                    placeholdError.Controls.Add(ErrorBx);
                }
                else
                {                   
                    string strMsg = "<h4 style='background-color:red; color:white; width:inherit; text-align:center;'>An error has occurred. We apologise for any inconvenience this may have caused you. Please try again later.</h4>";
                    ErrorBx.Text = strMsg;
                    placeholdError.Controls.Add(ErrorBx);
                }
            }
            else if ((Roles.IsUserInRole(Page.User.Identity.Name, "Program Site Director")))
            {
                string sqlInsert = "UPDATE [ISBEPI_DEV].[dbo].[PIQRI_Comments] SET [SiteDate_" + sqlName + "] ='" + DateTime.Now + "',"
             + " [SiteComments_" + sqlName + "] ='" + CommentBx.Text + "' WHERE [Schd_ID] ='" + hfSchdId.Value + "';";
                int count = DBHelper.ExecuteSQL(sqlInsert);
                if (count == 1)
                {                    
                    string msg = "<h4 style='background-color:green; color:white; width:inherit; text-align:center;'>Success! Your message has been updated/submitted</h4>";
                    ErrorBx.Text = msg;
                    placeholdError.Controls.Add(ErrorBx);
                }
                else
                {                    
                    string strMsg = "<h4 style='background-color:red; color:white; width:inherit; text-align:center;'>An error has occurred. We apologise for any inconvenience this may have caused you. Please try again later.</h4>";
                    ErrorBx.Text = strMsg;
                    placeholdError.Controls.Add(ErrorBx);
                }
            }
            else
            {                
                string strMsg = "<h4 style='background-color:red; color:white; width:inherit; text-align:center;'>An error has occurred. We apologise for any inconvenience this may have caused you. Please try again later.</h4>";
                ErrorBx.Text = strMsg;
                placeholdError.Controls.Add(ErrorBx);
            }
        }

        protected void lnlSubmitA1_Click(object sender, EventArgs e)
        {
            commentInsert("A1","txtComment_A1", "plcError_A1");
            SqlDataSource1.DataBind();
            FormView1.DataBind();

        }

        protected void lnkSubmitA2_Click(object sender, EventArgs e)
        {
            commentInsert("A2","txtComment_A2", "plcError_A2");
            SqlDataSource2.DataBind();
            FormView2.DataBind();
        }

        protected void lnkSubmitA3_Click(object sender, EventArgs e)
        {
            commentInsert("A3","txtComment_A3", "plcError_A3");
            SqlDataSource3.DataBind();
            FormView3.DataBind();
        }

        protected void lnksubmitA4_Click(object sender, EventArgs e)
        {
            commentInsert("A4", "txtComment_A4", "plcError_A4");
            SqlDataSource4.DataBind();
            FormView4.DataBind();
        }

        protected void lnksubmitB1_Click(object sender, EventArgs e)
        {
            commentInsert("B1","txtComment_B1", "plcError_B1");
            SqlDataSource5.DataBind();
            FormView5.DataBind();
        }

        protected void lnkSubmitB2_Click(object sender, EventArgs e)
        {
            commentInsert("B2","txtComment_B2", "plcError_B2");
            SqlDataSource6.DataBind();
            FormView6.DataBind();
        }     
       
        protected void lnkSubmitB3_Click(object sender, EventArgs e)
        {
            commentInsert("B3","txtComment_B3", "plcError_B3");
            SqlDataSource7.DataBind();
            FormView7.DataBind();
        }

        protected void lnkSubmitB4_Click(object sender, EventArgs e)
        {
            commentInsert("B4","txtComment_B4", "plcError_B4");
            SqlDataSource8.DataBind();
            FormView8.DataBind();
        }

        protected void lnkSubmitB5_Click(object sender, EventArgs e)
        {
            commentInsert("B5","txtComment_B5", "plcError_B5");
            SqlDataSource9.DataBind();
            FormView9.DataBind();
        }

        protected void lnkSubmitC1_Click(object sender, EventArgs e)
        {
            commentInsert("C1","txtComment_C1", "plcError_C1");
            SqlDataSource10.DataBind();
            FormView10.DataBind();
        }

        protected void lnkSubmitC2_Click(object sender, EventArgs e)
        {
            commentInsert("C2","txtComment_C2", "plcError_C2");
            SqlDataSource11.DataBind();
            FormView11.DataBind();
        }

        protected void lnkSubmitC3_Click(object sender, EventArgs e)
        {
            commentInsert("C3","txtComment_C3", "plcError_C3");
            SqlDataSource12.DataBind();
            FormView12.DataBind();
        }

        protected void lnkSubmitC4_Click(object sender, EventArgs e)
        {
            commentInsert("C4","txtComment_C4", "plcError_C4");
            SqlDataSource13.DataBind();
            FormView13.DataBind();
        }

        protected void lnkSubmitD1_Click(object sender, EventArgs e)
        {
            commentInsert("D1","txtComment_D1", "plcError_D1");
            SqlDataSource14.DataBind();
            FormView14.DataBind();
        }

        protected void lnkSubmitD2_Click(object sender, EventArgs e)
        {
            commentInsert("D2","txtComment_D2", "plcError_D2");
            SqlDataSource15.DataBind();
            FormView15.DataBind();
        }

        protected void lnkSubmitD3_Click(object sender, EventArgs e)
        {
            commentInsert("D3","txtComment_D3", "plcError_D3");
            SqlDataSource16.DataBind();
            FormView16.DataBind();
        }

        protected void lnkSubmitD4_Click(object sender, EventArgs e)
        {
            commentInsert("D4","txtComment_D4", "plcError_D4");
            SqlDataSource17.DataBind();
            FormView17.DataBind();
        }

        protected void lnkSubmitD5_Click(object sender, EventArgs e)
        {
            commentInsert("D5","txtComment_D5", "plcError_D5");
            SqlDataSource18.DataBind();
            FormView18.DataBind();
        }

        protected void lnkSubmitD6_Click(object sender, EventArgs e)
        {
            commentInsert("D6","txtComment_D6", "plcError_D6");
            SqlDataSource19.DataBind();
            FormView19.DataBind();
        }

        protected void lnkSubmitE1_Click(object sender, EventArgs e)
        {
            commentInsert("E1","txtComment_E1", "plcError_E1");
            SqlDataSource20.DataBind();
            FormView20.DataBind();
        }

        protected void lnkSubmitE2_Click(object sender, EventArgs e)
        {
            commentInsert("E1","txtComment_E2", "plcError_E2");
            SqlDataSource21.DataBind();
            FormView21.DataBind();
        }

        protected void lnkSubmitE3_Click(object sender, EventArgs e)
        {
            commentInsert("E3","txtComment_E3", "plcError_E3");
            SqlDataSource22.DataBind();
            FormView22.DataBind();
        }

       
        

      
    }
}