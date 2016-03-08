<%@ Page Title="" Language="C#" MasterPageFile="~/ManageSite.Master" AutoEventWireup="true" CodeBehind="SiteInformation.aspx.cs" Inherits="HVP.Staff.SiteInformation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HiddenField ID="hfsiteid" runat="server" />
    <asp:HiddenField ID="hfSchdId" runat="server" />
    <div class="userlist">
        <div>
            <h1 class="users">Site Information</h1>
        </div>
        <div>
            <h2 class="Sitename">Sitename:
            <asp:Label ID="lblSitename" runat="server"></asp:Label></h2>
            <h4 class="Sitename">Program ID:
                <asp:Label ID="lblProgramId" runat="server"></asp:Label></h4>
        </div>
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
                <div runat="server" id="Edit">
                    <div border-top: solid 1px white;">
                        <div>
                            <label class="LeftLabelColumn">Main Contact:</label>
                            <asp:TextBox ID="txtMainPhone_Edit" CssClass="LeftValueColumn" runat="server" Width="350px" Enabled="False"></asp:TextBox>
                        </div>
                        <div>
                            <label class="LeftLabelColumn">Phone:</label>
                            <asp:TextBox ID="txtPhone_Edit" CssClass="LeftValueColumn" runat="server" Width="350px" Enabled="False"></asp:TextBox>
                        </div>
                        <div>
                            <label class="LeftLabelColumn">Email:</label>
                            <asp:TextBox ID="txtEmail_Edit" CssClass="LeftValueColumn" runat="server" Width="350px" Enabled="False"></asp:TextBox>
                        </div>
                        <div>
                            <label class="LeftLabelColumn">Site Address:</label>
                            <asp:TextBox ID="txtSiteAddress_Edit" CssClass="LeftValueColumn" runat="server" Width="350px" Enabled="False"></asp:TextBox>
                        </div>
                        <div>
                            <label class="LeftLabelColumn">City:</label>
                            <asp:TextBox ID="txtCity_Edit" CssClass="LeftValueColumn" runat="server" Width="350px" Enabled="False"></asp:TextBox>
                        </div>
                        <div>
                            <label class="LeftLabelColumn">State:</label>
                            <asp:TextBox ID="txtState_Edit" CssClass="LeftValueColumn" runat="server" Width="150px" Enabled="False"></asp:TextBox>
                        </div>
                        <div>
                            <label class="LeftLabelColumn">Zip Code:</label>
                            <asp:TextBox ID="txtZip_Edit" CssClass="LeftValueColumn" runat="server" Width="150px" Enabled="False"></asp:TextBox>
                        </div>
                        <div>

                            <label class="LeftLabelColumn">Number of Home Visitor:</label>
                            <asp:TextBox ID="txtNum_Hv_Visitor_Edit" CssClass="LeftValueColumn" runat="server" Width="150px" Enabled="False"></asp:TextBox>
                        </div>
                    </div>

                    <div style="margin: 5px;">
                        <div style="float: left; margin: 5px;">
                            <label>MIECHV</label><asp:CheckBox ID="chkMiechv_Edit" runat="server" Enabled="False" /></div>
                        <div style="float: left; margin: 5px;">
                            <label>MIHope</label><asp:CheckBox ID="chkMiHope_Edit" runat="server" Enabled="False" /></div>
                        <div style="float: left; margin: 5px;">
                            <label>Pilot</label><asp:CheckBox ID="chkPilot_Edit" runat="server" Enabled="False" /></div>
                        <div style="float: left; margin: 5px;">
                            <label>Validation Research</label><asp:CheckBox ID="chkValidation_research_Edit" runat="server" Enabled="False" /></div>
                    </div>
                    <div style="clear: both; float: right; margin: 20px">
                        <asp:LinkButton ID="lnkbtnEdit" runat="server" OnClick="lnkbtnEdit_Click">Edit</asp:LinkButton></div>
                </div>
                <asp:PlaceHolder ID="phErrorUpdate" runat="server"></asp:PlaceHolder>
                <asp:MultiView ID="MultiView3" runat="server">
                    <asp:View ID="View3" runat="server">
                        <div>
                            <div style="float: left; border-top: solid 1px white;">
                                <div>
                                    <label class="LeftLabelColumn">Main Contact:</label>
                                    <asp:TextBox ID="txtMainPhone_Update" CssClass="LeftValueColumn" runat="server" Width="350px"></asp:TextBox>
                                </div>
                                <div>
                                    <label class="LeftLabelColumn">Phone:</label>
                                    <asp:TextBox ID="txtPhone_Update" CssClass="LeftValueColumn" runat="server" Width="350px"></asp:TextBox>
                                </div>
                                <div>
                                    <label class="LeftLabelColumn">Email:</label>
                                    <asp:TextBox ID="txtEmail_Update" CssClass="LeftValueColumn" runat="server" Width="350px"></asp:TextBox>
                                </div>
                                <div>
                                    <label class="LeftLabelColumn">Site Address:</label>
                                    <asp:TextBox ID="txtSiteAddress_Update" CssClass="LeftValueColumn" runat="server" Width="350px"></asp:TextBox>
                                </div>
                                <div>
                                    <label class="LeftLabelColumn">City:</label>
                                    <asp:TextBox ID="txtCity_Update" CssClass="LeftValueColumn" runat="server" Width="350px"></asp:TextBox>
                                </div>
                                <div>
                                    <label class="LeftLabelColumn">State:</label>
                                    <asp:TextBox ID="txtState_Update" CssClass="LeftValueColumn" runat="server" Width="150px"></asp:TextBox>
                                </div>
                                <div>
                                    <label class="LeftLabelColumn">Zip Code:</label>
                                    <asp:TextBox ID="txtZip_Update" CssClass="LeftValueColumn" runat="server" Width="150px"></asp:TextBox>
                                </div>
                                <div>
                                    <label class="LeftLabelColumn">Number of Home Visitor:</label>
                                    <asp:TextBox ID="txtNum_Hv_Visitor_Update" CssClass="LeftValueColumn" runat="server" Width="150px"></asp:TextBox>
                                </div>
                            </div>

                            <div style="margin: 5px;">
                                <div style="float: left; margin: 5px;">
                                    <label>MIECHV</label><asp:CheckBox ID="chkMiechv_Update" runat="server" /></div>
                                <div style="float: left; margin: 5px;">
                                    <label>MIHope</label><asp:CheckBox ID="chkMiHope_Update" runat="server" /></div>
                                <div style="float: left; margin: 5px;">
                                    <label>Pilot</label><asp:CheckBox ID="chkPilot_Update" runat="server" /></div>
                                <div style="float: left; margin: 5px;">
                                    <label>Validation Research</label><asp:CheckBox ID="chkValidation_research_Update" runat="server" /></div>
                            </div>
                            <div style="clear: both; float: left; margin: 20px">
                                <asp:LinkButton ID="lnkBtnCancel" runat="server" OnClick="lnkBtnCancel_Click">Cancel</asp:LinkButton></div>
                            <div style="float: right; margin: 20px">
                                <asp:LinkButton ID="lnkbtnUpdate" runat="server" OnClick="lnkbtnUpdate_Click">Update</asp:LinkButton></div>
                            <%--<div style="float: right;">            
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2970.1031784060633!2d-87.63427628433634!3d41.8906380726082!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x880e2cb3de090361%3A0xa1c6bcad9e6b8bea!2s451+N+LaSalle+St%2C+Chicago%2C+IL+60654!5e0!3m2!1sen!2sus!4v1445898276823"" width="200" height="200"  style="border:0"></iframe>
        </div>--%>
                            <!-- Because we can't use border-top, margin-top or padding-top on a textbox, we surround the textboxes with div tags -->
                        </div>
                    </asp:View>
                </asp:MultiView>
            </ContentTemplate>
        </asp:UpdatePanel>

        <div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div style="clear: both; border-top: solid 2px;" id="primaryMonitor" runat="server">
                        <h4>
                            <label>Primary Monitor:</label><asp:Label ID="lblPrimaryMonitor" runat="server"></asp:Label></h4>
                    </div>
                    <div id="secondarymonitor" runat="server">
                        <h4>
                            <label>Secondary Monitor:</label><asp:Label ID="lblSecondaryMonitor" runat="server"></asp:Label></h4>
                    </div>
                    <asp:MultiView ID="MultiView1" runat="server">
                        <asp:View ID="View1" runat="server">
                            <div style="clear: both; border-top: solid 2px;">
                                <h4>
                                    <label>Primary Monitor:</label></h4>
                                <asp:DropDownList ID="ddlPrimaryMonitor" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="NameID" Width="200px" AppendDataBoundItems="True">
                                    <asp:ListItem Text="" Value="" />
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT UN.Name, UN.NameID FROM 
                        [ISBEPI_DEV].[dbo].[UserNames] UN 
                        JOIN [ISBEPI_DEV].[dbo].[Staff] ST ON UN.NameID = ST.NameID 
                        JOIN aspnet_Membership Member ON Member.UserId = UN.UserId 
                        WHERE ST.RoleId = 'E7F4D35C-8C43-48A0-99E1-8CF724F80ABD' AND Member.IsApproved =1 OR (ST.NameID =40 OR ST.NameID =39) ORDER BY Name;"></asp:SqlDataSource>
                            </div>
                            <div>
                                <h4>
                                    <label>Secondary Monitor:</label></h4>
                                <asp:DropDownList ID="ddlSecondaryMonitor" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="NameID" Width="200px" AppendDataBoundItems="True">
                                    <asp:ListItem Text="" Value="" />
                                </asp:DropDownList>
                            </div>
                            <div style="clear: both; float: left; margin: 10px">
                                <asp:LinkButton ID="lnkMonitor_Cancel" runat="server" OnClick="lnkMonitor_Cancel_Click">Cancel</asp:LinkButton></div>
                            <div style="float: right; margin: 10px;">
                                <asp:LinkButton ID="lnkaddChageMonitor" runat="server" OnClick="lnkaddChageMonitor_Click">Add/Chnage Monitor</asp:LinkButton></div>
                        </asp:View>
                    </asp:MultiView>
                    <div style="clear: both; float: right;">
                        <asp:LinkButton ID="lnkbtnChangeMonitor" runat="server" OnClick="lnkbtnChangeMonitor_Click">Add/Chnage Monitor</asp:LinkButton></div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <div id="visit_date" runat="server" style="clear: both;">
                        <h4>
                            <label>Visit Date:</label><asp:Label ID="lblVisitDate" runat="server"></asp:Label></h4>
                    </div>
                    <asp:MultiView ID="MultiView2" runat="server">
                        <asp:View ID="View2" runat="server">
                            <div style="margin: 15px; clear: both">
                                <asp:Calendar class="LeftLabelColumn" CssClass="cal" ID="Cal" runat="server" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>
                            </div>
                            <div style="clear: both;">
                                <h4>
                                    <label>Visit Date:</label><asp:TextBox ID="txtCal" runat="server" Width="200px" ValidationGroup="val1"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCal" ErrorMessage="Required" ValidationGroup="val1"></asp:RequiredFieldValidator>
                            </div>
                            <div style="clear: both; float: left; margin: 10px">
                                <asp:LinkButton ID="lnkbtnAddSchedule_Cancel" runat="server" OnClick="lnkbtnAddSchedule_Cancel_Click">Cancel</asp:LinkButton></div>
                            <div style="float:right;  margin:10px""><asp:LinkButton ID="lnkbtnAddSchedule" runat="server" OnClick="lnkbtnAddSchedule_Click" ValidationGroup="val1">Schedule/Reschedule Visit</asp:LinkButton></div>
                            <asp:PlaceHolder ID="PHError2" runat="server"></asp:PlaceHolder>
                        </asp:View>
                    </asp:MultiView>
                    <div style="clear: both; float: right;">
                        <asp:LinkButton ID="lnkbtnSchedule" runat="server" OnClick="lnkbtnSchedule_Click">Schedule/Reschedule Visit</asp:LinkButton></div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
