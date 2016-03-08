<%@ Page Title="" Language="C#" MasterPageFile="~/ProgramDirector/DirectorSurvey.Master" AutoEventWireup="true" CodeBehind="PD_Review.aspx.cs" Inherits="HVP.ProgramDirector.PD_Review" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Review Survey</h2>
    <p class="review">
        Your Survey is almost complete. Please review the answers below and click 'Submit' if all the information is correct.
    <br />
        You may use the 'Edit' button to make chnages to your survey if necessary.
    </p>
    <h3>DEMOGRAPHICS</h3>
    <h5>BASIC PROGRAM INFORMATION</h5>
    Please note: This survey distinguishes between your agency as a whole and your Prevention Initiative (PI) programming. While some questions ask about your agency, most ask specifically about your PI services and the home visitors providing PI services. Additionally, if your agency has more than one site, please answer these questions about the site that is the focus of the site visit.
             <ol>
                 <li>
                     <asp:HiddenField ID="hfSIteID" runat="server" />
                     <asp:HiddenField ID="hfStaffID" runat="server" />
                     <asp:HiddenField ID="hfSchdID" runat="server" />
                     <asp:Label ID="lblQ1" runat="server"></asp:Label><asp:TextBox ID="txtQ1" runat="server" Enabled="False"></asp:TextBox>
                 </li>
                 <li>
                     <asp:Label ID="lblQ2" runat="server"></asp:Label><asp:RadioButtonList ID="rdobtnlstQ2" runat="server" RepeatDirection="Horizontal" DataSourceID="SqlDataSource1" DataTextField="Answer" DataValueField="AnswerValue" Enabled="False">
                     </asp:RadioButtonList>
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT Question_ID, Answer, Answer_ID, AnswerValue FROM PROGRAM_DIRECTOR_SURVEY_ANSWERS WHERE (Question_ID = @Question_ID)">
                         <SelectParameters>
                             <asp:Parameter DefaultValue="Q2" Name="Question_ID" Type="String" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                 </li>
                 <li>
                     <asp:Label ID="lblQ3" runat="server"></asp:Label><asp:TextBox ID="txtQ3" runat="server" Enabled="False"></asp:TextBox>
                 </li>
                 <li>
                     <asp:Label ID="lblQ4" runat="server"></asp:Label>
                     <asp:RadioButtonList ID="rdobtnlstQ4" runat="server" DataSourceID="SqlDataSource2" DataTextField="Answer" DataValueField="AnswerValue" Enabled="False"></asp:RadioButtonList>
                     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [PROGRAM_DIRECTOR_SURVEY_ANSWERS] WHERE ([Question_ID] = @Question_ID)">
                         <SelectParameters>
                             <asp:Parameter DefaultValue="Q4" Name="Question_ID" Type="String" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                     <asp:TextBox ID="txtQ4Explain" runat="server" Enabled="False"></asp:TextBox>
                 </li>
             </ol>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <ol start="5">
                <li>
                    <asp:Label ID="lblQ5_Yes_or_No" runat="server"></asp:Label>
                    <asp:RadioButtonList ID="rdobtnlst_Yes_or_No" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" Enabled="False">
                        <asp:ListItem Value="1">Yes</asp:ListItem>
                        <asp:ListItem Value="0">No</asp:ListItem>
                    </asp:RadioButtonList>
                    <br />
                    <asp:Label ID="lblQ5" runat="server" Visible="False"></asp:Label>
                    <asp:CheckBoxList ID="chkbxlstQ5" runat="server" Visible="False" DataSourceID="SqlDataSource3" DataTextField="Answer" DataValueField="AnswerValue" Enabled="False"></asp:CheckBoxList>

                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [PROGRAM_DIRECTOR_SURVEY_ANSWERS] WHERE ([Question_ID] = @Question_ID)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="Q5" Name="Question_ID" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:TextBox ID="txtQ5Explain" runat="server" Visible="False" Enabled="False"></asp:TextBox>

                </li>
            </ol>
        </ContentTemplate>
    </asp:UpdatePanel>
    <ol start="6">
        <li>
            <asp:Label ID="lblQ6" runat="server"></asp:Label>
            <asp:RadioButtonList ID="rdobtnlstQ6" runat="server" DataSourceID="SqlDataSource4" DataTextField="Answer" DataValueField="AnswerValue" Enabled="False">
                <asp:ListItem Value="0">Public school district	</asp:ListItem>
                <asp:ListItem Value="1">Private school</asp:ListItem>
                <asp:ListItem Value="2">Community­based agency</asp:ListItem>
                <asp:ListItem Value="3">Private not for­profit child care organization</asp:ListItem>
                <asp:ListItem Value="4">Even Start organization</asp:ListItem>
                <asp:ListItem Value="5">Government agency</asp:ListItem>
                <asp:ListItem Value="6">Regional office of education</asp:ListItem>
                <asp:ListItem Value="7">Head Start of Early Head Start Agency</asp:ListItem>
                <asp:ListItem Value="8">Private for­profit child care organization</asp:ListItem>
                <asp:ListItem Value="9">Faith based organization</asp:ListItem>
                <asp:ListItem Value="10">Higher education institution</asp:ListItem>
                <asp:ListItem Value="11">Health care provider, hospital, or local health department</asp:ListItem>
                <asp:ListItem Value="12">Other (please specify)</asp:ListItem>
            </asp:RadioButtonList>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT PROGRAM_DIRECTOR_SURVEY_ANSWERS.* FROM PROGRAM_DIRECTOR_SURVEY_ANSWERS WHERE (Question_ID = @Question_ID)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="Q6" Name="Question_ID" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:TextBox ID="txtQ6Explain" runat="server" Enabled="False"></asp:TextBox>
        </li>
    </ol>
    <h5>FAMILY INFORMATION</h5>
    <ol start="7">

        <li>
            <asp:Label ID="lblQ7" runat="server"></asp:Label>
            <asp:TextBox ID="txtQ7" runat="server" Enabled="False"></asp:TextBox>
        </li>
        <script type="text/javascript">

            function sumQ8() {
                var txtQ8_1 = document.getElementById('<%=txtQ8_1.ClientID %>').value;
                var txtQ8_2 = document.getElementById('<%=txtQ8_2.ClientID %>').value;
                var txtQ8_3 = document.getElementById('<%=txtQ8_3.ClientID %>').value;
                var txtQ8_4 = document.getElementById('<%=txtQ8_4.ClientID %>').value;
                var txtQ8_5 = document.getElementById('<%=txtQ8_5.ClientID %>').value;
                var txtQ8_6 = document.getElementById('<%=txtQ8_6.ClientID %>').value;
                var txtQ8_7 = document.getElementById('<%=txtQ8_7.ClientID %>').value;
                var total_ = parseInt(txtQ8_1) + parseInt(txtQ8_2) + parseInt(txtQ8_3) + parseInt(txtQ8_4) + parseInt(txtQ8_5) + parseInt(txtQ8_6) + parseInt(txtQ8_7);

                if (isNaN(total_)) {
                    document.getElementById('<%=txtQ8_Total.ClientID%>').value = "Calculating ";
                        }
                        else {
                            document.getElementById('<%=txtQ8_Total.ClientID%>').value = total_;
                        }

                    }
                    function sumQ9() {
                        var txtQ9_1 = document.getElementById('<%=txtQ9_1.ClientID %>').value;
                        var txtQ9_2 = document.getElementById('<%=txtQ9_2.ClientID %>').value;
                        var txtQ9_3 = document.getElementById('<%=txtQ9_3.ClientID %>').value;
                        var txtQ9_4 = document.getElementById('<%=txtQ9_4.ClientID %>').value;
                        var txtQ9_5 = document.getElementById('<%=txtQ9_5.ClientID %>').value;
                        var txtQ9_6 = document.getElementById('<%=txtQ9_6.ClientID %>').value;
                        var total_ = parseInt(txtQ9_1) + parseInt(txtQ9_2) + parseInt(txtQ9_3) + parseInt(txtQ9_4) + parseInt(txtQ9_5) + parseInt(txtQ9_6);

                        if (isNaN(total_)) {
                            document.getElementById('<%=txtQ9_Total.ClientID%>').value = "Calculating ";
                        }
                        else {
                            document.getElementById('<%=txtQ9_Total.ClientID%>').value = total_;
                        }
                    }
                    function sumQ10() {
                        var txtQ10_1 = document.getElementById('<%=txtQ10_1.ClientID %>').value;
                        var txtQ10_2 = document.getElementById('<%=txtQ10_2.ClientID %>').value;
                        var txtQ10_3 = document.getElementById('<%=txtQ10_3.ClientID %>').value;
                        var txtQ10_4 = document.getElementById('<%=txtQ10_4.ClientID %>').value;
                        var txtQ10_5 = document.getElementById('<%=txtQ10_5.ClientID %>').value;
                        var total_ = parseInt(txtQ10_1) + parseInt(txtQ10_2) + parseInt(txtQ10_3) + parseInt(txtQ10_4) + parseInt(txtQ10_5);

                        if (isNaN(total_)) {
                            document.getElementById('<%=txtQ10_Total.ClientID%>').value = "Calculating ";
                        }
                        else {
                            document.getElementById('<%=txtQ10_Total.ClientID%>').value = total_;
                        }
                    }

        </script>
        <li>
            <asp:Label ID="lblQ8" runat="server"></asp:Label>
            <%-- <asp:CheckBoxList ID="chkbxlstQ8" runat="server">
                     </asp:CheckBoxList>--%>
            <ul>
                <li>
                    <asp:TextBox ID="txtQ8_1" runat="server" onkeyup="sumQ8();" Enabled="False"></asp:TextBox>White, not of Hispanic origin
                </li>
                <li>
                    <asp:TextBox ID="txtQ8_2" runat="server" onkeyup="sumQ8();" Enabled="False"></asp:TextBox>Black, not of Hispanic origin
                </li>
                <li>
                    <asp:TextBox ID="txtQ8_3" runat="server" onkeyup="sumQ8();" Enabled="False"></asp:TextBox>Hispanic
                </li>
                <li>
                    <asp:TextBox ID="txtQ8_4" runat="server" onkeyup="sumQ8();" Enabled="False"></asp:TextBox>Asian or Pacific Islander
                </li>
                <li>
                    <asp:TextBox ID="txtQ8_5" runat="server" onkeyup="sumQ8();" Enabled="False"></asp:TextBox>American Indian or Alaskan Native
                </li>
                <li>
                    <asp:TextBox ID="txtQ8_6" runat="server" onkeyup="sumQ8();" Enabled="False"></asp:TextBox>Other/Multiracial
                </li>
                <li>
                    <asp:TextBox ID="txtQ8_7" runat="server" onkeyup="sumQ8();" Enabled="False"></asp:TextBox>UnKnown
                </li>
                <li>Total &nbsp;
                    <asp:TextBox ID="txtQ8_Total" runat="server" Enabled="False"></asp:TextBox>

                </li>
            </ul>
        </li>
        <li>
            <asp:Label ID="lblQ9" runat="server"></asp:Label>
            <%-- <asp:CheckBoxList ID="chkbxlstQ9" runat="server"></asp:CheckBoxList>--%>
            <ul>
                <li>
                    <asp:TextBox ID="txtQ9_1" runat="server" onkeyup="sumQ9();" Enabled="False"></asp:TextBox>English only
                </li>
                <li>
                    <asp:TextBox ID="txtQ9_2" runat="server" onkeyup="sumQ9();" Enabled="False"></asp:TextBox>Spanish only
                </li>
                <li>
                    <asp:TextBox ID="txtQ9_3" runat="server" onkeyup="sumQ9();" Enabled="False"></asp:TextBox>English and Spanish
                </li>
                <li>
                    <asp:TextBox ID="txtQ9_4" runat="server" onkeyup="sumQ9();" Enabled="False"></asp:TextBox>English and a language other than Spanish
                </li>
                <li>
                    <asp:TextBox ID="txtQ9_5" runat="server" onkeyup="sumQ9();" Enabled="False"></asp:TextBox>Only a language other than Spanish or English
                </li>
                <li>
                    <asp:TextBox ID="txtQ9_6" runat="server" onkeyup="sumQ9();" Enabled="False"></asp:TextBox>UnKnown
                </li>
                <li>Total &nbsp;
                    <asp:TextBox ID="txtQ9_Total" runat="server" Enabled="false"></asp:TextBox>
                </li>
            </ul>
        </li>
        <br />
        <li>
            <asp:Label ID="lblQ10" runat="server"></asp:Label>
            <ul>
                <li>
                    <asp:TextBox ID="txtQ10_1" runat="server" onkeyup="sumQ10();" Enabled="False"></asp:TextBox>Not yet born 
                </li>
                <li>
                    <asp:TextBox ID="txtQ10_2" runat="server" onkeyup="sumQ10();" Enabled="False"></asp:TextBox>0­-12 
                </li>
                <li>
                    <asp:TextBox ID="txtQ10_3" runat="server" onkeyup="sumQ10();" Enabled="False"></asp:TextBox>13-24</li>
                <li>
                    <asp:TextBox ID="txtQ10_4" runat="server" onkeyup="sumQ10();" Enabled="False"></asp:TextBox>25-36 Months</li>
                <li>
                    <asp:TextBox ID="txtQ10_5" runat="server" onkeyup="sumQ10();" Enabled="False"></asp:TextBox>Older than 36 Months 
                </li>
                <li>Total &nbsp;
                    <asp:TextBox ID="txtQ10_Total" runat="server" Enabled="false"></asp:TextBox></li>
            </ul>
        </li>
    </ol>
    <h5>OTHER ACTIVITIES</h5>
    <ol start="11">
        <li>
            <asp:Label ID="lblQ11" runat="server"></asp:Label>
            <asp:CheckBoxList ID="chkbxlstQ11" runat="server" DataSourceID="SqlDataSource5" DataTextField="Answer" DataValueField="AnswerValue" Enabled="False">
            </asp:CheckBoxList>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [PROGRAM_DIRECTOR_SURVEY_ANSWERS] WHERE ([Question_ID] = @Question_ID)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="Q11" Name="Question_ID" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:TextBox ID="txtQ11_Other" runat="server" Enabled="False"></asp:TextBox>
        </li>

    </ol>

    <h3>EDUCATION AND EXPERIENCE</h3>
    <ol start="12">
        <li>            
            <p>
                <asp:GridView ID="grdQ12_V2" runat="server" AutoGenerateColumns="False" EnableModelValidation="True" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                    <Columns>
                        <asp:BoundField DataField="Q12_1" HeaderText="Title" />
                        <asp:BoundField DataField="Q12_2" HeaderText="Business function only *" />
                        <asp:BoundField DataField="Q12_3" HeaderText="Direct responsibility for program implementation and/or staff who work with families? *" />
                        <asp:BoundField DataField="Q13" HeaderText="Undergraduate degree?" />
                        <asp:BoundField DataField="Q14" HeaderText="Is undergraduate degree in early childhood field? **" />
                        <asp:BoundField DataField="Q15" HeaderText="Graduate degree? **" />
                        <asp:BoundField DataField="Q16" HeaderText="Is graduate degree in early childhood field? **" />
                        <asp:BoundField DataField="Q17" HeaderText="Years experience in early childhood field: " />
                        <asp:BoundField DataField="Q18" HeaderText="Years of direct management or mentorship experience ***:" />
                    </Columns>
                    <FooterStyle BackColor="#2461BF" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
            </p>
            <p>
                <asp:Label ID="lblQ12" runat="server"></asp:Label>
            </p>
            <p>*Business function refers to staff who have business responsibilities only. Example: Accountant</p>
            <p>
                ** Examples of early childhood related fields include: education, social work, psychology, child development, and nursing.
            </p>
            <p>
                ***Mentorship means that the staff position was teamed with a seasoned professional with specific expertise in carrying out the job responsibilities. This definition implies an on­ going relationship over a period of time, where multiple opportunities for consultation and guidance are present to support individual growth and development. A two month job shadowing period where there is no on­going guidance once job responsibilities are assumed would not meet this definition.
            </p>
        </li>
    </ol>
    <h3>Training</h3>
    <h5>INITIAL TRAINING</h5>
    <asp:Label ID="lblQ19" runat="server"></asp:Label>
    <br />
    <br />
    <ol start="13">
        <li><%--orginal number is 19--%>
            <asp:Label ID="lblQ19_A" runat="server"></asp:Label>
        </li>
    </ol>
    <ol type="A">
        <li>
            <asp:Label ID="lblQ19_1" runat="server"></asp:Label>
            <table class="HVSurvey">
                <%--<tr>
                            <td class="HVSurvey"></td>
                            <th class="HVSurvey">Formal = 1</th>                               
                            <th class="HVSurvey">Informal= 2</th>
                            <th class="HVSurvey">Not Offered= 3</th>
                        </tr>--%>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ19_1_1" runat="server"></asp:Label></td>
                    <td class="HVSurvey" colspan="3">
                        <asp:RadioButtonList ID="rdobtnlstQ19_1_1" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ19_1_2" runat="server"></asp:Label></td>
                    <td class="HVSurvey" colspan="3">
                        <asp:RadioButtonList ID="rdobtnlstQ19_1_2" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ19_1_3" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ19_1_3" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ19_1_4" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ19_1_4" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ19_1_5" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ19_1_5" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ19_1_6" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ19_1_6" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ19_1_7" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ19_1_7" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ19_1_8" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ19_1_8" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ19_1_9" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ19_1_9" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
            </table>
        </li>
        <li>
            <asp:Label ID="lblQ19_2" runat="server"></asp:Label>
            <table class="HVSurvey">
                <%--  <tr>
                            <td class="d"></td>
                            <th class="q">Formal = 1</th>                               
                            <th class="q">Informal= 2</th>
                            <th class="q">Not Offered= 3</th>
                        </tr>--%>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ19_2_1" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ19_2_1" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ19_2_2" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ19_2_2" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ19_2_3" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ19_2_3" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ19_2_4" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ19_2_4" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ19_2_5" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ19_2_5" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ19_2_6" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ19_2_6" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ19_2_7" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ19_2_7" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ19_2_8" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ19_2_8" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ19_2_9" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ19_2_9" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ19_2_10" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ19_2_10" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ19_2_11" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ19_2_11" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ19_2_12" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ19_2_12" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ19_2_13" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ19_2_13" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ19_2_14" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ19_2_14" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ19_2_15" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ19_2_15" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
            </table>
        </li>
        <li>
            <asp:Label ID="lblQ19_3" runat="server" Text="Label"></asp:Label>
            <table class="HVSurvey">
                <%-- <tr>
                            <td class="d"></td>
                             <th class="q">Formal = 1</th>                               
                            <th class="q">Informal= 2</th>
                            <th class="q">Not Offered= 3</th>
                        </tr>--%>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ19_3_1" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ19_3_1" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ19_3_2" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ19_3_2" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ19_3_3" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ19_3_3" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ19_3_4" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ19_3_4" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ19_3_5" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ19_3_5" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
            </table>
        </li>
    </ol>
    <h3>Training</h3>
    <h5>ONGOING TRAINING</h5>
    <ol start="14">
        <li>
            <p>
                <%--orginal number is 20--%>
                <asp:Label ID="lblQ20" runat="server"></asp:Label>
            </p>
        </li>
    </ol>
    <ol type="A">
        <li>
            <asp:Label ID="lblQ20_1" runat="server"></asp:Label>
            <table class="HVSurvey">
                <%-- <tr>
                            <td class="d"></td>
                            <th class="q">Formal = 1</th>                               
                            <th class="q">Informal= 2</th>
                            <th class="q">Not Offered= 3</th>
                        </tr>--%>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ20_1_1" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ20_1_1" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey" style="height: 48px">
                        <asp:Label ID="lblQ20_1_2" runat="server"></asp:Label></td>
                    <td class="HVSurvey" style="height: 48px">
                        <asp:RadioButtonList ID="rdobtnlstQ20_1_2" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ20_1_3" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ20_1_3" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ20_1_4" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ20_1_4" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ20_1_5" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ20_1_5" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ20_1_6" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ20_1_6" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ20_1_7" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ20_1_7" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ20_1_8" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ20_1_8" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ20_1_9" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ20_1_9" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
            </table>
        </li>
        <li>
            <asp:Label ID="lblQ20_2" runat="server"></asp:Label>
            <table class="HVSurvey">
                <%--<tr>
                            <td class="d"></td>
                           <th class="q">Formal = 1</th>                               
                            <th class="q">Informal= 2</th>
                            <th class="q">Not Offered= 3</th>
                        </tr>--%>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ20_2_1" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ20_2_1" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ20_2_2" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ20_2_2" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ20_2_3" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ20_2_3" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ20_2_4" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ20_2_4" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ20_2_5" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ20_2_5" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ20_2_6" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ20_2_6" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ20_2_7" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ20_2_7" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ20_2_8" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ20_2_8" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ20_2_9" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ20_2_9" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ20_2_10" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ20_2_10" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ20_2_11" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ20_2_11" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ20_2_12" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ20_2_12" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ20_2_13" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ20_2_13" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ20_2_14" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ20_2_14" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ20_2_15" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ20_2_15" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
            </table>
        </li>
        <li>
            <asp:Label ID="lblQ20_3" runat="server"></asp:Label>
            <table class="HVSurvey">
                <%-- <tr>
                            <td class="d"></td>
                            <th class="q">Formal = 1</th>                               
                            <th class="q">Informal= 2</th>
                            <th class="q">Not Offered= 3</th>
                        </tr>--%>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ20_3_1" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ20_3_1" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ20_3_2" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ20_3_2" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ20_3_3" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ20_3_3" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ20_3_4" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ20_3_4" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ20_3_5" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ20_3_5" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
            </table>
        </li>
    </ol>
    <h3>Program Materials</h3>
    <h5>MATERIALS AND RESOURCES</h5>
    <ol start="15">
        <li><%--orginal number is 21--%>
            <asp:Label ID="lblQ21" runat="server"></asp:Label>
        </li>
    </ol>
    <ol type="A">
        <li>
            <asp:Label ID="lblQ21_1" runat="server"></asp:Label>
            <table class="HVSurvey">
                <%-- <tr>
                            <td class="d"></td>
                           <th class="q">Formal = 1</th>                               
                            <th class="q">Informal= 2</th>
                            <th class="q">Not Offered= 3</th>
                        </tr>--%>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ21_1_1" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ21_1_1" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ21_1_2" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ21_1_2" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ21_1_3" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ21_1_3" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ21_1_4" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ21_1_4" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ21_1_5" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ21_1_5" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ21_1_6" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ21_1_6" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ21_1_7" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ21_1_7" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ21_1_8" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ21_1_8" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ21_1_9" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ21_1_9" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
            </table>
        </li>
        <li>
            <asp:Label ID="lblQ21_2" runat="server"></asp:Label>
            <table class="HVSurvey">
                <%-- <tr>
                            <td class="d"></td>
                            <th class="q">Formal = 1</th>                               
                            <th class="q">Informal= 2</th>
                            <th class="q">Not Offered= 3</th>
                        </tr>--%>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ21_2_1" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ21_2_1" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ21_2_2" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ21_2_2" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ21_2_3" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ21_2_3" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ21_2_4" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ21_2_4" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ21_2_5" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ21_2_5" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ21_2_6" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ21_2_6" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ21_2_7" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ21_2_7" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ21_2_8" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ21_2_8" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ21_2_9" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ21_2_9" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ21_2_10" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ21_2_10" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ21_2_11" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ21_2_11" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ21_2_12" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ21_2_12" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ21_2_13" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ21_2_13" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ21_2_14" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ21_2_14" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ21_2_15" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ21_2_15" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
            </table>
        </li>
        <li>
            <asp:Label ID="lblQ21_3" runat="server"></asp:Label>
            <table class="HVSurvey">
                <%--<tr>
                            <td class="d"></td>
                           <th class="q">Formal = 1</th>                               
                            <th class="q">Informal= 2</th>
                            <th class="q">Not Offered= 3</th>
                        </tr>--%>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ21_3_1" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ21_3_1" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ21_3_2" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ21_3_2" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ21_3_3" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ21_3_3" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>

                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ21_3_4" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ21_3_4" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="HVSurvey">
                        <asp:Label ID="lblQ21_3_5" runat="server"></asp:Label></td>
                    <td class="HVSurvey">
                        <asp:RadioButtonList ID="rdobtnlstQ21_3_5" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5" Enabled="False">
                            <asp:ListItem Value="1">Formal</asp:ListItem>
                            <asp:ListItem Value="2">Informal</asp:ListItem>
                            <asp:ListItem Value="3">Not Offered</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>

                </tr>
            </table>
        </li>
    </ol>
    <h3>Written Policies and Procedures</h3>
    <h5>WRITTEN POLICIES AND PROCEDURES</h5>
    The next set of questions relates to your program&#39;s polices and procedures. Please answer these questions thinking about the policies that apply to the home visiting staff providing PI services.
           <asp:UpdatePanel ID="UpdatePanel2" runat="server">
               <ContentTemplate>

                   <ol start="16">
                       <li>
                           <asp:Label ID="lblQ22" runat="server"></asp:Label>
                           <asp:RadioButtonList ID="rdobtnlstQ22" runat="server" RepeatDirection="Horizontal" DataSourceID="SqlDataSource14" DataTextField="Answer" DataValueField="AnswerValue" AutoPostBack="True" Enabled="False">
                               <asp:ListItem Value="0">Yes</asp:ListItem>
                               <asp:ListItem Value="1">No</asp:ListItem>
                           </asp:RadioButtonList>
                           <asp:SqlDataSource ID="SqlDataSource14" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [PROGRAM_DIRECTOR_SURVEY_ANSWERS] WHERE ([Question_ID] = @Question_ID)">
                               <SelectParameters>
                                   <asp:Parameter DefaultValue="Q22" Name="Question_ID" Type="String" />
                               </SelectParameters>
                           </asp:SqlDataSource>
                       </li>
                       <li runat="server" id="Q23">
                           <asp:Label ID="lblQ23" runat="server"></asp:Label>
                           <asp:CheckBoxList ID="chkbxlstQ23" runat="server" Height="29px" DataSourceID="SqlDataSource6" DataTextField="Answer" DataValueField="AnswerValue" Enabled="False">
                           </asp:CheckBoxList>
                           <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [PROGRAM_DIRECTOR_SURVEY_ANSWERS] WHERE ([Question_ID] = @Question_ID)">
                               <SelectParameters>
                                   <asp:Parameter DefaultValue="Q23" Name="Question_ID" Type="String" />
                               </SelectParameters>
                           </asp:SqlDataSource>
                       </li>
                       <li runat="server" id="Q24">
                           <asp:Label ID="lblQ24" runat="server"></asp:Label>
                           <asp:RadioButtonList ID="rdobtnlstQ24" runat="server" DataSourceID="SqlDataSource16" DataTextField="Answer" DataValueField="AnswerValue" Enabled="False">
                               <asp:ListItem Value="0">Annually </asp:ListItem>
                               <asp:ListItem Value="1">Every two years</asp:ListItem>
                               <asp:ListItem Value="2">Every three years</asp:ListItem>
                               <asp:ListItem Value="3">Only as needed</asp:ListItem>
                           </asp:RadioButtonList>
                           <asp:SqlDataSource ID="SqlDataSource16" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [PROGRAM_DIRECTOR_SURVEY_ANSWERS] WHERE ([Question_ID] = @Question_ID)">
                               <SelectParameters>
                                   <asp:Parameter DefaultValue="Q24" Name="Question_ID" Type="String" />
                               </SelectParameters>
                           </asp:SqlDataSource>
                       </li>
                       <li runat="server" id="Q25">
                           <asp:Label ID="lblQ25" runat="server"></asp:Label>
                           <asp:DropDownList ID="ddlMonth" runat="server" Enabled="False">
                               <asp:ListItem Value="0">MONTH</asp:ListItem>
                               <asp:ListItem Value="1">JAN</asp:ListItem>
                               <asp:ListItem Value="2">FEB</asp:ListItem>
                               <asp:ListItem Value="3">MAR</asp:ListItem>
                               <asp:ListItem Value="4">APR</asp:ListItem>
                               <asp:ListItem Value="5">MAY</asp:ListItem>
                               <asp:ListItem Value="6">JUN</asp:ListItem>
                               <asp:ListItem Value="7">JUL</asp:ListItem>
                               <asp:ListItem Value="8">AUG</asp:ListItem>
                               <asp:ListItem Value="9">SEP</asp:ListItem>
                               <asp:ListItem Value="10">OCT</asp:ListItem>
                               <asp:ListItem Value="11">NOV</asp:ListItem>
                               <asp:ListItem Value="12">DEC</asp:ListItem>
                           </asp:DropDownList>
                           <asp:DropDownList ID="ddlYear" runat="server" Enabled="False">
                               <asp:ListItem>YEAR</asp:ListItem>
                           </asp:DropDownList>
                       </li>
                   </ol>
               </ContentTemplate>
           </asp:UpdatePanel>
    <ol start="20">
        <li>
            <asp:Label ID="lblQ26" runat="server"></asp:Label>
            <asp:RadioButtonList ID="rdobtnlstQ26" runat="server" RepeatDirection="Horizontal" DataSourceID="SqlDataSource17" DataTextField="Answer" DataValueField="AnswerValue" Enabled="False">
                <asp:ListItem Value="0">Yes</asp:ListItem>
                <asp:ListItem Value="1">No</asp:ListItem>
            </asp:RadioButtonList>
            <asp:SqlDataSource ID="SqlDataSource17" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [PROGRAM_DIRECTOR_SURVEY_ANSWERS] WHERE ([Question_ID] = @Question_ID)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="Q26" Name="Question_ID" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <table>
                <tr>
                    <td>If yes, Please describe:
                    </td>
                    <td>
                        <asp:TextBox ID="txtQ26Explain" runat="server" Height="75px" TextMode="MultiLine" Width="300px" Enabled="False"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </li>
    </ol>
    <h3>Data Collection Process</h3>
    <p>The next set of questions lists specific types of data you may collect. For each section, indicate which types of data you are collecting on a regular and consistent basis from your families.</p>
    <ol start="21">
        <li>
            <p>
                <asp:Label ID="lblQ27" runat="server"></asp:Label>
            </p>
            <asp:CheckBoxList ID="chkbxlstQ27" runat="server" DataSourceID="SqlDataSource7" DataTextField="Answer" DataValueField="AnswerValue" Enabled="False"></asp:CheckBoxList>
            <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [PROGRAM_DIRECTOR_SURVEY_ANSWERS] WHERE ([Question_ID] = @Question_ID)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="Q27" Name="Question_ID" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:TextBox ID="txtQ27Explain" runat="server" Enabled="False"></asp:TextBox>
        </li>
        <li>
            <p>
                <asp:Label ID="lblQ28" runat="server"></asp:Label>
            </p>
            <asp:CheckBoxList ID="chkbxlstQ28" runat="server" DataSourceID="SqlDataSource8" DataTextField="Answer" DataValueField="AnswerValue" Style="margin-right: 0px" Enabled="False">
            </asp:CheckBoxList>
            <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [PROGRAM_DIRECTOR_SURVEY_ANSWERS] WHERE ([Question_ID] = @Question_ID)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="Q28" Name="Question_ID" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </li>
        <li>
            <p>
                <asp:Label ID="lblQ29" runat="server"></asp:Label>
            </p>
            <asp:CheckBoxList ID="chkbxlstQ29" runat="server" DataSourceID="SqlDataSource9" DataTextField="Answer" DataValueField="AnswerValue" Enabled="False">
            </asp:CheckBoxList>
            <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [PROGRAM_DIRECTOR_SURVEY_ANSWERS] WHERE ([Question_ID] = @Question_ID)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="Q29" Name="Question_ID" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </li>
        <li>
            <p>
                <asp:Label ID="lblQ30" runat="server"></asp:Label>
            </p>
            <asp:CheckBoxList ID="chkbxlstQ30" runat="server" DataSourceID="SqlDataSource10" DataTextField="Answer" DataValueField="AnswerValue" Enabled="False">
            </asp:CheckBoxList>
            <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [PROGRAM_DIRECTOR_SURVEY_ANSWERS] WHERE ([Question_ID] = @Question_ID)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="Q30" Name="Question_ID" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </li>
        <li>
            <p>
                <asp:Label ID="lblQ31" runat="server"></asp:Label>
            </p>
            <asp:CheckBoxList ID="chkbxlstQ31" runat="server" DataSourceID="SqlDataSource11" DataTextField="Answer" DataValueField="AnswerValue" Enabled="False">
            </asp:CheckBoxList>
            <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [PROGRAM_DIRECTOR_SURVEY_ANSWERS] WHERE ([Question_ID] = @Question_ID)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="Q31" Name="Question_ID" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </li>
        <li>
            <p>
                <asp:Label ID="lblQ32" runat="server"></asp:Label>
            </p>
            <asp:CheckBoxList ID="chkbxlstQ32" runat="server" DataSourceID="SqlDataSource12" DataTextField="Answer" DataValueField="AnswerValue" Enabled="False">
            </asp:CheckBoxList>
            <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [PROGRAM_DIRECTOR_SURVEY_ANSWERS] WHERE ([Question_ID] = @Question_ID)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="Q32" Name="Question_ID" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </li>
        <li>
            <p>
                <asp:Label ID="lblQ33" runat="server"></asp:Label>
            </p>
            <asp:CheckBoxList ID="chkbxlstQ33" runat="server" DataSourceID="SqlDataSource13" DataTextField="Answer" DataValueField="AnswerValue" Enabled="False">
            </asp:CheckBoxList>
            <asp:SqlDataSource ID="SqlDataSource13" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [PROGRAM_DIRECTOR_SURVEY_ANSWERS] WHERE ([Question_ID] = @Question_ID)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="Q33" Name="Question_ID" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </li>
        <li>
            <p>
                <asp:Label ID="lblQ34" runat="server"></asp:Label>
            </p>
            <asp:CheckBoxList ID="chkbxlstQ34" runat="server" DataSourceID="SqlDataSource15" DataTextField="Answer" DataValueField="AnswerValue" Enabled="False">
            </asp:CheckBoxList>
            <asp:SqlDataSource ID="SqlDataSource15" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [PROGRAM_DIRECTOR_SURVEY_ANSWERS] WHERE ([Question_ID] = @Question_ID)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="Q34" Name="Question_ID" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </li>
        <li>
            <p>
                <asp:Label ID="lblQ35" runat="server"></asp:Label>
            </p>
            <asp:CheckBoxList ID="chkbxlstQ35" runat="server" DataSourceID="SqlDataSource18" DataTextField="Answer" DataValueField="AnswerValue" Enabled="False">
            </asp:CheckBoxList>
            <asp:SqlDataSource ID="SqlDataSource18" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [PROGRAM_DIRECTOR_SURVEY_ANSWERS] WHERE ([Question_ID] = @Question_ID)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="Q35" Name="Question_ID" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </li>
    </ol>
    <br />

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
