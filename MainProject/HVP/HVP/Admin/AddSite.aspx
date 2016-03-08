<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="AddSite.aspx.cs" Inherits="HVP.Admin.AddSite" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
    <table>
        <tr><th id="AddSiteTitle">SITE INFORMATION</th></tr>
        <tr><th>&nbsp;</th></tr>
        <tr>
            <th>Site ID:</th>
            <td>
                <asp:TextBox ID="txtSiteID" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <th>
                Site Name:
            </th>
            <td>
                <asp:TextBox ID="txtSiteName" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <th>
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
            </th>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnCheckSite" runat="server" Text="Check Site" OnClick="btnCheckSite_Click" />
            </td>
        </tr>
    </table>
            </asp:View>
        <asp:View ID="View2" runat="server">
            <asp:GridView ID="grdViewSite" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="DistrictRCDT" HeaderText="Site ID" />
                    <asp:BoundField DataField="DistrictName" HeaderText="Site Name" />
                    <asp:BoundField DataField="DistrictAdminAddress" HeaderText="Site Address" />
                    <asp:BoundField DataField="DistrictAdminCity" HeaderText="Site City" />
                    <asp:BoundField DataField="DistrictAdminState" HeaderText="Site State" />
                </Columns>
            </asp:GridView>
            <asp:Button ID="btnReturnV2" runat="server" Text="Return" OnClick="btnReturnV2_Click" />
        </asp:View>
        <asp:View ID="View3" runat="server">
            <h2 id="H1">Add A NEW SITE</h2>
            <table>
                <tr>
                    <th>
                        Site ID:
                    </th>
                    <td>

                        <asp:TextBox ID="txtSiteIDV3" runat="server" Width="200px"></asp:TextBox>

                    </td>                    
                </tr>
                <tr>
                    <th>
                        Site Name:
                    </th>
                    <td>

                        <asp:TextBox ID="txtSiteNameV3" runat="server" Width="200px"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <th>
                    County:
                    </th>
                    <td>

                        <asp:TextBox ID="txtCountyV3" runat="server" Width="200px"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <th>
                        Initiative:
                    </th>
                    <td>

                        <asp:TextBox ID="txtInitiativeV3" runat="server" Width="200px"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <th>
                        DistrictAdminName:
                    </th>
                    <td>

                        <asp:TextBox ID="txtDstAdminName" runat="server" Width="200px"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <th>
                        DistrictAdminAddress:
                    </th>
                    <td>

                        <asp:TextBox ID="txtDstAdminAddress" runat="server" Width="200px" Height="60px" TextMode="MultiLine"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <th>
                        DistrictAdminCity:
                    </th>
                    <td>

                        <asp:TextBox ID="TextBox7" runat="server" Width="200px"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <th>
                        DistrictAdminState:
                    </th>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server">

                            <asp:ListItem>Select One</asp:ListItem>
                            <asp:ListItem>AK</asp:ListItem>
	                        <asp:ListItem>AL</asp:ListItem>
	                        <asp:ListItem>AR</asp:ListItem>
	                        <asp:ListItem>AZ</asp:ListItem>
	                        <asp:ListItem>CA</asp:ListItem>
	                        <asp:ListItem>CO</asp:ListItem>
	                        <asp:ListItem>CT</asp:ListItem>
	                        <asp:ListItem>DC</asp:ListItem>
	                        <asp:ListItem>DE</asp:ListItem>
	                        <asp:ListItem>FL</asp:ListItem>
	                        <asp:ListItem>GA</asp:ListItem>
	                        <asp:ListItem>HI</asp:ListItem>
	                        <asp:ListItem>IA</asp:ListItem>
	                        <asp:ListItem>ID</asp:ListItem>
	                        <asp:ListItem>IL</asp:ListItem>
	                        <asp:ListItem>IN</asp:ListItem>
	                        <asp:ListItem>KS</asp:ListItem>
	                        <asp:ListItem>KY</asp:ListItem>
	                        <asp:ListItem>LA</asp:ListItem>
	                        <asp:ListItem>MA</asp:ListItem>
	                        <asp:ListItem>MD</asp:ListItem>
	                        <asp:ListItem>ME</asp:ListItem>
	                        <asp:ListItem>MI</asp:ListItem>
	                        <asp:ListItem>MN</asp:ListItem>
	                        <asp:ListItem>MO</asp:ListItem>
	                        <asp:ListItem>MS</asp:ListItem>
	                        <asp:ListItem>MT</asp:ListItem>
	                        <asp:ListItem>NC</asp:ListItem>
	                        <asp:ListItem>ND</asp:ListItem>
	                        <asp:ListItem>NE</asp:ListItem>
	                        <asp:ListItem>NH</asp:ListItem>
	                        <asp:ListItem>NJ</asp:ListItem>
	                        <asp:ListItem>NM</asp:ListItem>
	                        <asp:ListItem>NV</asp:ListItem>
	                        <asp:ListItem>NY</asp:ListItem>
	                        <asp:ListItem>OH</asp:ListItem>
	                        <asp:ListItem>OK</asp:ListItem>
	                        <asp:ListItem>OR</asp:ListItem>
	                        <asp:ListItem>PA</asp:ListItem>
	                        <asp:ListItem>RI</asp:ListItem>
	                        <asp:ListItem>SC</asp:ListItem>
	                        <asp:ListItem>SD</asp:ListItem>
	                        <asp:ListItem>TN</asp:ListItem>
	                        <asp:ListItem>TX</asp:ListItem>
	                        <asp:ListItem>UT</asp:ListItem>
	                        <asp:ListItem>VA</asp:ListItem>
	                        <asp:ListItem>VT</asp:ListItem>
	                        <asp:ListItem>WA</asp:ListItem>
	                        <asp:ListItem>WI</asp:ListItem>
	                        <asp:ListItem>WV</asp:ListItem>
	                        <asp:ListItem>WY</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <th>
                    DistrictAdminZip:
                        </th>
                    <td>

                        <asp:TextBox ID="TextBox9" runat="server" Width="200px"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <th>
                        DistrictAdminPhone:
                    </th>
                    <td>

                        <asp:TextBox ID="TextBox10" runat="server" Width="200px"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <th>
                        DistrictAdminFax:
                    </th>
                    <td>

                        <asp:TextBox ID="TextBox11" runat="server" Width="200px"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <th>
                        DistrictAdmineMail:
                    </th>
                    <td>

                        <asp:TextBox ID="TextBox12" runat="server" Width="200px"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <th>
                         <asp:Button ID="btnCancelV3" runat="server" Text="Cancel" OnClick="btnCancelV3_Click" />
                    </th>
                    
                    <td>
                        <asp:Button ID="btnAdd" runat="server" Text="Add New Site" />
                        </td>
                       
                </tr>
            </table>
        </asp:View>
        </asp:MultiView>
</asp:Content>
