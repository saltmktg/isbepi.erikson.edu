<%@ Page Title="" Language="C#" MasterPageFile="~/MainNestedMaster.Master" AutoEventWireup="true" CodeBehind="PD_Survey .aspx.cs" Inherits="HVP.ProgramDirector._default" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="userlist">
   <div> <h1 class="users">Program Director Survey</h1></div>    
    <asp:GridView ID="grdPDView" runat="server" AutoGenerateColumns="False" EnableModelValidation="True" OnRowDataBound="grdPDView_RowDataBound" EmptyDataText="NO UP COMING VISIT">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Monitor Name" />
            <asp:TemplateField HeaderText="Visiting Date">                
                <ItemTemplate>
                    <asp:Label ID="lblVisitDate" runat="server" Text='<%# Bind("VisitDate", "{0:d}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Survey Status">
                <ItemTemplate>
                    <asp:Label ID="lblComplete" runat="server" Text='<%#Bind("Completed")%>'></asp:Label>
                    <asp:LinkButton ID="lnkbtnNewSurvey" runat="server" CommandArgument='<%#Bind("Schd_ID")%> ' OnCommand="lnkbtnNewSurvey_Command"><u>Not Yet Completed-Click here to start/finish your survey</u></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="NumberOFSurvey" HeaderText="Home Visitor Survey Completed" />
        </Columns>
    </asp:GridView>
         </div>
</asp:Content>
