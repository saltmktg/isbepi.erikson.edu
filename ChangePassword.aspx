<%@ Page Title="" Language="C#" MasterPageFile="~/MainNestedMaster.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="HVP.ChnagePassword" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="userlist">
        <div>
            <h1 class="users">Change Your Password</h1>
        </div>
        <table>
            <tr>
                <th>Current Password:
                </th>
                <td>
                    <asp:TextBox ID="txtCurrentPwd" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" ValidationGroup="ValGroup" ControlToValidate="txtCurrentPwd"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <th>New Password:
                </th>
                <td>
                    <asp:TextBox ID="txtNewPwd" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required" ValidationGroup="ValGroup" ControlToValidate="txtNewPwd"></asp:RequiredFieldValidator>                    
                </td>               
            </tr>
            <tr>
                <td colspan="2"><h6 style="color: red">- Password length minimum:7. Non-alphanumeric characters required:1</h6></td>
            </tr>
            <tr>
                <th>Confirm Password:
                </th>
                <td>
                    <asp:TextBox ID="txtConfirmPwd" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required" ValidationGroup="ValGroup" ControlToValidate="txtConfirmPwd"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Confirm password must match password." ValidationGroup="ValGroup" ControlToCompare="txtNewPwd" ControlToValidate="txtConfirmPwd"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <th>Security Questions:
                </th>
                <td>
                    <asp:DropDownList ID="ddlQuestion" runat="server">
                        <asp:ListItem Value="0">Select</asp:ListItem>
                        <asp:ListItem Value="1">What is your oldest sibling&#39;s middle name?</asp:ListItem>
                        <asp:ListItem Value="2">In what city or town was your first job?</asp:ListItem>
                        <asp:ListItem Value="3">What is the first name of your oldest niece/nephew?</asp:ListItem>
                        <asp:ListItem Value="4">What was the make and model of your first car?</asp:ListItem>
                        <asp:ListItem Value="5">What is the name of the first school you attended?</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required" ValidationGroup="ValGroup" ControlToValidate="ddlQuestion"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <th>Security Answer:
                </th>
                <td>
                    <asp:TextBox ID="txtAnswer" runat="server" Width="175px" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required" ValidationGroup="ValGroup" ControlToValidate="txtAnswer"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblComment" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnChangePwd" runat="server" Text="Change Password" OnClick="btnChangePwd_Click" />
                </td>
                <td>
                    <asp:Button ID="Cancel" runat="server" Text="Cancel" OnClick="Cancel_Click" /></td>
            </tr>
        </table>
    </div>
</asp:Content>
