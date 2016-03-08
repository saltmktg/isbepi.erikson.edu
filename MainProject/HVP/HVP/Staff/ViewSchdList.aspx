<%@ Page Title="" Language="C#" MasterPageFile="~/MainNestedMaster.Master" AutoEventWireup="true" CodeBehind="ViewSchdList.aspx.cs" Inherits="HVP.Staff.ViewSchdList" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="userlist">
        <div>
            <h1 class="users">PI ISBE Program Monitoring</h1>
        </div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AutoGenerateSelectButton="True" EnableModelValidation="True" HorizontalAlign="Center" OnSelectedIndexChanging="GridView1_SelectedIndexChanging1" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="5">
                    <Columns>
                        <asp:BoundField HeaderText="SiteID" DataField="SiteID" InsertVisible="False" ReadOnly="True" SortExpression="SiteID">
                            <HeaderStyle CssClass="HiddenSiteID" />
                            <ItemStyle CssClass="HiddenSiteID" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Schd_ID" DataField="Schd_ID" InsertVisible="False" ReadOnly="True" SortExpression="Schd_ID">
                            <HeaderStyle CssClass="HiddenSiteID" />
                            <ItemStyle CssClass="HiddenSiteID" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="VisitDate" DataField="VisitDate" SortExpression="VisitDate" DataFormatString=" {0:d}" />
                        <asp:BoundField HeaderText="Sites" DataField="Sites" SortExpression="Sites" />
                        <asp:BoundField HeaderText="Monitor's Name" DataField="Name" SortExpression="Name" />
                        <asp:BoundField HeaderText="Second Monitor's Name" DataField="Second_Name" ReadOnly="True" SortExpression="Second_Name" />
                        <asp:BoundField HeaderText="# of HV" DataField="Num_HV" ReadOnly="True" SortExpression="Num_HV" />
                        <asp:BoundField HeaderText="Status" DataField="Status" SortExpression="Status" />
                    </Columns>
                    <PagerSettings Mode="NextPrevious" NextPageText="Next" PreviousPageText="Previous" />
                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdateProgress ID="UpdateProgress1" runat="server">
            <ProgressTemplate>
                <div class="overlay">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/loader4.gif" />
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
    </div>
</asp:Content>
