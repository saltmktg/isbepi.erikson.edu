<%@ Page Title="" Language="C#" MasterPageFile="~/PIQRIInterview/PIQRIInterview.Master" AutoEventWireup="true" CodeBehind="HVInterviewtoExcel.aspx.cs" Inherits="HVP.Staff.HVInterviewtoExcel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:dropdownlist runat="server" ID="ddlSites" DataSourceID="SqlDataSource1" DataTextField="Sites" DataValueField="Schd_ID"></asp:dropdownlist>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="  SELECT ST.Sites, SCHD.Schd_ID FROM Sites AS ST RIGHT JOIN [ISBEPI_DEV].[dbo].[Scheduling] SCHD ON SCHD.SiteID = ST.SiteID RIGHT JOIN [ISBEPI_DEV].[dbo].[HomeVisitorInterview] HVI ON HVI.Schd_ID = SCHD.Schd_ID   GROUP BY ST.Sites, SCHD.Schd_ID"></asp:SqlDataSource>
        <asp:button runat="server" text="View" ID="btnView" OnClick="btnView_Click1" />
    </div>
     <div style="width: 100%; height: 400px; overflow: scroll">
         <asp:datagrid runat="server" ID="DataGrid1"></asp:datagrid>
         <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT [PMQ1_Score], [CDQ2_Score], [CHWBQ3_Score], [PCRQ4_Score],  [HRDQ5_Score], [IAQ6_Score], [RCCQ7_Score], [REFQ8_Score],[ACRQ9_Score], [vignete_ChildDevelopment_Range], [vignete_ChildHealthWellBeing_Range],  [vignete_FocusParentChildRelationship_Range], [vignete_WorkingWithFamilies_Range], [vignete_IndividualizingApproach_Range], [vignete_RecognizesCulturalConsiderations_Range],  [vignete_Referrals_Range] FROM [HomeVisitorInterview] WHERE ([Schd_ID] = @Schd_ID)">
             <SelectParameters>
                 <asp:ControlParameter ControlID="ddlSites" Name="Schd_ID" PropertyName="SelectedValue" Type="Int32" />
             </SelectParameters>
         </asp:SqlDataSource>
         </div>
     <asp:Button ID="btnExcel" runat="server" Text="Export To Excel" OnClick="btnExcel_Click" Visible="False" />
    </asp:Content>
