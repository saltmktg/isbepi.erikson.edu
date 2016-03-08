<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ErrorPage.aspx.cs" Inherits="HVP.ErrorPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>
                <asp:Menu ID="Menu1" runat="server" SkipLinkText="">
                    <Items>
                        <asp:MenuItem NavigateUrl="~/default.aspx" Text="Home" Value="Home"></asp:MenuItem>
                    </Items>
                    <StaticHoverStyle BackColor="Red" forecolor="Black"  />
                    <StaticMenuItemStyle Width="75px" BackColor="#990000" BorderColor="White" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" ForeColor="White"></StaticMenuItemStyle>
                </asp:Menu>
            </td>
            <td>
     <h2>Unauthorized Access</h2>
    <p>
        You have attempted to access a page that you are not authorized to view.
    </p>
    <p>
        If you have any questions, please contact the site administrator.
    </p>
                </td>
            </tr>
        </table>
</asp:Content>
