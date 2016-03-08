using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;

namespace HVP
{
    public class DBHelper
    {
        public static string connectionString = "Provider=ISBEPI_DEV;Server=\\ERI-DB-06\\DEVELOPMENT;Database=ISBEPI_DEV; Initial Catalog=ISBEPI_DEV;Persist Security Info=True; User ID=Pi_usr; Password =J6$h3Qoz#9Yw;";

         public static DataTable GetDataTable(string sqlStr)
         {
            
                 SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ISBEPI_DEV"].ToString());//(connectionString);                         
                 SqlDataAdapter read = new SqlDataAdapter(sqlStr, conn);
                 conn.Open();
                 DataTable dt = new DataTable();
                 read.Fill(dt);
                 conn.Close();
                 return dt;
             
            
         }
         public static int ExecuteSQL(string sqlStr)
         {
             try
             {                 
                 SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ISBEPI_DEV"].ToString());
                 SqlCommand cmd = new SqlCommand(sqlStr, conn);
                 conn.Open();
                 int affectedRows = cmd.ExecuteNonQuery();
                 conn.Close();
                 return affectedRows;
             }
             catch
             {               
                 return 0;
             }
         }
         public static int ExecuteSQLSiteInfo(string sqlStr)
         {
             try
             {

                 SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ISBEPI_DEV"].ToString());
                 SqlCommand cmd = new SqlCommand(sqlStr, conn);
                 conn.Open();
                 //int affectedRows = cmd.ExecuteNonQuery();
                 int id = Convert.ToInt32(cmd.ExecuteScalar());
                 conn.Close();

                 return id;
             }
             catch
             {
                 return 0;
             }
         }
         public static int ExecuteSQLUpdate(DataTable dt, string sqlsr)
         {

             SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ISBEPI_DEV"].ToString());
             SqlDataAdapter da = new SqlDataAdapter(sqlsr,conn);            
             using (new SqlCommandBuilder(da))
             {
                 try
                 {
                     DataTable updt = new DataTable();
                     da.Fill(updt);
                     updt.Rows[0]["PD_EDUCATIONANDEXPERIENCE_Q12_1"] = dt.Rows[0]["PD_EDUCATIONANDEXPERIENCE_Q12_1"].ToString();
                     updt.Rows[0]["PD_EDUCATIONANDEXPERIENCE_Q12_2"] = dt.Rows[0]["PD_EDUCATIONANDEXPERIENCE_Q12_2"].ToString();
                     updt.Rows[0]["PD_EDUCATIONANDEXPERIENCE_Q12_3"] = dt.Rows[0]["PD_EDUCATIONANDEXPERIENCE_Q12_3"].ToString();
                     updt.Rows[0]["PD_EDUCATION_Q13"] = dt.Rows[0]["PD_EDUCATION_Q13"].ToString();
                     updt.Rows[0]["PD_EDUCATION_Q14"] = dt.Rows[0]["PD_EDUCATION_Q14"].ToString();
                     updt.Rows[0]["PD_EDUCATION_Q15"] = dt.Rows[0]["PD_EDUCATION_Q15"].ToString();
                     updt.Rows[0]["PD_EDUCATION_Q16"] = dt.Rows[0]["PD_EDUCATION_Q16"].ToString();
                     updt.Rows[0]["PD_EDUCATION_Q17"] = dt.Rows[0]["PD_EDUCATION_Q17"].ToString();
                     updt.Rows[0]["PD_EDUCATION_Q17"] = dt.Rows[0]["PD_EDUCATION_Q17"].ToString();
                     conn.Open();
                     int message = da.Update(updt);                     
                     conn.Close();
                     return message;
                 }
                 catch
                 {
                     return 0;
                 }
             }

         }    


         
    }
     
}