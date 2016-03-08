<%@ Page Title="" Language="C#" MasterPageFile="~/ManageSite.Master" AutoEventWireup="true" CodeBehind="CaseNotes.aspx.cs" Inherits="HVP.Staff.CaseNotes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:HiddenField ID="hfsiteid" runat="server" />
    <asp:HiddenField ID="hfSchdId" runat="server" />
     <div class="userlist">
         <div> <h1 class="users">Notes</h1> </div> 
        <div style="float: left; border-top: solid 1px white;">
           <label class="LeftLabelColumn">Site Name:</label>
           <label class="LeftLabelColumn">user Name:</label>
           <%--<label class="LeftLabelColumn">Date:</label>--%>          
           <label class="LeftLabelColumn">Subject:</label>  
           <label class="LeftLabelColumn">Notes:</label>                  
        </div>  
         <div>
            <div style="padding-top: 5px;"><asp:TextBox ID="txtSiteName" CssClass="LeftValueColumn" runat="server" Width="350px" Enabled="False"></asp:TextBox></div>
            <div style="padding-top: 5px;"><asp:TextBox ID="txtUserName" CssClass="LeftValueColumn" runat="server" Width="350px" Enabled="False"></asp:TextBox></div>
            <%--<div style="padding-top: 5px;"><asp:TextBox ID="txtDate" CssClass="LeftValueColumn" runat="server" Width="350px"></asp:TextBox></div>--%>
            <div style="padding-top: 5px;"><asp:TextBox ID="txtSubject" CssClass="LeftValueColumn" runat="server" Width="350px"></asp:TextBox></div>
            <div style="padding-top: 5px;"><asp:TextBox ID="txtNotes" CssClass="LeftValueColumn" runat="server" Width="700px" TextMode="MultiLine" Height="150px"></asp:TextBox></div>
        </div> 
         <div>
             <asp:LinkButton ID="lnkSubmit" runat="server" OnClick="lnkSubmit_Click">Submit</asp:LinkButton></div>
         <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
         <div>
       <div style="width: 100%; height: 400px; margin-top:25px; overflow: scroll">
             <table class="d">
          <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" >
              
              <ItemTemplate>
                  <tr><td class="q">
                  <sub><asp:Label ID="lblUser" runat="server" text='<%# Eval("Name") %>' Font-Bold="True" Font-Size="Medium" ForeColor="Red"></asp:Label> <asp:Label ID="lblDate" runat="server" text='<%# Eval("Entered_Date") %>' ForeColor="Red"></asp:Label></sub>
                      <sup><asp:Label ID="lblSubject" runat="server" text='<%# Eval("Subject") %>' Font-Bold="True" Font-Size="Large"></asp:Label></sup>
                  <br />
                    <asp:Label ID="lblNote" runat="server"    text='<%# Eval("Note") %>'></asp:Label>
                      </td></tr>
              </ItemTemplate>
          </asp:Repeater>    
                </table>
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT UN.Name, SN.Entered_Date,SN.Subject,SN.Note FROM SiteNotes SN LEFT JOIN UserNames UN ON SN.NameID = UN.NameID WHERE ([SiteID] = @SiteID) ORDER BY [Entered_Date] DESC">
               <SelectParameters>
                   <asp:ControlParameter ControlID="hfsiteid" Name="SiteID" PropertyName="Value" />
               </SelectParameters>
             </asp:SqlDataSource>
       </div>
             </div>
    </div>
</asp:Content>
