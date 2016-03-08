<%@ Page Title="" Language="C#" MasterPageFile="~/MainNestedMaster.Master" AutoEventWireup="true" CodeBehind="UnlockUser.aspx.cs" Inherits="HVP.ManageUsers.LockorUnlockUser" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  
    <div id="userlist">
    <div>
        <h1 class="users">UnLock User</h1>
    </div>
         <div>
            <h4> Select A User:</h4>
             </div>
         <div style="float:left; margin-right:.5em;">
             <asp:DropDownList ID="ddlUsers" runat="server"></asp:DropDownList> 
             </div>
         <div style="float:left; margin-right:.5em;">
             <asp:LinkButton ID="lnkUnlock" runat="server" CssClass="pos-down-1" OnClick="lnkUnlock_Click">Unlock</asp:LinkButton>
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
