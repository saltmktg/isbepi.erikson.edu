<%@ Page Title="" Language="C#" MasterPageFile="~/MainNestedMaster.Master" AutoEventWireup="true" CodeBehind="PDSurveyOutput.aspx.cs" Inherits="HVP.Staff.PDSurveyOutput" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
<script type = "text/javascript">

    function SetTarget() {

        document.forms[0].target = "_blank";

    }

</script>
    <h4>SELECT SITE :<asp:DropDownList ID="ddlSites" runat="server" DataSourceID="SqlDataSource2" DataTextField="Sites" DataValueField="Schd_ID" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AppendDataBoundItems="True" AutoPostBack="True"></asp:DropDownList></h4>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT ST.Sites, HV.Schd_ID, ST.SiteID FROM Sites AS ST INNER JOIN HomeVisitorSiteVisitSurvey AS HV ON ST.SiteID = HV.SiteID GROUP BY ST.Sites, ST.SiteID, HV.Schd_ID"></asp:SqlDataSource>
    <h4>SELECT ONE TO VIEW:</h4><asp:RadioButtonList  ID="rdobtnSelect" runat="server" DataSourceID="SqlDataSource1" DataTextField="Completed" DataValueField="Schd_ID">
    </asp:RadioButtonList>   
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [Program_Director_Survey] WHERE ([Schd_ID] = @Schd_ID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlSites" Name="Schd_ID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Button ID="btnClick" runat="server" Text="View"  OnClientClick = "SetTarget();" OnClick="btnClick_Click" />
</asp:Content>
