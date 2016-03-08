<%@ Page Title="" Language="C#" MasterPageFile="~/EnterData/ManageSiteEnterData.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="HVP.PIQRI_Tool._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type = "text/javascript">

        function SetTarget() {

            document.forms[0].target = "_blank";

        }

</script>
     <asp:HiddenField ID="hfsiteid" runat="server" />
    <asp:HiddenField ID="hfSchdId" runat="server" />
    <div class="userlist">
   <div> <h1 class="users">PIQRI Interview</h1></div>    
        <div><h2 class="Sitename">Sitename:
            <asp:Label ID="lblSitename" runat="server"></asp:Label></h2>
            <h4 class="Sitename">Program ID: <asp:Label ID="lblProgramId" runat="server"></asp:Label></h4>
        </div>
 <%-- <div style="float:left;">--%>
       <%--<div style="margin-left:auto; margin-right:auto;">
      
       <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" EnableModelValidation="True" GridLines="Horizontal" Height="50px" Width="400px" HorizontalAlign="Center">
           <AlternatingRowStyle BackColor="#F7F7F7" />
           <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
           <Fields>
               <asp:BoundField DataField="Monitor Name" HeaderText="Monitor Name" SortExpression="Monitor Name" />
               <asp:BoundField DataField="Sites" HeaderText="Sites" SortExpression="Sites" />
               <asp:BoundField DataField="Visited Date" HeaderText="Visited Date" ReadOnly="True" SortExpression="Visited Date" />
           </Fields>
           <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
           <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
           <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
           <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
       </asp:DetailsView>
      </div>--%>
    <div id="section">
    <div style="float:left; margin-right:7em;">
    <%--<div>--%>
        <h5> Home Visitor</h5>
       <asp:FormView ID="FormView2" runat="server" DataSourceID="SqlDataSource2" EnableModelValidation="True" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1">
                   <ItemTemplate>
               Home Visitor Interview Completed:
               <asp:Label ID="Home_Visitor_Interview_CompletedLabel" runat="server" Text='<%# Bind("[Home Visitor Interview Completed]") %>' />
               <br />

           </ItemTemplate>
           <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
           <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
       </asp:FormView>
        <asp:LinkButton ID="lnkHV" runat="server" OnClientClick = "SetTarget();" OnClick="lnkHV_Click">Click Here to start New Home Visitor Interview</asp:LinkButton>
        <div>
       
    <%--<div style="float:left; border-bottom-left-radius:1px;">--%>
        <h5>
            Home Visitor Interview View/Edit Data
        </h5>
        <asp:RadioButtonList ID="rdobtnlst_HVData" runat="server"></asp:RadioButtonList>
        <asp:Button ID="btnView" runat="server" Text="View" OnClick="btnView_Click" OnClientClick = "SetTarget();" />
    </div>
   </div>
     <div style="float:left;">
            <h5>Program Director</h5>         
       <br />
         <asp:LinkButton ID="lnkPD" runat="server" OnClientClick = "SetTarget();" OnClick="lnkPD_Click" >Click Here to start New Program Director Interview</asp:LinkButton>
         <div>
             <h5>Program Director Interview View/Edit Data</h5>
              <asp:RadioButtonList ID="rdobtnlst_PD" runat="server"></asp:RadioButtonList>
        <asp:Button ID="btnpdView" runat="server" Text="View"  OnClientClick = "SetTarget();" OnClick="btnpdView_Click" />
         </div>
   </div>
        </div>
      <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT UN.Name 'Monitor Name', ST.Sites, convert(varchar, SCHD.VisitDate, 10) 'Visited Date' FROM Scheduling AS SCHD INNER JOIN UserNames AS UN ON UN.NameID = SCHD.NameID INNER JOIN Sites AS ST ON ST.SiteID = SCHD.SiteID WHERE (SCHD.Schd_ID = @Schd_ID)">
           <SelectParameters>
               <asp:ControlParameter Name="Schd_ID" ControlID="hfSchdId" PropertyName="Value" Type="Int32" />               
           </SelectParameters>
       </asp:SqlDataSource>--%>
       <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT coalesce(count(Completed), 0) AS 'Home Visitor Interview Completed' FROM HomeVisitorInterview  WHERE (Schd_ID = @Schd_ID1)">
           <SelectParameters>
               <asp:ControlParameter Name="Schd_ID1" ControlID="hfSchdId" PropertyName="Value" Type="Int32" />               
           </SelectParameters>
       </asp:SqlDataSource>
      </div>
</asp:Content>
