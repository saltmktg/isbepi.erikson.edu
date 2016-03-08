<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="VerifySiteInfomation.aspx.cs" Inherits="HVP.Survey.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Site Verification</h2>
     <table class="site">
         <tr>
             <td></td>
             <td></td>
         </tr>        
         <tr>
             <th>Site Name:</th>
              <td>
                <asp:TextBox ID="txtSiteName" runat="server" Width="200px"></asp:TextBox></td>
         </tr>
         <tr>
             <th>Site Address:</th>
              <td>
                <asp:TextBox ID="txtSiteAddress" runat="server" Height="75px" TextMode="MultiLine" Width="200px"></asp:TextBox></td>
         </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="btnContinue" runat="server" Text="Continue" />
            </td>
        </tr>
    </table>
</asp:Content>
