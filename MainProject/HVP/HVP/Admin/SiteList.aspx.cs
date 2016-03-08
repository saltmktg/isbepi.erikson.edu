using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Text;
using System.Collections;

namespace HVP.Admin
{
    public partial class SiteList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //MultiView1.ActiveViewIndex = 0;
                YearList();
                //ddlYear.Items.Insert(0,DateTime.
            }
        }

        private void YearList()
        {
           
            IList<int> years = Enumerable.Range(DateTime.Now.Year, 5).ToList();
            foreach (int y in years){
                ddlYear.Items.Add(new ListItem(y.ToString(), y.ToString()));
            }           
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            for (int i = ListBox1.Items.Count - 1; i >= 0; i--)
            {
                if (ListBox1.Items[i].Selected)
                {
                    ListBox2.Items.Add(ListBox1.Items[i]);
                    ListBox2.ClearSelection();
                    //ListBox1.Items.Remove(ListBox1.Items[i]);
                }
            }            
        }

        private void InsertRecord()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ISBEPI_DEV"].ToString());
            StringBuilder sb = new StringBuilder(string.Empty);
            foreach (ListItem item in ListBox2.Items)
            {             
                    string sqlStatement = " UPDATE  [ISBEPI_DEV].[dbo].[Sites] SET [Assigned_Yr] =" + ddlYear.SelectedValue + "WHERE SiteID =" + item.Value;
                    sb.AppendFormat("{0}; ", sqlStatement);                
            }
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sb.ToString(), conn);
                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();
                Label lbl = new Label();
                lbl.Text = "Successfuly Saved!";
                PlaceHolder1.Controls.Add(lbl);

            }



            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg = "Insert Error:";
                msg += ex.Message;
                throw new Exception(msg);
            }

            finally
            {
                conn.Close();
            }
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            for (int i = ListBox2.Items.Count - 1; i >= 0; i--)
            {
                if (ListBox2.Items[i].Selected)
                {
                    //ListBox1.Items.Add(ListBox2.Items[i]);                   
                    //ListBox1.ClearSelection();                    
                    ListBox2.Items.Remove(ListBox2.Items[i]);
                }
            }          
        }

        protected void lnkbtnSubmit_Click(object sender, EventArgs e)
        {
            InsertRecord();
            MultiView1.ActiveViewIndex = 0;
            string query = " SELECT Sites, Assigned_yr from Sites WHERE Assigned_Yr =  " + ddlYear.SelectedValue;
            DataTable dt = DBHelper.GetDataTable(query);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            ListBox2.Items.Clear();
        }

        protected void lnkbtnView_Click(object sender, EventArgs e)
        {            
            MultiView1.ActiveViewIndex = 0;
            string query = " SELECT Sites, Assigned_yr from Sites WHERE Assigned_Yr =  " + ddlYear.SelectedValue;
            DataTable dt = DBHelper.GetDataTable(query);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        
    }
}