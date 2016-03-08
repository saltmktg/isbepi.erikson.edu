<%@ Page Title="" Language="C#" MasterPageFile="~/MainNestedMaster.Master" AutoEventWireup="true" CodeBehind="managesite.aspx.cs" Inherits="HVP.Admin.managesite" %>
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
                 <li>
                     <asp:LinkButton ID="lnkbtnViewList" runat="server" OnClick="lnkbtnViewList_Click">View List</asp:LinkButton>
                 </li>
             </ul>            
                  
             </div>
        <div>
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="View1" runat="server">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AutoGenerateSelectButton="True" EnableModelValidation="True" HorizontalAlign="Center" DataSourceID="SqlDataSource2" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" AllowPaging="True" PageSize="5">
                        <Columns>
                            <asp:BoundField HeaderText="SiteID" DataField="SiteID" InsertVisible="False" ReadOnly="True" SortExpression="SiteID">
                                 <HeaderStyle CssClass="HiddenSiteID" />
                                 <ItemStyle CssClass="HiddenSiteID" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Schd_ID" DataField="Schd_ID" InsertVisible="False" ReadOnly="True" SortExpression="Schd_ID">
                                  <HeaderStyle CssClass="HiddenSiteID" />
                                 <ItemStyle CssClass="HiddenSiteID" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="VisitDate" DataField="VisitDate" SortExpression="VisitDate" DataFormatString=" {0:d}" />
                            <asp:BoundField HeaderText="Sites" DataField="Sites" SortExpression="Sites" />
                            <asp:BoundField HeaderText="Monitor's Name" DataField="Name" SortExpression="Name" />
                            <asp:BoundField HeaderText="Second Monitor's Name" DataField="Second_Name" ReadOnly="True" SortExpression="Second_Name" />
                            <asp:BoundField HeaderText="# of HV" DataField="Num_HV" ReadOnly="True" SortExpression="Num_HV" />
                            <asp:BoundField HeaderText="Status" DataField="Status" SortExpression="Status" />
                        </Columns>
                        <PagerSettings Mode="NextPrevious" NextPageText="Next" PreviousPageText="Previous" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT ST.SiteID, SCHD.Schd_ID,SCHD.VisitDate,ST.Sites, UN.Name,COALESCE(UN2.Name,'N/A') as Second_Name, COALESCE(ST.Num_of_HV,0) AS Num_HV, SCHD.Status
                       FROM [ISBEPI_DEV].[dbo].[Scheduling] SCHD JOIN [ISBEPI_DEV].[dbo].[UserNames] UN 
                       ON UN.NameID = SCHD.NameID JOIN [ISBEPI_DEV].[dbo].[Sites] ST 
                    ON ST.SiteID = SCHD.SiteID LEFT JOIN [ISBEPI_DEV].[dbo].[UserNames] UN2 ON SCHD.Second_NameID = UN2.NameID  ORDER BY [VisitDate] DESC"></asp:SqlDataSource>
                </asp:View>
            </asp:MultiView>
        </div>
    </div>
     <script src="../Scripts/jquery.min.js" type="text/javascript"></script>
		<script src="../Scripts/chosen.jquery.js" type="text/javascript"></script>
		<script type="text/javascript">
		    $(".chzn-select").chosen();
		    $(".chzn-select-deselect").chosen({ allow_single_deselect: true });
		</script>      
</asp:Content>
