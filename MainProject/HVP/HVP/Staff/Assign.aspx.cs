using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Security;
using System.Web.Security;


namespace HVP.Admin
{
    public partial class TimeSchedulig : System.Web.UI.Page
    {
        public string SuggestionList = "";
        string visitdate; Label lblSchdID = new Label();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               // SiteID();
                setDefaultView();
            }
        }

       
        protected void SiteID()
        {
            //userNames
            string sqlqueryUser = "SELECT UN.Name, UN.NameID FROM "
            + "[ISBEPI_DEV].[dbo].[UserNames] UN "
            + "JOIN [ISBEPI_DEV].[dbo].[Staff] ST ON UN.NameID = ST.NameID "
            + "JOIN aspnet_Membership Member ON Member.UserId = UN.UserId "
            + "WHERE (ST.RoleId = 'E7F4D35C-8C43-48A0-99E1-8CF724F80ABD' OR ST.NameID=39) AND Member.IsApproved =1 ORDER BY Name";

            DataTable dtUsers = DBHelper.GetDataTable(sqlqueryUser);
            ddluser.DataSource = dtUsers;
            ddluser.DataTextField = "Name";
            ddluser.DataValueField = "NameID";
            ddluser.DataBind();
            ddluser.Items.Insert(0, new ListItem(String.Empty, String.Empty));
            ddluser.SelectedIndex = 0;

            // Second Monitor ----------- We have option for-------------------- 
            //ddlSeconduser.DataSource = dtUsers;
            //ddlSeconduser.DataTextField = "Name";
            //ddlSeconduser.DataValueField = "NameID";
            //ddlSeconduser.DataBind();
            //ddlSeconduser.Items.Insert(0, new ListItem(String.Empty, String.Empty));
            //ddlSeconduser.SelectedIndex = 0;

            //Program Name
            string sqlProgramName = "SELECT * FROM [ISBEPI_DEV].[dbo].[Program] ORDER BY PROGRAM";
            DataTable dtPrograms = DBHelper.GetDataTable(sqlProgramName);

            //for (int i = 0; i < dtPrograms.Rows.Count; i++)
            //{
            //    if (string.IsNullOrEmpty(SuggestionList))
            //    {
            //        SuggestionList += "\"" + dtPrograms.Rows[i]["Program"].ToString() + "\"";
            //    }
            //    else
            //    {
            //        SuggestionList += ", \"" + dtPrograms.Rows[i]["Program"].ToString() + "\"";
            //    }
            //}
                ddlProgramName.DataSource = dtPrograms;
            ddlProgramName.DataTextField = "Program";
            ddlProgramName.DataValueField = "Program_ID";
            ddlProgramName.DataBind();
            ddlProgramName.Items.Insert(0, new ListItem(String.Empty, String.Empty));
            ddlProgramName.SelectedIndex = 0;

            // Site Name
            string sqlquerySite = "SELECT * FROM [ISBEPI_DEV].[dbo].[Sites] ORDER BY Sites";
            DataTable dtSiteName = DBHelper.GetDataTable(sqlquerySite);
            ddlSiteName.DataSource = dtSiteName;
            ddlSiteName.DataTextField = "Sites";
            ddlSiteName.DataValueField = "SiteID";
            ddlSiteName.DataBind();
            ddlSiteName.Items.Insert(0, new ListItem(String.Empty, String.Empty));
            ddlSiteName.SelectedIndex = 0;
        }

     
        protected void ddlProgramName_SelectedIndexChanged(object sender, EventArgs e)
        {           
                // Site Name
                string sqlquerySite = "  SELECT [ISBEPI_DEV].[dbo].[Sites].SiteID,[ISBEPI_DEV].[dbo].[Sites].Sites  FROM [ISBEPI_DEV].[dbo].[Sites] JOIN"
                    + "[ISBEPI_DEV].[dbo].[Program] ON [ISBEPI_DEV].[dbo].[Program].Program_ID = [ISBEPI_DEV].[dbo].[Sites].Program_ID WHERE [ISBEPI_DEV].[dbo].[Sites].Program_ID ='" + ddlProgramName.SelectedValue + "' ORDER BY SITES;";
                DataTable dtSiteName = DBHelper.GetDataTable(sqlquerySite);
                ddlSiteName.DataSource = dtSiteName;
                ddlSiteName.DataTextField = "Sites";
                ddlSiteName.DataValueField = "SiteID";
                ddlSiteName.DataBind();
                UpdatePanel1.DataBind();
                //ddlSiteName.Items.Insert(0, new ListItem(String.Empty, String.Empty));
                //ddlSiteName.SelectedIndex = 0;          
        }

        protected void setDefaultView()
        {
            MultiView1.ActiveViewIndex = 0;                     
            if (Roles.IsUserInRole("Administrator"))
            {
                Assign.Visible = true;
                SiteID();
            }
            else
            {
                Assign.Visible = false;
            }
            Display();
        }
        private void Display()
        {
            
            lnkbtnConfirm.Enabled = true;
            lnkbtnEdit.Enabled = true;
            MultiView1.ActiveViewIndex = 0;
            if (Roles.IsUserInRole(Page.User.Identity.Name, "Administrator"))
            {
                string sqlquery = "SELECT UN.Name, ST.Sites, SCHD.VisitDate, SCHD.Schd_ID, SCHD.Status,ST.SiteID  "
                        + "FROM [ISBEPI_DEV].[dbo].[Scheduling] SCHD JOIN [ISBEPI_DEV].[dbo].[UserNames] UN "
                        + "ON UN.NameID = SCHD.NameID JOIN [ISBEPI_DEV].[dbo].[Sites] ST "
                    + "ON ST.SiteID = SCHD.SiteID; ";
                DataTable dt = DBHelper.GetDataTable(sqlquery);

                //if (dt.Rows.Count > 1)
                //{
                    grdConfirmation.DataSource = dt;
                    grdConfirmation.DataBind();
                //}
                //else
                //{
                //    grdConfirmation.DataSource = dt;
                //    grdConfirmation.DataBind();
                //}

            }
            else
            {
                string userID = Membership.GetUser(Page.User.Identity.Name).ProviderUserKey.ToString();
                string sqlquery = "SELECT UN.Name, ST.Sites, SCHD.VisitDate,SCHD.Schd_ID,  "
                        + "SCHD.Status, ST.SiteID FROM [ISBEPI_DEV].[dbo].[Scheduling] SCHD "
                        + "JOIN [ISBEPI_DEV].[dbo].[UserNames] UN ON UN.NameID=SCHD.[NameID] "
                    + "JOIN [ISBEPI_DEV].[dbo].[Sites] ST ON ST.SiteID = SCHD.SiteID "
                      + "WHERE UN.UserId ='" + userID + "';";
                DataTable dt = DBHelper.GetDataTable(sqlquery);

                //if (dt.Rows.Count > 1)
                //{
                    grdConfirmation.DataSource = dt;
                    grdConfirmation.DataBind();
                    //grdConfirmation.EmptyDataText = "No DATA";
                //}
                //else
                //{
                //    grdConfirmation.DataSource = dt;
                //    grdConfirmation.DataBind();
                //}
            }             
            
        }
        protected void dispalyView2info()
        {
            MultiView1.ActiveViewIndex = 1;
            toGetInfo setinfo = new toGetInfo();
            string sqlquery = "SELECT [ISBEPI_DEV].[dbo].[UserNames].Name, [ISBEPI_DEV].[dbo].[Sites].Sites, [ISBEPI_DEV].[dbo].[Scheduling].VisitDate,[ISBEPI_DEV].[dbo].[Sites].PhoneNumber,[ISBEPI_DEV].[dbo].[Sites].ZipCode, [ISBEPI_DEV].[dbo].[Sites].MICEHV,[ISBEPI_DEV].[dbo].[Scheduling].Schd_ID, [ISBEPI_DEV].[dbo].[Scheduling].Status, [ISBEPI_DEV].[dbo].[Sites].SiteID, "
                       + "[ISBEPI_DEV].[dbo].[Sites].Site_Address, [ISBEPI_DEV].[dbo].[Sites].City, [ISBEPI_DEV].[dbo].[Sites].State FROM [ISBEPI_DEV].[dbo].[Scheduling] JOIN [ISBEPI_DEV].[dbo].[UserNames] "
                       + "ON [ISBEPI_DEV].[dbo].[UserNames].NameID=[ISBEPI_DEV].[dbo].[Scheduling].[NameID] JOIN [ISBEPI_DEV].[dbo].[Sites] "
                   + "ON [ISBEPI_DEV].[dbo].[Sites].SiteID = [ISBEPI_DEV].[dbo].[Scheduling].SiteID "
                     + "WHERE [ISBEPI_DEV].[dbo].[Scheduling].Schd_ID ='" + setinfo.getSchdID() + "';";
            DataTable dt2 = DBHelper.GetDataTable(sqlquery);
            txtSiteName.Text = dt2.Rows[0]["Sites"].ToString().Replace("amp;", string.Empty);
            txtFName.Text = dt2.Rows[0]["Name"].ToString();

            string status = dt2.Rows[0]["Status"].ToString();
            string siteID = dt2.Rows[0]["SiteID"].ToString();
            string address = dt2.Rows[0]["Site_Address"].ToString();
            string city = dt2.Rows[0]["City"].ToString();
            string state = dt2.Rows[0]["State"].ToString();
            string phone = dt2.Rows[0]["PhoneNumber"].ToString();
            txtPhoneNumber.Text = phone;
            string zip = dt2.Rows[0]["ZipCode"].ToString();
            txtZipV2.Text = zip;
            bool miechv = Convert.ToBoolean(dt2.Rows[0]["MICEHV"].ToString());
            chkbxMiechv.Checked = miechv;
            txtSiteAddress.Text = address;
            txtState.Text = state;
            txtCity.Text = city;
            if (dt2.Rows[0]["VisitDate"].ToString().Length > 1)
            {
                visitdate = DateTime.Parse(dt2.Rows[0]["VisitDate"].ToString()).ToShortDateString();
                txtVisitingdate.Text = visitdate;
            }
            else
            {
                txtVisitingdate.Text = null;
            }
            toGetInfo getuserInfo = new toGetInfo();
            getuserInfo.setVlaue(txtFName.Text, siteID, txtSiteName.Text, address, city, state, visitdate, status, phone, zip, miechv);



            if (status == "Confirmed" || txtVisitingdate.Text.Length < 1)
            {
                lnkbtnConfirm.Enabled = false;
            }
            else if (status == "Closed" || txtVisitingdate.Text.Length < 1)
            {
                lnkbtnConfirm.Enabled = false;
            }
            if (Roles.IsUserInRole(Page.User.Identity.Name, "Administrator"))
            {
                lnkbtnVisiting.Enabled = true;
                if (status == "Confirmed"
                    && (DateTime.Parse(visitdate)) <= DateTime.Parse(DateTime.Now.ToShortDateString().ToString()))
                {
                    lnkbtnConfirm.Enabled = false;
                    lnkbtnVisiting.Enabled = true;
                }
                else if (status == "Closed")
                {
                    lnkbtnConfirm.Enabled = false;
                    lnkbtnVisiting.Enabled = false;
                }
            }
            else if (!Roles.IsUserInRole(Page.User.Identity.Name, "Administrator"))
            {
                lnkbtnVisiting.Enabled = false;
                if (status == "Confirmed"
                    && (DateTime.Parse(visitdate) <= DateTime.Parse(DateTime.Now.ToShortDateString().ToString())))
                {
                    lnkbtnConfirm.Enabled = false;
                    lnkbtnVisiting.Enabled = true;
                }
                else if (status == "Closed")
                {
                    lnkbtnConfirm.Enabled = false;
                    lnkbtnVisiting.Enabled = false;
                }
            }
        }
        protected void GridView1_SelectedIndexChanged(object sender, GridViewSelectEventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;

            txtSiteName.Text = grdConfirmation.Rows[e.NewSelectedIndex].Cells[2].Text.Replace("amp;", string.Empty);
            txtFName.Text = grdConfirmation.Rows[e.NewSelectedIndex].Cells[4].Text;           
           
            string status = grdConfirmation.Rows[e.NewSelectedIndex].Cells[5].Text;
            string siteID = grdConfirmation.Rows[e.NewSelectedIndex].Cells[6].Text;
            string schdID = grdConfirmation.Rows[e.NewSelectedIndex].Cells[7].Text;


            string sqlquery2 = "SELECT UN.Name, ST.Sites, ST.PhoneNumber,ST.ZipCode,  ST.MICEHV, SCHD.VisitDate, "
                       + "SCHD.Schd_ID, SCHD.Status, ST.SiteID, ST.Site_Address, ST.City, ST.State  "
                       + "FROM [ISBEPI_DEV].[dbo].[Scheduling] SCHD JOIN [ISBEPI_DEV].[dbo].[UserNames] UN ON  "
                   + " UN.NameID=SCHD.[NameID] JOIN [ISBEPI_DEV].[dbo].[Sites] ST ON ST.SiteID = SCHD.SiteID "
                        + " WHERE SCHD.Schd_ID ='" + schdID + "';";
            DataTable dt2 = DBHelper.GetDataTable(sqlquery2);
            if (dt2.Rows.Count > 0)
            {
                string address = dt2.Rows[0]["Site_Address"].ToString();
                string city = dt2.Rows[0]["City"].ToString();
                string state = dt2.Rows[0]["State"].ToString();
                txtSiteAddress.Text = address;
                txtState.Text = state;
                txtCity.Text = city;
                string phone = dt2.Rows[0]["PhoneNumber"].ToString();
                txtPhoneNumber.Text = phone;
                string zip = dt2.Rows[0]["ZipCode"].ToString();
                txtZipV2.Text = zip;
                bool miechv = Convert.ToBoolean(dt2.Rows[0]["MICEHV"].ToString());
                chkbxMiechv.Checked = miechv;
                if (dt2.Rows[0]["VisitDate"].ToString().Length > 1)
                {
                    visitdate = DateTime.Parse(dt2.Rows[0]["VisitDate"].ToString()).ToShortDateString();
                    txtVisitingdate.Text = visitdate;
                }
                else
                {
                    txtVisitingdate.Text = null;
                }
                toGetInfo getuserInfo = new toGetInfo();
                getuserInfo.setSchdID(dt2.Rows[0]["Schd_ID"].ToString());
                getuserInfo.setVlaue(txtFName.Text, siteID, txtSiteName.Text, address, city, state, visitdate, status, phone, zip, miechv);



                if (status == "Confirmed" || txtVisitingdate.Text.Length < 1)
                {

                    lnkbtnConfirm.Enabled = false;
                }
                else if (status == "Closed" || txtVisitingdate.Text.Length < 1)
                {
                    lnkbtnConfirm.Enabled = false;
                }
                if (Roles.IsUserInRole(Page.User.Identity.Name, "Administrator"))
                {
                    lnkbtnVisiting.Enabled = true;
                    if (status == "Confirmed"
                        && (DateTime.Parse(visitdate)) <= DateTime.Parse(DateTime.Now.ToShortDateString().ToString()))
                    {
                        lnkbtnConfirm.Enabled = false;
                        lnkbtnVisiting.Enabled = true;
                    }
                    else if (status == "Closed")
                    {
                        lnkbtnConfirm.Enabled = false;
                        lnkbtnVisiting.Enabled = false;
                    }
                }
                else if (!Roles.IsUserInRole(Page.User.Identity.Name, "Administrator"))
                {
                    lnkbtnVisiting.Enabled = false;
                    if (status == "Confirmed"
                        && (DateTime.Parse(visitdate) <= DateTime.Parse(DateTime.Now.ToShortDateString().ToString())))
                    {
                        lnkbtnConfirm.Enabled = false;
                        lnkbtnVisiting.Enabled = true;
                    }
                    else if (status == "Closed")
                    {
                        lnkbtnConfirm.Enabled = false;
                        lnkbtnVisiting.Enabled = false;
                    }
                }
            }         

        }      

       

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            toGetInfo setinfo = new toGetInfo();

            MultiView1.ActiveViewIndex = 2;

            txtFNameV3.Text = setinfo.getValueFname();
            txtSiteNameV3.Text = setinfo.getValueSiteName();
            txtSiteAddressV3.Text = setinfo.getValueSiteAddress();
            txtCityV3.Text = setinfo.getValueCity();
            txtStateV3.Text = setinfo.getValueState();
            txtPhoneNumberV3.Text = setinfo.getPhone();
            txtZipV3.Text = setinfo.getZip();
            txtZipV3.Enabled = true;
            txtPhoneNumberV3.Enabled = true;
            txtSiteAddressV3.Enabled = true;
            txtCityV3.Enabled = true;
            txtStateV3.Enabled = true;
            chkbxMiechvV3.Enabled = true;
            chkbxMiechvV3.Checked = setinfo.getMiechv();
            txtCalV3.Visible = false;
            lbltitleEditorReschedule.Text = "Edit Information";
            lblVisitDateV3.Visible = false;
            calV3.Visible = false;
            lnkbtnReschedule.Visible = false;
            lnkbtnSaveChanges.Visible = true;
        }
        
      
        protected void calV3_SelectionChanged(object sender, EventArgs e)
        {
            if (calV3.SelectedDate <= (calV3.VisibleDate = DateTime.Now.AddDays(14)))
            {
                string strMsg = "<h3 class='errormsg'>Please Schedule visit two weeks from today; Please Select a Date after " + DateTime.Now.AddDays(14).ToShortDateString()+"</h3>";
                Label lbl = new Label();
                lbl.Text = strMsg;
                PHError2.Controls.Add(lbl);
                //System.Web.HttpContext.Current.Response.Write("<Script Language='JavaScript'>window.alert('" + strMsg + "');</script>");
            }
            else
            {
                txtCalV3.Text = calV3.SelectedDate.ToLongDateString();
                calV3.SelectedDates.Clear();
            }
        }  
        
       
        protected void grdConfirmation_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lbldate = (Label)e.Row.FindControl("lblDateSchedule");                                            
                LinkButton lnkbtnDate = (LinkButton)e.Row.FindControl("lnkbtnDateSchedule");
                if (string.IsNullOrEmpty(lbldate.Text))
                {
                    lbldate.Visible = false;
                    lnkbtnDate.Visible = true;
                   
                }
                else if (!string.IsNullOrEmpty(lbldate.Text))
                {
                    lnkbtnDate.Visible = false;
                    lbldate.Visible = true;                   

                }
            }
        }

        
        protected void lnkbtnDateSchedule_Command(object sender, CommandEventArgs e)
        {
            string schdID = e.CommandArgument.ToString();
            toGetInfo setinfo = new toGetInfo();
            setinfo.setSchdID(schdID);

            string sqlquery = "SELECT [ISBEPI_DEV].[dbo].[UserNames].Name, [ISBEPI_DEV].[dbo].[Sites].Sites,[ISBEPI_DEV].[dbo].[Sites].PhoneNumber,[ISBEPI_DEV].[dbo].[Sites].ZipCode,[ISBEPI_DEV].[dbo].[Sites].MICEHV, [ISBEPI_DEV].[dbo].[Scheduling].VisitDate,[ISBEPI_DEV].[dbo].[Scheduling].Schd_ID, [ISBEPI_DEV].[dbo].[Scheduling].Status, [ISBEPI_DEV].[dbo].[Sites].SiteID, "
                       + "[ISBEPI_DEV].[dbo].[Sites].Site_Address, [ISBEPI_DEV].[dbo].[Sites].City, [ISBEPI_DEV].[dbo].[Sites].State FROM [ISBEPI_DEV].[dbo].[Scheduling] JOIN [ISBEPI_DEV].[dbo].[UserNames] "
                       + "ON [ISBEPI_DEV].[dbo].[UserNames].NameID=[ISBEPI_DEV].[dbo].[Scheduling].[NameID] JOIN [ISBEPI_DEV].[dbo].[Sites] "
                   + "ON [ISBEPI_DEV].[dbo].[Sites].SiteID = [ISBEPI_DEV].[dbo].[Scheduling].SiteID "
                     + "WHERE [ISBEPI_DEV].[dbo].[Scheduling].Schd_ID ='" + setinfo.getSchdID() + "';";
            DataTable dt = DBHelper.GetDataTable(sqlquery);
            if (dt.Rows.Count > 0)
            {
                toGetInfo getuserInfo = new toGetInfo();
                getuserInfo.setVlaue(dt.Rows[0]["Name"].ToString(), dt.Rows[0]["SiteID"].ToString(), dt.Rows[0]["Sites"].ToString(), dt.Rows[0]["Site_Address"].ToString(), dt.Rows[0]["City"].ToString(), dt.Rows[0]["State"].ToString(), dt.Rows[0]["VisitDate"].ToString(), dt.Rows[0]["Status"].ToString(), dt.Rows[0]["PhoneNumber"].ToString(), dt.Rows[0]["ZipCode"].ToString(), Convert.ToBoolean(dt.Rows[0]["MICEHV"].ToString()));
                MultiView1.ActiveViewIndex = 2;
                txtFNameV3.Text = dt.Rows[0]["Name"].ToString();
                txtSiteNameV3.Text = dt.Rows[0]["Sites"].ToString();
                lbltitleEditorReschedule.Text = "<div> <h4 class='users'>Schedule Information</h1></div>";
                //calV3.SelectedDate = calV3;
                txtCalV3.Text = null;
                lnkbtnSaveChanges.Visible = false;
                lnkbtnReschedule.Visible = true;
                txtCalV3.Visible = true;
                calV3.Visible = true;
                txtSiteAddressV3.Enabled = false;
                txtStateV3.Enabled = false;
                txtCityV3.Enabled = false;
                txtPhoneNumberV3.Text = setinfo.getPhone();
                txtZipV3.Text = setinfo.getZip();
                txtZipV3.Enabled = false;
                txtPhoneNumberV3.Enabled = false;
                chkbxMiechvV3.Enabled = false;
                chkbxMiechvV3.Checked = setinfo.getMiechv();
            }
        }

        
              
        protected void lnkbtnCancel_v2_Click(object sender, EventArgs e)
        {
            setDefaultView();
        }

        protected void lnkbtnEdit_Click(object sender, EventArgs e)
        {
            toGetInfo setinfo = new toGetInfo();

            MultiView1.ActiveViewIndex = 2;

            txtFNameV3.Text = setinfo.getValueFname();
            txtSiteNameV3.Text = setinfo.getValueSiteName();
            txtSiteAddressV3.Text = setinfo.getValueSiteAddress();
            txtCityV3.Text = setinfo.getValueCity();
            txtStateV3.Text = setinfo.getValueState();
            txtPhoneNumberV3.Text = setinfo.getPhone();
            txtZipV3.Text = setinfo.getZip();
            txtZipV3.Enabled = true;
            txtPhoneNumberV3.Enabled = true;
            txtSiteAddressV3.Enabled = true;
            txtCityV3.Enabled = true;
            txtStateV3.Enabled = true;
            chkbxMiechvV3.Enabled = true;
            chkbxMiechvV3.Checked = setinfo.getMiechv();
            txtCalV3.Visible = false;
            lbltitleEditorReschedule.Text = "<div> <h4 class='users'>Edit Information</h1></div>";
            lblVisitDateV3.Visible = false;
            calV3.Visible = false;
            lnkbtnReschedule.Visible = false;
            lnkbtnSaveChanges.Visible = true;
        }

        protected void lnkbtnConfirm_Click(object sender, EventArgs e)
        {
            toGetInfo getinfo = new toGetInfo();
            //getting selected row
            string sqlquery2 = "SELECT UN.Name, ST.Sites,SCHD.VisitDate,SCHD.Status, St.City_or_location, ST.SiteID, UN.NameID "
                            + " FROM [ISBEPI_DEV].[dbo].[Scheduling] SCHD JOIN [ISBEPI_DEV].[dbo].[UserNames] UN "
                            + "ON UN.NameID=SCHD.[NameID] JOIN [ISBEPI_DEV].[dbo].[Sites] ST "
                          + "ON ST.SiteID = SCHD.SiteID WHERE SCHD.Schd_ID ='" + getinfo.getSchdID() + "';";
            DataTable dt2 = DBHelper.GetDataTable(sqlquery2);
            string nameID = dt2.Rows[0]["NameID"].ToString();
            string siteID = dt2.Rows[0]["SiteID"].ToString();
            //Updating Confirmation
            string sqlInsert = string.Format("UPDATE [ISBEPI_DEV].[dbo].[Scheduling] SET VisitDate ='" + txtVisitingdate.Text + "',Status='Confirmed'"
                 + ", [LastActivity] = '" + DateTime.Now + "' WHERE Schd_ID ='" + getinfo.getSchdID() + "';");
            int count = DBHelper.ExecuteSQL(sqlInsert);
            if (count == 1)
            {
                string strMsg = "<h3 class='errormsgSuccess'>The Confirmation is successful!</h3>";
                Label lbl = new Label();
                lbl.Text = strMsg;
                PHError1.Controls.Add(lbl);
                //System.Web.HttpContext.Current.Response.Write("<Script Language='JavaScript'>window.alert('" + strMsg + "');</script>");
                setDefaultView();
            }
            else
            {
                string strMsg = "The Confirmation is not successful!";
                Label lbl = new Label();
                lbl.Text = strMsg;
                PHError1.Controls.Add(lbl);
                //System.Web.HttpContext.Current.Response.Write("<Script Language='JavaScript'>window.alert('" + strMsg + "');</script>");
            }
        }

        protected void lnkbtnStatus_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 3;
            toGetInfo getinfo = new toGetInfo();
            string schdID = getinfo.getSchdID();
            string sqlquery = "SELECT SCHD.Schd_ID, SCHD.SiteID, SCHD.VisitDate, UN.Name,PDS.Completed, coalesce( HVS.Survey_Count, 0) AS NumberOFSurvey " +
                                        "FROM Scheduling SCHD RIGHT JOIN UserNames UN " +
                                        "ON SCHD.NameID = UN.NameID " +
                                        "LEFT JOIN Program_Director_Survey PDS " +
                                        "ON PDS.Schd_ID = SCHD.Schd_ID " +
                                        "LEFT JOIN (SELECT COUNT(*) AS Survey_Count, Schd_ID " +
                                        "FROM HomeVisitorSiteVisitSurvey WHERE  Schd_ID =Schd_ID " +
                                        "GROUP BY Schd_ID) AS HVS ON HVS.Schd_ID = SCHD.Schd_ID " +
                                        "WHERE SCHD.Schd_ID= '" + schdID + "' " +
                                        "GROUP BY SCHD.Schd_ID, SCHD.SiteID, SCHD.VisitDate, UN.Name,PDS.Completed, HVS.Survey_Count";
            DataTable dtGetTable = DBHelper.GetDataTable(sqlquery);
            string schdid = dtGetTable.Rows[0]["Schd_ID"].ToString();
            string sqlquerystatus = "  SELECT SCHD.STATUS FROM [ISBEPI_DEV].[dbo].[Scheduling] SCHD WHERE SCHD.Schd_ID ='" + schdid + "'";
            DataTable dtGetTableStatus = DBHelper.GetDataTable(sqlquerystatus);
            if ((dtGetTable.Rows.Count > 0) && (dtGetTableStatus.Rows.Count > 0))
            {
                if (dtGetTableStatus.Rows[0]["Status"].ToString() != "Closed")
                {
                    lblStatus.Text = "Active";//dtGetTableStatus.Rows[0]["Status"].ToString();
                }
                else
                {
                    lblStatus.Text = "Closed";
                }

                lblStatusMonitorName.Text = dtGetTable.Rows[0]["Name"].ToString();
                if (dtGetTable.Rows[0]["Completed"].ToString() == "Completed")
                {
                    lblStatusPD.Text = "Yes";
                }
                else
                {
                    lblStatusPD.Text = "NO";
                }
                lblStausHVS.Text = dtGetTable.Rows[0]["NumberOFSurvey"].ToString();
                lblStatusSIteName.Text = getinfo.getValueSiteName();
            }
        }

        protected void lnkbtnReschedule1_Click(object sender, EventArgs e)
        {
            toGetInfo setinfo = new toGetInfo();

            MultiView1.ActiveViewIndex = 2;

            txtFNameV3.Text = setinfo.getValueFname();
            txtSiteNameV3.Text = setinfo.getValueSiteName();
            txtSiteAddressV3.Text = setinfo.getValueSiteAddress();
            txtCityV3.Text = setinfo.getValueCity();
            txtStateV3.Text = setinfo.getValueState();
            lbltitleEditorReschedule.Text = "<div> <h4 class='users'>Schedule Information</h1></div>";
            //calV3.SelectedDate = calV3;
            txtCalV3.Text = null;
            lnkbtnSaveChanges.Visible = false;
            lnkbtnReschedule.Visible = true;
            txtCalV3.Visible = true;
            lblVisitDateV3.Visible = true;
            chkbxMiechvV3.Checked = setinfo.getMiechv();
            chkbxMiechvV3.Enabled = false;
            calV3.Visible = true;
            txtSiteAddressV3.Enabled = false;
            txtStateV3.Enabled = false;
            txtCityV3.Enabled = false;
            txtPhoneNumberV3.Text = setinfo.getPhone();
            txtZipV3.Text = setinfo.getZip();
            txtZipV3.Enabled = false;
            txtPhoneNumberV3.Enabled = false;
        }

        protected void lnkbtnVisiting_Click(object sender, EventArgs e)
        {
            toGetInfo getinfo = new toGetInfo();
            Session["SchdId"] = getinfo.getSchdID();
            Response.Redirect("~/PIQRIInterview/default.aspx");
        }

        protected void lnkbtnCancelV3_Click(object sender, EventArgs e)
        {
            dispalyView2info();
        }

        protected void lnkbtnSaveChanges_Click(object sender, EventArgs e)
        {
            toGetInfo getinfo = new toGetInfo();
            //getting selected row
            //string sqlquery2 = "SELECT [ISBEPI_DEV].[dbo].[UserNames].Name, [ISBEPI_DEV].[dbo].[Sites].Sites, [ISBEPI_DEV].[dbo].[Scheduling].VisitDate, [ISBEPI_DEV].[dbo].[Scheduling].Status,[ISBEPI_DEV].[dbo].[Sites].City_or_location, [ISBEPI_DEV].[dbo].[Sites].SiteID, [ISBEPI_DEV].[dbo].[Scheduling].[NameID] "
            //                + "FROM [ISBEPI_DEV].[dbo].[Scheduling] JOIN [ISBEPI_DEV].[dbo].[UserNames] "
            //                + "ON [ISBEPI_DEV].[dbo].[UserNames].NameID=[ISBEPI_DEV].[dbo].[Scheduling].[NameID] JOIN [ISBEPI_DEV].[dbo].[Sites] "
            //            + "ON [ISBEPI_DEV].[dbo].[Sites].SiteID = [ISBEPI_DEV].[dbo].[Scheduling].SiteID "
            //              + "WHERE [ISBEPI_DEV].[dbo].[UserNames].Name ='" + getinfo.getValueFname() + "' AND [ISBEPI_DEV].[dbo].[Sites].SiteID ='" + getinfo.getValueSiteID() + "'  AND [ISBEPI_DEV].[dbo].[Scheduling].Status ='" + getinfo.getValueStatus() + "';";
            //DataTable dt2 = DBHelper.GetDataTable(sqlquery2);
            string siteID = getinfo.getValueSiteID(); //dt2.Rows[0]["SiteID"].ToString();
            //making changes
            int miechv = 0;
            if (chkbxMiechvV3.Checked == true)
            {
                miechv = 1;
            }
            else
            {
                miechv = 0;
            }
            string sqlInsert = string.Format("UPDATE [ISBEPI_DEV].[dbo].[Sites] SET Site_Address ='" + txtSiteAddress.Text + "', City ='" + txtCity.Text + "', State ='" + txtState.Text
              + "', PhoneNumber='" + txtPhoneNumberV3.Text + "',ZipCode='" + txtZipV3.Text + "', MICEHV='" + miechv + "'  WHERE SiteID ='" + siteID + "';");
            int count = DBHelper.ExecuteSQL(sqlInsert);
            if (count == 1)
            {
                string strMsg = "<h3 class='errormsgSuccess'>The changes you made is successful!</h3>";
                Label lbl = new Label();
                lbl.Text = strMsg;
                PHError2.Controls.Add(lbl);
                //System.Web.HttpContext.Current.Response.Write("<Script Language='JavaScript'>window.alert('" + strMsg + "');</script>");
                lnkbtnConfirm.Enabled = true;
                dispalyView2info();
            }
            else
            {
                string strMsg = "<h3 class='errormsg'>The changes you made is not successful!</h3>";
                Label lbl = new Label();
                lbl.Text = strMsg;
                PHError2.Controls.Add(lbl);
                //System.Web.HttpContext.Current.Response.Write("<Script Language='JavaScript'>window.alert('" + strMsg + "');</script>");
            }
        }

        protected void lnkbtnReschedule_Click(object sender, EventArgs e)
        {
            toGetInfo getinfo = new toGetInfo();
            //getting selected row
            string sqlquery2 = "SELECT [ISBEPI_DEV].[dbo].[UserNames].Name, [ISBEPI_DEV].[dbo].[Scheduling].[NameID],[ISBEPI_DEV].[dbo].[Sites].Sites, [ISBEPI_DEV].[dbo].[Scheduling].VisitDate,[ISBEPI_DEV].[dbo].[Scheduling].Schd_ID, [ISBEPI_DEV].[dbo].[Scheduling].Status, [ISBEPI_DEV].[dbo].[Sites].SiteID "
                       + "FROM [ISBEPI_DEV].[dbo].[Scheduling] JOIN [ISBEPI_DEV].[dbo].[UserNames] "
                       + "ON [ISBEPI_DEV].[dbo].[UserNames].NameID=[ISBEPI_DEV].[dbo].[Scheduling].[NameID] JOIN [ISBEPI_DEV].[dbo].[Sites] "
                   + "ON [ISBEPI_DEV].[dbo].[Sites].SiteID = [ISBEPI_DEV].[dbo].[Scheduling].SiteID "
                     + "WHERE [ISBEPI_DEV].[dbo].[Scheduling].Schd_ID ='" + getinfo.getSchdID() + "';";
            DataTable dt2 = DBHelper.GetDataTable(sqlquery2);
            string nameID = dt2.Rows[0]["NameID"].ToString();
            string siteID = dt2.Rows[0]["SiteID"].ToString();
            //reschedule info
            DateTime date = Convert.ToDateTime(txtCalV3.Text).Date;
            string sqlInsert = string.Format("UPDATE [ISBEPI_DEV].[dbo].[Scheduling] SET VisitDate ='" + date.ToShortDateString() + "',Status='Pending'"
                + " , [LastActivity] = '" + DateTime.Now + "' WHERE Schd_ID ='" + getinfo.getSchdID() + "';");
            int count = DBHelper.ExecuteSQL(sqlInsert);
            if (count == 1)
            {
                string strMsg = "<h3 class='errormsgSuccess'>The schedule is successful!</h3>";
                Label lbl = new Label();
                lbl.Text = strMsg;
                PHError2.Controls.Add(lbl);
                //System.Web.HttpContext.Current.Response.Write("<Script Language='JavaScript'>window.alert('" + strMsg + "');</script>");
                lnkbtnConfirm.Enabled = true;
                setDefaultView();
            }
            else
            {
                string strMsg = "<h3 class='errormsg'>The schedule is not successful!</h3>";
                Label lbl = new Label();
                lbl.Text = strMsg;
                PHError2.Controls.Add(lbl);
                //System.Web.HttpContext.Current.Response.Write("<Script Language='JavaScript'>window.alert('" + strMsg + "');</script>");
            }
        }

        protected void lnkbtnStatusCancel_Click(object sender, EventArgs e)
        {
            setDefaultView();        
        }

        protected void lnkbtnStausChange_Click(object sender, EventArgs e)
        {
            if (chkbxChangeStatus.Checked == true)
            {
                //
                toGetInfo getinfo = new toGetInfo();
                string schdID = getinfo.getSchdID();

                string sqlqueryUpdate = "UPDATE [ISBEPI_DEV].[dbo].[Scheduling] " +
                                        "SET [ISBEPI_DEV].[dbo].[Scheduling].[Status]='Closed'" +
                                        " WHERE [ISBEPI_DEV].[dbo].[Scheduling].[Schd_ID]='" + schdID + "';";
                int count = DBHelper.ExecuteSQL(sqlqueryUpdate);

                if (count > 0)
                {
                    chkbxChangeStatus.Checked = false;
                    string strMsg = "The changes you made is successful!";
                    Label lbl = new Label();
                    lbl.Text = strMsg;
                    PHError3.Controls.Add(lbl);
                    //System.Web.HttpContext.Current.Response.Write("<Script Language='JavaScript'>window.alert('" + strMsg + "');</script>");
                    MultiView1.ActiveViewIndex = 3;
                }
            }
        }

        protected void lnkbtnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/default.aspx");
        }

        protected void lnkbtnSubmit_Click(object sender, EventArgs e)
        {
            string sqlcheckOpenSite = "SELECT * FROM Scheduling WHERE SiteID =" + ddlSiteName.SelectedValue + " AND (Status = 'Assigned' or Status='Confirmed')";
            DataTable dt = DBHelper.GetDataTable(sqlcheckOpenSite);
            if (dt.Rows.Count < 1)
            {
                string sqlInsert = string.Format("INSERT INTO [ISBEPI_DEV].[dbo].[Scheduling] ([SiteID],[NameID],[Status],[LastActivity] )"
                    + "VALUES('{0}', '{1}', '{2}','{3}')", ddlSiteName.SelectedValue, ddluser.SelectedValue, "Assigned", DateTime.Now);
                int count = DBHelper.ExecuteSQL(sqlInsert);

                if (count == 1)
                {
                    string strMsg = "<h3 class='errormsgSuccess'>The registration is successful!</h3>";
                    Label lbl = new Label();                   
                    lbl.Text = strMsg;
                    PHSiteError.Controls.Add(lbl);
                    //System.Web.HttpContext.Current.Response.Write("<Script Language='JavaScript'>window.alert('" + strMsg + "');</script>");
                    //SiteID();                
                    setDefaultView();
                }
                else
                {
                    string strMsg = "<h3 class='errormsg'>The registration is not successful!</h3>";
                    Label lbl = new Label();
                    lbl.Text = strMsg;
                    PHSiteError.Controls.Add(lbl);
                    //System.Web.HttpContext.Current.Response.Write("<Script Language='JavaScript'>window.alert('" + strMsg + "');</script>");
                }
            }
            else
            {
                string strMsg = "<h3 class='errormsg'>The registration is not successful! This " + ddlSiteName.SelectedItem.Text + " site is active. Please check and change status of the active site. Thank you!</h3>";
                Label lbl = new Label();
                lbl.Text = strMsg;
                PHSiteError.Controls.Add(lbl);
                //System.Web.HttpContext.Current.Response.Write("<Script Language='JavaScript'>window.alert('" + strmsg + "');</script>");
            }
        }

        protected void lnkbtnPIQRI_Click(object sender, EventArgs e)
        {
            toGetInfo getinfo = new toGetInfo();
            Session["SchdId"] = getinfo.getSchdID();
            Response.Redirect("~/PIQRIFinalTool/FinalTool.aspx");
        }

        protected void lnkbtnPICC_Click(object sender, EventArgs e)
        {
            PICCTool.StoreInfo getinfo = new PICCTool.StoreInfo();

            getinfo.setvalue_Address(txtSiteAddress.Text.Trim());
            getinfo.setvalue_Assessor(txtFName.Text.Trim());
            getinfo.setvalue_ProgramName(txtSiteName.Text.Trim());
            getinfo.setvalue_VisitDate(txtVisitingdate.Text.Trim());
            toGetInfo getschid = new toGetInfo();
            Session["SchdId"] = getschid.getSchdID();
            Response.Redirect("~/PICCTool/PICCTool.aspx");
        }

        
               
    }
}


        
   