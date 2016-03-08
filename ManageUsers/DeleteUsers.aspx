<%@ Page Title="" Language="C#" MasterPageFile="~/MainNestedMaster.Master" AutoEventWireup="true" CodeBehind="DeleteUsers.aspx.cs" Inherits="HVP.ManageUsers.DeleteUsers" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Delete User</h2>
    <h4>Select User to Delete</h4>
    <asp:CheckBoxList ID="ChkBxLstDeleteUser" runat="server"></asp:CheckBoxList>
    <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />
</asp:Content>
