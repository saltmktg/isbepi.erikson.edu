﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Survey/SurveyMaster.Master" AutoEventWireup="true" CodeBehind="ExporttoExcel.aspx.cs" Inherits="HVP.Survey.WebForm3" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h4>SELECT SITE:<asp:DropDownList ID="ddlSites" runat="server" DataSourceID="SqlDataSource2" DataTextField="Sites" DataValueField="SiteID" AppendDataBoundItems="True"></asp:DropDownList>
        <asp:Button ID="btnView" runat="server" Text="View" OnClick="btnView_Click" />
    </h4>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT ST.Sites, ST.SiteID FROM Sites AS ST INNER JOIN HomeVisitorSiteVisitSurvey AS HV ON ST.SiteID = HV.SiteID GROUP BY ST.Sites, ST.SiteID"></asp:SqlDataSource>
    <div style="width: 100%; height: 400px; overflow: scroll" class="data-table">
        <asp:DataGrid ID="DataGrid1" runat="server" CssClass="Grid2">
        </asp:DataGrid>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT [HV_DEMOGRAPHICS_Q1], [HV_DEMOGRAPHICS_Q2], [HV_DEMOGRAPHICS_Q2_Other], [HV_DEMOGRAPHICS_Q3_yesOrNO], [HV_DEMOGRAPHICS_Q3_1], [HV_DEMOGRAPHICS_Q3_2], [HV_DEMOGRAPHICS_Q3_3], [HV_DEMOGRAPHICS_Q3_4], [HV_DEMOGRAPHICS_Q3_5], [HV_DEMOGRAPHICS_Q3_Other], [HV_EDUCATION_Q4], [HV_EDUCATION_Q5], [HV_EDUCATION_Q5_other], [HV_PROFESSIONALEXPERIENCE_Q6_A], [HV_PROFESSIONALEXPERIENCE_Q6_B], [HV_PROFESSIONALEXPERIENCE_Q7], [HV_PROFESSIONALEXPERIENCE_Q8], [HV_PROFESSIONALEXPERIENCE_Q9], [HV_PROFESSIONALEXPERIENCE_Q10_1], [HV_PROFESSIONALEXPERIENCE_Q10_2], [HV_PROFESSIONALEXPERIENCE_Q10_3], [HV_PROFESSIONALEXPERIENCE_Q10_4], [HV_PROFESSIONALEXPERIENCE_Q10_5], [HV_PROFESSIONALEXPERIENCE_Q11_1], [HV_PROFESSIONALEXPERIENCE_Q10_total], [HV_PROFESSIONALEXPERIENCE_Q11_2], [HV_PROFESSIONALEXPERIENCE_Q11_3], [HV_PROFESSIONALEXPERIENCE_Q11_4], [HV_PROFESSIONALEXPERIENCE_Q11_5], [HV_PROFESSIONALEXPERIENCE_Q11_6], [HV_PROFESSIONALEXPERIENCE_Q11_7], [HV_PROFESSIONALEXPERIENCE_Q11_total], [HV_PROFESSIONALEXPERIENCE_Q12], [HV_PROFESSIONALEXPERIENCE_Q13_1], [HV_PROFESSIONALEXPERIENCE_Q13_2], [HV_PROFESSIONALEXPERIENCE_Q13_3], [HV_PROFESSIONALEXPERIENCE_Q13_4], [HV_PROFESSIONALEXPERIENCE_Q13_5], [HV_PROFESSIONALEXPERIENCE_Q13_other], [HV_COMMUNICATIONANDDECISIONMAKING_Q14], [HV_COMMUNICATIONANDDECISIONMAKING_Q15], [HV_COMMUNICATIONANDDECISIONMAKING_Q17], [HV_COMMUNICATIONANDDECISIONMAKING_Q16], [HV_SUPPORTIVEWORKENVIRONMENT_WAGESANDBENEFITS_Q25], [HV_SUPPORTIVEWORKENVIRONMENT_WAGESANDBENEFITS_Q24], [HV_SUPPORTIVEWORKENVIRONMENT_WAGESANDBENEFITS_Q23], [HV_SUPPORTIVEWORKENVIRONMENT_WAGESANDBENEFITS_Q22], [HV_COMMUNICATIONANDDECISIONMAKING_Q21], [HV_COMMUNICATIONANDDECISIONMAKING_Q20], [HV_COMMUNICATIONANDDECISIONMAKING_Q19], [HV_COMMUNICATIONANDDECISIONMAKING_Q18], [HV_SUPPORTIVEWORKENVIRONMENT_MATERIALSANDPHYSICALENVIRONMENT_Q33], [HV_SUPPORTIVEWORKENVIRONMENT_MATERIALSANDPHYSICALENVIRONMENT_Q32], [HV_SUPPORTIVEWORKENVIRONMENT_MATERIALSANDPHYSICALENVIRONMENT_Q31], [HV_SUPPORTIVEWORKENVIRONMENT_MATERIALSANDPHYSICALENVIRONMENT_Q30], [HV_SUPPORTIVEWORKENVIRONMENT_STAFFMORALEANDSATISFACTION_Q29], [HV_SUPPORTIVEWORKENVIRONMENT_STAFFMORALEANDSATISFACTION_Q28], [HV_SUPPORTIVEWORKENVIRONMENT_STAFFMORALEANDSATISFACTION_Q26], [HV_SUPPORTIVEWORKENVIRONMENT_STAFFMORALEANDSATISFACTION_Q27], [HV_REFLECTIVESUPERVISION_Q41], [HV_REFLECTIVESUPERVISION_Q40], [HV_REFLECTIVESUPERVISION_Q39], [HV_REFLECTIVESUPERVISION_Q38], [HV_SUPPORTIVEWORKENVIRONMENT_TECHNICALSUPPORT_Q37], [HV_SUPPORTIVEWORKENVIRONMENT_TECHNICALSUPPORT_Q36], [HV_SUPPORTIVEWORKENVIRONMENT_TECHNICALSUPPORT_Q35], [HV_SUPPORTIVEWORKENVIRONMENT_TECHNICALSUPPORT_Q34], [HV_REFLECTIVESUPERVISION_Q49], [HV_REFLECTIVESUPERVISION_Q48], [HV_REFLECTIVESUPERVISION_Q47], [HV_REFLECTIVESUPERVISION_Q46], [HV_REFLECTIVESUPERVISION_Q45], [HV_REFLECTIVESUPERVISION_Q44], [HV_REFLECTIVESUPERVISION_Q43], [HV_REFLECTIVESUPERVISION_Q42], [HV_SUPERVISONCONTENT_Q57], [HV_SUPERVISONCONTENT_Q56], [HV_SUPERVISONCONTENT_Q55], [HV_SUPERVISONCONTENT_Q54], [HV_SUPERVISONCONTENT_Q53], [HV_SUPERVISONCONTENT_Q52], [HV_REFLECTIVESUPERVISION_Q51], [HV_REFLECTIVESUPERVISION_Q50], [HV_PROFESSIONALDEVELOPMENT_Q59_7], [HV_PROFESSIONALDEVELOPMENT_Q59_6], [HV_PROFESSIONALDEVELOPMENT_Q59_5], [HV_PROFESSIONALDEVELOPMENT_Q59_4], [HV_PROFESSIONALDEVELOPMENT_Q59_3], [HV_PROFESSIONALDEVELOPMENT_Q59_2], [HV_PROFESSIONALDEVELOPMENT_Q59_1], [HV_FAMILYINVOLVEMENT_Q58], [HV_PROFESSIONALDEVELOPMENT_Q59_Other], [HV_PROFESSIONALDEVELOPMENT_Q59_14], [HV_PROFESSIONALDEVELOPMENT_Q59_13], [HV_PROFESSIONALDEVELOPMENT_Q59_12], [HV_PROFESSIONALDEVELOPMENT_Q59_11], [HV_PROFESSIONALDEVELOPMENT_Q59_10], [HV_PROFESSIONALDEVELOPMENT_Q59_9], [HV_PROFESSIONALDEVELOPMENT_Q59_8], [HV_PROFESSIONALDEVELOPMENT_Q63_a], [HV_PROFESSIONALDEVELOPMENT_Q62_e], [HV_PROFESSIONALDEVELOPMENT_Q62_d], [HV_PROFESSIONALDEVELOPMENT_Q62_b], [HV_PROFESSIONALDEVELOPMENT_Q62_c], [HV_PROFESSIONALDEVELOPMENT_Q62_a], [HV_PROFESSIONALDEVELOPMENT_Q61], [HV_PROFESSIONALDEVELOPMENT_Q60], [HV_PROFESSIONALDEVELOPMENT_Q63_h], [HV_PROFESSIONALDEVELOPMENT_Q63_g], [HV_PROFESSIONALDEVELOPMENT_Q63_f], [HV_PROFESSIONALDEVELOPMENT_Q63_e], [HV_PROFESSIONALDEVELOPMENT_Q63_d], [HV_PROFESSIONALDEVELOPMENT_Q63_c], [HV_PROFESSIONALDEVELOPMENT_Q63_b] FROM [vw_HomeVisitorSiteVisitSurvey] WHERE ([SiteID] = @SiteID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlSites" Name="SiteID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <asp:Button ID="btnExcel" runat="server" Text="Export To Excel" OnClick="btnExcel_Click" Visible="False" />
    </asp:Content>
