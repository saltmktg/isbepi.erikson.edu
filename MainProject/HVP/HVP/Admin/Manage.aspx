<%@ Page Title="" Language="C#" MasterPageFile="~/MainNestedMaster.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="HVP.Admin.Manage" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
             <div id="userlist" runat="server">
                <div> <h1 class="users">Manage Monitors</h1> </div>            
            <asp:GridView ID="grdManager" runat="server"  AutoGenerateColumns="False" AutoGenerateSelectButton="True" OnSelectedIndexChanging="GridView1_SelectedIndexChanged1" EmptyDataText="NO DATA" EnableModelValidation="True" DataKeyNames="NameID" DataSourceID="SqlDataSource1" HorizontalAlign="Left">
    <Columns>
        <asp:BoundField HeaderText="Name" DataField="Name" SortExpression="Name" />
        <asp:BoundField DataField="NameID" HeaderText="NameID" ReadOnly="True" SortExpression="NameID" ItemStyle-CssClass="HiddenSiteID" HeaderStyle-CssClass ="HiddenSiteID" InsertVisible="False">
            </asp:BoundField>
        <asp:BoundField DataField="VistingCount" HeaderText="Visiting Assigned" ReadOnly="True" SortExpression="VistingCount" />
    </Columns>
</asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT DISTINCT UN.Name, UN.NameID,count(schd.NameID) AS VistingCount 
FROM UserNames UN JOIN Scheduling Schd ON UN.NameID = Schd.NameID
Group by Un.Name,UN.NameID,Schd.NameID"></asp:SqlDataSource>
                   </div>
        </asp:View>
       
        <!--New View -->
        <asp:View ID="View2" runat="server">
             <div class="userlist" runat="server">
                <div> <h1 class="users">Manage Monitors</h1> </div>     
           <%-- <table><tr><th>
            Search By:
                </th>
                <td>
            <asp:DropDownList ID="ddlSearch" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged">
                <asp:ListItem Value="0" Selected="True">Select One</asp:ListItem>
                <asp:ListItem Value="1">Site Name</asp:ListItem>
                <asp:ListItem Value="2">Name</asp:ListItem>
                <asp:ListItem Value="3">Visiting Date</asp:ListItem>
            </asp:DropDownList>
                </td>                
                   </tr>
                <tr>
                    <th>
                        <asp:Label ID="lblSearch" runat="server" Visible="False"></asp:Label>
                    </th>
                    <td>
                        <asp:DropDownList ID="ddlSlectSearch" Visible="false" runat="server"></asp:DropDownList>
                        <asp:TextBox ID="txtSearch" runat="server" Visible="False"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" Visible="False" /></td>
                </tr>
            </table>--%>
            <asp:GridView ID="grdview2" runat="server" CssClass="Grid" AutoGenerateColumns="False" AutoGenerateSelectButton="True" OnSelectedIndexChanging="GridView1_SelectedIndexChanged2" EmptyDataText="NO DATA" EnableModelValidation="True" HorizontalAlign="Center"> <%--OnRowDeleting="grdview2_RowDeleting"--%>
                <Columns>
                    <asp:BoundField HeaderText="Schedule Date" DataField="VisitDate" DataFormatString="{0:d}" />
                    <asp:BoundField HeaderText="Monitor's Name" DataField="Name" />
                    <asp:BoundField DataField="Sites" HeaderText="Site Name" />
                    <asp:BoundField DataField="Status" HeaderText="Status" />
                    <asp:BoundField DataField="City_or_location" HeaderText="Location" />
                    <asp:BoundField DataField="Schd_ID" HeaderText="ScheduleID" ItemStyle-CssClass="HiddenSiteID" HeaderStyle-CssClass ="HiddenSiteID">
                    <HeaderStyle CssClass="HiddenSiteID" />
                    <ItemStyle CssClass="HiddenSiteID" />
                    </asp:BoundField>
                    <asp:BoundField DataField="NameID" HeaderText="NameID" ItemStyle-CssClass="HiddenSiteID" HeaderStyle-CssClass ="HiddenSiteID">
                         <HeaderStyle CssClass="HiddenSiteID" />
                    <ItemStyle CssClass="HiddenSiteID" />
                        </asp:BoundField>
                </Columns>
            </asp:GridView>
           <div>
                        <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource2" EnableModelValidation="True" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" GridLines="Both" Width="200%" OnItemUpdated="FormView1_ItemUpdated">
                            <EditItemTemplate>
                                Name:
                                <asp:DropDownList ID="ddlurname" runat="server" DataSourceID="ddlusername" DataTextField="Name" DataValueField="NameID" AppendDataBoundItems="true">
                                <asp:ListItem Text="" Value="0" />
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="ddlusername" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="  SELECT UN.Name, UN.NameID FROM UserNames un JOIN Staff st ON st.NameID = un.NameID 
                                WHERE st.RoleId ='E7F4D35C-8C43-48A0-99E1-8CF724F80ABD';"></asp:SqlDataSource>
                                <asp:SqlDataSource ID="ddlSitename" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT [Sites], [SiteID] FROM [Sites]"></asp:SqlDataSource>
                                <br />
                                <br />
                                Sites:
                                <asp:DropDownList ID="ddlStname" runat="server" DataSourceID="ddlSitename" DataTextField="Sites" DataValueField="SiteID" AppendDataBoundItems="true">
                                 <asp:ListItem Text="" Value="0" />
                                </asp:DropDownList>
                                <br />
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Change Monitor/Site" OnClick="UpdateButton_Click" />
                                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                            </EditItemTemplate>                        
                            <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                            <ItemTemplate>                               
                                Name:
                                <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' />
                                <br /> <br />
                                Sites:
                                <asp:Label ID="SitesLabel" runat="server" Text='<%# Bind("Sites") %>' />
                                <br /> <br />
                                Status:
                                <asp:Label ID="StatusLabel" runat="server" Text='<%# Bind("Status") %>' />
                                <br /> <br />
                                VisitDate:
                                <asp:Label ID="VisitDateLabel" runat="server" Text='<%# Bind("VisitDate") %>' />
                                <br /> <br />
                                City_or_location:
                                <asp:Label ID="City_or_locationLabel" runat="server" Text='<%# Bind("City_or_location") %>' />
                                <br /> <br />
                                 Site_Address:
                                <asp:Label ID="Site_AddressLabel" runat="server" Text='<%# Bind("Site_Address") %>' />
                                <br /> <br />
                                City:
                                <asp:Label ID="CityLabel" runat="server" Text='<%# Bind("City") %>' />
                                <br />   <br />                             
                                State:
                                <asp:Label ID="StateLabel" runat="server" Text='<%# Bind("State") %>' />
                                <br /> <br />
                                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Change Monitor/Site" /><br />                               
                            </ItemTemplate>
                            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                        </asp:FormView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT Schd.Schd_ID, UN.NameID, Schd.SiteID, UN.Name, s.Sites, Schd.Status, Schd.VisitDate, s.City_or_location, s.City, s.Site_Address, s.State FROM Scheduling AS Schd INNER JOIN UserNames AS UN ON Schd.NameID = UN.NameID INNER JOIN Sites AS s ON s.SiteID = Schd.SiteID WHERE (Schd.Schd_ID = @Schd_ID) ">
                            <SelectParameters>
                                <asp:SessionParameter DefaultValue="0" Name="Schd_ID" SessionField="schdid" Type="Int32" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="SiteID" Type="Int32" />
                                <asp:Parameter Name="NameID" Type="Int32" />
                                <asp:Parameter Name="Schd_ID" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                  </div>
                 <div>                 
                        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder><br />                    
                    </div>  
                 
                 <div style="margin:10px;">
                        <asp:LinkButton ID="lnkbtnReturnv2" runat="server" OnClick="lnkbtnReturnv2_Click">Return</asp:LinkButton>
                 </div>
                 </div>
        </asp:View>
          <!--New View -->       
    </asp:MultiView>
</asp:Content>
