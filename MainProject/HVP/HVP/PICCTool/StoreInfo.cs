using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HVP.PICCTool
{
    class StoreInfo
    {
        private static string Id, Program_name, Address, Authorized_Official, RCDT, Assessor, Visit_Date, Notes;

        public void setvalue_ID(string _id)
        {
            Id = _id;
        }
        public void setvalue_ProgramName(string _programName)
        {
            Program_name = _programName;
        }

        public void setvalue_Address(string _Address)
        {
            Address = _Address;
        }
        public void setvalue_AuthorizedOfficial(string _authorizedOfficial)
        {
            Authorized_Official = _authorizedOfficial;
        }
        public void setvalue_RCDT(string _RCDT)
        {
            RCDT = _RCDT;
        }
        public void setvalue_Assessor(string _Assessor)
        {
            Assessor = _Assessor;
        }
        public void setvalue_VisitDate(string _VisitDate)
        {
            Visit_Date = _VisitDate;
        }
        public void setvalue_Notes(string _Notes)
        {
            Notes = _Notes;
        }

        public string getvalue_ID()
        {
            return Id;
        }
        public string getvalue_ProgramName()
        {
            return Program_name;
        }

        public string getvalue_Address()
        {
            return Address;
        }
        public string getvalue_AuthorizedOfficial()
        {
            return Authorized_Official;
        }
        public string getvalue_RCDT()
        {
            return RCDT;
        }
        public string getvalue_Assessor()
        {
           return Assessor;
        }
        public string getvalue_VisitDate()
        {
            return Visit_Date;
        }
        public string getvalue_Notes()
        {
           return Notes;
        }
    }
}