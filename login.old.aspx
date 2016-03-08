<%@ Page Title="" Language="C#" MasterPageFile="~/loginMaster.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="HVP._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 
    
    <div id="login">
     <asp:Login ID="Login1" runat="server" DestinationPageUrl="~/Home.aspx" DisplayRememberMe="False" FailureAction="RedirectToLoginPage" PasswordRecoveryUrl="~/ResetPassword.aspx" PasswordRecoveryText="Forgot Password" OnLoginError="Login1_LoginError" Height="150px"  Width="300px" LoginButtonText="LOGIN"  TitleText=" _______  LOGIN  _______" LoginButtonType="Button" >
         <HyperLinkStyle Font-Bold="True" Font-Italic="False" Font-Strikeout="False" Font-Underline="False" Wrap="True" />
         <LabelStyle Font-Bold="True" Font-Italic="True" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" ForeColor="White" HorizontalAlign="Center" />
         <LoginButtonStyle  BackColor="#3399FF" BorderStyle="None" Font-Bold="False" Font-Italic="False" ForeColor="White" Font-Names="Arial Black" Font-Size="Medium" Width="190px" />
         <TextBoxStyle BackColor="White" BorderStyle="None" ForeColor="Black" Width="170px" />
         <TitleTextStyle Font-Bold="True" ForeColor="Maroon" Font-Italic="False" Font-Underline="False" Font-Overline="False" Font-Names="Arial Black" Font-Size="Large" />
         <ValidatorTextStyle Font-Bold="True" Font-Italic="True" Font-Size="Larger" />
    </asp:Login>
    <asp:HyperLink CssClass="hv" ID="HyperLink1" runat="server" NavigateUrl="~/default.aspx" Font-Bold="True" Font-Underline="False">Home</asp:HyperLink>
       </div>    
    </asp:Content>
