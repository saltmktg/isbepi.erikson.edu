<%@ Page Title="" Language="C#" MasterPageFile="~/MainNestedMaster.master" AutoEventWireup="true" CodeBehind="ChangeRoles.aspx.cs" Inherits="HVP.ManageUsers.ChangeRoles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="userlist">
     <div><h1 class="users">Roles</h1></div>       
         <div>
         <fieldset class="field_set">
              <legend>CHANGE ROLES</legend>
             <table>        
        <tr>
            <th class="site">UserName:</th>
            <td>
                 <asp:DropDownList ID="ddlUserName" runat="server" OnSelectedIndexChanged="ddlUserName_SelectedIndexChanged" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="UserName" AppendDataBoundItems="True">
                 <asp:ListItem></asp:ListItem>
                 </asp:DropDownList>
                 <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT UN.Name, Ur.UserName FROM [ISBEPI_DEV].[dbo].[UserNames] UN JOIN aspnet_Users UR ON UN.UserId = UR.UserId ORDER BY NAME"></asp:SqlDataSource>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Required" ValidationGroup="CreateVal" ControlToValidate="ddlUserName"></asp:RequiredFieldValidator>                            
            </td>            
        </tr>       
        <tr>
            <th class="site">Name:</th>
            <td>
                <asp:TextBox ID="txtName" runat="server"  Width="200px"></asp:TextBox>                
            </td>
        </tr>
        <tr>
            <th class="site">Email:</th>
            <td>
                <asp:TextBox ID="txtEmail" runat="server"  Width="200px"></asp:TextBox>                
            </td>
        </tr>
        <tr>
            <th class="site">Roles</th>
            <td>
                <asp:DropDownList ID="ddlRoles" runat="server"  Width="200px" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="RoleName" DataValueField="RoleName" OnSelectedIndexChanged="ddlRoles_SelectedIndexChanged" AppendDataBoundItems="True">
                <asp:ListItem></asp:ListItem>
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
                <asp:LinkButton ID="lnkCreate" runat="server" ValidationGroup="CreateVal" OnClick="lnkCreate_Click">Change Role</asp:LinkButton>
            </th>
        </tr>
    </table>
          </fieldset>
         </div>
     </div>
</asp:Content>
