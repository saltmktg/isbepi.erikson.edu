<%@ Page Title="" Language="C#" MasterPageFile="~/MainNestedMaster.Master" AutoEventWireup="true" CodeBehind="DisableUser.aspx.cs" Inherits="HVP.ManageUsers.DisableUser" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="userlist">
    <div>
        <h1 class="users">Disable User</h1>
    </div>
         <div>
            <h4> Select A User:</h4>
             </div>
         <div style="float:left; margin-right:.5em;">

             <asp:DropDownList ID="ddlUsers" runat="server"></asp:DropDownList> 
             </div>
         <div style="float:left; margin-right:.5em;">
             <asp:LinkButton ID="lnkDisable" runat="server" OnClick="lnkDisable_Click">Disable</asp:LinkButton>
        </div>
         <div style="float:left; margin-right:.5em;">
             <asp:LinkButton ID="lbkUnDisable" runat="server" OnClick="lbkUnDisable_Click">Un-Disable</asp:LinkButton>
        </div>
        <br />
        <div style="clear:both">
         <asp:Label ID="lblComment" runat="server"></asp:Label>
        </div>
        <br /><br />
        <div>
          <asp:LinkButton ID="lnkCancel" runat="server" OnClick="lnkCancel_Click">Cancel</asp:LinkButton>   
     </div>
    </div>
</asp:Content>
