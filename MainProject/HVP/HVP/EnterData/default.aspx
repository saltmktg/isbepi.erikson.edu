<%@ Page Title="" Language="C#" MasterPageFile="~/EnterData/ManageSiteEnterData.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="HVP.EnterData._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <asp:HiddenField ID="hfsiteid" runat="server" />
    <asp:HiddenField ID="hfSchdId" runat="server" />
    <div class="userlist">
   <div> <h1 class="users">Manage Sites: Enter Data</h1></div>    
        <div><h2 class="Sitename">Sitename:
            <asp:Label ID="lblSitename" runat="server"></asp:Label></h2>
            <h4 class="Sitename">Program ID: <asp:Label ID="lblProgramId" runat="server"></asp:Label></h4>
        </div>
        </div>
</asp:Content>
