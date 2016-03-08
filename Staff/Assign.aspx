<%@ Page Title="" Language="C#" MasterPageFile="~/MainNestedMaster.Master" AutoEventWireup="true" CodeBehind="Assign.aspx.cs" Inherits="HVP.Admin.TimeSchedulig" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="userlist">
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
             
    
            <div id="Assign" runat="server">
                <div> <h1 class="users">Assign Monitor</h1> </div>    
    <table>            
        <tr>
            <th>
                Select Monitor:</th>            
            <td>             
                
                <asp:DropDownList ID="ddluser" runat="server">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddluser" Display="Dynamic" ErrorMessage="*" Font-Size="Large" ForeColor="Red" ValidationGroup="valGroup1"></asp:RequiredFieldValidator>
            </td>                    
        </tr> 
          <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>              
        <tr>           
        <th>Select Program Name:</th>                     
            <td>            
                <asp:DropDownList ID="ddlProgramName" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlProgramName_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddluser" Display="Dynamic" ErrorMessage="*" Font-Size="Large" ForeColor="Red" ValidationGroup="valGroup1"></asp:RequiredFieldValidator>                           
            </td>                            
        </tr>         
        <tr>            
            <th>Select Site Name:</th>
            <td>                  
                <asp:DropDownList ID="ddlSiteName" runat="server"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlSiteName" Display="Dynamic" ErrorMessage="*" Font-Size="Large" ForeColor="Red" ValidationGroup="valGroup1"></asp:RequiredFieldValidator>                    
            </td>            
        </tr>
           </ContentTemplate>                            
                </asp:UpdatePanel>             
        <tr>            
            <td></td>
            <td></td>
        </tr>
        <tr>            
            <th>
                <asp:LinkButton ID="lnkbtnCancel" runat="server" OnClick="lnkbtnCancel_Click">Cancel</asp:LinkButton>
            </th>
            <td>                            
                <asp:LinkButton ID="lnkbtnSubmit" runat="server" OnClick="lnkbtnSubmit_Click" ValidationGroup="valGroup1">Assign</asp:LinkButton>
                </td>

        </tr>
    </table> 
    </div> 
        <table>
                <tr>
                    <td colspan ="1">
                         <div> <h1 class="users">Scheduling/Visiting Sites</h1> </div>    
                    </td>
                </tr>
                <tr>
                    <td colspan="1" >
                        <asp:GridView ID="grdConfirmation" runat="server" CssClass="Grid" AutoGenerateColumns="False" AutoGenerateSelectButton="True" OnSelectedIndexChanging="GridView1_SelectedIndexChanged" style="margin-right: 2px" EmptyDataText="NO UPCOMING VISITS" EnableModelValidation="True" OnRowDataBound="grdConfirmation_RowDataBound" HeaderStyle-BackColor="#999999">
        <Columns>
            <asp:BoundField DataField="SiteID" HeaderText="Site ID" Visible="False" />
            <asp:BoundField DataField="Sites" HeaderText="Site Name" />
            <asp:TemplateField HeaderText="Schedule Date">
                <ItemTemplate>
                    <asp:Label ID="lblDateSchedule" runat="server" Text='<%# Bind("VisitDate", "{0:d}") %>'></asp:Label>
                    <asp:LinkButton ID="lnkbtnDateSchedule" runat="server" CommandArgument='<%# Bind("Schd_ID") %>' OnCommand="lnkbtnDateSchedule_Command">Not yet Scheduled</asp:LinkButton>                  
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Name" HeaderText="Monitor's Name" />
            <asp:BoundField HeaderText="Confirmation Status" DataField="Status" NullDisplayText="No Data" />
            <asp:BoundField DataField="SiteID" ItemStyle-CssClass="HiddenSiteID" HeaderStyle-CssClass ="HiddenSiteID" HeaderText="Site ID" >            
            <HeaderStyle CssClass="HiddenSiteID" />
            <ItemStyle CssClass="HiddenSiteID" />
            </asp:BoundField>
            <asp:BoundField DataField="Schd_ID" HeaderText="SchId" ItemStyle-CssClass="HiddenSiteID" HeaderStyle-CssClass ="HiddenSiteID" >
                <HeaderStyle CssClass="HiddenSiteID" />
            <ItemStyle CssClass="HiddenSiteID" />
                </asp:BoundField>
        </Columns>
    </asp:GridView>
                    </td>

                </tr>         

            </table>
    
            </asp:View>
        <asp:View ID="View2" runat="server">
              <div> <h1 class="users">Site Information</h1> </div>    
            <table>
        <tr>
            <th>Monitor Name:</th>
            <td colspan="4">
                <asp:TextBox ID="txtFName" runat="server" Enabled="False" Width="250px"></asp:TextBox></td>
        </tr>
        <tr>
            <th>Site Name:</th>
            <td colspan="2"><asp:TextBox ID="txtSiteName" runat="server" Width="400px" Enabled="False"></asp:TextBox></td>
            <td  colspan="2">
                <asp:CheckBox ID="chkbxMiechv" Text ="MIECHV" Enabled="false" runat="server" />
            </td>
        </tr>
        
                <tr>
                    <th>Site Address:</th>
                    <td colspan="4">
                        <asp:TextBox ID="txtSiteAddress" runat="server" Width="300px" Enabled="False"></asp:TextBox></td>
                </tr>
                <tr>
                    <th>City:</th>
                    <td colspan="4">
                        <asp:TextBox ID="txtCity" runat="server" Width="300px" Enabled="False"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th>State:</th>
                    <td colspan="4">
                        <asp:TextBox ID="txtState" runat="server" Width="300px" Enabled="False"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th>Zip Code:</th>
                    <td colspan="4">
                        <asp:TextBox ID="txtZipV2" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th>Phone Number:</th>
                    <td>
                        <asp:TextBox ID="txtPhoneNumber" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                </tr>
        <tr>
            <th>Visiting Date:</th>
             <td colspan="4"><asp:TextBox ID="txtVisitingdate" runat="server" Enabled="False"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="5">&nbsp;</td>
        </tr>
        <tr>
            <th>
                <asp:LinkButton ID="lnkbtnCancel_v2" runat="server" OnClick="lnkbtnCancel_v2_Click">Cancel</asp:LinkButton>
            </th>
            <td>
                <asp:LinkButton ID="lnkbtnEdit" runat="server" OnClick="lnkbtnEdit_Click">Edit Information</asp:LinkButton>
            </td>
                <td>
                    <asp:LinkButton ID="lnkbtnConfirm" runat="server" OnClick="lnkbtnConfirm_Click">Confirm</asp:LinkButton>
            </td>
              <td>
                  <asp:LinkButton ID="lnkbtnStatus" runat="server" OnClick="lnkbtnStatus_Click">Status</asp:LinkButton>
            </td>
            <td></td>
            </tr>
                <tr>
                    <td colspan="5"></td>
                </tr>               
                <tr>
               <td>
                   <asp:LinkButton ID="lnkbtnReschedule1" runat="server" OnClick="lnkbtnReschedule1_Click">Schedule/Reschedule</asp:LinkButton>
            </td>
                <td>
                    <asp:LinkButton ID="lnkbtnVisiting" runat="server" OnClick="lnkbtnVisiting_Click">Visiting</asp:LinkButton>
            </td>
            <td>
                <asp:LinkButton ID="lnkbtnPIQRI" runat="server" OnClick="lnkbtnPIQRI_Click">PIQRI</asp:LinkButton>
            </td>
            
        </tr>
    </table>
        </asp:View>
        <asp:View ID="View3" runat="server">
            <table>
        <tr><th id="schedTite"><asp:Label ID="lbltitleEditorReschedule" runat="server" Font-Size="Large" ForeColor="Blue"></asp:Label>
            </th></tr>  
         
        <tr>
            <th>
                Monitor Name:
            </th>            
            <td colspan="2">
                <asp:TextBox ID="txtFNameV3" runat="server" Enabled="False"></asp:TextBox>
            </td>                    
        </tr>     
                <tr>
                    <th>Site Name:</th>
                    <td><asp:TextBox ID="txtSiteNameV3" runat="server" Width="400px" Enabled="False"></asp:TextBox></td>
                     <td>
                <asp:CheckBox ID="chkbxMiechvV3" Text ="MIECHV" runat="server" />
            </td>
                </tr>
                <tr>
                    <th>Site Address:</th>
                    <td colspan="2">
                        <asp:TextBox ID="txtSiteAddressV3" runat="server" Width="300px" Enabled="False"></asp:TextBox></td>
                </tr>
                <tr>
                    <th>City:</th>
                    <td colspan="2">
                        <asp:TextBox ID="txtCityV3" runat="server" Width="300px" Enabled="False"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th>State:</th>
                    <td colspan="2">
                        <asp:TextBox ID="txtStateV3" runat="server" Width="300px" Enabled="False"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th>Zip Code:</th>
                    <td colspan="2">
                        <asp:TextBox ID="txtZipV3" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtZipV3" ErrorMessage="Not Valid Zip Code" ValidationExpression="\d{5}(-\d{4})?" ValidationGroup="val1"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <th>Phone Number:</th>
                    <td colspan="2">
                        <asp:TextBox ID="txtPhoneNumberV3" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtPhoneNumberV3" ErrorMessage="Not Valid Phone Number(000-000-0000)" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" ValidationGroup="val1"></asp:RegularExpressionValidator>
                    </td>
                </tr>
        <tr>
            <th>
                <asp:Label ID="lblVisitDateV3" runat="server" Text="Pick a Day to Visit:"></asp:Label>
