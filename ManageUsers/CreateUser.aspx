<%@ Page Title="" Language="C#" MasterPageFile="~/MainNestedMaster.Master" AutoEventWireup="true" CodeBehind="CreateUser.aspx.cs" Inherits="HVP.ManageUsers.CreateUser" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
     <div id="userlist">
     <div><h1 class="users">Create User</h1></div>       
         <div>
         <fieldset class="field_set">
              <legend>Sign Up for Your New Account</legend>
             <table>        
        <tr>
            <th class="site">UserName:</th>
            <td>
                 <asp:TextBox ID="txtUserName" runat="server" Width="200px"></asp:TextBox>   
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Required" ValidationGroup="CreateVal" ControlToValidate="txtUserName"></asp:RequiredFieldValidator>                            
            </td>            
        </tr>
        <tr>
            <th class="site">Password:</th>
            <td>
                <asp:TextBox ID="txtPwd" runat="server" ReadOnly="True"  Width="200px"></asp:TextBox>                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="* Required" ValidationGroup="CreateVal" ControlToValidate="txtPwd"></asp:RequiredFieldValidator>
                <asp:Button ID="btnAutoPWd" runat="server" Text="Auto Generate Password" OnClick="btnAutoPWd_Click" />
            </td>
        </tr>
        <tr>
            <th class="site">Name:</th>
            <td>
                <asp:TextBox ID="txtName" runat="server"  Width="200px"></asp:TextBox>                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="* Required" ValidationGroup="CreateVal" ControlToValidate="txtName"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <th class="site">Email:</th>
            <td>
                <asp:TextBox ID="txtEmail" runat="server"  Width="200px"></asp:TextBox>                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="* Required" ValidationGroup="CreateVal" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="-Wrong Email Format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="CreateVal"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <th class="site">Roles</th>
            <td>
                <asp:DropDownList ID="ddlRoles" runat="server"  Width="200px" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="RoleName" DataValueField="RoleName" OnSelectedIndexChanged="ddlRoles_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="* Required" ControlToValidate="ddlRoles" ValidationGroup="CreateVal"></asp:RequiredFieldValidator>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT [RoleName] FROM [vw_aspnet_Roles]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <th class="site">
                <asp:Label ID="lblSites" runat="server" Text="Sites:" Visible="False"></asp:Label>
            </th>
            <td>
                <asp:DropDownList ID="ddlSites"  Width="200px" runat="server" DataSourceID="SqlDataSource2" DataTextField="Sites" DataValueField="SiteID"  Visible="False" AppendDataBoundItems="True">
              <asp:ListItem Text="" Value="" />
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="* Required" ValidationGroup="CreateVal" ControlToValidate="ddlSites" Visible="False"></asp:RequiredFieldValidator>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [Sites]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <th>
                <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
            </th>
        </tr>
        <tr>
            <th>
                <asp:LinkButton ID="lnkCancel" runat="server" OnClick="lnkCancel_Click">Cancel</asp:LinkButton>
            </th>
            <th>
                <asp:LinkButton ID="lnkCreate" runat="server" ValidationGroup="CreateVal" OnClick="lnkCreate_Click">Create User</asp:LinkButton>
            </th>
        </tr>
    </table>
          </fieldset>
         </div>
     </div>
</asp:Content>
