<%@ Page Title="" Language="C#" MasterPageFile="~/MainNestedMaster.Master" AutoEventWireup="true" CodeBehind="ManageUser.aspx.cs" Inherits="HVP.ManageUsers.ManageUser" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="userlist">
    <div>
        <h1 class="users">Users</h1>
    </div>
          <div style="float:left; margin-right:.5em;">
        <asp:LinkButton ID="lnkAdduser" runat="server" OnClick="lnkAdduser_Click">Add User</asp:LinkButton>
            </div>       
        <div style="float:left;  margin-right:.5em;">
            <asp:LinkButton ID="lnkunlockuser" runat="server" OnClick="lnkunlockuser_Click">Unlock User</asp:LinkButton>
            </div>
         <div style="float:left;  margin-right:.5em;">
            <asp:LinkButton ID="lnkRetrieve" runat="server" OnClick="lnkRetrieve_Click">Retrieve Password</asp:LinkButton>
            </div> 
          <div style="float:left;  margin-right:.5em;">
            <asp:LinkButton ID="lnkDisableUser" runat="server" OnClick="lnkDisableUser_Click">Disable User</asp:LinkButton>
            </div>  
         <div style="float:left;  margin-right:.5em;">
            <asp:LinkButton ID="lnkChangeRoles" runat="server" OnClick="lnkChangeRoles_Click">Change Roles</asp:LinkButton>
            </div>  
        <div style="float:left;  margin-right:.5em;">
            <asp:LinkButton ID="lnkAnalytics" runat="server" OnClick="lnkAnalytics_Click"> User Analytics</asp:LinkButton>
            </div>  
        <br />    
        <br />
        <div>
            <asp:gridview runat="server" Width="100%" AutoGenerateColumns="False" CssClass="Grid2" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" EnableModelValidation="True" ForeColor="Black" GridLines="Vertical" DataSourceID="SqlDataSource1">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:BoundField HeaderText="Name" DataField="Name" SortExpression="Name" />
                    <asp:BoundField HeaderText="UserName" DataField="UserName" SortExpression="UserName" />
                    <asp:BoundField HeaderText="RoleName" DataField="RoleName" SortExpression="RoleName" />
                    <asp:BoundField HeaderText="status" DataField="status" ReadOnly="True" SortExpression="status" />
                    <asp:BoundField DataField="Locked" HeaderText="Locked" ReadOnly="True" SortExpression="Locked" />
                    <asp:BoundField HeaderText="LastLoginDate" DataField="LastLoginDate" SortExpression="LastLoginDate" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="#999999" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="Black" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            </asp:gridview>       
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="  SELECT UN.Name, users.UserName, Roles.RoleName, case when Member.IsApproved =1 then 'Active' else 'Not Active' end as status, case when Member.[IsLockedOut] =1 then 'True' else 'False' end as Locked, Member.LastLoginDate  FROM [ISBEPI_DEV].[dbo].[UserNames] UN
  --INNER JOIN [ISBEPI_DEV].[dbo].[Staff] staff ON staff.UserId = UN.UserId
  INNER JOIN [ISBEPI_DEV].[dbo].[aspnet_Users] Users ON Users.UserId = Un.UserId
  INNER JOIN [ISBEPI_DEV].[dbo].[aspnet_UsersInRoles] UserRoles ON UserRoles.UserId = Users.UserId
  INNER JOIN [ISBEPI_DEV].[dbo].[aspnet_Roles] Roles ON Roles.RoleId = UserRoles.RoleId 
  INNER JOIN [ISBEPI_DEV].[dbo].[aspnet_Membership] Member ON Member.UserId = Un.UserId"></asp:SqlDataSource>
        </div>
        </div>
</asp:Content>