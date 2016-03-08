<%@ Page Title="" Language="C#" MasterPageFile="~/GroupObservation/GropObservation.master" AutoEventWireup="true" CodeBehind="GroupObservation.aspx.cs" Inherits="HVP.GroupObservation.GroupObservation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <p>Ask the group leader the following questions before the group begins.</p>
        <ol>
            <li>
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server"></asp:RadioButtonList>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </li>
            <li>
                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                <asp:CheckBoxList ID="CheckBoxList1" runat="server"></asp:CheckBoxList>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </li>
            <%--Need A Repeater for Q3--%>
            <li>
                <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                <asp:CheckBox ID="CheckBox1" runat="server" />
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </li>
            <li>
                <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                <asp:CheckBox ID="CheckBox2" runat="server" />
                <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            </li>
            <li>
                <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                <asp:CheckBoxList ID="CheckBoxList2" runat="server"></asp:CheckBoxList>
            </li>
            <li>
                <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
                <asp:CheckBoxList ID="CheckBoxList3" runat="server"></asp:CheckBoxList>
                If yes:
                <asp:CheckBoxList ID="CheckBoxList4" runat="server"></asp:CheckBoxList>
            </li>
        </ol>
        <p>Answer the following questions based on your observations.</p>
        <ol>
            <li>
                <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            </li>
            <li>
                <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label><asp:TextBox ID="TextBox6" runat="server"></asp:TextBox><asp:Label ID="Label10" runat="server" Text="Label"></asp:Label><asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
            </li>
            <li>
                <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label><asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
            </li>
            <li>
                <p>Attendance:</p>
                <asp:Label ID="Label12" runat="server" Text="Label"></asp:Label>
                <asp:Repeater ID="Repeater1" runat="server">
                    <HeaderTemplate>
                        <table>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:Label ID="Label13" runat="server" Text="Label"></asp:Label>
                                <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </li>
            <li>
                <p>Language of Instruction:</p>
                <asp:Label ID="Label14" runat="server" Text="Label"></asp:Label>
                <asp:RadioButtonList ID="RadioButtonList2" runat="server"></asp:RadioButtonList>
            </li>
            <li>
                <p>Physical Room Setup:</p>
                <asp:Label ID="Label15" runat="server" Text="Label"></asp:Label>
                <asp:RadioButtonList ID="RadioButtonList3" runat="server"></asp:RadioButtonList>
                <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
            </li>
            <li>
                <asp:Label ID="Label16" runat="server" Text="Label"></asp:Label>
                <asp:CheckBox ID="CheckBox3" runat="server" />
                <asp:CheckBox ID="CheckBox4" runat="server" />
                <asp:CheckBox ID="CheckBox5" runat="server" />
                <asp:CheckBox ID="CheckBox6" runat="server" />
                <%--second section, radiobutton--%>
                <asp:RadioButtonList ID="RadioButtonList4" runat="server"></asp:RadioButtonList>
                <%--second section, radiobutton--%>
                <asp:CheckBox ID="CheckBox7" runat="server" />
                <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
            </li>
            <li>
                <asp:Label ID="Label17" runat="server" Text="Label"></asp:Label>
                <asp:Repeater ID="Repeater2" runat="server">
                    <HeaderTemplate>
                        <table>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:Label ID="Label18" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="RadioButtonList5" runat="server"></asp:RadioButtonList>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </li>
            <li>
                <asp:Label ID="Label19" runat="server" Text="Label"></asp:Label>
                <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
            </li>
            <li>
                <asp:Label ID="Label20" runat="server" Text="Label"></asp:Label>

                <asp:Repeater ID="Repeater3" runat="server">
                    <HeaderTemplate>
                        <table>
                            <tr>
                                <td>Welcome / Ice Breaker
                                </td>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>dd
                            </td>
                            <td>123
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
                <asp:Repeater ID="Repeater4" runat="server">
                    <HeaderTemplate>
                        <table>
                            <tr>
                                <td>Facilitator and Facilitation Skills
                                </td>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>dd
                            </td>
                            <td>123
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
                <asp:Repeater ID="Repeater5" runat="server">
                    <HeaderTemplate>
                        <table>
                            <tr>
                                <td>Content
                                </td>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>dd
                            </td>
                            <td>123
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
                <asp:Repeater ID="Repeater6" runat="server">
                    <HeaderTemplate>
                        <table>
                            <tr>
                                <td>Early Childhood Development
                                </td>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>dd
                            </td>
                            <td>123
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
                <asp:Repeater ID="Repeater7" runat="server">
                    <HeaderTemplate>
                        <table>
                            <tr>
                                <td>Handouts
                                </td>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>dd
                            </td>
                            <td>123
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
                <asp:Repeater ID="Repeater8" runat="server">
                    <HeaderTemplate>
                        <table>
                            <tr>
                                <td>Interaction
                                </td>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>dd
                            </td>
                            <td>123
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </li>
            <li>
                <asp:Label ID="Label21" runat="server" Text="Label"></asp:Label>
                <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox>
            </li>
            <li>
                <asp:Label ID="Label22" runat="server" Text="Label"></asp:Label>
                <asp:TextBox ID="TextBox14" runat="server"></asp:TextBox>
            </li>
            <li>
                <asp:Label ID="Label23" runat="server" Text="Label"></asp:Label>
                <asp:TextBox ID="TextBox15" runat="server"></asp:TextBox>
            </li>
            <li>
                <asp:Label ID="Label24" runat="server" Text="Label"></asp:Label>
                <asp:TextBox ID="TextBox16" runat="server"></asp:TextBox>
            </li>
        </ol>
        <h4 style="text-align: center">POST-OBSERVATION QUESTIONS</h4>
        <p>Ask the group leader the following questions after the group ends.</p>
        <ol>
            <li>
                <asp:Label ID="Label25" runat="server" Text="Label"></asp:Label>
                <asp:RadioButtonList ID="RadioButtonList6" runat="server"></asp:RadioButtonList>
                Comments:<asp:TextBox ID="TextBox17" runat="server"></asp:TextBox>
            </li>
            <li>
                <asp:Label ID="Label26" runat="server" Text="Label"></asp:Label>
                <asp:RadioButtonList ID="RadioButtonList7" runat="server"></asp:RadioButtonList>

                <asp:Label ID="Label27" runat="server" Text="Label"></asp:Label>
                <asp:RadioButtonList ID="RadioButtonList8" runat="server"></asp:RadioButtonList>
                Comments:<asp:TextBox ID="TextBox18" runat="server"></asp:TextBox>
            </li>
            <li>
                <asp:Label ID="Label28" runat="server" Text="Label"></asp:Label>
                <asp:RadioButtonList ID="RadioButtonList9" runat="server"></asp:RadioButtonList>
            </li>
            <li>
                <asp:Label ID="Label29" runat="server" Text="Label"></asp:Label>
                <asp:RadioButtonList ID="RadioButtonList10" runat="server"></asp:RadioButtonList>
                <asp:TextBox ID="TextBox19" runat="server"></asp:TextBox>
            </li>
            <li>
                <asp:Label ID="Label30" runat="server" Text="Label"></asp:Label>
                <asp:RadioButtonList ID="RadioButtonList11" runat="server"></asp:RadioButtonList>
                 <asp:Label ID="Label31" runat="server" Text="Label"></asp:Label><br />
                <asp:Repeater ID="Repeater9" runat="server">
                    <ItemTemplate>
                        <%--Need Group Name--%>
                        <asp:RadioButton ID="RadioButton1" runat="server" />
                        <asp:TextBox ID="TextBox20" runat="server"></asp:TextBox><br />
                    </ItemTemplate>
                </asp:Repeater>
            </li>
            <li>
                <asp:Label ID="Label32" runat="server" Text="Label"></asp:Label>
                 <asp:Repeater ID="Repeater10" runat="server">
                    <ItemTemplate>
                        <%--Need Group Name--%>
                        <asp:RadioButton ID="RadioButton1" runat="server" />
                        <asp:TextBox ID="TextBox20" runat="server"></asp:TextBox><br />
                    </ItemTemplate>
                </asp:Repeater>
            </li>
            <li>
                <asp:Label ID="Label33" runat="server" Text="Label"></asp:Label>
            </li>
        </ol>
    </div>
</asp:Content>
