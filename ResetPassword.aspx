<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="HVP.ResetPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <div class="userlist" style=" margin-left:20%; margin-right:20%;">
			<div>
        <h1 class="users">Reset Password</h1>
    </div>
                <table class="a">
                    <tr>
                        <th class="a">Enter Your User Name:
                        </th>
                        <td class="q">
                            <asp:TextBox ID="txtuserName" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                         <th class="a">Enter Your Email:
                        </th>
                        <td class="q">
                            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="a"> <asp:LinkButton ID="lnkCancel" runat="server" OnClick="lnkCancel_Click">CANCEL</asp:LinkButton></td>
                        <td class="a">
                            <asp:LinkButton ID="lnkbtnSubmit" runat="server" OnClick="btnSubmit_Click">NEXT</asp:LinkButton>
                        </td>                       
                    </tr>
                </table>
            </div>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <div class="userlist" style=" margin-left:20%; margin-right:20%;">
			<div>
        <h1 class="users">Reset Password</h1>
    </div>
                <table class="a">
                    <tr>
                        <th class="a">Question: 
                        </th>
                        <td class="q">
                            <asp:Label ID="lblQuestion" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th class="a">Answer:
                        </th>
                        <td class="q">
                            <asp:TextBox ID="txtAnswer" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="a" colspan="2">
                            <asp:LinkButton ID="lnkbtnSumitQuestion" runat="server" OnClick="lnkbtnSumitQuestion_Click">SUBMIT</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </div>
        </asp:View>
        <asp:View ID="View3" runat="server">
		 <div class="userlist" style=" margin-left:20%; margin-right:20%;">
			<div>
        <h1 class="users">Reset Password</h1>
    </div>
            <table>
                <tr>
                    <th>Password:
                    </th>
                    <td>
                        <asp:Label ID="lblPassword" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:HyperLink ID="hyplnkRedirectToLogin" runat="server" NavigateUrl="~/login.aspx">Login to change Password</asp:HyperLink></td>
                </tr>
            </table>
			</div>
        </asp:View>
    </asp:MultiView>

</asp:Content>
