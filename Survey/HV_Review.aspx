<%@ Page Title="" Language="C#" MasterPageFile="~/Survey/SurveyMaster.Master" AutoEventWireup="true" CodeBehind="HV_Review.aspx.cs" Inherits="HVP.Survey.HV_Review" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        window.onbeforeunload = function (e) {
            var e = e || window.event;
            if (e) e.returnValue = 'All the work will be lost, Do you want to continue or Leave?.';//for IE & Firefox
            return 'All the work will be lost, Do you want to continue? or Leave?.';// for Safari and Chrome
        };

    </script>

    <h2>Review Survey</h2>
    <p class="review">
        Your Survey is almost complete. Please review the answers below and click 'Submit' if all the information is correct.
    <br />
        You may use the 'Edit' button to make changes to your survey if necessary.
    </p>
    <ol>
        <li>
            <label>How is your position funded?</label>
            <asp:RadioButtonList ID="rdobtnlstQ_4_MIECHV" runat="server" Enabled="False">
                <asp:ListItem Value="1">ISBE</asp:ListItem>
                <asp:ListItem Value="2">MIECHV</asp:ListItem>
                <asp:ListItem Value="3">Both</asp:ListItem>
            </asp:RadioButtonList>            
        </li>
    </ol>
    <h3>DEMOGRAPHICS</h3>
   <ol start="2">
        <li>
            <asp:Label ID="lblQ1" runat="server"></asp:Label>
            &nbsp;<asp:HiddenField ID="hfSiteID" runat="server" />
            <asp:HiddenField ID="hfSchd_ID" runat="server" />
            <asp:RadioButtonList ID="rdobtnlstQ1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Answers" DataValueField="Value" Height="29px" Enabled="False" BorderStyle="None">
            </asp:RadioButtonList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT Answer_ID, Question_ID, Answers, Value FROM HomeVisitorSurveyAnswers WHERE (Question_ID = @Question_ID)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="Q1" Name="Question_ID" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </li>
        <li>
            <asp:Label ID="lblQ2" runat="server"></asp:Label>
            &nbsp;<asp:RadioButtonList ID="rdobtnlstQ2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Answers" DataValueField="Value" Enabled="False" BorderStyle="None">
            </asp:RadioButtonList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT Answer_ID, Question_ID, Answers, Value FROM HomeVisitorSurveyAnswers WHERE (Question_ID = @Question_ID)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="Q2" Name="Question_ID" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:TextBox ID="txtRace" runat="server" BorderStyle="None" ReadOnly="True"></asp:TextBox>
        </li>
    </ol>
    <ol start="4">
        <li>
            <asp:Label ID="lblQ3_Yes_or_No" runat="server"></asp:Label>
            <asp:RadioButtonList ID="rdobtnlst_Yes_or_No" runat="server" RepeatDirection="Horizontal" Enabled="False" BorderStyle="None">
                <asp:ListItem Value="1">Yes</asp:ListItem>
                <asp:ListItem Value="0">No</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <asp:Label ID="lblQ3" runat="server" Visible="False"></asp:Label>
            &nbsp;<asp:CheckBoxList ID="chkLanguageQ3" runat="server" DataSourceID="SqlDataSource3" DataTextField="Answers" DataValueField="Value" Visible="False" Enabled="False" BorderStyle="None">
            </asp:CheckBoxList>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [HomeVisitorSurveyAnswers] WHERE ([Question_ID] = @Question_ID)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="Q3" Name="Question_ID" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:TextBox ID="txtLanguage" runat="server" Visible="False" BorderStyle="None" ReadOnly="True"></asp:TextBox>
        </li>
    </ol>
    <h3>EDUCATION</h3>

    <ol start="5">
        <li>
            <ol type="A" start="1">
                <li>
                    <asp:Label ID="lblQ4" runat="server"></asp:Label>
                    &nbsp;<asp:RadioButtonList ID="rdobtnlstQ4" runat="server" DataSourceID="SqlDataSource4" DataTextField="Answers" DataValueField="Value" AutoPostBack="True" onchange="window.onbeforeunload=null;" Enabled="False" Height="29px" BorderStyle="None">
                    </asp:RadioButtonList>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [HomeVisitorSurveyAnswers] WHERE ([Question_ID] = @Question_ID)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="Q4" Name="Question_ID" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </li>
            </ol>
        </li>

        <li runat="server" id="Q5_li" visible="false" style="list-style: none">
            <ol type="A" start="2">
                <li>
                    <asp:Label ID="lblQ5" runat="server" Visible="False"></asp:Label>
                    &nbsp;<asp:RadioButtonList ID="rdobtnlstQ5" runat="server" DataSourceID="SqlDataSource5" DataTextField="Answers" DataValueField="Value" Visible="False" Enabled="False" BorderStyle="None">
                    </asp:RadioButtonList>
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [HomeVisitorSurveyAnswers] WHERE ([Question_ID] = @Question_ID)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="Q5" Name="Question_ID" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:TextBox ID="txtBestDescribesEducation" runat="server" Visible="False" BorderStyle="None" ReadOnly="True"></asp:TextBox>
                </li>
            </ol>
        </li>
    </ol>

    <h3>PROFESSIONAL EXPERIENCE</h3>
    <ol start="6">
        <li>
            <asp:Label ID="lblQ6" runat="server"></asp:Label>
            <ol class="d">
                <li>
                    <asp:Label ID="lblQ6A" runat="server"></asp:Label>
                    &nbsp;<asp:RadioButtonList ID="rdobtnlstQ6_A" runat="server" DataSourceID="SqlDataSource6" DataTextField="Answers" DataValueField="Value" BorderStyle="None" Enabled="False">
                    </asp:RadioButtonList>
                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [HomeVisitorSurveyAnswers] WHERE ([Question_ID] = @Question_ID)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="Q6A" Name="Question_ID" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </li>
                <li>
                    <asp:Label ID="lblQ6B" runat="server"></asp:Label>
                    &nbsp;<asp:RadioButtonList ID="rdobtnlstQ6_B" runat="server" DataSourceID="SqlDataSource7" DataTextField="Answers" DataValueField="Value" BorderStyle="None" Enabled="False">
                    </asp:RadioButtonList>
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
            &nbsp;<asp:TextBox ID="txtQ7" runat="server" BorderStyle="None" ReadOnly="True"></asp:TextBox>
        </li>
        <li>
            <asp:Label ID="lblQ8" runat="server"></asp:Label>
            <asp:TextBox ID="txtQ8" runat="server" BorderStyle="None" ReadOnly="True"></asp:TextBox>
        </li>
        <li>
            <asp:Label ID="lblQ9" runat="server"></asp:Label>
            &nbsp;<asp:TextBox ID="txtQ9" runat="server" BorderStyle="None" ReadOnly="True"></asp:TextBox>
        </li>
        <li>
            <asp:Label ID="lblQ10" runat="server"></asp:Label>
            <ol class="d">
                <asp:Label ID="lblQ10_comment" runat="server" Text="Please enter 0 if you have none." ForeColor="Green"></asp:Label>
                <li>
                    <asp:TextBox ID="txt10_1" runat="server" onkeyup="sumQ10();" BorderStyle="None" ReadOnly="True"></asp:TextBox>Prenatal­-3 months</li>
                <li>
                    <asp:TextBox ID="txt10_2" runat="server" onkeyup="sumQ10();" BorderStyle="None" ReadOnly="True"></asp:TextBox>4­-12 months</li>
                <li>
                    <asp:TextBox ID="txt10_3" runat="server" onkeyup="sumQ10();" BorderStyle="None" ReadOnly="True"></asp:TextBox>13-24 months</li>
                <li>
                    <asp:TextBox ID="txt10_4" runat="server" onkeyup="sumQ10();" BorderStyle="None" ReadOnly="True"></asp:TextBox>25-­36 months</li>
                <li>
                    <asp:TextBox ID="txt10_5" runat="server" onkeyup="sumQ10();" BorderStyle="None" ReadOnly="True"></asp:TextBox>Older than 36 months</li>
            </ol>
            <br />
            Total:<asp:TextBox ID="txtQ10_total" runat="server" ReadOnly="True" BorderStyle="None"></asp:TextBox>
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

        <li>
            <asp:Label ID="lblQ11" runat="server"></asp:Label>
            &nbsp;<ol class="d">
                <asp:Label ID="lblQ11_comment" runat="server" Text="Please enter 0 if you have none." ForeColor="Green"></asp:Label>
                <li>
                    <asp:TextBox ID="txt11_1" runat="server" onkeyup="sumQ11();" BorderStyle="None" ReadOnly="True"></asp:TextBox>White, not of Hispanic origin&nbsp;&nbsp;</li>
                <li>
                    <asp:TextBox ID="txt11_2" runat="server" onkeyup="sumQ11();" BorderStyle="None" ReadOnly="True"></asp:TextBox>Black, not of Hispanic origin 
                </li>
                <li>
                    <asp:TextBox ID="txt11_3" runat="server" onkeyup="sumQ11();" BorderStyle="None" ReadOnly="True"></asp:TextBox>Hispanic
                </li>
                <li>
                    <asp:TextBox ID="txt11_4" runat="server" onkeyup="sumQ11();" BorderStyle="None" ReadOnly="True"></asp:TextBox>Asian or Pacific Islander
                </li>
                <li>
                    <asp:TextBox ID="txt11_5" runat="server" onkeyup="sumQ11();" BorderStyle="None" ReadOnly="True"></asp:TextBox>American Indian or Alaskan Native
                </li>
                <li>
                    <asp:TextBox ID="txt11_6" runat="server" onkeyup="sumQ11();" BorderStyle="None" ReadOnly="True"></asp:TextBox>Other/Multiracial
                </li>
                <li>
                    <asp:TextBox ID="txt11_7" runat="server" onkeyup="sumQ11();" BorderStyle="None" ReadOnly="True"></asp:TextBox>Unknown
                </li>
            </ol>
            <br />
            Total:<asp:TextBox ID="txt11_Total" runat="server" ReadOnly="True" BorderStyle="None"></asp:TextBox>
        </li>
    </ol>


    <ol start="12">
        <li>
            <ol type="A" start="1">
                <li>
                    <asp:Label ID="lblQ12" runat="server"></asp:Label>
                    &nbsp;<asp:TextBox ID="txtQ12" runat="server" AutoPostBack="True" onchange="window.onbeforeunload=null;" BorderStyle="None" ReadOnly="True"></asp:TextBox>
                </li>
            </ol>
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
                    </td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ12_1" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" Visible="False" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Often</asp:ListItem>
                            <asp:ListItem Value="2">Sometimes</asp:ListItem>
                            <asp:ListItem Value="3">Rarely</asp:ListItem>
                            <asp:ListItem Value="4">Never</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <ol type="A" start="2">
                            <li>
                                <asp:Label ID="lblQ12_2" runat="server" Visible="False"></asp:Label>
                            </li>
                        </ol>
                    </td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ12_2" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" Visible="False" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Often</asp:ListItem>
                            <asp:ListItem Value="2">Sometimes</asp:ListItem>
                            <asp:ListItem Value="3">Rarely</asp:ListItem>
                            <asp:ListItem Value="4">Never</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <ol type="A" start="3">
                            <li>
                                <asp:Label ID="lblQ12_3" runat="server" Visible="False"></asp:Label>
                            </li>
                        </ol>
                    </td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ12_3" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" Visible="False" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Often</asp:ListItem>
                            <asp:ListItem Value="2">Sometimes</asp:ListItem>
                            <asp:ListItem Value="3">Rarely</asp:ListItem>
                            <asp:ListItem Value="4">Never</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <ol type="A" start="4">
                            <li>
                                <asp:Label ID="lblQ12_4" runat="server" Visible="False"></asp:Label>
                            </li>
                        </ol>
                    </td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ12_4" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" Visible="False" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Often</asp:ListItem>
                            <asp:ListItem Value="2">Sometimes</asp:ListItem>
                            <asp:ListItem Value="3">Rarely</asp:ListItem>
                            <asp:ListItem Value="4">Never</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <ol type="A" start="5">
                            <li>
                                <asp:Label ID="lblQ12_5" runat="server" Visible="False"></asp:Label>
                                &nbsp;<asp:TextBox ID="txtq12_5_specify" runat="server" Visible="False" Enabled="False"></asp:TextBox>
                            </li>
                        </ol>
                    </td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ12_5" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" Visible="False" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Often</asp:ListItem>
                            <asp:ListItem Value="2">Sometimes</asp:ListItem>
                            <asp:ListItem Value="3">Rarely</asp:ListItem>
                            <asp:ListItem Value="4">Never</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
            </table>
        </li>
    </ol>
    <h3>COMMUNICATION AND DECISION MAKING</h3>
    <p>In completing the following section for the leaders of your program, leaders are those who have direct oversight responsibility for your program and its implementation. Depending on your program design, this could include the positions of executive director, program manager, and supervisors. For this section, indicate your response by thinking of your leadership staff as a whole.</p>
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
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Question") %>'></asp:Label>
                        </li>
                    </ol>
                </td>
                <td class="HVSurvey">
                    <asp:RadioButtonList ID="rdobtnlstQ13" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                        <asp:ListItem Value="1">Strongly Disagree</asp:ListItem>
                        <asp:ListItem Value="2">Disagree</asp:ListItem>
                        <asp:ListItem Value="3">Neutral</asp:ListItem>
                        <asp:ListItem Value="4">Agree</asp:ListItem>
                        <asp:ListItem Value="5">Strongly Agree</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
    <asp:SqlDataSource runat="server" ID="SqlDataRepeater1" ConnectionString='<%$ ConnectionStrings:ISBEPI_DEV %>' SelectCommand="SELECT * FROM [HomeVisitorSurveyQuestions] WHERE Question_ID BETWEEN 'Q13' AND 'Q20' AND Question_ID <>'Q2'"></asp:SqlDataSource>
    <h3>SUPPORTIVE WORK ENVIRONMENT – WAGES AND BENEFITS </h3>
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
                    <asp:RadioButtonList ID="rdobtnlstQ21" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                        <asp:ListItem Value="1">Strongly Disagree</asp:ListItem>
                        <asp:ListItem Value="2">Disagree</asp:ListItem>
                        <asp:ListItem Value="3">Neutral</asp:ListItem>
                        <asp:ListItem Value="4">Agree</asp:ListItem>
                        <asp:ListItem Value="5">Strongly Agree</asp:ListItem>

                    </asp:RadioButtonList>
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>

    <asp:SqlDataSource runat="server" ID="SqlDataRepeater2" ConnectionString='<%$ ConnectionStrings:ISBEPI_DEV %>' SelectCommand="SELECT * FROM [HomeVisitorSurveyQuestions] WHERE Question_ID BETWEEN 'Q21' AND 'Q24'"></asp:SqlDataSource>
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
                    <asp:RadioButtonList ID="rdobtnlstQ25" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                        <asp:ListItem Value="1">Strongly Disagree</asp:ListItem>
                        <asp:ListItem Value="2">Disagree</asp:ListItem>
                        <asp:ListItem Value="3">Neutral</asp:ListItem>
                        <asp:ListItem Value="4">Agree</asp:ListItem>
                        <asp:ListItem Value="5">Strongly Agree</asp:ListItem>

                    </asp:RadioButtonList>
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>

    <asp:SqlDataSource runat="server" ID="SqlDataRepeater3" ConnectionString='<%$ ConnectionStrings:ISBEPI_DEV %>' SelectCommand="SELECT * FROM [HomeVisitorSurveyQuestions] WHERE Question_ID BETWEEN 'Q25' AND 'Q28'"></asp:SqlDataSource>
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
                    <asp:RadioButtonList ID="rdobtnlstQ29" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                        <asp:ListItem Value="1">Strongly Disagree</asp:ListItem>
                        <asp:ListItem Value="2">Disagree</asp:ListItem>
                        <asp:ListItem Value="3">Neutral</asp:ListItem>
                        <asp:ListItem Value="4">Agree</asp:ListItem>
                        <asp:ListItem Value="5">Strongly Agree</asp:ListItem>

                    </asp:RadioButtonList>
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>

    <asp:SqlDataSource runat="server" ID="SqlDataRepeater4" ConnectionString='<%$ ConnectionStrings:ISBEPI_DEV %>' SelectCommand="SELECT * FROM [HomeVisitorSurveyQuestions] WHERE Question_ID BETWEEN 'Q29' AND 'Q32' AND Question_ID  <>'Q3' AND Question_ID  <>'Q3_Y'"></asp:SqlDataSource>
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
                    <asp:RadioButtonList ID="rdobtnlstQ33" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                        <asp:ListItem Value="1">Strongly Disagree</asp:ListItem>
                        <asp:ListItem Value="2">Disagree</asp:ListItem>
                        <asp:ListItem Value="3">Neutral</asp:ListItem>
                        <asp:ListItem Value="4">Agree</asp:ListItem>
                        <asp:ListItem Value="5">Strongly Agree</asp:ListItem>

                    </asp:RadioButtonList>
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>

    <asp:SqlDataSource runat="server" ID="SqlDataRepeater5" ConnectionString='<%$ ConnectionStrings:ISBEPI_DEV %>' SelectCommand="SELECT * FROM [HomeVisitorSurveyQuestions] WHERE Question_ID BETWEEN 'Q33' AND 'Q36'"></asp:SqlDataSource>
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
                    <asp:RadioButtonList ID="rdobtnlstQ37" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                        <asp:ListItem Value="1">Strongly Disagree</asp:ListItem>
                        <asp:ListItem Value="2">Disagree</asp:ListItem>
                        <asp:ListItem Value="3">Neutral</asp:ListItem>
                        <asp:ListItem Value="4">Agree</asp:ListItem>
                        <asp:ListItem Value="5">Strongly Agree</asp:ListItem>

                    </asp:RadioButtonList>
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
    <asp:SqlDataSource runat="server" ID="SqlDataRepeater6" ConnectionString='<%$ ConnectionStrings:ISBEPI_DEV %>' SelectCommand="SELECT * FROM [HomeVisitorSurveyQuestions] WHERE Question_ID BETWEEN 'Q37' AND 'Q56' AND Question_ID <>'Q4' AND Question_ID <>'Q5'"></asp:SqlDataSource>
    <h3>SUPERVISON CONTENT.</h3>
    <p><strong>How much of the supervision you receive is focused on your work in these areas?</strong></p>
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
                    <asp:RadioButtonList ID="rdobtnlstQ57" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
    <asp:SqlDataSource runat="server" ID="SqlDataRepeater7" ConnectionString='<%$ ConnectionStrings:ISBEPI_DEV %>' SelectCommand="SELECT * FROM [HomeVisitorSurveyQuestions] WHERE Question_ID BETWEEN 'Q57' AND 'Q59'"></asp:SqlDataSource>
    <p><strong>How often does your supervisor actually <u>observe</u> you in practice and provide guidance in these areas?</strong></p>

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
                    <asp:RadioButtonList ID="rdobtnlstQ60" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
    <asp:SqlDataSource runat="server" ID="SqlDataRepeater8" ConnectionString='<%$ ConnectionStrings:ISBEPI_DEV %>' SelectCommand="SELECT * FROM [HomeVisitorSurveyQuestions] WHERE Question_ID BETWEEN 'Q60' AND 'Q62'"></asp:SqlDataSource>
    <h3>FAMILY INVOLVEMENT</h3>

    <ol start="63">
        <li>
            <asp:Label ID="lblQ63" runat="server"></asp:Label>
            &nbsp;<asp:TextBox ID="txtQ63" runat="server" AutoCompleteType="Disabled" ReadOnly="True"></asp:TextBox>
        </li>
    </ol>
    <h3>PROFESSIONAL DEVELOPMENT</h3>

    <ol start="64">
        <li>
            <asp:Label ID="lblQ64" runat="server"></asp:Label>&nbsp;
                                  <asp:CheckBoxList ID="CheckBoxList64" runat="server" DataSourceID="SqlDataSource9" DataTextField="Answers" DataValueField="Value" Enabled="False">
                                  </asp:CheckBoxList>
            <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [HomeVisitorSurveyAnswers] WHERE ([Question_ID] = @Question_ID)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="Q64" Name="Question_ID" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:TextBox ID="txt_q64" runat="server" Enabled="True" ReadOnly="True"></asp:TextBox>
        </li>
        <li>
            <asp:Label ID="lblQ65" runat="server"></asp:Label>
            &nbsp;<asp:RadioButtonList ID="rdobtnlstQ65" runat="server" DataSourceID="SqlDataSource10" DataTextField="Answers" DataValueField="Value" Enabled="False">
            </asp:RadioButtonList>
            <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [HomeVisitorSurveyAnswers] WHERE ([Question_ID] = @Question_ID)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="Q65" Name="Question_ID" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </li>
        <li>
            <asp:Label ID="lblQ66" runat="server"></asp:Label>
            <asp:RadioButtonList ID="rdobtnlstQ66" runat="server" DataSourceID="SqlDataSource11" DataTextField="Answers" DataValueField="Value" Enabled="False">
            </asp:RadioButtonList>
            <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [HomeVisitorSurveyAnswers] WHERE ([Question_ID] = @Question_ID)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="Q66" Name="Question_ID" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </li>
        <li>
            <p>
                <asp:Label ID="lblQ67" runat="server"></asp:Label></p>
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
                            <asp:RadioButtonList ID="rdobtnlstQ67" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                                <asp:ListItem Value="1">1</asp:ListItem>
                                <asp:ListItem Value="2">2</asp:ListItem>
                                <asp:ListItem Value="3">3</asp:ListItem>
                                <asp:ListItem Value="4">4</asp:ListItem>
                            </asp:RadioButtonList>
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
            <p>
                <asp:Label ID="lblQ68" runat="server"></asp:Label></p>
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
                            <asp:RadioButtonList ID="rdobtnlstQ68" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                                <asp:ListItem Value="1">1</asp:ListItem>
                                <asp:ListItem Value="2">2</asp:ListItem>
                                <asp:ListItem Value="3">3</asp:ListItem>
                                <asp:ListItem Value="4">4</asp:ListItem>
                            </asp:RadioButtonList>
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
                <asp:Button ID="btnEdit" runat="server" BackColor="#F3F3F3" BorderStyle="Solid" BorderWidth="5px" Font-Bold="True" Font-Italic="False" Font-Size="X-Large" Font-Strikeout="False" Font-Underline="False" ForeColor="Black" Height="50px" Text="Edit" Width="100px" ValidationGroup="Val1" OnClientClick="window.onbeforeunload=null;" OnClick="btnEdit_Click" />
            </td>
            <td>
                <asp:Button ID="btnSubmit" runat="server" BackColor="#F3F3F3" BorderStyle="Solid" BorderWidth="5px" Font-Bold="True" Font-Italic="False" Font-Size="X-Large" Font-Strikeout="False" Font-Underline="False" ForeColor="Black" Height="50px" Text="Submit" Width="100px" ValidationGroup="Val1" OnClientClick="window.onbeforeunload=null;" OnClick="btnSubmit_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
