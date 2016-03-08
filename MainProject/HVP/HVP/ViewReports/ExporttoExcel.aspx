<%@ Page Title="" Language="C#" MasterPageFile="~/ManageSiteViewReport.Master" AutoEventWireup="true" CodeBehind="ExporttoExcel.aspx.cs" Inherits="HVP.Survey.WebForm3" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type = "text/javascript">

        //function SetTarget() {

            document.forms[0].target = "_blank";

        //}

</script>
    <asp:HiddenField ID="hfsiteid" runat="server" />
    <asp:HiddenField ID="hfSchdId" runat="server" />
    <%--<h4>SELECT SITE :<asp:DropDownList ID="ddlSites" runat="server" DataSourceID="SqlDataSource2" DataTextField="Sites" DataValueField="SiteID" AppendDataBoundItems="True"></asp:DropDownList>
        <asp:Button ID="btnView" runat="server" Text="View" OnClick="btnView_Click" />
    </h4>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT ST.Sites, ST.SiteID FROM Sites AS ST INNER JOIN HomeVisitorSiteVisitSurvey AS HV ON ST.SiteID = HV.SiteID GROUP BY ST.Sites, ST.SiteID"></asp:SqlDataSource>--%>
    <div class="userlist">
   <div> <h1 class="users">HV Export to Excel</h1></div>
        <div><h2 class="Sitename">Sitename:
            <asp:Label ID="lblSitename" runat="server"></asp:Label></h2>
            <h4 class="Sitename">Program ID: <asp:Label ID="lblProgramId" runat="server"></asp:Label></h4>
        </div>    
    <div style="width: 100%; height: 400px; overflow: scroll">
        <asp:DataGrid ID="DataGrid1" runat="server">
        </asp:DataGrid>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="spHVSurveyToExcel" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="hfSchdId" Name="SchdID" PropertyName="Value" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <asp:Button ID="btnExcel" runat="server" Text="Export To Excel" OnClick="btnExcel_Click" Visible="False" />
        </div>
    </asp:Content>
