<%@ Page Title="" Language="C#" MasterPageFile="~/MainNestedMaster.Master" AutoEventWireup="true" CodeBehind="Surveyoutput.aspx.cs" Inherits="HVP.Staff.Surveyoutput" %>

<%@ Register Assembly="System.Web.DynamicData, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.DynamicData" TagPrefix="cc1" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    

<script type = "text/javascript">

    function SetTarget() {

        document.forms[0].target = "_blank";

    }

</script>
    <h4>SELECT SITE:<asp:DropDownList ID="ddlSites" runat="server" DataSourceID="SqlDataSource2" DataTextField="Sites" DataValueField="SiteID" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AppendDataBoundItems="True" AutoPostBack="True"></asp:DropDownList></h4>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT ST.Sites, ST.SiteID FROM Sites AS ST INNER JOIN HomeVisitorSiteVisitSurvey AS HV ON ST.SiteID = HV.SiteID GROUP BY ST.Sites, ST.SiteID"></asp:SqlDataSource>
    <h4>SELECT ONE TO VIEW:</h4><asp:RadioButtonList  ID="rdobtnSelect" runat="server" DataSourceID="SqlDataSource1" DataTextField="ID" DataValueField="ID">
    </asp:RadioButtonList>   
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [HomeVisitorSiteVisitSurvey] WHERE ([SiteID] = @SiteID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlSites" Name="SiteID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Button ID="btnClick" runat="server" Text="View"  OnClientClick = "SetTarget();" OnClick="btnClick_Click" />
    </asp:Content>
