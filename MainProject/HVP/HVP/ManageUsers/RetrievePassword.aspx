<%@ Page Title="" Language="C#" MasterPageFile="~/MainNestedMaster.Master" AutoEventWireup="true" CodeBehind="RetrievePassword.aspx.cs" Inherits="HVP.ManageUsers.RetrievePassword" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="userlist">
    <div>
        <h1 class="users">Retrieve Password</h1>
    </div>
        <div style="float:left;  margin-right:.5em;">
             <strong> Select A User:</strong>
            <asp:DropDownList ID="ddlRetrieve" runat="server" Width="200px"></asp:DropDownList>                     
            </div>              
         <div style="float:left;  margin-right:.5em;">
             <asp:LinkButton ID="lnkRetrieve" runat="server" OnClick="lnkRetrieve_Click">Retrieve</asp:LinkButton>   
         </div>
        <br /> <br />
              <div style="clear:both">  
              <strong> UserName:</strong>
              <asp:Label ID="lblUserName" runat="server" ForeColor="Red"></asp:Label> 
              </div>
              <div>
                  <strong>Password:</strong>
                  <asp:Label ID="lblRetrieve" runat="server" ForeColor="Red"></asp:Label>
              </div>
        <br />
        <div>
            <asp:Label ID="lblComment" runat="server" Visible="False" ForeColor="Red"></asp:Label>
        </div>
        <br />
     <div>
          <asp:LinkButton ID="lnkCancel" runat="server" OnClick="lnkCancel_Click">Cancel</asp:LinkButton>   
     </div>

           
        </div>
</asp:Content>
