<%@ Page Title="" Language="C#" MasterPageFile="~/MainNestedMaster.master" AutoEventWireup="true" CodeBehind="SiteList.aspx.cs" Inherits="HVP.Admin.SiteList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="userlist">
        <div>
            <h1 class="users">Site List</h1>
        </div>
        <div>
            <div style="float: left; border-top: solid 1px white;">
                <label class="LeftLabelColumn">Select Year:</label>
            </div>
            <div>
                <div style="padding-top: 5px; height: 22px;">
                    <asp:DropDownList ID="ddlYear" runat="server"></asp:DropDownList>
                </div>
            </div>
            <br />
            <div style="padding-top: 5px;">
                <table>
                    <tr>
                        <td>
                            <asp:ListBox ID="ListBox1" runat="server" Height="200px" DataSourceID="SqlDataSource1" DataTextField="Sites" DataValueField="SiteID" SelectionMode="Multiple"></asp:ListBox>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT [SiteID], [Sites] FROM [Sites]"></asp:SqlDataSource>
                        </td>
                        <td style="padding-top: 50px; padding-top: 50px; text-align: center;">
                            <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
                            <asp:Button ID="btnRemove" runat="server" Text="Remove" OnClick="btnRemove_Click" />
                        </td>
                        <td>
                            <asp:ListBox ID="ListBox2" runat="server" Height="200px" Width="250px" SelectionMode="Multiple"></asp:ListBox>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                <div>
                    <asp:LinkButton ID="lnkbtnSubmit" runat="server" OnClick="lnkbtnSubmit_Click">Submit</asp:LinkButton>
                </div>
                <br />
                <div>
                    <asp:LinkButton ID="lnkbtnView" runat="server" OnClick="lnkbtnView_Click">View List</asp:LinkButton>
                </div>
            </div>
            <br />
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="View1" runat="server">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" EnableModelValidation="True" EmptyDataText="NO DATA">
                        <Columns>
                            <asp:BoundField DataField="Sites" HeaderText="Sites" />
                            <asp:BoundField DataField="Assigned_yr" HeaderText="Year" />
                        </Columns>
                    </asp:GridView>
                </asp:View>
            </asp:MultiView>
        </div>
    </div>
</asp:Content>
