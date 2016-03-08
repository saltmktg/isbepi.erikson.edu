using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HVP.Staff
{
    public partial class UploadedMaterials : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            hfsiteid.Value = Session["Site_ID"] == null ? "" : Session["Site_ID"].ToString();
            hfSchdId.Value = Session["Schd_Id"] == null ? "" : Session["Schd_Id"].ToString();
        }
    }
}