<%@ Page Title="" Language="C#" MasterPageFile="~/MainNestedMaster.Master" AutoEventWireup="true" CodeBehind="uploadDcumentation.aspx.cs" Inherits="HVP.ProgramDirector.uploadDcumentation" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:HiddenField ID="hfsiteid" runat="server" />
    <asp:HiddenField ID="hfSchdId" runat="server" />
    <div class="userlist">
         <div> <h1 class="users">Upload Documentation</h1> </div> 
       <div style="float:left; margin-right:10px;"> Upload Document:</div><asp:FileUpload ID="FileUpload1" runat="server" />
        <div style="float:right; margin-right:200px;"><asp:LinkButton ID="lnkbtnUpload" runat="server" OnClick="LinkButton1_Click">Upload Documrnts</asp:LinkButton></div>
        <asp:PlaceHolder ID="PlaceHolder1" runat="server">
        </asp:PlaceHolder>
        <div style="margin-top:25px;">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EnableModelValidation="True">
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="ContentType" HeaderText="ContentType" SortExpression="ContentType" />
                    <asp:BoundField DataField="EnteredDate" HeaderText="EnteredDate" SortExpression="EnteredDate" dataformatstring="&quot;{0:d}&quot;"></asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT [Name], [ContentType], [EnteredDate] FROM [FileUpload] WHERE ([SiteID] = @SiteID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="hfsiteid" Name="SiteID" PropertyName="Value" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
       </div>
</asp:Content>
