<%@ Page Title="" Language="C#" MasterPageFile="~/MainNestedMaster.master" AutoEventWireup="true" CodeBehind="RunReports.aspx.cs" Inherits="HVP.Staff.RunReports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="userlist">
        <div>
            <h1 class="users">Run Reports</h1>
        </div>
        <div style="float: left; border-top: solid 1px white;">
            <label class="LeftLabelColumn">Report:</label>
            <label class="LeftLabelColumn">Monitor:</label>
            <label class="LeftLabelColumn">Status:</label>
            <label class="LeftLabelColumn">Year:</label>
            <label class="LeftLabelColumn">From Date:</label>
            <label class="LeftLabelColumn">To Date:</label>
        </div>
        <div>
            <div style="padding-top: 5px;">
                <asp:DropDownList ID="ddlTypeofReport" runat="server" AppendDataBoundItems="True" AutoPostBack="True" CausesValidation="True" OnSelectedIndexChanged="ddlTypeofReport_SelectedIndexChanged">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="1">Site Visit Status</asp:ListItem>
                    <asp:ListItem Value="2">Site Schedule List</asp:ListItem>
                    <asp:ListItem Enabled="False" Value="3">PIQRI Score(Not Available)</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlTypeofReport" ErrorMessage="Required"></asp:RequiredFieldValidator>
            </div>
            <div style="padding-top: 5px;">
                <asp:DropDownList ID="ddlMonitor" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="NameID">
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="  SELECT U.[NameID], U.[Name] FROM [UserNames] U RIGHT JOIN [Staff] S ON U.NameID = S.NameID
                LEFT JOIN aspnet_Membership M ON M.UserId = U.UserId
                WHERE S.RoleId = 'E7F4D35C-8C43-48A0-99E1-8CF724F80ABD'"></asp:SqlDataSource>
            </div>
            <div style="padding-top: 5px;">
                <asp:DropDownList ID="ddlStatus" runat="server">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>Active</asp:ListItem>
                    <asp:ListItem>Closed</asp:ListItem>
                </asp:DropDownList>
            </div>
         <div style="padding-top: 5px;">
             <asp:DropDownList ID="ddlYear" runat="server" AppendDataBoundItems="True">
                  <asp:ListItem></asp:ListItem>
             </asp:DropDownList>
            </div>
            <div style="padding-top: 5px;">
                <asp:TextBox ID="txtFromDate" runat="server"></asp:TextBox>
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Button/Calendar.jpg" Width="20px" OnClick="ImageButton1_Click" />
                <asp:Calendar ID="calFrom" runat="server" CssClass="cal" Visible="False" OnSelectionChanged="calFrom_SelectionChanged"></asp:Calendar>
            </div>
            <div style="padding-top: 5px;">
                <asp:TextBox ID="txtToDate" runat="server"></asp:TextBox>
                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Button/Calendar.jpg" Width="20px" OnClick="ImageButton2_Click" />
                <asp:Calendar ID="calTo" CssClass="cal" Visible="False" runat="server" OnSelectionChanged="calTo_SelectionChanged"></asp:Calendar>
            </div>
        </div>
        <div>
            <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
        </div>
        <br />
        <div>
            <asp:LinkButton ID="lnkbtnViewRpt" runat="server" OnClick="LinkButton1_Click">View Report</asp:LinkButton>
        </div>
        <br />
        <div>
            <asp:GridView ID="GridView1" runat="server" Visible="False" AutoGenerateColumns="False" EnableModelValidation="True" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="7" EmptyDataText="No Records to Display">
                <Columns>
                    <asp:BoundField HeaderText="Site Name" DataField="Sites" />
                    <asp:BoundField HeaderText="Visit Date" DataField="VisitDate" DataFormatString="{0:d}" />
                    <asp:BoundField HeaderText="Status" DataField="Status" />
                    <asp:CheckBoxField HeaderText="Site Visit Completed" DataField="SiteVisit" />
                    <asp:BoundField HeaderText="# HV Survey" DataField="HVS" />
                    <asp:BoundField HeaderText="# HV Interview" DataField="HVI" />
                    <asp:CheckBoxField HeaderText="PD Survey Completed" DataField="PDS" />
                    <asp:CheckBoxField HeaderText="PD Interview Completed" DataField="PDI" />
                </Columns>
                <PagerSettings FirstPageText="First" LastPageText="Last" Mode="NextPrevious" NextPageText="Next" PreviousPageText="Previous" />
            </asp:GridView>
        </div>
        <div>
            <asp:GridView ID="GridView2" runat="server" Visible="False" AutoGenerateColumns="False" EnableModelValidation="True" AllowPaging="True" OnPageIndexChanging="GridView2_PageIndexChanging" EmptyDataText="No Records to Display">
                <Columns>
                    <asp:BoundField HeaderText="Sites Name" DataField="Sites" SortExpression="Sites" />
                    <asp:CheckBoxField HeaderText="Site Visit Schedule" DataField="SiteVistSCHD" ReadOnly="True" SortExpression="SiteVistSCHD" />
                    <asp:BoundField DataField="Monitor" HeaderText="Monitor" />
                    <asp:BoundField DataField="Year" HeaderText="Year"></asp:BoundField>
                </Columns>
                <PagerSettings Mode="NextPrevious" NextPageText="Next" PreviousPageText="Previous" />
            </asp:GridView>
        </div>     
</asp:Content>
