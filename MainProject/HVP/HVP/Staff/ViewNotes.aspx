<%@ Page Title="" Language="C#" MasterPageFile="~/ManageSite.Master" AutoEventWireup="true" CodeBehind="ViewNotes.aspx.cs" Inherits="HVP.Staff.ViewNotes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="userlist">
         <div> <h1 class="users">Notes</h1> </div>
            <table class="d">
          <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" >
              
              <ItemTemplate>
                  <tr><td class="q">
                  <sub><asp:Label ID="lblUser" runat="server" text='<%# Eval("NameID") %>' Font-Bold="True" Font-Size="Medium"></asp:Label><asp:Label ID="lblDate" runat="server"    text='<%# Eval("Entered_Date") %>' Font-Bold="True" Font-Size="Medium"></asp:Label></sub>
                      <sup><asp:Label ID="lblSubject" runat="server" text='<%# Eval("Subject") %>' Font-Bold="True" Font-Size="Large"></asp:Label></sup>
                  <br />
                    <asp:Label ID="lblNote" runat="server"    text='<%# Eval("Note") %>'></asp:Label>
                      </td></tr>
              </ItemTemplate>
          </asp:Repeater>    
                </table>
          <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT [NameID], [Entered_Date], [Note], [Subject] FROM [SiteNotes]"></asp:SqlDataSource>
          </div>
</asp:Content>
