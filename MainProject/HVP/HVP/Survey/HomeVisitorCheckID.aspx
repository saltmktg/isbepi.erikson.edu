<%@ Page Title="" Language="C#" MasterPageFile="~/Survey/SurveyMaster.Master" AutoEventWireup="true" CodeBehind="HomeVisitorCheckID.aspx.cs" Inherits="HVP.Survey.HomeVisitorCheckID" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="login">
    <table class="hvid">
        <tr>
            <th class="hvid">Select Program Name:</th>
            <td class="hvid">
                <asp:DropDownList ID="ddlProgramName" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlProgramName_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlProgramName" ErrorMessage="* Select Program Name" ValidationGroup="valGroup" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <th class="hvid">Select Site Name:</th>
            <td class="hvid">
                <asp:DropDownList ID="ddlSiteName" runat="server">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlSIteName" ErrorMessage="* Select Site Name" ValidationGroup="valGroup" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="hvidbtn">
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
            </td>
            <td class="hvid">
                <asp:Button ID="btnCheckSite" runat="server" Text="Verify" OnClick="btnCheckSite_Click" ValidationGroup="valGroup" />
            </td>
        </tr>
    </table>
        </div>
    <div>
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>       
    </div>
</asp:Content>
