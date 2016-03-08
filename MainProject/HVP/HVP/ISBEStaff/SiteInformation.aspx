<%@ Page Title="" Language="C#" MasterPageFile="~/ManageSite.Master" AutoEventWireup="true" CodeBehind="SiteInformation.aspx.cs" Inherits="HVP.ISBEStaff.SiteInformation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HiddenField ID="hfsiteid" runat="server" />
    <asp:HiddenField ID="hfSchdId" runat="server" />
     <div class="userlist">
   <div> <h1 class="users">Site Information</h1></div>    
        <div><h2 class="Sitename">Sitename:
            <asp:Label ID="lblSitename" runat="server"></asp:Label></h2>
            <h4 class="Sitename">Program ID: <asp:Label ID="lblProgramId" runat="server"></asp:Label></h4>
        </div>        
       <div runat="server" id="Edit">
       <div style="float: left; border-top: solid 1px white;">
           <label class="LeftLabelColumn">Main Contact:</label>
           <label class="LeftLabelColumn">Phone:</label>
           <label class="LeftLabelColumn">Email:</label>
           <label class="LeftLabelColumn">Site Address:</label>  
           <label class="LeftLabelColumn">City:</label>  
           <label class="LeftLabelColumn">State:</label>  
           <label class="LeftLabelColumn">Zip Code:</label>  
           <label class="LeftLabelColumn">Number of Home Visitor:</label>          
        </div>  
           <div>
            <div style="padding-top: 5px;"><asp:TextBox ID="txtMainPhone_Edit" CssClass="LeftValueColumn" runat="server" Width="350px" Enabled="False"></asp:TextBox></div>
            <div style="padding-top: 5px;"><asp:TextBox ID="txtPhone_Edit" CssClass="LeftValueColumn" runat="server" Width="350px" Enabled="False"></asp:TextBox></div>
            <div style="padding-top: 5px;"><asp:TextBox ID="txtEmail_Edit" CssClass="LeftValueColumn" runat="server" Width="350px" Enabled="False"></asp:TextBox></div>
            <div style="padding-top: 5px;"><asp:TextBox ID="txtSiteAddress_Edit" CssClass="LeftValueColumn" runat="server" Width="350px" Enabled="False"></asp:TextBox></div>
             <div style="padding-top: 5px;"><asp:TextBox ID="txtCity_Edit" CssClass="LeftValueColumn" runat="server" Width="350px" Enabled="False"></asp:TextBox></div>
             <div style="padding-top: 5px;"><asp:TextBox ID="txtState_Edit" CssClass="LeftValueColumn" runat="server" Width="150px" Enabled="False"></asp:TextBox></div>
             <div style="padding-top: 5px;"><asp:TextBox ID="txtZip_Edit" CssClass="LeftValueColumn" runat="server" Width="150px" Enabled="False"></asp:TextBox></div>
             <div style="padding-top: 5px;"><asp:TextBox ID="txtNum_Hv_Visitor_Edit" CssClass="LeftValueColumn" runat="server" Width="150px" Enabled="False" ></asp:TextBox></div>
        </div> 
          <div style="margin:5px;">
            <div style="float:left; margin:5px;"><label>MIECHV</label><asp:CheckBox ID="chkMiechv_Edit" runat="server" Enabled="False"/></div>
            <div style="float:left; margin:5px;"><label>MIHope</label><asp:CheckBox ID="chkMiHope_Edit" runat="server" Enabled="False" /></div>
           <div style="float:left; margin:5px;"><label>Pilot</label><asp:CheckBox ID="chkPilot_Edit" runat="server" Enabled="False"/></div>
           <div style="float:left; margin:5px;"><label>Validation Research</label><asp:CheckBox ID="chkValidation_research_Edit" runat="server" Enabled="False"/></div>
        </div> 
           </div>
         </div>
         
</asp:Content>