&nbsp;</th>
            <td colspan="2">                
                <asp:Calendar CssClass="cal" ID="calV3" runat="server" OnSelectionChanged="calV3_SelectionChanged">                    
                </asp:Calendar>
                <asp:TextBox ID="txtCalV3" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            
            <td>&nbsp;</td>
            <td colspan="2">
                &nbsp;</td>

        </tr>
        <tr>
            
            <th>
                <asp:LinkButton ID="lnkbtnCancelV3" runat="server" OnClick="lnkbtnCancelV3_Click">Cancel</asp:LinkButton>
            </th>
            <td>                                
                <asp:LinkButton ID="lnkbtnSaveChanges" runat="server" OnClick="lnkbtnSaveChanges_Click">Save Changes</asp:LinkButton>
           
                <asp:LinkButton ID="lnkbtnReschedule" runat="server" OnClick="lnkbtnReschedule_Click">Schedule</asp:LinkButton>
                </td>

        </tr>
    </table>
        </asp:View>
        <asp:View ID="View4" runat="server">
            <div id="status">
            <h2>STATUS</h2>
            <h3><asp:Label ID="lblStatus" runat="server"></asp:Label></h3>
            <h4>
               Site Name:
                <asp:Label ID="lblStatusSIteName" CssClass="status-text" runat="server" ForeColor="#2bb696"></asp:Label>
            </h4>
            <h4>
                Monitor Name:
                <asp:Label ID="lblStatusMonitorName" CssClass="status-text" runat="server" ForeColor="#2bb696"></asp:Label>
            </h4>
            <h4>
                Program Survey Completed:
                <asp:Label ID="lblStatusPD" CssClass="status-text" runat="server" ForeColor="#2bb696"></asp:Label>
            </h4>
            <h4>
                Home Visitor Survey Completed:
                <asp:Label ID="lblStausHVS" CssClass="status-text" runat="server" ForeColor="#2bb696"></asp:Label>
            </h4>
            <h4>
                <div class="change-status">
                    Change Status:
                    <asp:CheckBox ID="chkbxChangeStatus" runat="server" Text="Closed" />&nbsp<asp:LinkButton ID="lnkbtnStausChange" runat="server" OnClick="lnkbtnStausChange_Click">Save Status</asp:LinkButton>
                </div>
            </h4>
                </div>
            <table>
                <tr>
                    <td>
                        <asp:LinkButton ID="lnkbtnStatusCancel" runat="server" OnClick="lnkbtnStatusCancel_Click">Cancel</asp:LinkButton>
                    </td>                    
                </tr>
            </table>
        </asp:View>
        </asp:MultiView>
        </div>
</asp:Content>
