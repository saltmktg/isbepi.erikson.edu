<%@ Page Title="" Language="C#" MasterPageFile="~/MainNestedMaster.Master" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="HVP.Admin.AddUser" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
       
    
</asp:Content>--%>
<%--not using this page. Create user is right page.--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Add User</h2>
    <table>
        <tr>
            <td>            
                <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" ContinueDestinationPageUrl="~/default.aspx" LoginCreatedUser="False" OnCreatedUser="CreateUserWizard1_CreatedUser1" CancelDestinationPageUrl="~/Home.aspx">
                    <WizardSteps>
                        <asp:CreateUserWizardStep runat="server" >
                            <ContentTemplate>
                                <table>
                                    <tr>
                                        <td align="center" colspan="2">Sign Up for Your New Account</td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="auto-style1">
                                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="CreateUserWizard1" style="color: #FF0000">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="auto-style1">
                                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Password" runat="server" Enabled="False"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="CreateUserWizard1" style="color: #FF0000">*</asp:RequiredFieldValidator>
                                            <asp:Button ID="btnAutoPwd" runat="server" Text="Auto Generate Password" OnClick="btnAutoPwd_Click" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="auto-style1">
                                            <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="ConfirmPassword" runat="server" Enabled="False"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1" style="color: #FF0000">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="auto-style1">Name:</td>
                                        <td>
                                            <asp:TextBox ID="Name" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="NameRequired" runat="server" ErrorMessage="Name is Required." ControlToValidate="Name" ToolTip="Name is Required" style="color: #FF0000" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="auto-style1">
                                            <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="E-mail is required." ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1" style="color: #FF0000">*</asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Wrong Email Format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ToolTip="Wrong Email Format" ControlToValidate="Email" style="color: #FF0000"></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="auto-style1">
                                            <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">Security Question:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Question" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question" ErrorMessage="Security question is required." ToolTip="Security question is required." ValidationGroup="CreateUserWizard1" style="color: #FF0000">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="auto-style1">
                                            <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Security Answer:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Answer" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer" ErrorMessage="Security answer is required." ToolTip="Security answer is required." ValidationGroup="CreateUserWizard1" style="color: #FF0000">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="auto-style1">Role:</td>
                                        <td>
                                            <asp:RadioButtonList ID="rdoBtnLstRole" runat="server" DataSourceID="SqlDataSource1" DataTextField="RoleName" DataValueField="RoleName">
                                            </asp:RadioButtonList>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEVConnectionString %>" SelectCommand="SELECT [RoleName] FROM [vw_aspnet_Roles]"></asp:SqlDataSource>
                                            <asp:RequiredFieldValidator ID="RoleRequired" runat="server" ControlToValidate="rdoBtnLstRole" ErrorMessage="Role Required" style="color: #FF0000" ToolTip="Role Required" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2">
                                            <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match." ValidationGroup="CreateUserWizard1" style="color: #FF0000"></asp:CompareValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2" style="color:Red;">
                                            <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2" style="color:Red;">
                                            <asp:Label ID="lblMsg" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style1">
                                            <asp:Button ID="CancelButton" runat="server"  CausesValidation="False" CommandName="Cancel" Font-Names="Verdana"  Text="Cancel" ValidationGroup="CreateUserWizard1" />
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:CreateUserWizardStep>
                        <asp:CompleteWizardStep runat="server" >
                            <ContentTemplate>
                                <table style="font-family:Verdana;font-size:100%;">
                                    <tr>
                                        <td align="center" style="color:White;background-color:#5D7B9D;font-weight:bold;">Complete</td>
                                    </tr>
                                    <tr>
                                        <td>Your account has been successfully created.</td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Button ID="CancelButton" runat="server" BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" CausesValidation="False" CommandName="Cancel" Font-Names="Verdana" ForeColor="#284775" Text="Return To Home" ValidationGroup="CreateUserWizard1" />
                                            <asp:Button ID="ContinueButton" runat="server" BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" CausesValidation="False" CommandName="Continue" Font-Names="Verdana" ForeColor="#284775" Text="Continue To Login" ValidationGroup="CreateUserWizard1" />
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:CompleteWizardStep>
                    </WizardSteps>
                </asp:CreateUserWizard>
                </td>
            </tr>
        </table>
</asp:Content>
