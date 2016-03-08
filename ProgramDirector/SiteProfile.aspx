<%@ Page Title="" Language="C#" MasterPageFile="~/MainNestedMaster.Master" AutoEventWireup="true" CodeBehind="SiteProfile.aspx.cs" Inherits="HVP.ProgramDirector.SiteProfile" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:HiddenField ID="hfsiteid" runat="server" />
     <div class="userlist">
   <div> <h1 class="users">Site Information</h1></div>    
        <div><h2 class="Sitename">Site Name:
            <asp:Label ID="lblSitename" runat="server"></asp:Label></h2>
            <h4 class="Sitename">Program ID: <asp:Label ID="lblProgramId" runat="server"></asp:Label></h4>
        </div>
         <asp:UpdatePanel ID="UpdatePanel3" runat="server"><ContentTemplate>    
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
         <div style="clear:both; float:right; margin:20px"><asp:LinkButton ID="lnkbtnEdit" runat="server" OnClick="lnkbtnEdit_Click">Edit</asp:LinkButton></div>         
        </div>
             <asp:PlaceHolder ID="phErrorUpdate" runat="server"></asp:PlaceHolder>
        <asp:MultiView ID="MultiView3" runat="server">
            <asp:View ID="View3" runat="server">
       <div>
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
            <div style="padding-top: 5px;"><asp:TextBox ID="txtMainPhone_Update" CssClass="LeftValueColumn" runat="server" Width="350px"></asp:TextBox></div>
            <div style="padding-top: 5px;"><asp:TextBox ID="txtPhone_Update" CssClass="LeftValueColumn" runat="server" Width="350px"></asp:TextBox></div>
            <div style="padding-top: 5px;"><asp:TextBox ID="txtEmail_Update" CssClass="LeftValueColumn" runat="server" Width="350px"></asp:TextBox></div>
            <div style="padding-top: 5px;"><asp:TextBox ID="txtSiteAddress_Update" CssClass="LeftValueColumn" runat="server" Width="350px"></asp:TextBox></div>
             <div style="padding-top: 5px;"><asp:TextBox ID="txtCity_Update" CssClass="LeftValueColumn" runat="server" Width="350px" ></asp:TextBox></div>
             <div style="padding-top: 5px;"><asp:TextBox ID="txtState_Update" CssClass="LeftValueColumn" runat="server" Width="150px"></asp:TextBox></div>
             <div style="padding-top: 5px;"><asp:TextBox ID="txtZip_Update" CssClass="LeftValueColumn" runat="server" Width="150px" ></asp:TextBox></div>
             <div style="padding-top: 5px;"><asp:TextBox ID="txtNum_Hv_Visitor_Update" CssClass="LeftValueColumn" runat="server" Width="150px" ></asp:TextBox></div>
        </div>
       <div style="margin:5px;">
            <div style="float:left; margin:5px;"><label>MIECHV</label><asp:CheckBox ID="chkMiechv_Update" runat="server"/></div>
            <div style="float:left; margin:5px;"><label>MIHope</label><asp:CheckBox ID="chkMiHope_Update" runat="server" /></div>
           <div style="float:left; margin:5px;"><label>Pilot</label><asp:CheckBox ID="chkPilot_Update" runat="server" /></div>
           <div style="float:left; margin:5px;"><label>Validation Research</label><asp:CheckBox ID="chkValidation_research_Update" runat="server" /></div>
        </div>
           <div style="clear:both; float:left; margin:20px"><asp:LinkButton ID="lnkBtnCancel" runat="server" OnClick="lnkBtnCancel_Click">Cancel</asp:LinkButton></div>
         <div style="float:right; margin:20px"><asp:LinkButton ID="lnkbtnUpdate" runat="server" OnClick="lnkbtnUpdate_Click">Update</asp:LinkButton></div>       
        <%--<div style="float: right;">            
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2970.1031784060633!2d-87.63427628433634!3d41.8906380726082!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x880e2cb3de090361%3A0xa1c6bcad9e6b8bea!2s451+N+LaSalle+St%2C+Chicago%2C+IL+60654!5e0!3m2!1sen!2sus!4v1445898276823"" width="200" height="200"  style="border:0"></iframe>
        </div>--%>
        <!-- Because we can't use border-top, margin-top or padding-top on a textbox, we surround the textboxes with div tags -->
                        
            </asp:View>
        </asp:MultiView>
             </ContentTemplate></asp:UpdatePanel>
			 </div>   
        














    <%--<h3> SITE INFORMATION</h3>
    <table>       
        <tr>
            <th>Site Name:</th>
            <td>
                <asp:textbox runat="server" ID="txtSiteName" Enabled="False" Width="400px"></asp:textbox>
            </td>
        </tr>
        
                <tr>
                    <th>Site Address:</th>
                    <td>
                        <asp:TextBox ID="txtSiteAddress" runat="server" Width="300px"></asp:TextBox></td>
                </tr>
                <tr>
                    <th>City:</th>
                    <td>
                        <asp:TextBox ID="txtCity" runat="server" Width="300px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th>State:</th>
                    <td>
                        <asp:TextBox ID="txtState" runat="server" Width="300px"></asp:TextBox>
                    </td>
                </tr>
        <tr>
            <th>Zip Code:</th>
             <td><asp:TextBox ID="txtZip" runat="server" ></asp:TextBox>
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtZip" ErrorMessage="NOT VAILD ZIP CODE" ValidationExpression="\d{5}(-\d{4})?" ValidationGroup="val1"></asp:RegularExpressionValidator>
            </td>
        </tr>
                 <tr>
            <th>Phone Number:</th>
             <td><asp:TextBox ID="txtPhone" runat="server" Width="200px" ></asp:TextBox>
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPhone" ErrorMessage="NOT VAILD PHONE NUMBER(000-000-0000)" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" ValidationGroup="val1"></asp:RegularExpressionValidator>
                     </td>
        </tr>
        <tr>
            <th>
                MICEHV Sites:
                
            </th>   
            <td>
                <asp:CheckBox ID="chkbxMICEHV" Text="MICEHV" runat="server" />
            </td>         
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <th>
                <asp:Button ID="btnCancelV2" runat="server" Text="Cancel" OnClick="btnCancelV2_Click"/>
            </th>
            <td>&nbsp;&nbsp;<asp:Button ID="btnSave" runat="server" Text="Save Changes" OnClick="btnSave_Click" ValidationGroup="val1"  />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            
        </tr>
    </table>--%>
</asp:Content>
