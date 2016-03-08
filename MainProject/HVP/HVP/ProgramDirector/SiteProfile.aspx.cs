using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;

namespace HVP.ProgramDirector
{
    public partial class SiteProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getinfo();
            }
        }

        private void getinfo()
        {
            string name = Page.User.Identity.Name;
            string userID = Membership.GetUser(name).ProviderUserKey.ToString();
          
            string sqlquerysiteID = "Select  [ISBEPI_DEV].[dbo].[ProgramDirector].SiteID " +
                                  "From [ISBEPI_DEV].[dbo].[ProgramDirector] JOIN [ISBEPI_DEV].[dbo].Staff " +
                                   "ON [ISBEPI_DEV].[dbo].[ProgramDirector].Staff_ID = [ISBEPI_DEV].[dbo].Staff.Staff_ID WHERE [ISBEPI_DEV].[dbo].Staff.UserId ='"+userID+"' ;";
            DataTable dtsiteID = DBHelper.GetDataTable(sqlquerysiteID);
            if (dtsiteID.Rows.Count > 0)
            {
                hfsiteid.Value =dtsiteID.Rows[0]["SiteID"].ToString();
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




            //string name = Page.User.Identity.Name;
            //string userID = Membership.GetUser(name).ProviderUserKey.ToString();
            //string sqlquerysiteID = "Select  [ISBEPI_DEV].[dbo].[ProgramDirector].SiteID " +
            //                        "From [ISBEPI_DEV].[dbo].[ProgramDirector] JOIN [ISBEPI_DEV].[dbo].Staff " +
            //                        "ON [ISBEPI_DEV].[dbo].[ProgramDirector].Staff_ID = [ISBEPI_DEV].[dbo].Staff.Staff_ID WHERE [ISBEPI_DEV].[dbo].Staff.UserId ='"+userID+"' ;";
            //DataTable dtsiteID = DBHelper.GetDataTable(sqlquerysiteID);
            //if (dtsiteID.Rows.Count > 0)
            //{
            //    string siteID = dtsiteID.Rows[0]["SiteID"].ToString();
            //    toGetInfo getsiteID = new toGetInfo();
            //    getsiteID.setSiteID(siteID);
            //    string sqlqueryInfo = "SELECT [SiteID] ,[Program_ID] ,[Sites] ,[City_or_location] " +
            //        ",[County] ,[Site_Address] ,[City] ,[State] ,[MICEHV] ,[PhoneNumber] ,[ZipCode]" +
            //        " FROM [ISBEPI_DEV].[dbo].[Sites] WHERE SITEID ='" + siteID + "'";
            //    DataTable dtsiteINFO = DBHelper.GetDataTable(sqlqueryInfo);

            //    if (dtsiteINFO.Rows.Count > 0)
            //    {
            //        txtSiteName.Text = dtsiteINFO.Rows[0]["Sites"].ToString();
            //        txtSiteAddress.Text = dtsiteINFO.Rows[0]["Site_Address"].ToString();
            //        txtCity.Text = dtsiteINFO.Rows[0]["City"].ToString();
            //        txtState.Text = dtsiteINFO.Rows[0]["State"].ToString();
            //        txtZip.Text = dtsiteINFO.Rows[0]["ZipCode"].ToString();
            //        txtPhone.Text = dtsiteINFO.Rows[0]["PhoneNumber"].ToString();
            //        chkbxMICEHV.Checked = Convert.ToBoolean(dtsiteINFO.Rows[0]["MICEHV"].ToString());
            //    }
            //}
                

        }
        //protected void btnSave_Click(object sender, EventArgs e)
        //{
        //    int micehv = 0;
        //    if (chkbxMICEHV.Checked == true)
        //    {
        //        micehv = 1;
        //    }
        //    else
        //    {
        //        micehv = 0;
        //    }
        //    toGetInfo getsiteID = new toGetInfo();
        //    string sqlInsert = string.Format("UPDATE [ISBEPI_DEV].[dbo].[Sites] SET Site_Address ='" + txtSiteAddress.Text + "', City ='" + txtCity.Text + "', State ='" + txtState.Text
        //      + "', MICEHV ='" + micehv + "', PhoneNumber='" + txtPhone.Text + "',ZipCode='" + txtZip.Text + "'  WHERE SiteID ='" + getsiteID.getValueSiteID() + "';");
        //    int count = DBHelper.ExecuteSQL(sqlInsert);
        //    if (count == 1)
        //    {
        //        string strMsg = "The changes you made is successful!";
        //        System.Web.HttpContext.Current.Response.Write("<Script Language='JavaScript'>window.alert('" + strMsg + "');</script>");
        //        getinfo();
        //    }
        //    else
        //    {
        //        string strMsg = "The changes you made is not successful!";
        //        System.Web.HttpContext.Current.Response.Write("<Script Language='JavaScript'>window.alert('" + strMsg + "');</script>");
        //    }
        //}

        //protected void btnCancelV2_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("~/ProgramDirector/default.aspx");
        //}

        //protected void lnkbtnEdit_Click(object sender, EventArgs e)
        //{
        //    Edit.Visible = false;
        //    MultiView3.ActiveViewIndex = 0;
        //    MultiView3.Visible = true; 
        //}

        protected void lnkBtnCancel_Click(object sender, EventArgs e)
        {
            Edit.Visible = true;
            MultiView3.Visible = false;
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
                getinfo();
            }
            else
            {
                Label lblError = new Label();
                lblError.Text = "<h3 class='errormsg'>Update not Successful</h3>";
                phErrorUpdate.Controls.Add(lblError);
            }
        }

        protected void lnkbtnEdit_Click(object sender, EventArgs e)
        {
            Edit.Visible = false;
            MultiView3.ActiveViewIndex = 0;
            MultiView3.Visible = true; 
        }
    }
}