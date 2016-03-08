<%@ Page Title="" Language="C#" MasterPageFile="~/Survey/SurveyMaster.Master" AutoEventWireup="true" CodeBehind="PIQRIHomeVisitorOnlineSurvey.aspx.cs" Inherits="HVP.PIQRI_Home_Visitor_Online_Survey" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1
        {
            text-decoration: underline;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        window.onbeforeunload = function (e) {
            var e = e || window.event;
            if (e) e.returnValue = 'All the work will be lost, Do you want to continue or Leave?.';//for IE & Firefox
            return 'All the work will be lost, Do you want to continue? or Leave?.';// for Safari and Chrome
        };

    </script>
    <asp:HiddenField ID="hfSiteId" runat="server" />
    <asp:HiddenField ID="hsSchd_id" runat="server" />
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <table class="progressbar">
                <tr>
                    <td class="progressbar_1"></td>
                    <td>progressing...</td>
                </tr>
            </table>
            <h3>DEMOGRAPHICS</h3>

            <ol>
                <li>
                    <asp:Label ID="lblQ1" runat="server"></asp:Label>
                    &nbsp;<asp:RadioButtonList ID="rdobtnlstQ1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Answers" DataValueField="Value" Height="29px">
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="rdobtnlstQ1" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT Answer_ID, Question_ID, Answers, Value FROM HomeVisitorSurveyAnswers WHERE (Question_ID = @Question_ID)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="Q1" Name="Question_ID" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </li>
                <li>
                    <asp:Label ID="lblQ2" runat="server"></asp:Label>
                    &nbsp;<asp:RadioButtonList ID="rdobtnlstQ2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Answers" DataValueField="Value">
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="rdobtnlstQ2" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT Answer_ID, Question_ID, Answers, Value FROM HomeVisitorSurveyAnswers WHERE (Question_ID = @Question_ID)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="Q2" Name="Question_ID" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:TextBox ID="txtRace" runat="server"></asp:TextBox>
                    <asp:Label ID="lblQ2Comment" runat="server" ForeColor="Red"></asp:Label>
                </li>
            </ol>
            <%-- <asp:ScriptManager ID="ScriptManager1" runat="server"/>--%>
            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                <ContentTemplate>
                    <ol start="3">
                        <li>
                            <asp:Label ID="lblQ3_Yes_or_No" runat="server"></asp:Label>
                            <asp:RadioButtonList ID="rdobtnlst_Yes_or_No" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="rdobtnlst_Yes_or_No_SelectedIndexChanged" CausesValidation="True">
                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                <asp:ListItem Value="0">No</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator89" runat="server" ControlToValidate="rdobtnlst_Yes_or_No" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <br />
                            <asp:Label ID="lblQ3" runat="server" Visible="False"></asp:Label>
                            &nbsp;<asp:CheckBoxList ID="chkLanguageQ3" runat="server" DataSourceID="SqlDataSource3" DataTextField="Answers" DataValueField="Value" Visible="False">
                            </asp:CheckBoxList>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [HomeVisitorSurveyAnswers] WHERE ([Question_ID] = @Question_ID)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="Q3" Name="Question_ID" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:TextBox ID="txtLanguage" runat="server" Visible="False"></asp:TextBox>
                            <asp:Label ID="lblQ3Comment" runat="server" ForeColor="Red"></asp:Label>
                        </li>
                    </ol>
                </ContentTemplate>
            </asp:UpdatePanel>
            <table>
                <tr>
                    <td>

                        <%--<asp:ImageButton ID="imgbtnHome0" runat="server" Height="50px" ImageUrl="~/Button/home.png" />--%>
                      
                    </td>
                    <td>
                        <asp:ImageButton ID="imgbtnForward0" runat="server" Height="50px" ImageUrl="~/Button/media_seek_forward.png" OnClick="imgbtnForward0_Click" ValidationGroup="Val1" OnClientClick="window.onbeforeunload=null;" />
                    </td>
                </tr>
            </table>

        </asp:View>
        <asp:View ID="View2" runat="server">
            <table class="progressbar">
                <tr>
                    <td class="progressbar_2"></td>
                    <td>progressing...</td>
                </tr>
            </table>
            <h3>EDUCATION</h3>

            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <ol start="4">
                        <li>
                            <asp:Label ID="lblQ4" runat="server"></asp:Label>
                            &nbsp;<asp:RadioButtonList ID="rdobtnlstQ4" runat="server" DataSourceID="SqlDataSource4" DataTextField="Answers" DataValueField="Value" AutoPostBack="True" onchange="window.onbeforeunload=null;" OnSelectedIndexChanged="rdobtnlstQ4_SelectedIndexChanged">
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="rdobtnlstQ4" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [HomeVisitorSurveyAnswers] WHERE ([Question_ID] = @Question_ID)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="Q4" Name="Question_ID" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </li>

                        <li runat="server" id="Q5_li" visible="false">
                            <asp:Label ID="lblQ5" runat="server" Visible="False"></asp:Label>
                            &nbsp;<asp:RadioButtonList ID="rdobtnlstQ5" runat="server" DataSourceID="SqlDataSource5" DataTextField="Answers" DataValueField="Value" Visible="False">
                            </asp:RadioButtonList>
                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [HomeVisitorSurveyAnswers] WHERE ([Question_ID] = @Question_ID)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="Q5" Name="Question_ID" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:TextBox ID="txtBestDescribesEducation" runat="server" Visible="False"></asp:TextBox>
                            <asp:Label ID="lblQ5Comment" runat="server" ForeColor="Red"></asp:Label>
                        </li>
                    </ol>
                </ContentTemplate>
            </asp:UpdatePanel>
            <table>
                <tr>
                    <td>
                        <asp:ImageButton ID="imgbtnback1" runat="server" Height="50px" ImageUrl="~/Button/media_seek_backward.png" OnClick="imgbtnback1_Click" OnClientClick="window.onbeforeunload=null;" />
                    </td>
                    <td>
                        <asp:ImageButton ID="imgbtnForward1" runat="server" Height="50px" ImageUrl="~/Button/media_seek_forward.png" OnClick="imgbtnForward1_Click" ValidationGroup="Val1" OnClientClick="window.onbeforeunload=null;" />
                    </td>
                </tr>
            </table>
        </asp:View>

        <asp:View ID="View3" runat="server">
            <table class="progressbar">
                <tr>
                    <td class="progressbar_3"></td>
                    <td>progressing...</td>
                </tr>
            </table>
            <h3>PROFESSIONAL EXPERIENCE</h3>
            <ol start="6">
                <li>
                    <asp:Label ID="lblQ6" runat="server"></asp:Label>
                    &nbsp;<ol class="d">
                        <li>
                            <asp:Label ID="lblQ6A" runat="server"></asp:Label>
                            &nbsp;<asp:RadioButtonList ID="rdobtnlstQ6_A" runat="server" DataSourceID="SqlDataSource6" DataTextField="Answers" DataValueField="Value">
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="rdobtnlstQ6_A" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [HomeVisitorSurveyAnswers] WHERE ([Question_ID] = @Question_ID)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="Q6A" Name="Question_ID" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </li>
                        <li>
                            <asp:Label ID="lblQ6B" runat="server"></asp:Label>
                            &nbsp;<asp:RadioButtonList ID="rdobtnlstQ6_B" runat="server" DataSourceID="SqlDataSource7" DataTextField="Answers" DataValueField="Value">
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="rdobtnlstQ6_B" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [HomeVisitorSurveyAnswers] WHERE ([Question_ID] = @Question_ID)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="Q6B" Name="Question_ID" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </li>
                    </ol>
                </li>
            </ol>
            <!-- getting toatl of Q10. -->
            <script type="text/javascript">
                var total_ = 0, txt10bx1 = 0, txt10bx2 = 0, txt10bx3 = 0, txt10bx4 = 0, txt10bx5 = 0;
                function sumQ10() {

                    txt10bx1 = document.getElementById('<%=txt10_1.ClientID %>').value;
                    txt10bx2 = document.getElementById('<%=txt10_2.ClientID %>').value;
                    txt10bx3 = document.getElementById('<%=txt10_3.ClientID %>').value;
                    txt10bx4 = document.getElementById('<%=txt10_4.ClientID %>').value;
                    txt10bx5 = document.getElementById('<%=txt10_5.ClientID %>').value;
                    total_ = parseInt(txt10bx1) + parseInt(txt10bx2) + parseInt(txt10bx3) + parseInt(txt10bx4) + parseInt(txt10bx5);

                    if (isNaN(total_)) {
                        document.getElementById('<%=txtQ10_total.ClientID%>').value = "Calculating ";
                    }
                    else {
                        document.getElementById('<%=txtQ10_total.ClientID%>').value = total_;
                    }
                }


            </script>
            <!-- getting toatl of Q10. -->
            <ol start="7">
                <li>
                    <asp:Label ID="lblQ7" runat="server"></asp:Label>
                    &nbsp;<asp:TextBox ID="txtQ7" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtQ7" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </li>
                <br />
                <li>
                    <asp:Label ID="lblQ8" runat="server"></asp:Label>
                    <asp:TextBox ID="txtQ8" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtQ8" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </li>
                <br />
                <li>
                    <asp:Label ID="lblQ9" runat="server"></asp:Label>
                    &nbsp;<asp:TextBox ID="txtQ9" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtQ9" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtQ9" ErrorMessage="Number Only" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                </li>


                <li>
                    <asp:Label ID="lblQ10" runat="server"></asp:Label>
                    &nbsp;<br />
                    <asp:Label ID="lblQ10_comment" runat="server" Text="Please enter 0 if you have none." ForeColor="Green"></asp:Label>
                    <ol class="d">
                        <li>
                            <asp:TextBox ID="txt10_1" runat="server" onkeyup="sumQ10();"></asp:TextBox>Prenatal­-3 months<asp:RequiredFieldValidator ID="RequiredFieldValidator74" runat="server" ControlToValidate="txt10_1" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </li>
                        <li>
                            <asp:TextBox ID="txt10_2" runat="server" onkeyup="sumQ10();"></asp:TextBox>4­-12 months<asp:RequiredFieldValidator ID="RequiredFieldValidator75" runat="server" ControlToValidate="txt10_2" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </li>
                        <li>
                            <asp:TextBox ID="txt10_3" runat="server" onkeyup="sumQ10();"></asp:TextBox>13-24 months<asp:RequiredFieldValidator ID="RequiredFieldValidator76" runat="server" ControlToValidate="txt10_3" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </li>
                        <li>
                            <asp:TextBox ID="txt10_4" runat="server" onkeyup="sumQ10();"></asp:TextBox>25-­36 months<asp:RequiredFieldValidator ID="RequiredFieldValidator77" runat="server" ControlToValidate="txt10_4" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </li>
                        <li>
                            <asp:TextBox ID="txt10_5" runat="server" onkeyup="sumQ10();"></asp:TextBox>Older than 36 months<asp:RequiredFieldValidator ID="RequiredFieldValidator78" runat="server" ControlToValidate="txt10_5" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </li>
                    </ol>
                    <br />
                    Total:<asp:TextBox ID="txtQ10_total" runat="server" ReadOnly="True"></asp:TextBox>
                </li>
                <!-- getting toatl of Q11. -->
                <script type="text/javascript">

                    function sumQ11() {
                        var txt11bx1 = document.getElementById('<%=txt11_1.ClientID %>').value;
                        var txt11bx2 = document.getElementById('<%=txt11_2.ClientID %>').value;
                        var txt11bx3 = document.getElementById('<%=txt11_3.ClientID %>').value;
                        var txt11bx4 = document.getElementById('<%=txt11_4.ClientID %>').value;
                        var txt11bx5 = document.getElementById('<%=txt11_5.ClientID %>').value;
                        var txt11bx6 = document.getElementById('<%=txt11_6.ClientID %>').value;
                        var txt11bx7 = document.getElementById('<%=txt11_7.ClientID %>').value;
                        var total_ = parseInt(txt11bx1) + parseInt(txt11bx2) + parseInt(txt11bx3) + parseInt(txt11bx4) + parseInt(txt11bx5) + parseInt(txt11bx6) + parseInt(txt11bx7);
                        if (isNaN(total_)) {
                            document.getElementById('<%=txt11_Total.ClientID%>').value = "Calculating ";
                        }
                        else {
                            document.getElementById('<%=txt11_Total.ClientID%>').value = total_;
                        }
                    }
                    function Q13show() {
                        var txtboxQ12 = document.getElementById('<%=txtQ12.ClientID %>').value;
                        var Q13 = document.getElementById('Q13');
                        var notshow = document.getElementById('Q13Notshow');
                        if (txtboxQ12 == 0) {
                            notshow.style.display = 'none';
                            Q13.style.display = 'none';
                        }
                        else {
                            notshow.style.display = '';
                            Q13.style.display = '';
                        }

                    }

                </script>
                <!-- getting toatl of Q11. -->

                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtQ9" ControlToValidate="txtQ10_total" ErrorMessage="Should be Equal to number stated in Question #9" ValidationGroup="Val1" SetFocusOnError="True"></asp:CompareValidator>

                <li>
                    <asp:Label ID="lblQ11" runat="server"></asp:Label>
                    &nbsp;<ol class="d">
                        <asp:Label ID="lblQ11_comment" runat="server" Text="Please enter 0 if you have none." ForeColor="Green"></asp:Label>
                        <li>
                            <asp:TextBox ID="txt11_1" runat="server" onkeyup="sumQ11();"></asp:TextBox>White, not of Hispanic origin<asp:RequiredFieldValidator ID="RequiredFieldValidator79" runat="server" ControlToValidate="txt11_1" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            &nbsp;&nbsp;</li>
                        <li>
                            <asp:TextBox ID="txt11_2" runat="server" onkeyup="sumQ11();"></asp:TextBox>Black, not of Hispanic origin 
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator80" runat="server" ControlToValidate="txt11_2" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </li>
                        <li>
                            <asp:TextBox ID="txt11_3" runat="server" onkeyup="sumQ11();"></asp:TextBox>Hispanic
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator81" runat="server" ControlToValidate="txt11_3" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </li>
                        <li>
                            <asp:TextBox ID="txt11_4" runat="server" onkeyup="sumQ11();"></asp:TextBox>Asian or Pacific Islander
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator82" runat="server" ControlToValidate="txt11_4" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </li>
                        <li>
                            <asp:TextBox ID="txt11_5" runat="server" onkeyup="sumQ11();"></asp:TextBox>American Indian or Alaskan Native
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator83" runat="server" ControlToValidate="txt11_5" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </li>
                        <li>
                            <asp:TextBox ID="txt11_6" runat="server" onkeyup="sumQ11();"></asp:TextBox>Other/Multiracial
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator84" runat="server" ControlToValidate="txt11_6" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </li>
                        <li>
                            <asp:TextBox ID="txt11_7" runat="server" onkeyup="sumQ11();"></asp:TextBox>Unknown
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator85" runat="server" ControlToValidate="txt11_7" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </li>
                    </ol>
                    <br />
                    Total:<asp:TextBox ID="txt11_Total" runat="server" ReadOnly="True"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="txtQ9" ControlToValidate="txt11_Total" ErrorMessage="Should be Equal to number stated in Question #9" ValidationGroup="Val1" SetFocusOnError="True"></asp:CompareValidator>
                </li>
            </ol>

            <asp:UpdatePanel ID="UpdatePanel2" RenderMode="Inline" runat="server">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="txtQ12" EventName="TextChanged" />
                </Triggers>
                <ContentTemplate>
                    <ol start="12">
                        <li>
                            <asp:Label ID="lblQ12" runat="server"></asp:Label>
                            &nbsp;<asp:TextBox ID="txtQ12" runat="server" onchange="window.onbeforeunload=null;" OnTextChanged="txtQ12_TextChanged" AutoPostBack="True"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtQ12" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <br />
                            <asp:Label ID="lblcommentQ12" runat="server" ForeColor="Red" Text="Please Answer Question# 13" Visible="False"></asp:Label>
                        </li>
                    </ol>
                    <ol type="A" start="2">
                        <li id="Q12_li" runat="server" visible="false">
                            <asp:Label ID="lblQ12_B" runat="server"></asp:Label>


                            <table class="HVSurvey">
                                <%-- <tr>
                                  <td class="d"></td>
                                  <th class="q">Often = 1</th>
                                  <th class="q">Sometimes = 2</th>
                                  <th class="q">Rarely = 3</th>
                                  <th class="q">Never = 4 </th>
                              </tr>--%>

                                <tr>
                                    <td class="HVSurvey">
                                        <ol type="A">
                                            <li>
                                                <asp:Label ID="lblQ12_1" runat="server" Visible="False"></asp:Label>
                                            </li>
                                        </ol>
                                        </th>
                                  <td class="HVSurvey">
                                      <asp:RadioButtonList ID="rdobtnlstQ12_1" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" Visible="False" CellPadding="5">
                                          <asp:ListItem Value="1">Often</asp:ListItem>
                                          <asp:ListItem Value="2">Sometimes</asp:ListItem>
                                          <asp:ListItem Value="3">Rarely</asp:ListItem>
                                          <asp:ListItem Value="4">Never</asp:ListItem>
                                      </asp:RadioButtonList>
                                      <asp:Label ID="lblcommentQ12_1" runat="server" ForeColor="Red" Text="Required" Visible="False"></asp:Label>
                                  </td>
                                </tr>
                                <tr>
                                    <td class="HVSurvey">
                                        <ol type="A" start="2">
                                            <li>
                                                <asp:Label ID="lblQ12_2" runat="server" Visible="False"></asp:Label>
                                            </li>
                                        </ol>
                                        </th>
                                  <td class="HVSurvey">
                                      <asp:RadioButtonList ID="rdobtnlstQ12_2" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" Visible="False" CellPadding="5">
                                          <asp:ListItem Value="1">Often</asp:ListItem>
                                          <asp:ListItem Value="2">Sometimes</asp:ListItem>
                                          <asp:ListItem Value="3">Rarely</asp:ListItem>
                                          <asp:ListItem Value="4">Never</asp:ListItem>
                                      </asp:RadioButtonList>
                                      <asp:Label ID="lblcommentQ12_2" runat="server" ForeColor="Red" Text="Required" Visible="False"></asp:Label>
                                  </td>
                                </tr>
                                <tr>
                                    <td class="HVSurvey">
                                        <ol type="A" start="3">
                                            <li>
                                                <asp:Label ID="lblQ12_3" runat="server" Visible="False"></asp:Label>
                                            </li>
                                        </ol>
                                        </th>
                                  <td class="HVSurvey">
                                      <asp:RadioButtonList ID="rdobtnlstQ12_3" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" Visible="False" CellPadding="5">
                                          <asp:ListItem Value="1">Often</asp:ListItem>
                                          <asp:ListItem Value="2">Sometimes</asp:ListItem>
                                          <asp:ListItem Value="3">Rarely</asp:ListItem>
                                          <asp:ListItem Value="4">Never</asp:ListItem>
                                      </asp:RadioButtonList>
                                      <asp:Label ID="lblcommentQ12_3" runat="server" ForeColor="Red" Text="Required" Visible="False"></asp:Label>
                                  </td>
                                </tr>
                                <tr>
                                    <td class="HVSurvey">
                                        <ol type="A" start="4">
                                            <li>
                                                <asp:Label ID="lblQ12_4" runat="server" Visible="False"></asp:Label>
                                            </li>
                                        </ol>
                                        </th>
                                  <td class="HVSurvey">
                                      <asp:RadioButtonList ID="rdobtnlstQ12_4" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" Visible="False" CellPadding="5">
                                          <asp:ListItem Value="1">Often</asp:ListItem>
                                          <asp:ListItem Value="2">Sometimes</asp:ListItem>
                                          <asp:ListItem Value="3">Rarely</asp:ListItem>
                                          <asp:ListItem Value="4">Never</asp:ListItem>
                                      </asp:RadioButtonList>
                                      <asp:Label ID="lblcommentQ12_4" runat="server" ForeColor="Red" Text="Required" Visible="False"></asp:Label>
                                  </td>
                                </tr>
                                <tr>
                                    <td class="HVSurvey">
                                        <ol type="A" start="5">
                                            <li>
                                                <asp:Label ID="lblQ12_5" runat="server" Visible="False"></asp:Label>
                                                &nbsp;<asp:TextBox ID="txtq12_5_specify" runat="server" Visible="False"></asp:TextBox>
                                                <asp:Label ID="lblcommentQ12_5" runat="server" ForeColor="Red" Text="Required" Visible="False"></asp:Label>
                                            </li>
                                        </ol>
                                        </th>
                                  <td class="HVSurvey">
                                      <asp:RadioButtonList ID="rdobtnlstQ12_5" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" Visible="False" CellPadding="5">
                                          <asp:ListItem Value="1">Often</asp:ListItem>
                                          <asp:ListItem Value="2">Sometimes</asp:ListItem>
                                          <asp:ListItem Value="3">Rarely</asp:ListItem>
                                          <asp:ListItem Value="4">Never</asp:ListItem>
                                      </asp:RadioButtonList>
                                      <asp:Label ID="lblcommentQ12_5_1" runat="server" ForeColor="Red" Text="Required" Visible="False"></asp:Label>
                                  </td>
                                </tr>
                            </table>
                        </li>
                    </ol>
                </ContentTemplate>
            </asp:UpdatePanel>
            <table>
                <tr>
                    <td>
                        <asp:ImageButton ID="imgV3B" runat="server" Height="50px" ImageUrl="~/Button/media_seek_backward.png" OnClick="imgV3B_Click" OnClientClick="window.onbeforeunload=null;" />
                    </td>
                    <td>
                        <asp:ImageButton ID="imgV3F" runat="server" Height="50px" ImageUrl="~/Button/media_seek_forward.png" OnClick="imgV3F_Click" ValidationGroup="Val1" OnClientClick="window.onbeforeunload=null;" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View4" runat="server">
            <table class="progressbar">
                <tr>
                    <td class="progressbar_4"></td>
                    <td>progressing...</td>
                </tr>
            </table>
            In completing the following section regarding the leaders of your program, leaders are those who have direct oversight responsibility for your program and its implementation. Depending on your program design, this could include the positions of executive director, program manager, and supervisors. For this section, indicate your response by thinking of your leadership staff as a whole.
            <h3>COMMUNICATION AND DECISION MAKING</h3>
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataRepeater1">
                <HeaderTemplate>
                    <table class="HVSurvey">
                        <tr>
                            <th class="HVSurvey">Statement</th>
                            <th class="HVSurvey"></th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td class="HVSurvey">
                            <ol start="<%# Container.ItemIndex + 13 %>">
                                <li>
                                    <asp:Label runat="server" Text='<%# Eval("Question") %>'></asp:Label>
                                </li>
                            </ol>
                        </td>
                        <td class="HVSurvey">
                            <asp:RadioButtonList ID="rdobtnlstQ13" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                <asp:ListItem Value="1">Strongly Disagree</asp:ListItem>
                                <asp:ListItem Value="2">Disagree</asp:ListItem>
                                <asp:ListItem Value="3">Neutral</asp:ListItem>
                                <asp:ListItem Value="4">Agree</asp:ListItem>
                                <asp:ListItem Value="5">Strongly Agree</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required" ControlToValidate="rdobtnlstQ13" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
            <asp:SqlDataSource runat="server" ID="SqlDataRepeater1" ConnectionString='<%$ ConnectionStrings:ISBEPI_DEV %>' SelectCommand="SELECT * FROM [HomeVisitorSurveyQuestions] WHERE Question_ID BETWEEN 'Q13' AND 'Q20' AND Question_ID <>'Q2'"></asp:SqlDataSource>
            <table>
                <tr>
                    <td>
                        <asp:ImageButton ID="imgbtnV4B" runat="server" Height="50px" ImageUrl="~/Button/media_seek_backward.png" OnClick="imgbtnV4B_Click" OnClientClick="window.onbeforeunload=null;" />
                    </td>
                    <td>
                        <asp:ImageButton ID="imgbtnV4F" runat="server" Height="50px" ImageUrl="~/Button/media_seek_forward.png" OnClick="imgbtnV4F_Click" ValidationGroup="Val1" OnClientClick="window.onbeforeunload=null;" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View5" runat="server">
            <table class="progressbar">
                <tr>
                    <td class="progressbar_5"></td>
                    <td>progressing...</td>
                </tr>
            </table>
            <h3>SUPPORTIVE WORK ENVIRONMENT – WAGES AND BENEFITS</h3>
            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataRepeater2">
                <HeaderTemplate>
                    <table class="HVSurvey">
                        <tr>
                            <th class="HVSurvey">Statement</th>
                            <th class="HVSurvey"></th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td class="HVSurvey">
                            <ol start="<%# Container.ItemIndex + 21 %>">
                                <li>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Question") %>'></asp:Label>
                                </li>
                            </ol>
                        </td>
                        <td class="HVSurvey">
                            <asp:RadioButtonList ID="rdobtnlstQ21" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                <asp:ListItem Value="1">Strongly Disagree</asp:ListItem>
                                <asp:ListItem Value="2">Disagree</asp:ListItem>
                                <asp:ListItem Value="3">Neutral</asp:ListItem>
                                <asp:ListItem Value="4">Agree</asp:ListItem>
                                <asp:ListItem Value="5">Strongly Agree</asp:ListItem>

                            </asp:RadioButtonList>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required" ControlToValidate="rdobtnlstQ21" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>

            <asp:SqlDataSource runat="server" ID="SqlDataRepeater2" ConnectionString='<%$ ConnectionStrings:ISBEPI_DEV %>' SelectCommand="SELECT * FROM [HomeVisitorSurveyQuestions] WHERE Question_ID BETWEEN 'Q21' AND 'Q24'"></asp:SqlDataSource>
            <table>
                <tr>
                    <td>
                        <asp:ImageButton ID="imgbtnV5B" runat="server" Height="50px" ImageUrl="~/Button/media_seek_backward.png" OnClick="imgbtnV5B_Click" OnClientClick="window.onbeforeunload=null;" />
                    </td>
                    <td>
                        <asp:ImageButton ID="imgbtnV5F" runat="server" Height="50px" ImageUrl="~/Button/media_seek_forward.png" OnClick="imgbtnV5F_Click" ValidationGroup="Val1" OnClientClick="window.onbeforeunload=null;" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View6" runat="server">
            <table class="progressbar">
                <tr>
                    <td class="progressbar_6"></td>
                    <td>progressing...</td>
                </tr>
            </table>
            <h3>SUPPORTIVE WORK ENVIRONMENT – STAFF MORALE AND SATISFACTION</h3>
            <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataRepeater3">
                <HeaderTemplate>
                    <table class="HVSurvey">
                        <tr>
                            <th class="HVSurvey">Statement</th>
                            <th class="HVSurvey"></th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td class="HVSurvey">
                            <ol start="<%# Container.ItemIndex + 25 %>">
                                <li>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Question") %>'></asp:Label>
                                </li>
                            </ol>
                        </td>
                        <td class="HVSurvey">
                            <asp:RadioButtonList ID="rdobtnlstQ25" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                <asp:ListItem Value="1">Strongly Disagree</asp:ListItem>
                                <asp:ListItem Value="2">Disagree</asp:ListItem>
                                <asp:ListItem Value="3">Neutral</asp:ListItem>
                                <asp:ListItem Value="4">Agree</asp:ListItem>
                                <asp:ListItem Value="5">Strongly Agree</asp:ListItem>

                            </asp:RadioButtonList>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required" ControlToValidate="rdobtnlstQ25" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>

            <asp:SqlDataSource runat="server" ID="SqlDataRepeater3" ConnectionString='<%$ ConnectionStrings:ISBEPI_DEV %>' SelectCommand="SELECT * FROM [HomeVisitorSurveyQuestions] WHERE Question_ID BETWEEN 'Q25' AND 'Q28'"></asp:SqlDataSource>
            <table>
                <tr>
                    <td>
                        <asp:ImageButton ID="imgbtnV6B" runat="server" Height="50px" ImageUrl="~/Button/media_seek_backward.png" OnClick="imgbtnV6B_Click" OnClientClick="window.onbeforeunload=null;" />
                    </td>
                    <td>
                        <asp:ImageButton ID="imgbtnV6F" runat="server" Height="50px" ImageUrl="~/Button/media_seek_forward.png" OnClick="imgbtnV6F_Click" ValidationGroup="Val1" OnClientClick="window.onbeforeunload=null;" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View7" runat="server">
            <table class="progressbar">
                <tr>
                    <td class="progressbar_7"></td>
                    <td>progressing...</td>
                </tr>
            </table>
            <h3>SUPPORTIVE WORK ENVIRONMENT – MATERIALS AND PHYSICAL ENVIRONMENT SATISFACTION</h3>

            <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataRepeater4">
                <HeaderTemplate>
                    <table class="HVSurvey">
                        <tr>
                            <th class="HVSurvey">Statement</th>
                            <th class="HVSurvey"></th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td class="HVSurvey">
                            <ol start="<%# Container.ItemIndex + 29 %>">
                                <li>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Question") %>'></asp:Label>
                                </li>
                            </ol>
                        </td>
                        <td class="HVSurvey">
                            <asp:RadioButtonList ID="rdobtnlstQ29" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                <asp:ListItem Value="1">Strongly Disagree</asp:ListItem>
                                <asp:ListItem Value="2">Disagree</asp:ListItem>
                                <asp:ListItem Value="3">Neutral</asp:ListItem>
                                <asp:ListItem Value="4">Agree</asp:ListItem>
                                <asp:ListItem Value="5">Strongly Agree</asp:ListItem>

                            </asp:RadioButtonList>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required" ControlToValidate="rdobtnlstQ29" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>

            <asp:SqlDataSource runat="server" ID="SqlDataRepeater4" ConnectionString='<%$ ConnectionStrings:ISBEPI_DEV %>' SelectCommand="SELECT * FROM [HomeVisitorSurveyQuestions] WHERE Question_ID BETWEEN 'Q29' AND 'Q32' AND Question_ID  <>'Q3' AND Question_ID  <>'Q3_Y'"></asp:SqlDataSource>
            <table>
                <tr>
                    <td>
                        <asp:ImageButton ID="imgbtnV7B" runat="server" Height="50px" ImageUrl="~/Button/media_seek_backward.png" OnClick="imgbtnV7B_Click" OnClientClick="window.onbeforeunload=null;" />
                    </td>
                    <td>
                        <asp:ImageButton ID="imgbtnV7F" runat="server" Height="50px" ImageUrl="~/Button/media_seek_forward.png" OnClick="imgbtnV7F_Click" ValidationGroup="Val1" OnClientClick="window.onbeforeunload=null;" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View8" runat="server">
            <table class="progressbar">
                <tr>
                    <td class="progressbar_8"></td>
                    <td>progressing...</td>
                </tr>
            </table>
            <h3>SUPPORTIVE WORK ENVIRONMENT – TECHNICAL SUPPORT</h3>

            <asp:Repeater ID="Repeater5" runat="server" DataSourceID="SqlDataRepeater5">
                <HeaderTemplate>
                    <table class="HVSurvey">
                        <tr>
                            <th class="HVSurvey">Statement</th>
                            <th class="HVSurvey"></th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td class="HVSurvey">
                            <ol start="<%# Container.ItemIndex + 33 %>">
                                <li>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Question") %>'></asp:Label>
                                </li>
                            </ol>
                        </td>
                        <td class="HVSurvey">
                            <asp:RadioButtonList ID="rdobtnlstQ33" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                <asp:ListItem Value="1">Strongly Disagree</asp:ListItem>
                                <asp:ListItem Value="2">Disagree</asp:ListItem>
                                <asp:ListItem Value="3">Neutral</asp:ListItem>
                                <asp:ListItem Value="4">Agree</asp:ListItem>
                                <asp:ListItem Value="5">Strongly Agree</asp:ListItem>

                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required" ControlToValidate="rdobtnlstQ33" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>

            <asp:SqlDataSource runat="server" ID="SqlDataRepeater5" ConnectionString='<%$ ConnectionStrings:ISBEPI_DEV %>' SelectCommand="SELECT * FROM [HomeVisitorSurveyQuestions] WHERE Question_ID BETWEEN 'Q33' AND 'Q36'"></asp:SqlDataSource>
            <table>
                <tr>
                    <td>
                        <asp:ImageButton ID="imgbtnV8B" runat="server" Height="50px" ImageUrl="~/Button/media_seek_backward.png" OnClick="imgbtnV8B_Click" OnClientClick="window.onbeforeunload=null;" />
                    </td>
                    <td>
                        <asp:ImageButton ID="imgbtnV8F" runat="server" Height="50px" ImageUrl="~/Button/media_seek_forward.png" OnClick="imgbtnV8F_Click" ValidationGroup="Val1" OnClientClick="window.onbeforeunload=null;" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View9" runat="server">
            <table class="progressbar">
                <tr>
                    <td class="progressbar_9"></td>
                    <td>progressing...</td>
                </tr>
            </table>
            <h3>REFLECTIVE SUPERVISION</h3>

            <asp:Repeater ID="Repeater6" runat="server" DataSourceID="SqlDataRepeater6">
                <HeaderTemplate>
                    <table class="HVSurvey">
                        <tr>
                            <th class="HVSurvey">Statement</th>
                            <th class="HVSurvey"></th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td class="HVSurvey">
                            <ol start="<%# Container.ItemIndex + 37 %>">
                                <li>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Question") %>'></asp:Label>
                                </li>
                            </ol>
                        </td>
                        <td class="HVSurvey">
                            <asp:RadioButtonList ID="rdobtnlstQ37" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                <asp:ListItem Value="1">Strongly Disagree</asp:ListItem>
                                <asp:ListItem Value="2">Disagree</asp:ListItem>
                                <asp:ListItem Value="3">Neutral</asp:ListItem>
                                <asp:ListItem Value="4">Agree</asp:ListItem>
                                <asp:ListItem Value="5">Strongly Agree</asp:ListItem>

                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required" ControlToValidate="rdobtnlstQ37" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
            <asp:SqlDataSource runat="server" ID="SqlDataRepeater6" ConnectionString='<%$ ConnectionStrings:ISBEPI_DEV %>' SelectCommand="SELECT * FROM [HomeVisitorSurveyQuestions] WHERE Question_ID BETWEEN 'Q37' AND 'Q56' AND Question_ID <>'Q4' AND Question_ID <>'Q5'"></asp:SqlDataSource>
            <table>
                <tr>
                    <td>
                        <asp:ImageButton ID="imgbtnV9B" runat="server" Height="50px" ImageUrl="~/Button/media_seek_backward.png" OnClick="imgbtnV9B_Click" OnClientClick="window.onbeforeunload=null;" />
                    </td>
                    <td>
                        <asp:ImageButton ID="imgbtnV9F" runat="server" Height="50px" ImageUrl="~/Button/media_seek_forward.png" OnClick="imgbtnV9F_Click" ValidationGroup="Val1" OnClientClick="window.onbeforeunload=null;" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View10" runat="server">
            <table class="progressbar">
                <tr>
                    <td class="progressbar_10"></td>
                    <td>progressing...</td>
                </tr>
            </table>
            <h3>SUPERVISON CONTENT.</h3>
            <h5>How much of the supervision you receive is focused on your work in these areas? </h5>
            <asp:Repeater ID="Repeater7" runat="server" DataSourceID="SqlDataRepeater7">
                <HeaderTemplate>
                    <table class="HVSurvey">
                        <tr>
                            <th class="HVSurvey">Area</th>
                            <td class="HVSurvey">
                                <ul>
                                    <li>Not at All = 1</li>
                                    <li>Sometimes = 2</li>
                                    <li>Regularly-(at least half my supervision sessions) = 3</li>
                                    <li>All the time-(a focus of most of my supervision sessions) = 4</li>
                                </ul>
                            </td>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td class="HVSurvey">
                            <ol start="<%# Container.ItemIndex + 57 %>">
                                <li>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Question") %>'></asp:Label>
                                </li>
                            </ol>
                        </td>
                        <td class="HVSurvey" colspan="4">
                            <asp:RadioButtonList ID="rdobtnlstQ57" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                <asp:ListItem Value="1">1</asp:ListItem>
                                <asp:ListItem Value="2">2</asp:ListItem>
                                <asp:ListItem Value="3">3</asp:ListItem>
                                <asp:ListItem Value="4">4</asp:ListItem>
                            </asp:RadioButtonList>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required" ControlToValidate="rdobtnlstQ57" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
            <asp:SqlDataSource runat="server" ID="SqlDataRepeater7" ConnectionString='<%$ ConnectionStrings:ISBEPI_DEV %>' SelectCommand="SELECT * FROM [HomeVisitorSurveyQuestions] WHERE Question_ID BETWEEN 'Q57' AND 'Q59'"></asp:SqlDataSource>
            <h5>How often does your supervisor actually <span class="auto-style1">observe</span> you in practice and provide guidance in these areas?</h5>

            <asp:Repeater ID="Repeater8" runat="server" DataSourceID="SqlDataRepeater8">
                <HeaderTemplate>
                    <table class="HVSurvey">
                        <tr>
                            <th class="HVSurvey">Area</th>
                            <td class="HVSurvey">
                                <ul>
                                    <li>Never = 1</li>
                                    <li>Rarely or less than once a year = 2</li>
                                    <li>Annually, or about once a year = 3</li>
                                    <li>More than once a year = 4</li>
                                </ul>
                            </td>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td class="HVSurvey">
                            <ol start="<%# Container.ItemIndex + 60 %>">
                                <li>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Question") %>'></asp:Label>
                                </li>
                            </ol>
                        </td>
                        <td class="HVSurvey" colspan="4">
                            <asp:RadioButtonList ID="rdobtnlstQ60" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                <asp:ListItem Value="1">1</asp:ListItem>
                                <asp:ListItem Value="2">2</asp:ListItem>
                                <asp:ListItem Value="3">3</asp:ListItem>
                                <asp:ListItem Value="4">4</asp:ListItem>
                            </asp:RadioButtonList>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required" ControlToValidate="rdobtnlstQ60" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
            <asp:SqlDataSource runat="server" ID="SqlDataRepeater8" ConnectionString='<%$ ConnectionStrings:ISBEPI_DEV %>' SelectCommand="SELECT * FROM [HomeVisitorSurveyQuestions] WHERE Question_ID BETWEEN 'Q60' AND 'Q62'"></asp:SqlDataSource>
            <table>
                <tr>
                    <td>
                        <asp:ImageButton ID="imgbtnV10B" runat="server" Height="50px" ImageUrl="~/Button/media_seek_backward.png" OnClick="imgbtnV10B_Click" OnClientClick="window.onbeforeunload=null;" />
                    </td>
                    <td>
                        <asp:ImageButton ID="imgbtnV10F" runat="server" Height="50px" ImageUrl="~/Button/media_seek_forward.png" OnClick="imgbtnV10F_Click" ValidationGroup="Val1" OnClientClick="window.onbeforeunload=null;" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View11" runat="server">
            <table class="progressbar">
                <tr>
                    <td class="progressbar_11"></td>
                    <td>progressing...</td>
                </tr>
            </table>
            <h3>FAMILY INVOLVEMENT</h3>

            <ol start="63">
                <li>
                    <asp:Label ID="lblQ63" runat="server"></asp:Label>
                    &nbsp;<asp:TextBox ID="txtQ63" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator57" runat="server" ControlToValidate="txtQ63" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtQ63" ErrorMessage="Not Valid - Should be number and value between 0-100" MaximumValue="100" MinimumValue="0" SetFocusOnError="True" ValidationGroup="Val1" Type="Integer"></asp:RangeValidator>
                </li>
            </ol>
            <table>
                <tr>
                    <td>
                        <asp:ImageButton ID="imgbtnV11B" runat="server" Height="50px" ImageUrl="~/Button/media_seek_backward.png" OnClick="imgbtnV11B_Click" OnClientClick="window.onbeforeunload=null;" />
                    </td>
                    <td>
                        <asp:ImageButton ID="imgbtnV11F" runat="server" Height="50px" ImageUrl="~/Button/media_seek_forward.png" OnClick="imgbtnV11F_Click" ValidationGroup="Val1" OnClientClick="window.onbeforeunload=null;" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View12" runat="server">
            <table class="progressbar">
                <tr>
                    <td class="progressbar_15"></td>
                    <td></td>
                </tr>
            </table>
            <h3>PROFESSIONAL DEVELOPMENT</h3>

            <ol start="64">
                <li>
                    <asp:Label ID="lblQ64" runat="server"></asp:Label>&nbsp;
                                  <asp:CheckBoxList ID="CheckBoxList64" runat="server" DataSourceID="SqlDataSource9" DataTextField="Answers" DataValueField="Value">
                                  </asp:CheckBoxList>
                    <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [HomeVisitorSurveyAnswers] WHERE ([Question_ID] = @Question_ID)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="Q64" Name="Question_ID" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:TextBox ID="txt_q64" runat="server"></asp:TextBox>
                    <asp:Label ID="lblQ64Comment" runat="server" ForeColor="Red"></asp:Label>
                    <asp:Label ID="lblQ64Comment1" runat="server" ForeColor="Red"></asp:Label>
                </li>
                <li>
                    <asp:Label ID="lblQ65" runat="server"></asp:Label>
                    &nbsp;<asp:RadioButtonList ID="rdobtnlstQ65" runat="server" DataSourceID="SqlDataSource10" DataTextField="Answers" DataValueField="Value">
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator58" runat="server" ControlToValidate="rdobtnlstQ65" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [HomeVisitorSurveyAnswers] WHERE ([Question_ID] = @Question_ID)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="Q65" Name="Question_ID" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </li>
                <li>
                    <asp:Label ID="lblQ66" runat="server"></asp:Label>
                    <asp:RadioButtonList ID="rdobtnlstQ66" runat="server" DataSourceID="SqlDataSource11" DataTextField="Answers" DataValueField="Value">
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator59" runat="server" ControlToValidate="rdobtnlstQ66" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [HomeVisitorSurveyAnswers] WHERE ([Question_ID] = @Question_ID)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="Q66" Name="Question_ID" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </li>
                <li>
                    <asp:Label ID="lblQ67" runat="server"></asp:Label>
                    <asp:Repeater ID="Repeater9" runat="server" DataSourceID="SqlDataSourceRepeater9">
                        <HeaderTemplate>
                            <table class="HVSurvey">
                                <tr>
                                    <th class="HVSurvey">Area</th>
                                    <td class="HVSurvey">
                                        <ul type="disc">
                                            <li>Well prepared = 1</li>
                                            <li>Somewhat prepared = 2</li>
                                            <li>Not very prepared = 3</li>
                                            <li>Not at all prepared = 4</li>
                                        </ul>
                                    </td>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td class="HVSurvey">
                                    <ol start="<%# Container.ItemIndex + 1  %>" type="A">
                                        <li>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Question") %>'></asp:Label>
                                        </li>
                                    </ol>
                                </td>
                                <td class="HVSurvey">
                                    <asp:RadioButtonList ID="rdobtnlstQ67" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                        <asp:ListItem Value="1">1</asp:ListItem>
                                        <asp:ListItem Value="2">2</asp:ListItem>
                                        <asp:ListItem Value="3">3</asp:ListItem>
                                        <asp:ListItem Value="4">4</asp:ListItem>
                                    </asp:RadioButtonList>
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required" ControlToValidate="rdobtnlstQ67" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource runat="server" ID="SqlDataSourceRepeater9" ConnectionString='<%$ ConnectionStrings:ISBEPI_DEV %>' SelectCommand="SELECT * FROM [HomeVisitorSurveyQuestions] WHERE Question_ID BETWEEN 'Q67_A' AND 'Q67_E'"></asp:SqlDataSource>
                </li>
                <li>
                    <asp:Label ID="lblQ68" runat="server"></asp:Label>
                    <asp:Repeater ID="Repeater10" runat="server" DataSourceID="SqlDataSourceRepeater10">
                        <HeaderTemplate>
                            <table class="HVSurvey">
                                <tr>
                                    <th class="HVSurvey">Area</th>
                                    <td class="HVSurvey">
                                        <ul type="disc">
                                            <li>Well prepared = 1</li>
                                            <li>Somewhat prepared = 2</li>
                                            <li>Not very prepared = 3</li>
                                            <li>Not at all prepared = 4</li>
                                        </ul>
                                    </td>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td class="HVSurvey">
                                    <ol start="<%# Container.ItemIndex + 1  %>" type="A">
                                        <li>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Question") %>'></asp:Label>
                                        </li>
                                    </ol>
                                </td>
                                <td class="HVSurvey">
                                    <asp:RadioButtonList ID="rdobtnlstQ68" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                        <asp:ListItem Value="1">1</asp:ListItem>
                                        <asp:ListItem Value="2">2</asp:ListItem>
                                        <asp:ListItem Value="3">3</asp:ListItem>
                                        <asp:ListItem Value="4">4</asp:ListItem>
                                    </asp:RadioButtonList>
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required" ControlToValidate="rdobtnlstQ68" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource runat="server" ID="SqlDataSourceRepeater10" ConnectionString='<%$ ConnectionStrings:ISBEPI_DEV %>' SelectCommand="SELECT * FROM [HomeVisitorSurveyQuestions] WHERE Question_ID BETWEEN 'Q68_A' AND 'Q68_H'"></asp:SqlDataSource>
                </li>
            </ol>

            <table>
                <tr>
                    <td>
                        <asp:ImageButton ID="imgbtnV12B" runat="server" Height="50px" ImageUrl="~/Button/media_seek_backward.png" OnClick="imgbtnV12B_Click" OnClientClick="window.onbeforeunload=null;" />
                    </td>
                    <td>
                        <asp:Button ID="btnSubmit" runat="server" BackColor="#F3F3F3" BorderStyle="Solid" BorderWidth="5px" Font-Bold="True" Font-Italic="False" Font-Size="X-Large" Font-Strikeout="False" Font-Underline="False" ForeColor="Black" Height="50px" Text="Submit" Width="100px" OnClick="btnSubmit_Click" ValidationGroup="Val1" OnClientClick="window.onbeforeunload=null;" />
                    </td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
</asp:Content>
