<%@ Page Title="" Language="C#" MasterPageFile="~/MainNestedMaster.Master" AutoEventWireup="true" CodeBehind="ManageRoles.aspx.cs" Inherits="HVP.Admin.ManageRoles" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>MANAGE ROLES</h2>
    <table>
        <tr>
            <td>
                Current Roles:
            </td>
            <td>
                <asp:BulletedList ID="BulllstRole" runat="server"></asp:BulletedList>               
            </td>            
        </tr>        
        <tr>
            <td>
                 Create New Role:
            </td>
            <td>
                <asp:TextBox ID="txtCreateNewRole" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="btnSubmitTextBX" runat="server" Text="Add New Role" OnClick="btnSubmitTextBX_Click" />
            </td>
        </tr>
        <tr><td>
            <asp:Label ID="lblComment" runat="server" ForeColor="Red" Visible="False"></asp:Label></td></tr>
    </table>
    
   
    
</asp:Content>
