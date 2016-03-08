<%@ Page Title="" Language="C#" MasterPageFile="~/beta/Site2.Master" AutoEventWireup="true" CodeBehind="ErrorPage.aspx.cs" Inherits="HVP.ErrorPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="push-1 border-collapse no-border-spacing">
        <tr>
            <td>
                <asp:Menu ID="Menu1" runat="server" SkipLinkText="" StaticDisplayLevels="2">
                    <Items>
                       <asp:MenuItem NavigateUrl="~/Admin/default.aspx" Text="Home" Value="Admin" ToolTip="Home">
                            <asp:MenuItem NavigateUrl="~/Staff/Assign.aspx" Text="Assigning Monitor" ToolTip="Assigning Monitor" Value="Assign Monitor"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/Admin/Manage.aspx" Text="Manage Monitors" ToolTip="Manage Monitors" Value="Manage"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/ChangePassword.aspx" Text="Change Password" ToolTip="Chnage Password" Value="Chnage Password"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/Admin/SiteInfomation.aspx" Text="Site Information" ToolTip="Site Information" Value="Site Information"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/Staff/Surveyoutput.aspx" Text="HV Survey Data" ToolTip="HV Survey Data" Value="HV Survey Data"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/Staff/PDSurveyOutput.aspx" Text="PD Survey Data" ToolTip="PD Survey Data" Value="PD Survey Data"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/Staff/ExporttoExcel.aspx" Target="_blank" Text="HV Survey to Excel" ToolTip="HV Survey to Excel" Value="HV Survey to Excel"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/Staff/PDtoExcel.aspx" Target="_blank" Text="PD Survey to Excel" ToolTip="PD Survey to Excel" Value="PD Survey to Excel"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/Staff/HVInterviewtoExcel.aspx" Target="_blank" Text="HV Interview to Excel" ToolTip="HV Interview to Excel" Value="HV Interview to Excel"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/ManageUsers/ManageUser.aspx" Text="Manage Users" ToolTip="Manage Users" Value="Manage Users"></asp:MenuItem>
                        </asp:MenuItem>
                    </Items>
                    <%--<StaticHoverStyle BackColor="Red" forecolor="Black"  />
                    <StaticMenuItemStyle Width="75px" BackColor="#990000" BorderColor="White" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" ForeColor="White"></StaticMenuItemStyle>--%>
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
