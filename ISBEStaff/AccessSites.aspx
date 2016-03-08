<%@ Page Title="" Language="C#" MasterPageFile="~/MainNestedMaster.Master" AutoEventWireup="true" CodeBehind="AccessSites.aspx.cs" Inherits="HVP.ISBEStaff.AccessSites" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
		a img{border: none;}
		ol li{list-style: decimal outside;}
		div#container{width: 780px;margin: 0 auto;padding: 1em 0;}
		div.side-by-side{width: 100%;margin-bottom: 1em;}
		div.side-by-side > div{width: 50%;}
		div.side-by-side > div > em{margin-bottom: 10px;display: block;}
		.clearfix:after{content: "\0020";display: block;height: 0;clear: both;overflow: hidden;visibility: hidden;}		
	</style>
    <link rel="stylesheet" href="../Style/chosen.css" />
    <div class="userlist">
   <div> <h1 class="users">PI ISBE Program Monitoring</h1></div>        
       <div id="container">			
			<div class="side-by-side clearfix">
				<div>
					<h4><label style="float:left;">Program:</label></h4><asp:DropDownList data-placeholder="Choose a Program..." runat="server" ID="ddlProgram" class="chzn-select" Style="width: 400px;" DataSourceID="SqlDataSource1" DataTextField="Program" DataValueField="Program_ID" OnSelectedIndexChanged="ddlProgram_SelectedIndexChanged" AutoPostBack="True" AppendDataBoundItems="True">
					<asp:ListItem Text="" Value="" />
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlProgram" ErrorMessage="Required" ValidationGroup="val1"></asp:RequiredFieldValidator>
				    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT [Program], [Program_ID] FROM [Program] ORDER BY [Program]"></asp:SqlDataSource> 
				</div>
                <div>
                    <h4><label style="float:left;">Site:</label></h4><asp:DropDownList ID="ddlSite" data-placeholder="Choose a Site..." Style="width: 400px;" class="chzn-select" runat="server"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlSite" ErrorMessage="Required" ValidationGroup="val1"></asp:RequiredFieldValidator>
                </div>
			</div>
		</div>		
        <div id="nav">
             <ul>
                 <li>
                     <asp:LinkButton ID="lnkbtnEnter" runat="server" OnClick="lnkbtnEnter_Click" ValidationGroup="val1">Enter</asp:LinkButton>
                 </li>               
             </ul>           
             </div>
        </div>
    <script src="../Scripts/jquery.min.js" type="text/javascript"></script>
		<script src="../Scripts/chosen.jquery.js" type="text/javascript"></script>
		<script type="text/javascript">
		    $(".chzn-select").chosen();
		    $(".chzn-select-deselect").chosen({ allow_single_deselect: true });
		</script>      
</asp:Content>
