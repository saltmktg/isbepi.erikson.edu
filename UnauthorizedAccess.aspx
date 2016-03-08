<%@ Page Title="" Language="C#" MasterPageFile="~/MainNestedMaster.Master" AutoEventWireup="true" CodeBehind="UnauthorizedAccess.aspx.cs" Inherits="HVP.UnauthorizedAccess" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <h2>Unauthorized Access</h2>
    <p>
        You have attempted to access a page that you are not authorized to view.
    </p>
    <p>
        If you have any questions, please contact the site administrator.
    </p>
</asp:Content>
