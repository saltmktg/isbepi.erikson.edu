<%@ Page Title="" Language="C#" MasterPageFile="~/ManageSite.Master" AutoEventWireup="true" CodeBehind="UploadedMaterials.aspx.cs" Inherits="HVP.Staff.UploadedMaterials" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:HiddenField ID="hfsiteid" runat="server" />
    <asp:HiddenField ID="hfSchdId" runat="server" />
    <div class="userlist">
         <div> <h1 class="users">Uploaded Documentation</h1> </div> 
       <div style="width: 100%; height: 400px; margin-top:25px; overflow: scroll">
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                      <a href='<%# string.Format("downloadfiles.ashx?id={0}&filename={1}",Eval("Id"),Eval("Name")) %>'>Download - <%#Eval("Name") %></a><br />
                     </ItemTemplate>
            </asp:Repeater>
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [FileUpload] WHERE ([Schd_ID] = @Schd_ID)">
               <SelectParameters>
                   <asp:ControlParameter ControlID="hfSchdId" PropertyName="Value" Name="Schd_ID" Type="Int32"></asp:ControlParameter>
               </SelectParameters>
           </asp:SqlDataSource>
        </div>
        </div>
</asp:Content>
