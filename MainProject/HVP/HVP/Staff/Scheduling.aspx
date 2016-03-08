<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="Scheduling.aspx.cs" Inherits="HVP.Staff.Scheduling" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="userlist">
         <asp:MultiView ID="MultiView1" runat="server">
             <asp:View ID="View1" runat="server">
                  <div id="Assign" runat="server">
                <div><h1 class="users">Assign Monitor</h1> </div>
                      <div><label style="float:left;">Select Monitor:</label>
                      <asp:DropDownList ID="ddlMonitor" runat="server" Width="200px" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="NameID"></asp:DropDownList>
                          <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT UN.Name, UN.NameID FROM 
            [ISBEPI_DEV].[dbo].[UserNames] UN 
            JOIN [ISBEPI_DEV].[dbo].[Staff] ST ON UN.NameID = ST.NameID 
            JOIN aspnet_Membership Member ON Member.UserId = UN.UserId 
            WHERE ST.RoleId = 'E7F4D35C-8C43-48A0-99E1-8CF724F80ABD' AND Member.IsApproved =1 ORDER BY Name"></asp:SqlDataSource>
                      </div>
                      <div><label style="float:left;">Select Second Monitor:</label>
                      <asp:DropDownList ID="ddlSecondMonitor" runat="server" Width="200px"></asp:DropDownList></div>
                       <div><label style="float:left;">Select Program Name:</label>
                      <asp:DropDownList ID="ddlProgram" runat="server" Width="200px" DataSourceID="SqlDataSource2" DataTextField="Program" DataValueField="Program_ID"></asp:DropDownList>
                           <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT [Program_ID], [Program] FROM [Program] ORDER BY [Program]"></asp:SqlDataSource>
                      </div>
                      <div><label style="float:left;">Select Site Name:</label>
                      <asp:DropDownList ID="ddlSites" runat="server" Width="200px"></asp:DropDownList></div>
                </div>
               
             </asp:View>
         </asp:MultiView>                 
         </div>
</asp:Content>
