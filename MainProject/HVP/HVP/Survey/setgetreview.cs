using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace HVP.Survey
{
    class setgetreview
    {
        private static DataTable getDt = new DataTable();
        private static string SchdID, ID;
        public void setQuestions(DataTable dt)
        {            
                getDt = dt;             
            
        }
        public DataTable getQuestions()
        {
            return getDt;            
           
        }   
         public void setSchdID(string _SchdID)
        {
            SchdID = _SchdID;
        }
        public string getSchdID()
        {
            return SchdID;
        }
        public void setID(string _ID)
        {
            ID = _ID;
        }
        public string getID()
        {
            return ID;
        }

    }
}