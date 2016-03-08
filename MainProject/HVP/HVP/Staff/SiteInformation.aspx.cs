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
    public partial class SiteInformation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
                hfsiteid.Value = Session["Site_ID"] == null ? "" : Session["Site_ID"].ToString();
                hfSchdId.Value = Session["Schd_Id"] == null ? "" : Session["Schd_Id"].ToString();
                if (!IsPostBack)
                {
                    getSiteinfo();
                }
        }
        protected void getSiteinfo()
        {
            if (hfsiteid.Value.Length > 0)
            {
                string sqlquery = "SELECT * FROM [ISBEPI_DEV].[dbo].[Sites] WHERE SiteID =" + hfsiteid.Value;
                DataTable dt = DBHelper.GetDataTable(sqlquery);
                txtEmail_Edit.Text = dt.Rows[0]["Email_address"].ToString();
                txtMainPhone_Edit.Text = dt.Rows[0]["Main_PhoneNumber"].ToString();
                txtPhone_Edit.Text = dt.Rows[0]["PhoneNumber"].ToString();
                txtSiteAddress_Edit.Text = dt.Rows[0]["Site_Address"].ToString();
                txtCity_Edit.Text = dt.Rows[0]["City"].ToString();
                txtState_Edit.Text = dt.Rows[0]["State"].ToString();
                txtZip_Edit.Text = dt.Rows[0]["ZipCode"].ToString();
                txtNum_Hv_Visitor_Edit.Text = dt.Rows[0]["Num_of_HV"].ToString();
                lblSitename.Text = dt.Rows[0]["Sites"].ToString();
                lblProgramId.Text = dt.Rows[0]["Program_ID"].ToString();
                chkMiechv_Edit.Checked = Convert.ToBoolean(object.Equals(dt.Rows[0]["MICEHV"].ToString(), 0));
                chkMiHope_Edit.Checked = Convert.ToBoolean(object.Equals(dt.Rows[0]["MiHope"].ToString(), 0));
                chkPilot_Edit.Checked = Convert.ToBoolean(object.Equals(dt.Rows[0]["Pilot"].ToString(), 0));
                chkValidation_research_Edit.Checked = Convert.ToBoolean(object.Equals(dt.Rows[0]["Validation_Research"].ToString(), 0));


                txtEmail_Update.Text = dt.Rows[0]["Email_address"].ToString();
                txtMainPhone_Update.Text = dt.Rows[0]["Main_PhoneNumber"].ToString();
                txtPhone_Update.Text = dt.Rows[0]["PhoneNumber"].ToString();
                txtSiteAddress_Update.Text = dt.Rows[0]["Site_Address"].ToString();
                txtCity_Update.Text = dt.Rows[0]["City"].ToString();
                txtState_Update.Text = dt.Rows[0]["State"].ToString();
                txtZip_Update.Text = dt.Rows[0]["ZipCode"].ToString();
                txtNum_Hv_Visitor_Update.Text = dt.Rows[0]["Num_of_HV"].ToString();
                lblSitename.Text = dt.Rows[0]["Sites"].ToString();
                lblProgramId.Text = dt.Rows[0]["Program_ID"].ToString();
                chkMiechv_Update.Checked = Convert.ToBoolean(object.Equals(dt.Rows[0]["MICEHV"].ToString(), 0));
                chkMiHope_Update.Checked = Convert.ToBoolean(object.Equals(dt.Rows[0]["MiHope"].ToString(), 0));
                chkPilot_Update.Checked = Convert.ToBoolean(object.Equals(dt.Rows[0]["Pilot"].ToString(), 0));
                chkValidation_research_Update.Checked = Convert.ToBoolean(object.Equals(dt.Rows[0]["Validation_Research"].ToString(), 0));
            }
            //monitor         
            if (hfSchdId.Value.Length > 0)
            {
                string sqlQuery_schd = "  SELECT UN.Name, ST.Sites, SCHD.VisitDate, SCHD.Schd_ID, SCHD.Status,ST.SiteID,UN2.Name as Second_Name "
                       + "FROM [ISBEPI_DEV].[dbo].[Scheduling] SCHD JOIN [ISBEPI_DEV].[dbo].[UserNames] UN "
                       + "ON UN.NameID = SCHD.NameID JOIN [ISBEPI_DEV].[dbo].[Sites] ST "
                    + "ON ST.SiteID = SCHD.SiteID LEFT JOIN [ISBEPI_DEV].[dbo].[UserNames] UN2 ON SCHD.Second_NameID = UN2.NameID WHERE SCHD.Schd_ID =" + hfSchdId.Value;
                DataTable dt_schd = DBHelper.GetDataTable(sqlQuery_schd);

                lblPrimaryMonitor.Text = dt_schd.Rows[0]["Name"].ToString();
                lblSecondaryMonitor.Text = dt_schd.Rows[0]["Second_Name"].ToString();
                if (dt_schd.Rows[0]["VisitDate"].ToString().Length > 0)
                {
                    lblVisitDate.Text = DateTime.Parse(dt_schd.Rows[0]["VisitDate"].ToString()).ToShortDateString();
                }
            }

            if (!Roles.IsUserInRole("Administrator"))
            {
                MultiView1.Visible = false;
                primaryMonitor.Visible = true;
                secondarymonitor.Visible = true;
                lnkbtnChangeMonitor.Visible = false;
            }
        }
        protected void lnkbtnSchedule_Click(object sender, EventArgs e)
        {
            visit_date.Visible = false;
            lnkbtnSchedule.Visible = false;
            MultiView2.Visible = true;
            MultiView2.ActiveViewIndex = 0;
        }
        protected void lnkbtnChangeMonitor_Click(object sender, EventArgs e)
        {
            if (Roles.IsUserInRole("Administrator"))
            {
                primaryMonitor.Visible = false;
                secondarymonitor.Visible = false;
                lnkbtnChangeMonitor.Visible = false;
                MultiView1.Visible = true;
                MultiView1.ActiveViewIndex = 0;
            }
            else
            {
                MultiView1.Visible = false;
                primaryMonitor.Visible = true;
                secondarymonitor.Visible = true;
                lnkbtnChangeMonitor.Visible = false;
            }
        }
        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            if (Cal.SelectedDate <= (Cal.VisibleDate = DateTime.Now.AddDays(14)))
            {
                string strMsg = "<h3 class='errormsg'>Please Schedule visit two weeks from today; Please Select a Date after " + DateTime.Now.AddDays(14).ToShortDateString() + "</h3>";
                Label lbl = new Label();
                lbl.Text = strMsg;
                PHError2.Controls.Add(lbl);
                //System.Web.HttpContext.Current.Response.Write("<Script Language='JavaScript'>window.alert('" + strMsg + "');</script>");
            }
            else
            {
                txtCal.Text = Cal.SelectedDate.ToLongDateString();
                Cal.SelectedDates.Clear();
            }
        }
        protected void lnkbtnEdit_Click(object sender, EventArgs e)
        {
            Edit.Visible = false;
            MultiView3.ActiveViewIndex = 0;
            MultiView3.Visible = true; 
        }
        protected void lnkBtnCancel_Click(object sender, EventArgs e)
        {
            Edit.Visible = true;
            MultiView3.Visible = false;
        }
        protected void lnkMonitor_Cancel_Click(object sender, EventArgs e)
        {
            primaryMonitor.Visible = true;
            secondarymonitor.Visible = true;
            lnkbtnChangeMonitor.Visible = true;
            MultiView1.Visible = false;
        }
        protected void lnkbtnAddSchedule_Cancel_Click(object sender, EventArgs e)
        {
            visit_date.Visible = true;
            lnkbtnSchedule.Visible = true;
            MultiView2.Visible = false;
        }

        protected void lnkbtnUpdate_Click(object sender, EventArgs e)
        {
            string sqlupdateInfo = " UPDATE Sites SET Main_PhoneNumber='" + txtMainPhone_Update.Text + "', " +
                        "PhoneNumber='" + txtPhone_Update.Text + "',Email_address='" + txtEmail_Update.Text + "'," +
                        "Site_Address='" + txtSiteAddress_Update.Text + "', City='" + txtCity_Update.Text + "',State ='" + txtState_Update.Text + "'," +
                        "ZipCode='" + txtZip_Update.Text + "',Num_of_HV='" + txtNum_Hv_Visitor_Update.Text + "'," +
                            "MICEHV='" + chkMiechv_Update.Checked + "', MiHope='" + chkMiHope_Update.Checked + "'," +
                        " Pilot='" + chkPilot_Update.Checked + "',Validation_Research='" + chkValidation_research_Update.Checked + "'" +
                        " WHERE SiteID=" + hfsiteid.Value;
            int count = DBHelper.ExecuteSQL(sqlupdateInfo);
            if (count == 1)
            {
                Label lblError = new Label();
                lblError.Text = "<h3 class='errormsgSuccess'>Update Successful</h3>";
                phErrorUpdate.Controls.Add(lblError);
                Edit.Visible = true;
                MultiView3.Visible = false;
                getSiteinfo();
            }
            else
            {
                Label lblError = new Label();
                lblError.Text = "<h3 class='errormsg'>Update not Successful</h3>";
                phErrorUpdate.Controls.Add(lblError);
            }
        }

        protected void lnkaddChageMonitor_Click(object sender, EventArgs e)
        {
            int count = 0;
            int NewSchdid = 0;
            if (hfSchdId.Value.Length < 1)
            {
                string siteyearquery = "SELECT * FROM Sites WHERE SiteID =" + hfsiteid.Value;
                DataTable dt = DBHelper.GetDataTable(siteyearquery);

                string year = dt.Rows[0]["Assigned_Yr"].ToString();
                if (year.Length > 0)
                {

                    if ((!string.IsNullOrEmpty(ddlPrimaryMonitor.SelectedValue)) && (!string.IsNullOrEmpty(ddlSecondaryMonitor.SelectedValue)))
                    {
                        string sqlInsert = string.Format("INSERT INTO [ISBEPI_DEV].[dbo].[Scheduling] ([SiteID],[NameID],[Status],[LastActivity],[Second_NameID])"
                                + "VALUES('{0}', '{1}', '{2}','{3}','{4}') SELECT SCOPE_IDENTITY()", hfsiteid.Value, ddlPrimaryMonitor.SelectedValue, "ACTIVE", DateTime.Now, ddlSecondaryMonitor.SelectedValue);
                        NewSchdid = DBHelper.ExecuteSQLSiteInfo(sqlInsert);
                        Session["Schd_Id"] = NewSchdid.ToString();
                       
                    }
                    else if (!string.IsNullOrEmpty(ddlPrimaryMonitor.SelectedValue))
                    {
                        string sqlInsert = string.Format("INSERT INTO [ISBEPI_DEV].[dbo].[Scheduling] ([SiteID],[NameID],[Status],[LastActivity])"
                               + "VALUES('{0}', '{1}', '{2}','{3}') SELECT SCOPE_IDENTITY()", hfsiteid.Value, ddlPrimaryMonitor.SelectedValue, "ACTIVE", DateTime.Now);
                        NewSchdid = DBHelper.ExecuteSQLSiteInfo(sqlInsert);
                        Session["Schd_Id"] = NewSchdid.ToString();
                    }
                }
                else
                {

                    int july = 7;
                    int date = DateTime.Now.Year;
                    int month = DateTime.Now.Month;
                    if ((month > july) || (month == july))
                    {
                        string yearupdate = "UPDATE Sites SET Assigned_Yr='" + date + "'";
                    }
                    else
                    {
                        date = date - 1;
                        string yearupdate = "UPDATE Sites SET Assigned_Yr='" + date + "'";
                    }


                    if ((!string.IsNullOrEmpty(ddlPrimaryMonitor.SelectedValue)) && (!string.IsNullOrEmpty(ddlSecondaryMonitor.SelectedValue)))
                    {
                        string sqlInsert = string.Format("INSERT INTO [ISBEPI_DEV].[dbo].[Scheduling] ([SiteID],[NameID],[Status],[LastActivity],[Second_NameID])"
                                + "VALUES('{0}', '{1}', '{2}','{3}','{4}') SELECT SCOPE_IDENTITY()", hfsiteid.Value, ddlPrimaryMonitor.SelectedValue, "ACTIVE", DateTime.Now, ddlSecondaryMonitor.SelectedValue);
                        NewSchdid = DBHelper.ExecuteSQLSiteInfo(sqlInsert);
                        Session["Schd_Id"] = NewSchdid.ToString();
                    }
                    else if (!string.IsNullOrEmpty(ddlPrimaryMonitor.SelectedValue))
                    {
                        string sqlInsert = string.Format("INSERT INTO [ISBEPI_DEV].[dbo].[Scheduling] ([SiteID],[NameID],[Status],[LastActivity])"
                               + "VALUES('{0}', '{1}', '{2}','{3}') SELECT SCOPE_IDENTITY()", hfsiteid.Value, ddlPrimaryMonitor.SelectedValue, "ACTIVE", DateTime.Now);
                        NewSchdid = DBHelper.ExecuteSQLSiteInfo(sqlInsert);
                        Session["Schd_Id"] = NewSchdid.ToString();
                    }
                }
            }
            else
            {

                if ((!string.IsNullOrEmpty(ddlPrimaryMonitor.SelectedValue)) && (!string.IsNullOrEmpty(ddlSecondaryMonitor.SelectedValue)))
                {
                    string sqlUpdateNameID = " UPDATE Scheduling SET NameID='" + ddlPrimaryMonitor.SelectedValue + "', Second_NameID ='" + ddlSecondaryMonitor.SelectedValue + "' WHERE Schd_ID=" + hfSchdId.Value;
                    count = DBHelper.ExecuteSQL(sqlUpdateNameID);
                }
                else if (!string.IsNullOrEmpty(ddlPrimaryMonitor.SelectedValue))
                {
                    string sqlUpdateNameID = " UPDATE Scheduling SET NameID='" + ddlPrimaryMonitor.SelectedValue + "' WHERE Schd_ID=" + hfSchdId.Value;
                    count = DBHelper.ExecuteSQL(sqlUpdateNameID);
                }
                else
                {
                    string sqlUpdateNameID = " UPDATE Scheduling SET Second_NameID='" + ddlSecondaryMonitor.SelectedValue + "' WHERE Schd_ID=" + hfSchdId.Value;
                    count = DBHelper.ExecuteSQL(sqlUpdateNameID);
                }
            }
            if (count == 1 || NewSchdid != 0)
            {
                Label lblError = new Label();
                lblError.Text = "<h3 class='errormsgSuccess'>Update Successful</h3>";
                phErrorUpdate.Controls.Add(lblError);
                primaryMonitor.Visible = true;
                secondarymonitor.Visible = true;
                lnkbtnChangeMonitor.Visible = true;
                MultiView1.Visible = false;
                getSiteinfo();
            }
            else
            {
                Label lblError = new Label();
                lblError.Text = "<h3 class='errormsg'>Update not Successful</h3>";
                phErrorUpdate.Controls.Add(lblError);
            }
        }

        protected void lnkbtnAddSchedule_Click(object sender, EventArgs e)
        {         
                if (hfSchdId.Value.Length > 0)
                {
                    string sqlQuery_schd = "  SELECT UN.Name, ST.Sites, SCHD.VisitDate, SCHD.Schd_ID, SCHD.Status,ST.SiteID,UN2.Name as Second_Name "
                       + "FROM [ISBEPI_DEV].[dbo].[Scheduling] SCHD JOIN [ISBEPI_DEV].[dbo].[UserNames] UN "
                       + "ON UN.NameID = SCHD.NameID JOIN [ISBEPI_DEV].[dbo].[Sites] ST "
                    + "ON ST.SiteID = SCHD.SiteID LEFT JOIN [ISBEPI_DEV].[dbo].[UserNames] UN2 ON SCHD.Second_NameID = UN2.NameID WHERE SCHD.Schd_ID =" + hfSchdId.Value;
                    DataTable dt_schd = DBHelper.GetDataTable(sqlQuery_schd);
                    if (!string.IsNullOrEmpty(dt_schd.Rows[0]["Name"].ToString()))
                    {
                        DateTime date = Convert.ToDateTime(txtCal.Text).Date;
                        string sqlUpdate = "UPDATE [ISBEPI_DEV].[dbo].[Scheduling] SET VisitDate ='" + date.ToShortDateString() + "' , [SiteVistScheduled]= 'TRUE',[LastActivity] = '" + DateTime.Now + "' WHERE Schd_ID =" + hfSchdId.Value;
                        int count = DBHelper.ExecuteSQL(sqlUpdate);
                        if (count == 1)
                        {
                            Label lblError = new Label();
                            lblError.Text = "<h3 class='errormsgSuccess'>Update Successful</h3>";
                            phErrorUpdate.Controls.Add(lblError);
                            visit_date.Visible = true;
                            lnkbtnSchedule.Visible = true;
                            MultiView2.Visible = false;
                            getSiteinfo();
                        }
                        else
                        {
                            Label lblError = new Label();
                            lblError.Text = "<h3 class='errormsg'>Update not Successful</h3>";
                            phErrorUpdate.Controls.Add(lblError);
                        }
                    }
                }
                else
                {
                    Label lblError = new Label();
                    lblError.Text = "<h3 class='errormsg'>Update not Successful; No Monitor Assigned.</h3>";
                    phErrorUpdate.Controls.Add(lblError);
                }
            //else
            //{
            //    DateTime date = Convert.ToDateTime(txtCal.Text).Date;
            //    string sqlinsert = "INSERT INTO [ISBEPI_DEV].[dbo].[Scheduling] (SiteID, VisitDate, SiteVistCompleted) VALUES ('"+hfsiteid.Value+"','" + date.ToShortDateString() + "','TRUE')";
            //    int count = DBHelper.ExecuteSQL(sqlinsert);
            //    if (count == 1)
            //    {
            //        Label lblError = new Label();
            //        lblError.Text = "<h3 class='errormsgSuccess'>Update Successful</h3>";
            //        phErrorUpdate.Controls.Add(lblError);
            //        visit_date.Visible = true;
            //        lnkbtnSchedule.Visible = true;
            //        MultiView2.Visible = false;
            //        getSiteinfo();
            //    }
            //    else
            //    {
            //        Label lblError = new Label();
            //        lblError.Text = "<h3 class='errormsg'>Update not Successful</h3>";
            //        phErrorUpdate.Controls.Add(lblError);
            //    }
            //}
        }

        
    }
}