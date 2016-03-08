<%@ Page Title="" Language="C#" MasterPageFile="~/MainNestedMaster.Master" AutoEventWireup="true" CodeBehind="Analytics.aspx.cs" Inherits="HVP.Admin.Analytics" %>
<%--<%@ Register assembly="System.Web.DynamicData, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.DynamicData" tagprefix="cc1" %>--%>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#0099CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource1" EnableModelValidation="True" AllowSorting="True" AllowPaging="True" PageSize="50" PagerSettings-Mode="NextPreviousFirstLast" PagerSettings-NextPageText="Next" PagerSettings-PreviousPageText="Pervious" PagerSettings-Visible="True" PagerSettings-LastPageText="Last" PagerSettings-FirstPageText="First">
        <Columns>
            <asp:BoundField DataField="PageLoadTime" HeaderText="Time" SortExpression="ID" >
            <HeaderStyle Font-Underline="False" />
            <ItemStyle Font-Underline="False" />
            </asp:BoundField>
            <asp:BoundField DataField="IPAdress" HeaderText="Remote Address" />
            <asp:BoundField DataField="UserAgent" HeaderText="Application Type" />
            <asp:BoundField DataField="Browser" HeaderText="Browser" />
            <asp:BoundField DataField="version" HeaderText="Browser Version"  />
            <asp:BoundField DataField="Major" HeaderText="Browser Version Major" />
            <asp:BoundField DataField="Minor" HeaderText="Browser Version Minor"  />
            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
        </Columns>
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <HeaderStyle BackColor="#0099CC" Font-Bold="True" ForeColor="#CCCCFF" Font-Underline="False" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <RowStyle BackColor="White" ForeColor="#003399" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [UsersAnalytics]"></asp:SqlDataSource>
   
</asp:Content>
