<%@ Page Title="" Language="C#" MasterPageFile="~/ManageSite.Master" AutoEventWireup="true" CodeBehind="SiteStatusChecklist.aspx.cs" Inherits="HVP.ISBEStaff.SiteStatusChecklist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:HiddenField ID="hfsiteid" runat="server" />
    <asp:HiddenField ID="hfSchdId" runat="server" />
    <div class="userlist">
   <div> <h1 class="users">Site Status Checklist</h1></div>    
        <div><h2 class="Sitename">Site Name:
            <asp:Label ID="lblSitename" runat="server"></asp:Label></h2>
            <h4 class="Sitename">Program ID: <asp:Label ID="lblProgramId" runat="server"></asp:Label></h4>
        </div>
       <%-- <asp:LoginView ID="LoginView1" runat="server">
        </asp:LoginView>--%>
        <div>
            <h3>Pre-Visit Activities </h3>
            <ul style="list-style:none">
                <li class="status-check-list">
                    <asp:CheckBox ID="chkIsbeLettertoSite" runat="server" Enabled="False" /> ISBE Letter to site
                </li>
                <li class="status-check-list">
                    <asp:CheckBox ID="chkInitialCall" runat="server" /> Initial Call with Erikson
                </li>
                <li class="status-check-list">
                    <asp:CheckBox ID="chkSiteVisitScheduled" runat="server" Enabled="False" /> Site Visit Scheduled:(Date:<asp:Label ID="lblSchdDate" runat="server"></asp:Label>)
                </li>
                <li class="status-check-list">
                    <asp:CheckBox ID="chkPrepCall" runat="server" /> Prep Call  1 week before visit
                </li>
                <li class="status-check-list">
                    <asp:CheckBox ID="chkHVSurvry" runat="server" Enabled="False" /> Home Visitor Surveys Completed:(Count:<asp:Label ID="lblHVSurveyCount" runat="server"></asp:Label>)
                </li>
                <li class="status-check-list">
                    <asp:CheckBox ID="chkPDSurvey" runat="server" Enabled="False" /> Program Director Surveys Completed:(Completed:<asp:Label ID="lblPDSurveyCompleted" runat="server"></asp:Label>)
                </li>
               <li class="status-check-list">
                    <asp:CheckBox ID="chkDocReceived" runat="server" /> Documentation Received
                </li>                 
            </ul>
            <h3>Post-Visit Activities</h3>
            <ul style="list-style:none">
                <li class="status-check-list">
                    <asp:CheckBox ID="chkSiteVisitCompleted" runat="server" /> Site Visit Completed
                </li>
                 <li class="status-check-list">
                    <asp:CheckBox ID="chkPIQRIInterView" runat="server" Enabled="False" /> PIQRI Interview Data Entered
                </li>
                 <li class="status-check-list">
                    <asp:CheckBox ID="chkPicc" runat="server" Enabled="False" /> PICC Data Entered 
                </li>
                 <li class="status-check-list">
                    <asp:CheckBox ID="chkVideo" runat="server" /> Videos Submitted  
                </li>
                <li class="status-check-list">
                    <asp:CheckBox ID="chkHOVRS" runat="server" Enabled="False" /> HOVRS completed   
                </li>
                <li class="status-check-list">
                    <asp:CheckBox ID="chkFeedBackRPT" runat="server" Enabled="False" /> Feedback Report Completed   
                </li>
                <li class="status-check-list">
                    <asp:CheckBox ID="chkFeedbackCallSchd" runat="server" /> Feedback call scheduled<%--:(Date:<asp:Label ID="lblFeedbackSchd" runat="server"></asp:Label>)  --%>  
                </li>
                <li class="status-check-list">
                    <asp:CheckBox ID="chkFeedbackCallCompleted" runat="server" /> Feedback call completed<%--:(Date:<asp:Label ID="lblFeedbackCompleted" runat="server"></asp:Label>)--%>   
                </li>
            </ul>
            </div>
        </div>
</asp:Content>
