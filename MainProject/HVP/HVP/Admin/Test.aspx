<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="HVP.Admin.Test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <title>User's IP Address using ASP.NET</title>   
    <style type="text/css">
    body
    {
      background-color:#32373a;
      color:#FFFFFF;
    }
    #mainBody
    {
      background-color:#FFFFFF;
      height:100%;
      color:#32373a;
    }
    .divMainTime
    {
      width:350px;
      height:30px;
      background-color:#fdd136;
      font-size:14px;
      vertical-align:middle;
      padding-top: 5px;
    }
    #divLANIPAddress
    {
        font-size:20px;
        float:right;
        margin-right:10px;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    
    <div id='mainBody'>
    <h1>
    Retrieve User's IP Address
    </h1>
    <br />
        <div class='divMainTime'>
            <div style='float:left;font-size:18px;'>User's IP Address :</div> 
            <div id="divLANIPAddress" runat="server"></div>
        </div>
    </div>
    </form>
</body>
</html>
