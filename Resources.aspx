<%@ Page Title="" Language="C#" MasterPageFile="~/MainNestedMaster.Master" AutoEventWireup="true" CodeBehind="Resources.aspx.cs" Inherits="HVP.Resources" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="header-strip">
        <div class="container">
            <h1 class="bot-mar-10">Resources</h1>
        </div>
    </div>

    <div class="container content page-interior">

        <div class="row top-mar-10">
            <div>
                <ul style="list-style: none">
                    <li class="status-check-list"><a href="#">Letter from ISBE</a></li>
                    <li class="status-check-list"><a href="#">Site Visit Prep Guide</a></li>
                    <li class="status-check-list"><a href="#">General Information</a></li>
                    <li class="status-check-list"><a href="#">Monitoring Webinar</a></li>
                </ul>
            </div>
            <div>
                <asp:LoginView ID="LoginView1" runat="server">
                    <RoleGroups>
                        <asp:RoleGroup Roles="Administrator">
                            <ContentTemplate>
                                <div>
                                    <ul style="list-style: none">
                                        <li class="status-check-list"><a href="#">PIQRI Webinar</a></li>
                                        <li class="status-check-list"><a href="#">PICC Webinar</a></li>
                                        <li class="status-check-list"><a href="#">HOVRS Webinar</a></li>
                                        <li class="status-check-list"><a href="#">PIQRI</a></li>
                                        <li class="status-check-list"><a href="#">PICC</a></li>
                                        <li class="status-check-list"><a href="#">HOVRS-A+</a></li>
                                         <li class="status-check-list"><a href="#">Group Observation Protocol</a></li>
                                    </ul>
									 <div>
                                   <div style="float:left; margin-right:10px;"> Update Document:</div><asp:FileUpload ID="FileUpload1" runat="server" />
                                    <div style="float:right; margin-right:200px;"><asp:LinkButton ID="lnkbtnUpload" runat="server">Upload Documrnts</asp:LinkButton></div>
                                        </div>
                                </div>
                            </ContentTemplate>
                        </asp:RoleGroup>
                    </RoleGroups>
                </asp:LoginView>
            </div>
        </div>
    </div>
</asp:Content>
