using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace HVP
{
    class toGetInfo
    {
        private static string Name, SchdID, SiteID, SiteName, SiteAddress, _City, _State, VisitingDate, status, PhoneNumber, ZipCode;
        private static int total, total2, total3;
        private static bool check, miechv;
        public void setVlaue(string _Name, string Site_ID, string Site_Name, string Site_Address, string city, string state, string Visiting_Date, string _status,string _phone, string _Zip,bool _miechv)
        {
            Name = _Name;            
            SiteID = Site_ID;
            SiteName = Site_Name;
            SiteAddress = Site_Address;
            VisitingDate = Visiting_Date;
            status = _status;
            _City = city;
            _State = state;
            PhoneNumber = _phone;
            ZipCode = _Zip;
            miechv = _miechv;
        }
        public void setSiteID(string _SiteID)
        {
            SiteID = _SiteID;
        }
        public void setVisitDate(string _Date)
        {
            VisitingDate = _Date;
        }
        public void setSchdID(string _SchdID)
        {
            SchdID = _SchdID;
        }
        public string getSchdID()
        {
            return SchdID;
        }
        public string getValueFname()
        {
            return Name;            
        }
        
        public string getValueSiteID()
        {            
            return SiteID;            
        }
        public string getValueSiteName()
        {            
            return SiteName;            
        }
        public string getValueSiteAddress()
        {            
            return SiteAddress;            
        }
        public string getValueVisitingDate()
        {           
            return VisitingDate;
        }
        public string getValueStatus()
        {
            return status;
        }

        public string getValueCity()
        {
            return _City;
        }
        public string getValueState()
        {
            return _State;
        }
        public string getPhone()
        {
            return PhoneNumber;
        }
        public string getZip()
        {
            return ZipCode;
        }
        public void setStarted(bool _check)
        {
            check = _check;
        }
        public bool getMiechv()
        {
            return miechv;
        }
        public bool getStarted()
        {
            return check;
        }
        public void Set_total_1(int _total)
        {
            total = _total;
        }
        public int Get_total_1()
        {
            return total;
        }
        public void Set_total_2(int _total)
        {
            total2 = _total;
        }
        public int Get_total_2()
        {
            return total2;
        }
        public void Set_total_3(int _total)
        {
            total3 = _total;
        }
        public int Get_total_3()
        {
            return total3;
        }
    }
}
