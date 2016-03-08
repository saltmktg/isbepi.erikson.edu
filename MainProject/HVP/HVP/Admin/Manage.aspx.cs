using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HVP.Admin
{
    public partial class Manage : System.Web.UI.Page
    {
        public string sqlquery;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                setDefaultView();
            }
        }
        protected void setDefaultView()
        {
            
                MultiView1.ActiveViewIndex = 0;
                //Display();
           
        }
       
        protected void GridView1_SelectedIndexChanged1(object sender, GridViewSelectEventArgs e)
        {
            sqlquery = "SELECT Schd.Schd_ID, Schd.SiteID, UN.Name, S.Sites, Schd.Status,Schd.VisitDate,"
                        + "S.City_or_location,s.City,s.Site_Address,s.State,Schd.NameID "
                        +"FROM Scheduling Schd JOIN UserNames UN "
                        + "	ON Schd.NameID = UN.NameID JOIN Sites s ON s.SiteID = Schd.SiteID WHERE UN.NameID ='" + grdManager.Rows[e.NewSelectedIndex].Cells[2].Text + "'";
            
            DataTable dt = DBHelper.GetDataTable(sqlquery);
            grdview2.DataSource = dt;
            grdview2.DataBind();
            MultiView1.ActiveViewIndex = 1;
        }
        protected void GridView1_SelectedIndexChanged2(object sender, GridViewSelectEventArgs e)
        {
            Session["schdid"] = grdview2.Rows[e.NewSelectedIndex].Cells[6].Text;

            //sqlquery = "	SELECT Schd.Schd_ID, Schd.SiteID, UN.Name, S.Sites, Schd.Status,Schd.VisitDate,"
            //+ "S.City_or_location,s.City,s.Site_Address,s.State "
            //+ "FROM Scheduling Schd JOIN UserNames UN "
            //+ "ON Schd.NameID = UN.NameID JOIN Sites s ON s.SiteID = Schd.SiteID WHERE Schd.Schd_ID ='" + grdview2.Rows[e.NewSelectedIndex].Cells[6].Text + "'";           
            //DataTable dt = DBHelper.GetDataTable(sqlquery);
           
            //for (int x = 0; x < dt.Rows.Count; x++)
            //{
            //    if (dt.Rows[x]["Schd_ID"].ToString() == grdview2.Rows[e.NewSelectedIndex].Cells[6].Text)
            //    {
            //        txtFname.Text = dt.Rows[x]["Name"].ToString();
            //        txtVistingDate.Text = DateTime.Parse(dt.Rows[x]["VisitDate"].ToString()).ToShortDateString();
            //        //txtSiteID.Text = dt.Rows[x]["SiteID"].ToString();
            //        txtSiteName.Text = dt.Rows[x]["Sites"].ToString();

            //        txtSiteAddress.Text = dt.Rows[x]["Site_Address"].ToString() + Environment.NewLine + dt.Rows[x]["City"].ToString()
            //            + ", " + dt.Rows[x]["State"].ToString();
            //    }
            //}
            //MultiView1.ActiveViewIndex = 2;
        }
            
        

        //protected void ddlSearch_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    switch (ddlSearch.SelectedValue)
        //    {
        //        case "0":
        //            {
        //                lblSearch.Visible = false;
        //                ddlSlectSearch.Visible = false;
        //                btnSearch.Visible = false;
        //                sqlquery = "SELECT [ISBEPI_DEV].[dbo].[UserNames].Name, [ISBEPI_DEV].[dbo].[Sites].Sites, [ISBEPI_DEV].[dbo].[Scheduling].VisitDate,"
        //        + "[ISBEPI_DEV].[dbo].[Scheduling].Status,[ISBEPI_DEV].[dbo].[Sites].City_or_location, [ISBEPI_DEV].[dbo].[Sites].SiteID,"
        //        + "[ISBEPI_DEV].[dbo].[Sites].Site_Address, [ISBEPI_DEV].[dbo].[Sites].City, [ISBEPI_DEV].[dbo].[Sites].State "
        //    + "FROM [ISBEPI_DEV].[dbo].[Scheduling] JOIN [ISBEPI_DEV].[dbo].[UserNames] ON [ISBEPI_DEV].[dbo].[UserNames].NameID=[ISBEPI_DEV].[dbo].[Scheduling].[NameID] "
        //    + "JOIN [ISBEPI_DEV].[dbo].[Sites] ON [ISBEPI_DEV].[dbo].[Sites].SiteID = [ISBEPI_DEV].[dbo].[Scheduling].SiteID;";
        //                DataTable dt = DBHelper.GetDataTable(sqlquery);
        //                grdManager.DataSource = dt;
        //                grdManager.DataBind();
        //                break;
        //            }

        //        case "1":
        //            {
        //                lblSearch.Visible = true;
        //                lblSearch.Text = "Enter Site" + ddlSearch.SelectedItem.Text;
        //                ddlSlectSearch.Visible = true;
        //                btnSearch.Visible = true;
        //                break;
        //            }
        //        case "2":
        //            {
        //                lblSearch.Visible = true;
        //                lblSearch.Text = "Enter Monitor " + ddlSearch.SelectedItem.Text;
        //                ddlSlectSearch.Visible = true;
        //                btnSearch.Visible = true;
        //                break;
        //            }
        //        case "3":
        //            {
        //                lblSearch.Visible = true;
        //                lblSearch.Text = "Enter " + ddlSearch.SelectedItem.Text;
        //                ddlSlectSearch.Visible = true;
        //                btnSearch.Visible = true;
        //                break;
        //            }               
        //    }

        //}

        //protected void btnSearch_Click(object sender, EventArgs e)
        //{

        //    switch (ddlSearch.SelectedValue)
        //    {
        //        case "0":
        //            {
        //                sqlquery = "SELECT [ISBEPI_DEV].[dbo].[UserNames].Name, [ISBEPI_DEV].[dbo].[Sites].Sites, [ISBEPI_DEV].[dbo].[Scheduling].VisitDate,"
        //        + "[ISBEPI_DEV].[dbo].[Scheduling].Status,[ISBEPI_DEV].[dbo].[Sites].City_or_location, [ISBEPI_DEV].[dbo].[Sites].SiteID,"
        //        + "[ISBEPI_DEV].[dbo].[Sites].Site_Address, [ISBEPI_DEV].[dbo].[Sites].City, [ISBEPI_DEV].[dbo].[Sites].State "
        //    + "FROM [ISBEPI_DEV].[dbo].[Scheduling] JOIN [ISBEPI_DEV].[dbo].[UserNames] ON [ISBEPI_DEV].[dbo].[UserNames].NameID=[ISBEPI_DEV].[dbo].[Scheduling].[NameID] "
        //    + "JOIN [ISBEPI_DEV].[dbo].[Sites] ON [ISBEPI_DEV].[dbo].[Sites].SiteID = [ISBEPI_DEV].[dbo].[Scheduling].SiteID;";
        //                break;
        //            }

        //        case "1":
        //            {
        //                sqlquery = "SELECT [ISBEPI_DEV].[dbo].[UserNames].Name, [ISBEPI_DEV].[dbo].[Sites].Sites, [ISBEPI_DEV].[dbo].[Scheduling].VisitDate,"
        //        + "[ISBEPI_DEV].[dbo].[Scheduling].Status,[ISBEPI_DEV].[dbo].[Sites].City_or_location, [ISBEPI_DEV].[dbo].[Sites].SiteID,"
        //        + "[ISBEPI_DEV].[dbo].[Sites].Site_Address, [ISBEPI_DEV].[dbo].[Sites].City, [ISBEPI_DEV].[dbo].[Sites].State "
        //    + "FROM [ISBEPI_DEV].[dbo].[Scheduling] JOIN [ISBEPI_DEV].[dbo].[UserNames] ON [ISBEPI_DEV].[dbo].[UserNames].NameID=[ISBEPI_DEV].[dbo].[Scheduling].[NameID] "
        //    + "JOIN [ISBEPI_DEV].[dbo].[Sites] ON [ISBEPI_DEV].[dbo].[Sites].SiteID = [ISBEPI_DEV].[dbo].[Scheduling].SiteID WHERE [ISBEPI_DEV].[dbo].[Sites].Sites LIKE '%" + txtSearch.Text + "%';";
        //                break;
        //            }
        //        case "2":
        //            {
        //                sqlquery = "SELECT [ISBEPI_DEV].[dbo].[UserNames].Name, [ISBEPI_DEV].[dbo].[Sites].Sites, [ISBEPI_DEV].[dbo].[Scheduling].VisitDate,"
        //                  + "[ISBEPI_DEV].[dbo].[Scheduling].Status,[ISBEPI_DEV].[dbo].[Sites].City_or_location, [ISBEPI_DEV].[dbo].[Sites].SiteID,"
        //                  + "[ISBEPI_DEV].[dbo].[Sites].Site_Address, [ISBEPI_DEV].[dbo].[Sites].City, [ISBEPI_DEV].[dbo].[Sites].State "
        //                + "FROM [ISBEPI_DEV].[dbo].[Scheduling] JOIN [ISBEPI_DEV].[dbo].[UserNames] ON [ISBEPI_DEV].[dbo].[UserNames].NameID=[ISBEPI_DEV].[dbo].[Scheduling].[NameID] "
        //                + "JOIN [ISBEPI_DEV].[dbo].[Sites] ON [ISBEPI_DEV].[dbo].[Sites].SiteID = [ISBEPI_DEV].[dbo].[Scheduling].SiteID WHERE [ISBEPI_DEV].[dbo].[UserNames].Name LIKE '%" + txtSearch.Text + "%';";
        //                break;
        //            }
        //        case "3":
        //            {
        //                sqlquery = "SELECT [ISBEPI_DEV].[dbo].[UserNames].Name, [ISBEPI_DEV].[dbo].[Sites].Sites, [ISBEPI_DEV].[dbo].[Scheduling].VisitDate,"
        //                  + "[ISBEPI_DEV].[dbo].[Scheduling].Status,[ISBEPI_DEV].[dbo].[Sites].City_or_location, [ISBEPI_DEV].[dbo].[Sites].SiteID,"
        //                  + "[ISBEPI_DEV].[dbo].[Sites].Site_Address, [ISBEPI_DEV].[dbo].[Sites].City, [ISBEPI_DEV].[dbo].[Sites].State "
        //                + "FROM [ISBEPI_DEV].[dbo].[Scheduling] JOIN [ISBEPI_DEV].[dbo].[UserNames] ON [ISBEPI_DEV].[dbo].[UserNames].NameID=[ISBEPI_DEV].[dbo].[Scheduling].[NameID] "
        //                + "JOIN [ISBEPI_DEV].[dbo].[Sites] ON [ISBEPI_DEV].[dbo].[Sites].SiteID = [ISBEPI_DEV].[dbo].[Scheduling].SiteID WHERE [ISBEPI_DEV].[dbo].[Scheduling].VisitDate LIKE '%" + txtSearch.Text + "%';";
        //                break;
        //            }                
        //    }
        //    DataTable dt = DBHelper.GetDataTable(sqlquery);
        //    grdManager.DataSource = dt;
        //    grdManager.DataBind();

        //}

        protected void lnkbtnReturnv2_Click(object sender, EventArgs e)
        {
            Session["schdid"] = null;
            FormView1.DataBind();
            MultiView1.ActiveViewIndex = 0;
        }

        protected void lnkbtnReturnv3_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void lnkbtnChnageMonitor_Click(object sender, EventArgs e)
        {

        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            DropDownList ddlusername;
            ddlusername = (DropDownList)FormView1.Row.FindControl("ddlurname");
            DropDownList ddlstname;
            ddlstname = (DropDownList)FormView1.Row.FindControl("ddlStname");
            if (ddlstname.SelectedValue == "0")
            {
                sqlquery = "UPDATE [Scheduling] SET [NameID] =" + ddlusername.SelectedValue + "  WHERE [Schd_ID] ='" + Session["schdid"] + "'";
            }
            else if (ddlusername.SelectedValue == "0")
            {
                sqlquery = "UPDATE [Scheduling] SET [SiteID] =" + ddlstname.SelectedValue + "WHERE [Schd_ID] ='" + Session["schdid"] + "'"; 
            }
            else
            {
                sqlquery = "UPDATE [Scheduling] SET [SiteID] =" + ddlstname + ", [NameID] =" + ddlusername + "  WHERE [Schd_ID] ='" + Session["schdid"] + "'";
            }

            SqlDataSource2.UpdateCommand = sqlquery;
            SqlDataSource2.Update();
            Session["username"] = ddlusername.SelectedValue;
            
        }

        protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            sqlquery = "SELECT Schd.Schd_ID, Schd.SiteID, UN.Name, S.Sites, Schd.Status,Schd.VisitDate,"
                      + "S.City_or_location,s.City,s.Site_Address,s.State,Schd.NameID "
                     + "FROM Scheduling Schd JOIN UserNames UN "
                      + "	ON Schd.NameID = UN.NameID JOIN Sites s ON s.SiteID = Schd.SiteID WHERE UN.NameID ='" + Session["username"].ToString() + "'";

            DataTable dt = DBHelper.GetDataTable(sqlquery);
            Session["username"] = null;            
            grdview2.DataSource = dt;
            grdview2.DataBind();
        }

        //protected void grdview2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        //{
        //    string sqlcheckOpenSite = "SELECT * FROM Scheduling WHERE Schd_ID =" + grdview2.Rows[e.RowIndex].Cells[6].Text + " AND (Status = 'Assigned')";
        //    DataTable dtOpen = DBHelper.GetDataTable(sqlcheckOpenSite);

        //    if (dtOpen.Rows.Count > 0)
        //    {
        //        Session["usr"] = grdview2.Rows[e.RowIndex].Cells[7].Text;
        //        sqlquery = "DELETE FROM Scheduling WHERE Schd_ID='" + grdview2.Rows[e.RowIndex].Cells[6].Text + "';";
        //        int count = DBHelper.ExecuteSQL(sqlquery);
        //        //SqlDataSource2.DeleteCommand = sqlquery;
        //        //SqlDataSource2.Delete();
        //        if (count > 0)
        //        {
        //            sqlquery = "SELECT Schd.Schd_ID, Schd.SiteID, UN.Name, S.Sites, Schd.Status,Schd.VisitDate,"
        //                        + "S.City_or_location,s.City,s.Site_Address,s.State,Schd.NameID "
        //                        + "FROM Scheduling Schd JOIN UserNames UN "
        //                        + "	ON Schd.NameID = UN.NameID JOIN Sites s ON s.SiteID = Schd.SiteID WHERE UN.NameID ='" + Session["usr"].ToString() + "'";

        //            DataTable dt = DBHelper.GetDataTable(sqlquery);
        //            Session["usr"] = null;
        //            grdview2.DataSource = dt;
        //            grdview2.DataBind();
        //            grdManager.DataBind();

        //            Label lbl = new Label();
        //            lbl.Text = "<h3 class='errormsgSuccess'>Successful!</h3>";
        //            PlaceHolder1.Controls.Add(lbl);
        //        }
        //        else
        //        {
        //            Label lbl = new Label();
        //            lbl.Text = "<h3 class='errormsg'>Not Successful, Please Check with your TechAdmin!</h3>";
        //            PlaceHolder1.Controls.Add(lbl);
        //        }
        //    }
        //    else
        //    {
        //        Label lbl = new Label();
        //        lbl.Text = "<h3 class='errormsg'>Not Successful, Please Check with your TechAdmin!</h3>";
        //        PlaceHolder1.Controls.Add(lbl);
        //    }
        //}

            
    }
}