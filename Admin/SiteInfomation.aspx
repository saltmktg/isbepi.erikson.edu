<%@ Page Title="" Language="C#" MasterPageFile="~/MainNestedMaster.Master" AutoEventWireup="true" CodeBehind="SiteInfomation.aspx.cs" Inherits="HVP.Admin.SiteInfomation" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:MultiView ID="MultiView1" runat="server">
    <asp:View ID="View1" runat="server">
    <table >
        <tr>
            <td colspan="2">
                 <h3>Site Information</h3>
            </td>
            </tr>         
            <tr>
                <th>
                     Select Program Name:
                </th>
                <td>                    
                    <asp:DropDownList ID="ddlProgram" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlProgram_SelectedIndexChanged">
                    </asp:DropDownList>                    
                </td>
            </tr>  
        <tr>
            <th>
                Select Site Name:
            </th>
            <td>
                <asp:DropDownList ID="ddlSite" runat="server"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnCancel" CssClass="top-mar-10" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
            </td>
            <td>
                <asp:Button ID="btnSubmit" CssClass="top-mar-10" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
            </td>
        </tr>
    </table>   
    </asp:View>
        <asp:View ID="View2" runat="server">
             <table> 
             <h3>Site Information</h3>      
        <tr>
            <th>Site Name:</th>
            <td><asp:TextBox ID="txtSiteName" runat="server" Width="300px" Enabled="False"></asp:TextBox></td>
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
             <td><asp:TextBox ID="txtZip" runat="server" ></asp:TextBox></td>
        </tr>
                 <tr>
            <th>Phone Number:</th>
             <td><asp:TextBox ID="txtPhone" runat="server" Width="200px" ></asp:TextBox></td>
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
            <td>&nbsp;&nbsp;<asp:Button ID="btnSave" runat="server" Text="Save Changes" OnClick="btnSave_Click"  />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            
        </tr>
    </table>
        </asp:View>
    </asp:MultiView>
</asp:Content>
