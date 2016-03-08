<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="HVP.ResetPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Reset Password</h2>
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <table class="a">
        <tr>
            <td class="a">
                 Enter Your User Name:
            </td>
            <td class="a">
                <asp:TextBox ID="txtuserName" runat="server"></asp:TextBox>
            </td>
        </tr>
                <tr>
                    <td></td>
                    <td class="a">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                    </td>
                </tr>        
    </table>
            </asp:View>
        <asp:View ID="View2" runat="server">
             <table class="a">
        <tr>
            <td class="a">
              Question: 
            </td>
            <td class="a">
                <asp:Label ID="lblQuestion" runat="server"></asp:Label>
            </td>
        </tr>
                 <tr>
                     <td class="d">
                         Answer:
                     </td>
                     <td class="q">
                         <asp:TextBox ID="txtAnswer" runat="server"></asp:TextBox>
                     </td>
                 </tr> 
                 <tr>
                     <td></td>
                     <td class="q">
                         <asp:Button ID="btnSumitQuestion" runat="server" Text="Submit" OnClick="btnSumitQuestion_Click" /></td>
                 </tr>       
    </table>
        </asp:View>
        <asp:View ID="View3" runat="server">
            <table>
                <tr>
                    <th>
                        Password:
                    </th>
                    <td>
                        <asp:Label ID="lblPassword" runat="server" ></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>

                    </td>
                    <td>
                        <asp:HyperLink ID="hyplnkRedirectToLogin" runat="server" NavigateUrl="~/login.aspx">Login to change Password</asp:HyperLink></td>
                </tr>
            </table>
        </asp:View>
        </asp:MultiView>
    
</asp:Content>
