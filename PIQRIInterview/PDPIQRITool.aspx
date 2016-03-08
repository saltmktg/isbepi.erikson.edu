<%@ Page Title="" Language="C#" MasterPageFile="~/PIQRIInterview/PIQRIInterview.Master" AutoEventWireup="true" CodeBehind="PDPIQRITool.aspx.cs" Inherits="HVP.PIQRIInterview.PDPIQRITool" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 style="text-align: center">Program Director Interview</h3>
    <script type="text/javascript">
        function DivClicked(input) {
            var e = document.getElementById(input);
            if (e.style.display == 'block') {
                e.style.display = 'none';
                document.getElementById(input).focus();
            }
            else {
                e.style.display = 'block';
                document.getElementById(input).focus();
            }

        }

        function chkscoring() {

        }
        function scoring(score, sid1, sid2, sid3, sid4) {
            //var s = score;  

            //var AspRadio = document.getElementById(sid1);
            //var radio = AspRadio.getElementsByTagName("input");

            //if (score == 7) {
            //    radio[3].checked = true;
            //}
            //else if (score == 5) {
            //    radio[2].checked = true;
            //}
            //else if (score == 3) {
            //    radio[1].checked = true;
            //}
            //else if (score == 1) {
            //    radio[0].checked = true;
            //}
            //else {
            //    for (var i = 0; i < radio.length; i++) {
            //        radio[i].checked = false;
            //    }
            //    alert("Please make sure scoring part 1 option is checked. Thank you!")
            //}


            switch (score) {
                case "1":
                    {
                        document.getElementById(sid1).checked = true;
                        document.getElementById(sid2).checked = false;
                        document.getElementById(sid3).checked = false;
                        document.getElementById(sid4).checked = false;
                        break;
                    }
                case "3":
                    {
                        document.getElementById(sid1).checked = false;
                        document.getElementById(sid2).checked = true;
                        document.getElementById(sid3).checked = false;
                        document.getElementById(sid4).checked = false;
                        break;
                    }
                case "5":
                    {
                        document.getElementById(sid1).checked = false;
                        document.getElementById(sid2).checked = false;
                        document.getElementById(sid3).checked = true;
                        document.getElementById(sid4).checked = false;
                        break;
                    }
                case "7":
                    {
                        document.getElementById(sid1).checked = false;
                        document.getElementById(sid2).checked = false;
                        document.getElementById(sid3).checked = false;
                        document.getElementById(sid4).checked = true;
                        break;
                    }
                default:
                    {
                        document.getElementById(sid1).checked = false;
                        document.getElementById(sid2).checked = false;
                        document.getElementById(sid3).checked = false;
                        document.getElementById(sid4).checked = false;
                        alert("Check Scoring, One option must be checked. Thank you!")
                    }

            }
        }

        function EBPM_Q1() {
            if (((document.getElementById('<%=chk_EBPM_Q1_1.ClientID%>').checked != true
                     && document.getElementById('<%=chk_EBPM_Q1_2.ClientID%>').checked != true)
                     ||
                     (document.getElementById('<%=chk_EBPM_Q1_1.ClientID%>').checked != true
                     && document.getElementById('<%=chk_EBPM_Q1_2.ClientID%>').checked == true)
                     ||
                     (document.getElementById('<%=chk_EBPM_Q1_1.ClientID%>').checked == true
                     && document.getElementById('<%=chk_EBPM_Q1_2.ClientID%>').checked != true))
                     && document.getElementById('<%=chk_EBPM_Q1_3.ClientID%>').checked == true
                     && document.getElementById('<%=chk_EBPM_Q1_4.ClientID%>').checked == true
                     && document.getElementById('<%=chk_EBPM_Q1_5.ClientID%>').checked == true
                     && document.getElementById('<%=chk_EBPM_Q1_6.ClientID%>').checked == true
                     && document.getElementById('<%=chk_EBPM_Q1_7.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_EBPM_Q1.ClientID%>').innerHTML = 7;
            }
            else if ((((document.getElementById('<%=chk_EBPM_Q1_1.ClientID%>').checked != true
                && document.getElementById('<%=chk_EBPM_Q1_2.ClientID%>').checked != true)
                     ||
                     (document.getElementById('<%=chk_EBPM_Q1_1.ClientID%>').checked != true
                     && document.getElementById('<%=chk_EBPM_Q1_2.ClientID%>').checked == true)
                     ||
                     (document.getElementById('<%=chk_EBPM_Q1_1.ClientID%>').checked == true
                     && document.getElementById('<%=chk_EBPM_Q1_2.ClientID%>').checked != true))
                     && document.getElementById('<%=chk_EBPM_Q1_3.ClientID%>').checked == true
                     && document.getElementById('<%=chk_EBPM_Q1_4.ClientID%>').checked == true
                     && document.getElementById('<%=chk_EBPM_Q1_5.ClientID%>').checked == true)
                     && (document.getElementById('<%=chk_EBPM_Q1_6.ClientID%>').checked == true
                     || document.getElementById('<%=chk_EBPM_Q1_7.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_EBPM_Q1.ClientID%>').innerHTML = 5;
            }
            else if ((((document.getElementById('<%=chk_EBPM_Q1_1.ClientID%>').checked != true
                && document.getElementById('<%=chk_EBPM_Q1_2.ClientID%>').checked != true)
                     ||
                     (document.getElementById('<%=chk_EBPM_Q1_1.ClientID%>').checked != true
                     && document.getElementById('<%=chk_EBPM_Q1_2.ClientID%>').checked == true)
                     ||
                     (document.getElementById('<%=chk_EBPM_Q1_1.ClientID%>').checked == true
                     && document.getElementById('<%=chk_EBPM_Q1_2.ClientID%>').checked != true))
                     && document.getElementById('<%=chk_EBPM_Q1_3.ClientID%>').checked == true
                     && document.getElementById('<%=chk_EBPM_Q1_4.ClientID%>').checked == true
                     && document.getElementById('<%=chk_EBPM_Q1_5.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_EBPM_Q1.ClientID%>').innerHTML = 5;
            }
            else if (((document.getElementById('<%=chk_EBPM_Q1_1.ClientID%>').checked != true
                && document.getElementById('<%=chk_EBPM_Q1_2.ClientID%>').checked != true)
                     ||
                     (document.getElementById('<%=chk_EBPM_Q1_1.ClientID%>').checked != true
                     && document.getElementById('<%=chk_EBPM_Q1_2.ClientID%>').checked == true)
                     ||
                     (document.getElementById('<%=chk_EBPM_Q1_1.ClientID%>').checked == true
                     && document.getElementById('<%=chk_EBPM_Q1_2.ClientID%>').checked != true))
                     && (document.getElementById('<%=chk_EBPM_Q1_3.ClientID%>').checked == true
                     && document.getElementById('<%=chk_EBPM_Q1_4.ClientID%>').checked == true)) {
                     document.getElementById('<%=lblScore_EBPM_Q1.ClientID%>').innerHTML = 3;
                 }
                 else if ((((document.getElementById('<%=chk_EBPM_Q1_1.ClientID%>').checked != true
                     && document.getElementById('<%=chk_EBPM_Q1_2.ClientID%>').checked != true)
                     ||
                     (document.getElementById('<%=chk_EBPM_Q1_1.ClientID%>').checked != true
                     && document.getElementById('<%=chk_EBPM_Q1_2.ClientID%>').checked == true)
                     ||
                     (document.getElementById('<%=chk_EBPM_Q1_1.ClientID%>').checked == true
                     && document.getElementById('<%=chk_EBPM_Q1_2.ClientID%>').checked != true))
                     && (document.getElementById('<%=chk_EBPM_Q1_3.ClientID%>').checked == true
                     || document.getElementById('<%=chk_EBPM_Q1_4.ClientID%>').checked == true))) {
                     document.getElementById('<%=lblScore_EBPM_Q1.ClientID%>').innerHTML = 1;
                 }
                 else if ((document.getElementById('<%=chk_EBPM_Q1_1.ClientID%>').checked == true
                     && document.getElementById('<%=chk_EBPM_Q1_2.ClientID%>').checked == true)
                     ||
                     (document.getElementById('<%=chk_EBPM_Q1_1.ClientID%>').checked != true
                     && document.getElementById('<%=chk_EBPM_Q1_2.ClientID%>').checked == true)
                     ||
                     (document.getElementById('<%=chk_EBPM_Q1_1.ClientID%>').checked == true
                     && document.getElementById('<%=chk_EBPM_Q1_2.ClientID%>').checked != true)) {
                     document.getElementById('<%=lblScore_EBPM_Q1.ClientID%>').innerHTML = 1;
                 }
                 else {
                     document.getElementById('<%=lblScore_EBPM_Q1.ClientID%>').innerHTML = " ";
                 }

    var score = 0;
    score = document.getElementById('<%=lblScore_EBPM_Q1.ClientID%>').textContent;

    document.getElementById('<%=hf_EBPM_Q1.ClientID%>').value = score;


            scoring(score, '<%=chkScore_EBPM_Q1_1.ClientID%>', '<%=chkScore_EBPM_Q1_2.ClientID%>',
           '<%=chkScore_EBPM_Q1_3.ClientID%>', '<%=chkScore_EBPM_Q1_4.ClientID%>');

        }


        //// Q2
        function PO_Q2() {
            if (document.getElementById('<%=chk_PO_Q2_1.ClientID%>').checked != true
                         && document.getElementById('<%=chk_PO_Q2_2.ClientID%>').checked != true
                    && document.getElementById('<%=chk_PO_Q2_3.ClientID%>').checked == true
                    && document.getElementById('<%=chk_PO_Q2_4.ClientID%>').checked == true
                    && document.getElementById('<%=chk_PO_Q2_5.ClientID%>').checked == true
                    && document.getElementById('<%=chk_PO_Q2_6.ClientID%>').checked == true
                    && document.getElementById('<%=chk_PO_Q2_7.ClientID%>').checked == true
                    && document.getElementById('<%=chk_PO_Q2_8.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_PO_Q2.ClientID%>').innerHTML = 7;
            }
            else if ((document.getElementById('<%=chk_PO_Q2_1.ClientID%>').checked != true
                && document.getElementById('<%=chk_PO_Q2_2.ClientID%>').checked != true
                && document.getElementById('<%=chk_PO_Q2_3.ClientID%>').checked == true
                && document.getElementById('<%=chk_PO_Q2_4.ClientID%>').checked == true
                && document.getElementById('<%=chk_PO_Q2_5.ClientID%>').checked == true
                && document.getElementById('<%=chk_PO_Q2_6.ClientID%>').checked == true)
                && (document.getElementById('<%=chk_PO_Q2_7.ClientID%>').checked == true
                || document.getElementById('<%=chk_PO_Q2_8.ClientID%>').checked == true)) {
                     document.getElementById('<%=lblScore_PO_Q2.ClientID%>').innerHTML = 5;
                 }
                 else if (document.getElementById('<%=chk_PO_Q2_1.ClientID%>').checked != true
                && document.getElementById('<%=chk_PO_Q2_2.ClientID%>').checked != true
                && document.getElementById('<%=chk_PO_Q2_3.ClientID%>').checked == true
                && document.getElementById('<%=chk_PO_Q2_4.ClientID%>').checked == true
                && document.getElementById('<%=chk_PO_Q2_5.ClientID%>').checked == true
                && document.getElementById('<%=chk_PO_Q2_6.ClientID%>').checked == true) {
                     document.getElementById('<%=lblScore_PO_Q2.ClientID%>').innerHTML = 5;
                 }
                 else if ((document.getElementById('<%=chk_PO_Q2_1.ClientID%>').checked != true
                && document.getElementById('<%=chk_PO_Q2_2.ClientID%>').checked != true
                && document.getElementById('<%=chk_PO_Q2_3.ClientID%>').checked == true
                && document.getElementById('<%=chk_PO_Q2_4.ClientID%>').checked == true)
                && (document.getElementById('<%=chk_PO_Q2_5.ClientID%>').checked == true
                || document.getElementById('<%=chk_PO_Q2_6.ClientID%>').checked == true)) {
                     document.getElementById('<%=lblScore_PO_Q2.ClientID%>').innerHTML = 3;
                 }
                 else if (document.getElementById('<%=chk_PO_Q2_1.ClientID%>').checked != true
           && document.getElementById('<%=chk_PO_Q2_2.ClientID%>').checked != true
                && document.getElementById('<%=chk_PO_Q2_3.ClientID%>').checked == true
                && document.getElementById('<%=chk_PO_Q2_4.ClientID%>').checked == true) {
                     document.getElementById('<%=lblScore_PO_Q2.ClientID%>').innerHTML = 3;
                 }
                 else if ((document.getElementById('<%=chk_PO_Q2_1.ClientID%>').checked != true
                && document.getElementById('<%=chk_PO_Q2_2.ClientID%>').checked != true)
                && (document.getElementById('<%=chk_PO_Q2_3.ClientID%>').checked == true
                || document.getElementById('<%=chk_PO_Q2_4.ClientID%>').checked == true)) {
                     document.getElementById('<%=lblScore_PO_Q2.ClientID%>').innerHTML = 1;
                 }
                 else if ((document.getElementById('<%=chk_PO_Q2_1.ClientID%>').checked == true
                 || document.getElementById('<%=chk_PO_Q2_2.ClientID%>').checked == true)
                     || (document.getElementById('<%=chk_PO_Q2_1.ClientID%>').checked == true
                     && document.getElementById('<%=chk_PO_Q2_2.ClientID%>').checked == true)) {
                     document.getElementById('<%=lblScore_PO_Q2.ClientID%>').innerHTML = 1;
                 }
                 else {
                     document.getElementById('<%=lblScore_PO_Q2.ClientID%>').innerHTML = " ";
                 }

    var score = 0;
    score = document.getElementById('<%=lblScore_PO_Q2.ClientID%>').textContent;
    document.getElementById('<%=hf_PO_Q2.ClientID%>').value = score;

            scoring(score, '<%=chkScore_PO_Q2_1.ClientID%>', '<%=chkScore_PO_Q2_2.ClientID%>',
             '<%=chkScore_PO_Q2_3.ClientID%>', '<%=chkScore_PO_Q2_4.ClientID%>');

             }
    </script>

    <asp:HiddenField ID="hfschd" runat="server" />
    <div style="cursor: pointer;" onclick="javascript:DivClicked('EBPM_Q1');">
        <h3 class="scoringTitle">
            <img src="../Images/edit_add.png" height="40" style="width: 40px" />PROGRAM MODEL: EVIDENCE-BASED PROGRAM MODEL (Scale C1, IR1)</h3>
    </div>
    <asp:HiddenField ID="hf_EBPM_Q1" runat="server" />
    <div id="EBPM_Q1" style="display: none;">
        <table class="d">
            <tr>
                <td colspan="4">
                    <h3>SCORING</h3>
                </td>
            </tr>
            <tr>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_EBPM_Q1_1" runat="server" OnClick="javascript:EBPM_Q1();" /><asp:Label ID="lblEBPM_Q1_1" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_EBPM_Q1_2" runat="server" OnClick="javascript:EBPM_Q1();" /><asp:Label ID="lblEBPM_Q1_2" runat="server"></asp:Label>
                        </li>
                    </ul>
                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_EBPM_Q1_3" runat="server" OnClick="javascript:EBPM_Q1();" /><asp:Label ID="lblEBPM_Q1_3" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_EBPM_Q1_4" runat="server" OnClick="javascript:EBPM_Q1();" /><asp:Label ID="lblEBPM_Q1_4" runat="server"></asp:Label>
                        </li>
                    </ul>
                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_EBPM_Q1_5" runat="server" OnClick="javascript:EBPM_Q1();" /><asp:Label ID="lblEBPM_Q1_5" runat="server"></asp:Label>
                        </li>
                    </ul>
                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_EBPM_Q1_6" runat="server" OnClick="javascript:EBPM_Q1();" /><asp:Label ID="lblEBPM_Q1_6" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_EBPM_Q1_7" runat="server" OnClick="javascript:EBPM_Q1();" /><asp:Label ID="lblEBPM_Q1_7" runat="server"></asp:Label>
                        </li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td class="q">If BOTH criteria met, score 1; otherwise, continue. 
                </td>
                <td class="q">If BOTH criteria are met, continue; otherwise, score 1.
                </td>
                <td class="q">If the above criterion is met, continue; otherwise, score 3. 
                </td>
                <td class="q">If BOTH  criteria are met, score 7; otherwise, score 5. 
                </td>
            </tr>
            <tr>
                <td class="scoring" colspan="4">Score:<asp:Label ID="lblScore_EBPM_Q1" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <%--<tr>
            <td class="d" aria-orientation="horizontal" colspan="4">
                <asp:RadioButtonList ID="chkScore_EBPM_Q1" runat="server" RepeatDirection="Horizontal" Width="100%" ValidationGroup="Val1">
                    <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required-(C1, IR1)" ControlToValidate="chkScore_EBPM_Q1" ValidationGroup="Val1"></asp:RequiredFieldValidator>
            </td>
            </tr>--%>
            <tr>
                <td class="d">
                    <asp:RadioButton ID="chkScore_EBPM_Q1_1" GroupName="chkScore_EBPM_Q1" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_EBPM_Q1_1" runat="server" /><br />--%>
                1<br />
                    Low Quality<br />
                    Program has no developed logic model or theory of how program services benefit families and their young children.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_EBPM_Q1_2" GroupName="chkScore_EBPM_Q1" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_EBPM_Q1_2"  runat="server" /><br />--%>
                3<br />
                    Average Quality<br />
                    Program has a theoretically based program design presented in at least general terms. 
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_EBPM_Q1_3" GroupName="chkScore_EBPM_Q1" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_EBPM_Q1_3" runat="server" /><br />--%>
                    5<br />
                    Above Average Quality<br />
                    Program leadership can link some specific aspects of program services or content to both child and family outcomes.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_EBPM_Q1_4" GroupName="chkScore_EBPM_Q1" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_EBPM_Q1_4"  runat="server" /><br />--%>
                    7<br />
                    High Quality<br />
                    Program model is evidence based. Program leadership can clearly articulate links between services/content to outcomes.
                </td>
            </tr>
        </table>
    </div>
    <!---------------------------------------------------------------------------------->
    <div style="cursor: pointer;" onclick="javascript:DivClicked('PO_Q2');">
        <h3 class="scoringTitle">
            <img src="../Images/edit_add.png" height="40" style="width: 40px" />OUTCOME MEASUREMENT: PROGRAM OUTCOMES (Scale E3, IR 1)</h3>
    </div>
    <div id="PO_Q2" style="display: none;">
        <asp:HiddenField ID="hf_PO_Q2" runat="server" />
        <table class="d">
            <tr>
                <td colspan="4">
                    <h3>SCORING</h3>
                </td>
            </tr>
            <tr>
                <td class="q" style="height: 121px">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_PO_Q2_1" runat="server" OnClick="javascript:PO_Q2();" /><asp:Label ID="lblPO_Q2_1" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_PO_Q2_2" runat="server" OnClick="javascript:PO_Q2();" /><asp:Label ID="lblPO_Q2_2" runat="server"></asp:Label></li>
                    </ul>
                </td>
                <td class="q" style="height: 121px">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_PO_Q2_3" runat="server" OnClick="javascript:PO_Q2();" /><asp:Label ID="lblPO_Q2_3" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_PO_Q2_4" runat="server" OnClick="javascript:PO_Q2();" /><asp:Label ID="lblPO_Q2_4" runat="server"></asp:Label></li>
                    </ul>
                </td>
                <td class="q" style="height: 121px">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_PO_Q2_5" runat="server" OnClick="javascript:PO_Q2();" /><asp:Label ID="lblPO_Q2_5" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_PO_Q2_6" runat="server" OnClick="javascript:PO_Q2();" /><asp:Label ID="lblPO_Q2_6" runat="server"></asp:Label>
                        </li>
                    </ul>
                </td>
                <td class="q" style="height: 121px">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_PO_Q2_7" runat="server" OnClick="javascript:PO_Q2();" /><asp:Label ID="lblPO_Q2_7" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_PO_Q2_8" runat="server" OnClick="javascript:PO_Q2();" /><asp:Label ID="lblPO_Q2_8" runat="server"></asp:Label>
                        </li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td class="q">If EITHER criterion is met, score 1; otherwise, continue. 
                </td>
                <td class="q">If BOTH criteria are met, continue; otherwise, score 1.
                </td>
                <td class="q">If BOTH criteria are met, continue; otherwise, score 3. 
                </td>
                <td class="q">If BOTH criteria are met, score 7; otherwise score 5.
                </td>
            </tr>
            <tr>
                <td class="scoring" colspan="4">Score:<asp:Label ID="lblScore_PO_Q2" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <%-- <tr>
            <td class="d" aria-orientation="horizontal" colspan="4">
                <asp:RadioButtonList ID="chkScore_PO_Q2" runat="server" RepeatDirection="Horizontal" Width="100%" ValidationGroup="Val1">
                   <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required-(E3, IR 1)" ControlToValidate="chkScore_PO_Q2" ValidationGroup="Val1"></asp:RequiredFieldValidator>
            </td>
            </tr>--%>
            <tr>
                <td class="d">
                    <asp:RadioButton ID="chkScore_PO_Q2_1" GroupName="chkScore_PO_Q2" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_PO_Q2_1" runat="server"  /><br />--%>
                1<br />
                    Low Quality<br />
                    Program does not track outcomes.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_PO_Q2_2" GroupName="chkScore_PO_Q2" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_PO_Q2_2" runat="server" /><br />--%>
                3<br />
                    Average Quality<br />
                    Program can identify family and child outcomes and has established guidelines and processes for tracking progress and outcomes.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_PO_Q2_3" GroupName="chkScore_PO_Q2" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_PO_Q2_3" runat="server"/><br />--%>
                5<br />
                    Above Average Quality<br />
                    Program consistently monitors family and child outcomes and reports outcome attainments on at least an annual basis.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_PO_Q2_4" GroupName="chkScore_PO_Q2" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_PO_Q2_4" runat="server" /><br />--%>
                7<br />
                    High Quality<br />
                    Program can demonstrate clear effectiveness across multiple areas of child and family functioning, using a control or comparison group or reference data.  
                </td>
            </tr>
        </table>
    </div>
    <!---------------------------------------------------------------------------------->
    <script type="text/javascript">
        function COPRO_Q3() {
            if (document.getElementById('<%=chk_COPRO_Q3_1.ClientID%>').checked != true
        && document.getElementById('<%=chk_COPRO_Q3_2.ClientID%>').checked == true
        && document.getElementById('<%=chk_COPRO_Q3_3.ClientID%>').checked == true
        && document.getElementById('<%=chk_COPRO_Q3_4.ClientID%>').checked == true
        && document.getElementById('<%=chk_COPRO_Q3_5.ClientID%>').checked == true
        && document.getElementById('<%=chk_COPRO_Q3_6.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_COPRO_Q3.ClientID%>').innerHTML = 7;
            }
            else if ((document.getElementById('<%=chk_COPRO_Q3_1.ClientID%>').checked != true
           && document.getElementById('<%=chk_COPRO_Q3_2.ClientID%>').checked == true
           && document.getElementById('<%=chk_COPRO_Q3_3.ClientID%>').checked == true
           && document.getElementById('<%=chk_COPRO_Q3_4.ClientID%>').checked == true)
           && (document.getElementById('<%=chk_COPRO_Q3_5.ClientID%>').checked == true
           || document.getElementById('<%=chk_COPRO_Q3_6.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_COPRO_Q3.ClientID%>').innerHTML = 5;
            }
            else if (document.getElementById('<%=chk_COPRO_Q3_1.ClientID%>').checked != true
            && document.getElementById('<%=chk_COPRO_Q3_2.ClientID%>').checked == true
           && document.getElementById('<%=chk_COPRO_Q3_3.ClientID%>').checked == true
           && document.getElementById('<%=chk_COPRO_Q3_4.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_COPRO_Q3.ClientID%>').innerHTML = 5;
            }
            else if ((document.getElementById('<%=chk_COPRO_Q3_1.ClientID%>').checked != true
           && document.getElementById('<%=chk_COPRO_Q3_2.ClientID%>').checked == true)
           && (document.getElementById('<%=chk_COPRO_Q3_3.ClientID%>').checked == true
           || document.getElementById('<%=chk_COPRO_Q3_4.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_COPRO_Q3.ClientID%>').innerHTML = 3;
            }
            else if (document.getElementById('<%=chk_COPRO_Q3_1.ClientID%>').checked != true
            && document.getElementById('<%=chk_COPRO_Q3_2.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_COPRO_Q3.ClientID%>').innerHTML = 3;
            }
            else if (document.getElementById('<%=chk_COPRO_Q3_1.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_COPRO_Q3.ClientID%>').innerHTML = 1;
            }
            else {
                document.getElementById('<%=lblScore_COPRO_Q3.ClientID%>').innerHTML = " ";
            }
    var score = 0;
    score = document.getElementById('<%=lblScore_COPRO_Q3.ClientID%>').textContent;
    document.getElementById('<%=hf_COPRO_Q3.ClientID%>').value = score;

            scoring(score, '<%=chkScore_COPRO_Q3_1.ClientID%>', '<%=chkScore_COPRO_Q3_2.ClientID%>',
                  '<%=chkScore_COPRO_Q3_3.ClientID%>', '<%=chkScore_COPRO_Q3_4.ClientID%>');
        }
    </script>
    <div style="cursor: pointer;" onclick="javascript:DivClicked('COPRO_Q3');">
        <h3 class="scoringTitle">
            <img src="../Images/edit_add.png" height="40" style="width: 40px" />OUTCOME MEASUREMENT: COMMUNICATION OF PROGRAM RESULTS/OUTCOMES (Scale E3, IR 2)</h3>
    </div>
    <asp:HiddenField ID="hf_COPRO_Q3" runat="server" />
    <div id="COPRO_Q3" style="display: none;">
        <table class="d">
            <tr>
                <td colspan="4">
                    <h3>SCORING</h3>
                </td>
            </tr>
            <tr>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_COPRO_Q3_1" runat="server" OnClick="javascript:COPRO_Q3();" /><asp:Label ID="lblCOPRO_Q3_1" runat="server"></asp:Label>
                        </li>
                        <li></li>
                    </ul>
                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_COPRO_Q3_2" runat="server" OnClick="javascript:COPRO_Q3();" /><asp:Label ID="lblCOPRO_Q3_2" runat="server"></asp:Label>
                        </li>
                    </ul>
                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_COPRO_Q3_3" runat="server" OnClick="javascript:COPRO_Q3();" /><asp:Label ID="lblCOPRO_Q3_3" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_COPRO_Q3_4" runat="server" OnClick="javascript:COPRO_Q3();" /><asp:Label ID="lblCOPRO_Q3_4" runat="server"></asp:Label>
                        </li>
                    </ul>
                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_COPRO_Q3_5" runat="server" OnClick="javascript:COPRO_Q3();" /><asp:Label ID="lblCOPRO_Q3_5" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_COPRO_Q3_6" runat="server" OnClick="javascript:COPRO_Q3();" /><asp:Label ID="lblCOPRO_Q3_6" runat="server"></asp:Label>
                        </li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td class="q">If the above criterion is met, score 1; otherwise, continue.
                </td>
                <td class="q">If the above criterion is met, continue; otherwise, score 1. 
                </td>
                <td class="q">If BOTH criteria are met, continue; otherwise, score 3.
                </td>
                <td class="q">If BOTH criteria are met, score 7; otherwise, score 5.
                </td>
            </tr>
            <tr>
                <td class="scoring" colspan="4">Score:<asp:Label ID="lblScore_COPRO_Q3" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <%--<tr>
             <td class="d" aria-orientation="horizontal" colspan="4">
                <asp:RadioButtonList ID="chkScore_COPRO_Q3" runat="server" RepeatDirection="Horizontal" Width="100%" ValidationGroup="Val1">
                   <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required-(E3, IR 2)" ControlToValidate="chkScore_COPRO_Q3" ValidationGroup="Val1"></asp:RequiredFieldValidator>
            </td>
            </tr>--%>
            <tr>
                <td class="d">
                    <asp:RadioButton ID="chkScore_COPRO_Q3_1" GroupName="chkScore_COPRO_Q3" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_COPRO_Q3_1" runat="server" /><br />--%>
                1<br />
                    Low Quality<br />
                    Program does not use outcome data or share data with governing body.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_COPRO_Q3_2" GroupName="chkScore_COPRO_Q3" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_COPRO_Q3_2" runat="server" /><br />--%>
                3<br />
                    Average Quality<br />
                    Outcome data is communicated to governing body.  
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_COPRO_Q3_3" GroupName="chkScore_COPRO_Q3" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_COPRO_Q3_3" runat="server" /><br />--%>
                5<br />
                    Above Average Quality<br />
                    Program communicates program results at least annually via formal reports of progress on family and child outcomes. Program reports include both successes and areas of challenge or areas in need of improvement.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_COPRO_Q3_4" GroupName="chkScore_COPRO_Q3" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_COPRO_Q3_4" runat="server" /><br />--%>
                7<br />
                    High Quality<br />
                    Program uses outcome data to drive quality improvement efforts and includes specific outcome goals.
                </td>
            </tr>
        </table>
    </div>
    <!---------------------------------------------------------------------------------->
    <script type="text/javascript">
        function DMS_Q4() {
            if (document.getElementById('<%=chk_DMS_Q4_1.ClientID%>').checked != true
           && document.getElementById('<%=chk_DMS_Q4_2.ClientID%>').checked != true
           && document.getElementById('<%=chk_DMS_Q4_3.ClientID%>').checked != true
           && document.getElementById('<%=chk_DMS_Q4_4.ClientID%>').checked != true
           && document.getElementById('<%=chk_DMS_Q4_5.ClientID%>').checked == true
           && document.getElementById('<%=chk_DMS_Q4_6.ClientID%>').checked == true
           && document.getElementById('<%=chk_DMS_Q4_7.ClientID%>').checked == true
           && document.getElementById('<%=chk_DMS_Q4_8.ClientID%>').checked == true
           && document.getElementById('<%=chk_DMS_Q4_9.ClientID%>').checked == true
           && document.getElementById('<%=chk_DMS_Q4_10.ClientID%>').checked == true
           && document.getElementById('<%=chk_DMS_Q4_11.ClientID%>').checked == true
           && document.getElementById('<%=chk_DMS_Q4_12.ClientID%>').checked == true
           && document.getElementById('<%=chk_DMS_Q4_13.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_DMS_Q4.ClientID%>').innerHTML = 7;
            }
            else if ((document.getElementById('<%=chk_DMS_Q4_1.ClientID%>').checked != true
            && document.getElementById('<%=chk_DMS_Q4_2.ClientID%>').checked != true
           && document.getElementById('<%=chk_DMS_Q4_3.ClientID%>').checked != true
           && document.getElementById('<%=chk_DMS_Q4_4.ClientID%>').checked != true
           && document.getElementById('<%=chk_DMS_Q4_5.ClientID%>').checked == true
           && document.getElementById('<%=chk_DMS_Q4_6.ClientID%>').checked == true
           && document.getElementById('<%=chk_DMS_Q4_7.ClientID%>').checked == true
           && document.getElementById('<%=chk_DMS_Q4_8.ClientID%>').checked == true
           && document.getElementById('<%=chk_DMS_Q4_9.ClientID%>').checked == true)
           && (document.getElementById('<%=chk_DMS_Q4_10.ClientID%>').checked == true
           || document.getElementById('<%=chk_DMS_Q4_11.ClientID%>').checked == true
           || document.getElementById('<%=chk_DMS_Q4_12.ClientID%>').checked == true
           || document.getElementById('<%=chk_DMS_Q4_13.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_DMS_Q4.ClientID%>').innerHTML = 5;
            }
            else if (document.getElementById('<%=chk_DMS_Q4_1.ClientID%>').checked != true
            && document.getElementById('<%=chk_DMS_Q4_2.ClientID%>').checked != true
           && document.getElementById('<%=chk_DMS_Q4_3.ClientID%>').checked != true
           && document.getElementById('<%=chk_DMS_Q4_4.ClientID%>').checked != true
           && document.getElementById('<%=chk_DMS_Q4_5.ClientID%>').checked == true
           && document.getElementById('<%=chk_DMS_Q4_6.ClientID%>').checked == true
           && document.getElementById('<%=chk_DMS_Q4_7.ClientID%>').checked == true
           && document.getElementById('<%=chk_DMS_Q4_8.ClientID%>').checked == true
           && document.getElementById('<%=chk_DMS_Q4_9.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_DMS_Q4.ClientID%>').innerHTML = 5;
            }
            else if ((document.getElementById('<%=chk_DMS_Q4_1.ClientID%>').checked != true
           && document.getElementById('<%=chk_DMS_Q4_2.ClientID%>').checked != true
          && document.getElementById('<%=chk_DMS_Q4_3.ClientID%>').checked != true
          && document.getElementById('<%=chk_DMS_Q4_4.ClientID%>').checked != true
          && document.getElementById('<%=chk_DMS_Q4_5.ClientID%>').checked == true
          && document.getElementById('<%=chk_DMS_Q4_6.ClientID%>').checked == true)
          && (document.getElementById('<%=chk_DMS_Q4_7.ClientID%>').checked == true
          || document.getElementById('<%=chk_DMS_Q4_8.ClientID%>').checked == true
          || document.getElementById('<%=chk_DMS_Q4_9.ClientID%>').checked == true)) {
               document.getElementById('<%=lblScore_DMS_Q4.ClientID%>').innerHTML = 3;
           }
           else if (document.getElementById('<%=chk_DMS_Q4_1.ClientID%>').checked != true
          && document.getElementById('<%=chk_DMS_Q4_2.ClientID%>').checked != true
          && document.getElementById('<%=chk_DMS_Q4_3.ClientID%>').checked != true
          && document.getElementById('<%=chk_DMS_Q4_4.ClientID%>').checked != true
          && document.getElementById('<%=chk_DMS_Q4_5.ClientID%>').checked == true
          && document.getElementById('<%=chk_DMS_Q4_6.ClientID%>').checked == true) {
               document.getElementById('<%=lblScore_DMS_Q4.ClientID%>').innerHTML = 3;
           }
           else if ((document.getElementById('<%=chk_DMS_Q4_1.ClientID%>').checked != true
          && document.getElementById('<%=chk_DMS_Q4_2.ClientID%>').checked != true
          && document.getElementById('<%=chk_DMS_Q4_3.ClientID%>').checked != true
          && document.getElementById('<%=chk_DMS_Q4_4.ClientID%>').checked != true)
          && (document.getElementById('<%=chk_DMS_Q4_5.ClientID%>').checked == true
          || document.getElementById('<%=chk_DMS_Q4_6.ClientID%>').checked == true)) {
               document.getElementById('<%=lblScore_DMS_Q4.ClientID%>').innerHTML = 1;
           }
           else if (document.getElementById('<%=chk_DMS_Q4_1.ClientID%>').checked == true
           || document.getElementById('<%=chk_DMS_Q4_2.ClientID%>').checked == true
           || document.getElementById('<%=chk_DMS_Q4_3.ClientID%>').checked == true
           || document.getElementById('<%=chk_DMS_Q4_4.ClientID%>').checked == true) {
               document.getElementById('<%=lblScore_DMS_Q4.ClientID%>').innerHTML = 1;
           }
           else {
               document.getElementById('<%=lblScore_DMS_Q4.ClientID%>').innerHTML = " ";
           }
    var score = 0;
    score = document.getElementById('<%=lblScore_DMS_Q4.ClientID%>').textContent;
    document.getElementById('<%=hf_DMS_Q4.ClientID%>').value = score;

            scoring(score, '<%=chkScore_DMS_Q4_1.ClientID%>', '<%=chkScore_DMS_Q4_2.ClientID%>',
                  '<%=chkScore_DMS_Q4_3.ClientID%>', '<%=chkScore_DMS_Q4_4.ClientID%>');
        }
    </script>
    <div style="cursor: pointer;" onclick="javascript:DivClicked('DMS_Q4');">
        <h3 class="scoringTitle">
            <img src="../Images/edit_add.png" height="40" style="width: 40px" />PROGRAM MONITORING: DATA MANAGEMENT SYSTEM (Scale E1, IR 2)</h3>
    </div>
    <asp:HiddenField ID="hf_DMS_Q4" runat="server" />
    <div id="DMS_Q4" style="display: none;">
        <table class="d">
            <tr>
                <td colspan="4">
                    <h3>SCORING</h3>
                </td>
            </tr>
            <tr>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_DMS_Q4_1" runat="server" OnClick="javascript:DMS_Q4();" /><asp:Label ID="lbl_DMS_Q4_1" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_DMS_Q4_2" runat="server" OnClick="javascript:DMS_Q4();" /><asp:Label ID="lbl_DMS_Q4_2" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_DMS_Q4_3" runat="server" OnClick="javascript:DMS_Q4();" /><asp:Label ID="lbl_DMS_Q4_3" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_DMS_Q4_4" runat="server" OnClick="javascript:DMS_Q4();" /><asp:Label ID="lbl_DMS_Q4_4" runat="server"></asp:Label>
                        </li>
                    </ul>
                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_DMS_Q4_5" runat="server" OnClick="javascript:DMS_Q4();" /><asp:Label ID="lbl_DMS_Q4_5" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_DMS_Q4_6" runat="server" OnClick="javascript:DMS_Q4();" /><asp:Label ID="lbl_DMS_Q4_6" runat="server"></asp:Label>
                        </li>
                    </ul>
                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_DMS_Q4_7" runat="server" OnClick="javascript:DMS_Q4();" /><asp:Label ID="lbl_DMS_Q4_7" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_DMS_Q4_8" runat="server" OnClick="javascript:DMS_Q4();" /><asp:Label ID="lbl_DMS_Q4_8" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_DMS_Q4_9" runat="server" OnClick="javascript:DMS_Q4();" /><asp:Label ID="lbl_DMS_Q4_9" runat="server"></asp:Label>
                        </li>
                    </ul>
                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_DMS_Q4_10" runat="server" OnClick="javascript:DMS_Q4();" /><asp:Label ID="lbl_DMS_Q4_10" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_DMS_Q4_11" runat="server" OnClick="javascript:DMS_Q4();" /><asp:Label ID="lbl_DMS_Q4_11" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_DMS_Q4_12" runat="server" OnClick="javascript:DMS_Q4();" /><asp:Label ID="lbl_DMS_Q4_12" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_DMS_Q4_13" runat="server" OnClick="javascript:DMS_Q4();" /><asp:Label ID="lbl_DMS_Q4_13" runat="server"></asp:Label>
                        </li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td class="q">If ANY criteria are met, score 1; otherwise, continue.
                </td>
                <td class="q">If BOTH criteria are met, continue; otherwise, score 1. 
                </td>
                <td class="q">If ALL criteria are met, continue; otherwise score 3.
                </td>
                <td class="q">If ALL criteria are met, score 7; otherwise, score 5.
                </td>
            </tr>
            <tr>
                <td class="scoring" colspan="4">Score:<asp:Label ID="lblScore_DMS_Q4" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <%--<tr>            
             <td class="d" aria-orientation="horizontal" colspan="4">
                <asp:RadioButtonList ID="chkScore_DMS_Q4" runat="server" RepeatDirection="Horizontal" Width="100%" ValidationGroup="Val1">
                   <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required-(E1, IR 2)" ControlToValidate="chkScore_DMS_Q4" ValidationGroup="Val1"></asp:RequiredFieldValidator>
            </td>
            </tr>--%>
            <tr>
                <td class="d">
                    <asp:RadioButton ID="chkScore_DMS_Q4_1" GroupName="chkScore_DMS_Q4" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_DMS_Q4_1" runat="server" /><br />--%>
                1<br />
                    Low Quality<br />
                    Program shows no evidence of established data management system.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_DMS_Q4_2" GroupName="chkScore_DMS_Q4" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_DMS_Q4_2" runat="server" /><br />--%>
                3<br />
                    Average Quality<br />
                    Program has a basic data management system that relies primarily on home visitors keeping records and the data is aggregated at least annually.   
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_DMS_Q4_3" GroupName="chkScore_DMS_Q4" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_DMS_Q4_3" runat="server" /><br />--%>
                5<br />
                    Above Average Quality<br />
                    Program uses an electronic data system.  Program has policies and procedures for data collection and has specified guidelines and timelines for ongoing collection of family and program data. Program allocates staff time for data collection.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_DMS_Q4_4" GroupName="chkScore_DMS_Q4" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_DMS_Q4_4" runat="server" /><br />--%>
                7<br />
                    High Quality<br />
                    Program provides training and support related to data collection and analysis. Program data management system has dedicated staff responsible for oversight and monitoring, and provides feedback regarding data quality. Program includes budgeting for data management system/activities.
                </td>
            </tr>
        </table>
    </div>
    <!---------------------------------------------------------------------------------->
    <script type="text/javascript">
        function UOPD_Q5() {
            if (document.getElementById('<%=chk_UOPD_Q5_1.ClientID%>').checked != true
           && document.getElementById('<%=chk_UOPD_Q5_2.ClientID%>').checked == true
           && document.getElementById('<%=chk_UOPD_Q5_3.ClientID%>').checked == true
           && document.getElementById('<%=chk_UOPD_Q5_4.ClientID%>').checked == true
           && document.getElementById('<%=chk_UOPD_Q5_5.ClientID%>').checked == true
           && document.getElementById('<%=chk_UOPD_Q5_6.ClientID%>').checked == true
           && document.getElementById('<%=chk_UOPD_Q5_7.ClientID%>').checked == true
           && document.getElementById('<%=chk_UOPD_Q5_8.ClientID%>').checked == true
           && document.getElementById('<%=chk_UOPD_Q5_9.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_UOPD_Q5.ClientID%>').innerHTML = 7;
            }
            else if ((document.getElementById('<%=chk_UOPD_Q5_1.ClientID%>').checked != true
            && document.getElementById('<%=chk_UOPD_Q5_2.ClientID%>').checked == true
            && document.getElementById('<%=chk_UOPD_Q5_3.ClientID%>').checked == true
            && document.getElementById('<%=chk_UOPD_Q5_4.ClientID%>').checked == true
            && document.getElementById('<%=chk_UOPD_Q5_5.ClientID%>').checked == true
            && document.getElementById('<%=chk_UOPD_Q5_6.ClientID%>').checked == true)
            && (document.getElementById('<%=chk_UOPD_Q5_7.ClientID%>').checked == true
            || document.getElementById('<%=chk_UOPD_Q5_8.ClientID%>').checked == true
            || document.getElementById('<%=chk_UOPD_Q5_9.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_UOPD_Q5.ClientID%>').innerHTML = 5;
            }
            else if (document.getElementById('<%=chk_UOPD_Q5_1.ClientID%>').checked != true
             && document.getElementById('<%=chk_UOPD_Q5_2.ClientID%>').checked == true
            && document.getElementById('<%=chk_UOPD_Q5_3.ClientID%>').checked == true
            && document.getElementById('<%=chk_UOPD_Q5_4.ClientID%>').checked == true
            && document.getElementById('<%=chk_UOPD_Q5_5.ClientID%>').checked == true
            && document.getElementById('<%=chk_UOPD_Q5_6.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_UOPD_Q5.ClientID%>').innerHTML = 5;
            }
            else if ((document.getElementById('<%=chk_UOPD_Q5_1.ClientID%>').checked != true
           && document.getElementById('<%=chk_UOPD_Q5_2.ClientID%>').checked == true
            && ((document.getElementById('<%=chk_UOPD_Q5_3.ClientID%>').checked == true
            && document.getElementById('<%=chk_UOPD_Q5_4.ClientID%>').checked == true)
            && (document.getElementById('<%=chk_UOPD_Q5_5.ClientID%>').checked == true)
            || document.getElementById('<%=chk_UOPD_Q5_6.ClientID%>').checked == true))) {
                document.getElementById('<%=lblScore_UOPD_Q5.ClientID%>').innerHTML = 3;
            }
            else if (document.getElementById('<%=chk_UOPD_Q5_1.ClientID%>').checked != true
                && document.getElementById('<%=chk_UOPD_Q5_2.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_UOPD_Q5.ClientID%>').innerHTML = 3;
            }

            else if (document.getElementById('<%=chk_UOPD_Q5_1.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_UOPD_Q5.ClientID%>').innerHTML = 1;
            }
            else {
                document.getElementById('<%=lblScore_UOPD_Q5.ClientID%>').innerHTML = " ";
            }
    var score = 0;
    score = document.getElementById('<%=lblScore_UOPD_Q5.ClientID%>').textContent;
    document.getElementById('<%=hf_UOPD_Q5.ClientID%>').value = score;

            scoring(score, '<%=chkScore_UOPD_Q5_1.ClientID%>', '<%=chkScore_UOPD_Q5_2.ClientID%>',
                '<%=chkScore_UOPD_Q5_3.ClientID%>', '<%=chkScore_UOPD_Q5_4.ClientID%>');
        }
    </script>
    <div style="cursor: pointer;" onclick="javascript:DivClicked('UOPD_Q5');">
        <h3 class="scoringTitle">
            <img src="../Images/edit_add.png" height="40" style="width: 40px" />PROGRAM MONITORING: UTILIZATION OF PROGRAM DATA (Scale E1, IR 3)</h3>
    </div>
    <asp:HiddenField ID="hf_UOPD_Q5" runat="server" />
    <div id="UOPD_Q5" style="display: none;">
        <table class="d">
            <tr>
                <td colspan="4">
                    <h3>SCORING</h3>
                </td>
            </tr>
            <tr>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_UOPD_Q5_1" runat="server" OnClick="javascript:UOPD_Q5();" /><asp:Label ID="lbl_UOPD_Q5_1" runat="server"></asp:Label>
                        </li>
                    </ul>
                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_UOPD_Q5_2" runat="server" OnClick="javascript:UOPD_Q5();" /><asp:Label ID="lbl_UOPD_Q5_2" runat="server"></asp:Label>
                        </li>
                    </ul>
                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_UOPD_Q5_3" runat="server" OnClick="javascript:UOPD_Q5();" /><asp:Label ID="lbl_UOPD_Q5_3" runat="server"></asp:Label>
                            <!--ul-->
                            <ul style="list-style-type: none">
                                <li>
                                    <asp:CheckBox ID="chk_UOPD_Q5_4" runat="server" OnClick="javascript:UOPD_Q5();" /><asp:Label ID="lbl_UOPD_Q5_4" runat="server"></asp:Label>
                                </li>
                                <li>
                                    <asp:CheckBox ID="chk_UOPD_Q5_5" runat="server" OnClick="javascript:UOPD_Q5();" /><asp:Label ID="lbl_UOPD_Q5_5" runat="server"></asp:Label>
                                </li>
                            </ul>
                            <!--ul-->
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_UOPD_Q5_6" runat="server" OnClick="javascript:UOPD_Q5();" /><asp:Label ID="lbl_UOPD_Q5_6" runat="server"></asp:Label>
                        </li>
                    </ul>
                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_UOPD_Q5_7" runat="server" OnClick="javascript:UOPD_Q5();" /><asp:Label ID="lbl_UOPD_Q5_7" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_UOPD_Q5_8" runat="server" OnClick="javascript:UOPD_Q5();" /><asp:Label ID="lbl_UOPD_Q5_8" runat="server"> </asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_UOPD_Q5_9" runat="server" OnClick="javascript:UOPD_Q5();" /><asp:Label ID="lbl_UOPD_Q5_9" runat="server"></asp:Label>
                        </li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td class="q">If the above criterion is met, score 1; otherwise, continue.
                </td>
                <td class="q">If the above criterion is met, continue; otherwise, score 1. 
                </td>
                <td class="q">If BOTH criteria are met, continue; otherwise, score 3. 
                </td>
                <td class="q">If ALL criteria are met, score 7; otherwise, score 5.
                </td>
            </tr>
            <tr>
                <td class="scoring" colspan="4">Score:<asp:Label ID="lblScore_UOPD_Q5" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <%--  <tr>
             <td class="d" aria-orientation="horizontal" colspan="4">
                <asp:RadioButtonList ID="chkScore_UOPD_Q5" runat="server" RepeatDirection="Horizontal" Width="100%" ValidationGroup="Val1">
                   <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required-(E1, IR 3)" ControlToValidate="chkScore_UOPD_Q5" ValidationGroup="Val1"></asp:RequiredFieldValidator>
            </td>
            </tr>--%>
            <tr>
                <td class="d">
                    <asp:RadioButton ID="chkScore_UOPD_Q5_1" GroupName="chkScore_UOPD_Q5" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_UOPD_Q5_1" runat="server" /><br />--%>
                1<br />
                    Low Quality<br />
                    No evidence of ongoing monitoring of program service delivery and consistency.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_UOPD_Q5_2" GroupName="chkScore_UOPD_Q5" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_UOPD_Q5_2" runat="server" /><br />--%>
                3<br />
                    Average Quality<br />
                    Program monitors and reports service delivery on a limited basis. No evidence of using data in program improvement activities.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_UOPD_Q5_3" GroupName="chkScore_UOPD_Q5" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_UOPD_Q5_3" runat="server" /><br />--%>
                5<br />
                    Above Average Quality<br />
                    Program monitors and reports on program service delivery on a semi-annual basis and measures the variation or consistency across families and home visitors.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_UOPD_Q5_4" GroupName="chkScore_UOPD_Q5" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_UOPD_Q5_4" runat="server" /><br />--%>
                7<br />
                    High Quality<br />
                    Program monitors and reports on program service delivery on at least quarterly basis.  Program uses data for quality improvement and to drive decision-making. Program has evidence of using outside evaluators within the last 3 years.
                </td>
            </tr>
        </table>
    </div>

    <!---------------------------------------------------------------------------------->
    <script type="text/javascript">
        function FTPM_Q6() {
            if (document.getElementById('<%=chk_FTPM_Q6_1.ClientID%>').checked != true
           && document.getElementById('<%=chk_FTPM_Q6_2.ClientID%>').checked != true
           && document.getElementById('<%=chk_FTPM_Q6_3.ClientID%>').checked != true
           && document.getElementById('<%=chk_FTPM_Q6_4.ClientID%>').checked != true
           && document.getElementById('<%=chk_FTPM_Q6_5.ClientID%>').checked == true
           && document.getElementById('<%=chk_FTPM_Q6_6.ClientID%>').checked == true
           && document.getElementById('<%=chk_FTPM_Q6_7.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_FTPM_Q6.ClientID%>').innerHTML = 7;
            }

            else if ((document.getElementById('<%=chk_FTPM_Q6_1.ClientID%>').checked != true
            && document.getElementById('<%=chk_FTPM_Q6_2.ClientID%>').checked != true
            && document.getElementById('<%=chk_FTPM_Q6_3.ClientID%>').checked != true
            && document.getElementById('<%=chk_FTPM_Q6_4.ClientID%>').checked != true
            && document.getElementById('<%=chk_FTPM_Q6_5.ClientID%>').checked == true
            && document.getElementById('<%=chk_FTPM_Q6_6.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_FTPM_Q6.ClientID%>').innerHTML = 5;
            }
            else if ((document.getElementById('<%=chk_FTPM_Q6_1.ClientID%>').checked != true
        && document.getElementById('<%=chk_FTPM_Q6_2.ClientID%>').checked != true
            && document.getElementById('<%=chk_FTPM_Q6_3.ClientID%>').checked != true
            && document.getElementById('<%=chk_FTPM_Q6_4.ClientID%>').checked != true)
            && (document.getElementById('<%=chk_FTPM_Q6_5.ClientID%>').checked == true
            || document.getElementById('<%=chk_FTPM_Q6_6.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_FTPM_Q6.ClientID%>').innerHTML = 3;
            }

            else if (document.getElementById('<%=chk_FTPM_Q6_1.ClientID%>').checked != true
        && document.getElementById('<%=chk_FTPM_Q6_2.ClientID%>').checked != true
                && document.getElementById('<%=chk_FTPM_Q6_3.ClientID%>').checked == true
                && document.getElementById('<%=chk_FTPM_Q6_4.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_FTPM_Q6.ClientID%>').innerHTML = 3;
            }
            else if ((document.getElementById('<%=chk_FTPM_Q6_1.ClientID%>').checked != true
            && document.getElementById('<%=chk_FTPM_Q6_2.ClientID%>').checked != true)
                && (document.getElementById('<%=chk_FTPM_Q6_3.ClientID%>').checked == true
                || document.getElementById('<%=chk_FTPM_Q6_4.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_FTPM_Q6.ClientID%>').innerHTML = 3;
            }

            else if (document.getElementById('<%=chk_FTPM_Q6_1.ClientID%>').checked == true
            || document.getElementById('<%=chk_FTPM_Q6_2.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_FTPM_Q6.ClientID%>').innerHTML = 1;
            }
            else {
                document.getElementById('<%=lblScore_FTPM_Q6.ClientID%>').innerHTML = " ";
            }
    var score = 0;
    score = document.getElementById('<%=lblScore_FTPM_Q6.ClientID%>').textContent;
    document.getElementById('<%=hf_FTPM_Q6.ClientID%>').value = score;

            scoring(score, '<%=chkScore_FTPM_Q6_1.ClientID%>', '<%=chkScore_FTPM_Q6_2.ClientID%>',
               '<%=chkScore_FTPM_Q6_3.ClientID%>', '<%=chkScore_FTPM_Q6_4.ClientID%>');
        }
    </script>
    <div style="cursor: pointer;" onclick="javascript:DivClicked('FTPM_Q6');">
        <h3 class="scoringTitle">
            <img src="../Images/edit_add.png" height="40" style="width: 40px" />PROGRAM MODEL: FIDELITY TO PROGRAM MODEL (Scale C1, IR 2)</h3>
    </div>
    <asp:HiddenField ID="hf_FTPM_Q6" runat="server" />
    <div id="FTPM_Q6" style="display: none;">

        <table class="d">
            <tr>
                <td colspan="4">
                    <h3>SCORING</h3>
                </td>
            </tr>
            <tr>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_FTPM_Q6_1" runat="server" OnClick="javascript:FTPM_Q6();" /><asp:Label ID="lbl_FTPM_Q6_1" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_FTPM_Q6_2" runat="server" OnClick="javascript:FTPM_Q6();" /><asp:Label ID="lbl_FTPM_Q6_2" runat="server"></asp:Label>
                        </li>
                    </ul>
                </td>
                <td class="q">Methods of monitoring:
                 <ul style="list-style-type: none">
                     <li>
                         <asp:CheckBox ID="chk_FTPM_Q6_3" runat="server" OnClick="javascript:FTPM_Q6();" /><asp:Label ID="lbl_FTPM_Q6_3" runat="server"></asp:Label>
                     </li>
                 </ul>
                    Frequency of monitoring:
                <ul style="list-style-type: none">
                    <li>
                        <asp:CheckBox ID="chk_FTPM_Q6_4" runat="server" OnClick="javascript:FTPM_Q6();" /><asp:Label ID="lbl_FTPM_Q6_4" runat="server"></asp:Label>
                    </li>
                </ul>
                </td>
                <td class="q">Methods of monitoring:
                 <ul style="list-style-type: none">
                     <li>
                         <asp:CheckBox ID="chk_FTPM_Q6_5" runat="server" OnClick="javascript:FTPM_Q6();" /><asp:Label ID="lbl_FTPM_Q6_5" runat="server"></asp:Label>
                     </li>
                 </ul>
                    Frequency of monitoring:
              <ul style="list-style-type: none">
                  <li>
                      <asp:CheckBox ID="chk_FTPM_Q6_6" runat="server" OnClick="javascript:FTPM_Q6();" /><asp:Label ID="lbl_FTPM_Q6_6" runat="server"></asp:Label>
                  </li>
              </ul>
                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_FTPM_Q6_7" runat="server" OnClick="javascript:FTPM_Q6();" /><asp:Label ID="lbl_FTPM_Q6_7" runat="server"></asp:Label>
                        </li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td class="q">If EITHER criterion is met, score 1; otherwise, continue.
                </td>
                <td class="q">If EITHER criterion is met, score 3; otherwise, continue.
                </td>
                <td class="q">If BOTH criteria are met, continue; otherwise, score 3.
                </td>
                <td class="q">If the above criterion is met, score 7; otherwise, score 5.
                </td>
            </tr>
            <tr>
                <td class="scoring" colspan="4">Score:<asp:Label ID="lblScore_FTPM_Q6" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <%-- <tr>
            <td class="d" aria-orientation="horizontal" colspan="4">
                <asp:RadioButtonList ID="chkScore_FTPM_Q6" runat="server" RepeatDirection="Horizontal" Width="100%" ValidationGroup="Val1">
                   <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Required-(C1, IR 2)" ControlToValidate="chkScore_FTPM_Q6" ValidationGroup="Val1"></asp:RequiredFieldValidator>
            </td>
            </tr>--%>
            <tr>
                <td class="d">
                    <asp:RadioButton ID="chkScore_FTPM_Q6_1" GroupName="chkScore_FTPM_Q6" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_FTPM_Q6_1" runat="server" /><br />--%>
                1<br />
                    Low Quality<br />
                    Program does not identify performance standards or track fidelity to a program model.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_FTPM_Q6_2" GroupName="chkScore_FTPM_Q6" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_FTPM_Q6_2" runat="server" /><br />--%>
                3<br />
                    Average Quality<br />
                    Program model has identified standards, and tracking adherence to standards is at least informally or inconsistently followed.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_FTPM_Q6_3" GroupName="chkScore_FTPM_Q6" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_FTPM_Q6_3" runat="server" /><br />--%>
                5<br />
                    Above Average Quality<br />
                    Program conducts formal monitoring of performance standards, with current (within past year) action plan to correct areas of non-compliance.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_FTPM_Q6_4" GroupName="chkScore_FTPM_Q6" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_FTPM_Q6_4" runat="server" /><br />--%>
                7<br />
                    High Quality<br />
                    Program conducts at least annual monitoring of model performance standards and demonstrates strong compliance with program model.
                </td>
            </tr>
        </table>
    </div>
    <!---------------------------------------------------------------------------------->
    <script type="text/javascript">
        function PPAI_Q7() {

            var add = 0; var add1 = 0; var add2 = 0; var add3 = 0;

            if (document.getElementById('<%=chk_PPAI_Q7_1.ClientID%>').checked == true) {
                ++add;
            }
            if (document.getElementById('<%=chk_PPAI_Q7_2.ClientID%>').checked == true) {
                ++add;
            }
            if (document.getElementById('<%=chk_PPAI_Q7_3.ClientID%>').checked == true) {
                ++add;
            }
            if (document.getElementById('<%=chk_PPAI_Q7_4.ClientID%>').checked == true) {
                ++add;
            }
            if (document.getElementById('<%=chk_PPAI_Q7_5.ClientID%>').checked == true) {
                ++add;
            }
            if (document.getElementById('<%=chk_PPAI_Q7_6.ClientID%>').checked == true) {
                ++add;
            }
            if (document.getElementById('<%=chk_PPAI_Q7_7.ClientID%>').checked == true) {

                if (document.getElementById('<%=chk_PPAI_Q7_8.ClientID%>').checked == true) {
                    ++add2;
                }
                if (document.getElementById('<%=chk_PPAI_Q7_9.ClientID%>').checked == true) {
                    ++add2;
                }
                if (document.getElementById('<%=chk_PPAI_Q7_10.ClientID%>').checked == true) {
                    ++add2;
                }
                if (document.getElementById('<%=chk_PPAI_Q7_11.ClientID%>').checked == true) {
                    ++add2;
                }
                if (document.getElementById('<%=chk_PPAI_Q7_12.ClientID%>').checked == true) {
                    ++add2;
                }
                if (add2 >= 3) {
                    ++add;
                }
            }
            if (document.getElementById('<%=chk_PPAI_Q7_13.ClientID%>').checked == true) {
                ++add;
            }
            if (document.getElementById('<%=chk_PPAI_Q7_14.ClientID%>').checked == true) {
                ++add;
            }

            var s7 = add;
            var s3 = add2;

            if (add >= 8) {
                document.getElementById('<%=lblScore_PPAI_Q7.ClientID%>').innerHTML = 7;
            }

            else if (add >= 5 && add <= 7) {
                document.getElementById('<%=lblScore_PPAI_Q7.ClientID%>').innerHTML = 5;
            }

            else if (add >= 3 && add <= 4) {
                document.getElementById('<%=lblScore_PPAI_Q7.ClientID%>').innerHTML = 3;
            }
            else if (add < 3) {
                document.getElementById('<%=lblScore_PPAI_Q7.ClientID%>').innerHTML = 1;
            }
            else {
                document.getElementById('<%=lblScore_PPAI_Q7.ClientID%>').innerHTML = " ";
            }
    var score = 0;
    score = document.getElementById('<%=lblScore_PPAI_Q7.ClientID%>').textContent;
    document.getElementById('<%=hf_PPAI_Q7.ClientID%>').value = score;

            scoring(score, '<%=chkScore_PPAI_Q7_1.ClientID%>', '<%=chkScore_PPAI_Q7_2.ClientID%>',
              '<%=chkScore_PPAI_Q7_3.ClientID%>', '<%=chkScore_PPAI_Q7_4.ClientID%>');
        }
    </script>
    <div style="cursor: pointer;" onclick="javascript:DivClicked('PPAI_Q7');">
        <h3 class="scoringTitle">
            <img src="../Images/edit_add.png" height="40" style="width: 40px" />LEADERSHIP PRACTICE: PROGRAM PLANNING AND IMPLEMENTATION (Scale D2, IR 1)</h3>
    </div>
    <asp:HiddenField ID="hf_PPAI_Q7" runat="server" />
    <div id="PPAI_Q7" style="display: none;">

        <table class="d">
            <tr>
                <td colspan="4">
                    <h3>SCORING</h3>
                </td>
            </tr>
            <tr>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_PPAI_Q7_1" runat="server" OnClick="javascript:PPAI_Q7();" /><asp:Label ID="lbl_PPAI_Q7_1" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_PPAI_Q7_2" runat="server" OnClick="javascript:PPAI_Q7();" /><asp:Label ID="lbl_PPAI_Q7_2" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_PPAI_Q7_3" runat="server" OnClick="javascript:PPAI_Q7();" /><asp:Label ID="lbl_PPAI_Q7_3" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_PPAI_Q7_4" runat="server" OnClick="javascript:PPAI_Q7();" /><asp:Label ID="lbl_PPAI_Q7_4" runat="server"></asp:Label>
                        </li>
                    </ul>
                    *Review checklists for C1, IR1 & IR2 circle the numbers above.
                <br />
                    <br />
                    Note: Review any documentation available to determine if goals have specific measures determining if/when goals are achieved.
                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_PPAI_Q7_5" runat="server" OnClick="javascript:PPAI_Q7();" /><asp:Label ID="lbl_PPAI_Q7_5" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_PPAI_Q7_6" runat="server" OnClick="javascript:PPAI_Q7();" /><asp:Label ID="lbl_PPAI_Q7_6" runat="server"></asp:Label>
                        </li>
                    </ul>
                    Note: If home visiting program is part of larger agency with a strategic plan, this plan must include specific goals for home visiting program.
                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_PPAI_Q7_7" runat="server" /><asp:Label ID="lbl_PPAI_Q7_7" runat="server"></asp:Label>
                            <ul style="list-style-type: none">
                                <li>
                                    <asp:CheckBox ID="chk_PPAI_Q7_8" runat="server" OnClick="javascript:PPAI_Q7();" /><asp:Label ID="lbl_PPAI_Q7_8" runat="server"></asp:Label>
                                </li>
                                <li>
                                    <asp:CheckBox ID="chk_PPAI_Q7_9" runat="server" OnClick="javascript:PPAI_Q7();" /><asp:Label ID="lbl_PPAI_Q7_9" runat="server"></asp:Label>
                                </li>
                                <li>
                                    <asp:CheckBox ID="chk_PPAI_Q7_10" runat="server" OnClick="javascript:PPAI_Q7();" /><asp:Label ID="lbl_PPAI_Q7_10" runat="server"></asp:Label></li>
                                <li>
                                    <asp:CheckBox ID="chk_PPAI_Q7_11" runat="server" OnClick="javascript:PPAI_Q7();" /><asp:Label ID="lbl_PPAI_Q7_11" runat="server"></asp:Label></li>
                                <li>
                                    <asp:CheckBox ID="chk_PPAI_Q7_12" runat="server" OnClick="javascript:PPAI_Q7();" /><asp:Label ID="lbl_PPAI_Q7_12" runat="server"></asp:Label></li>
                            </ul>
                        </li>

                    </ul>
                    Note: Must include at least three of the above
                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_PPAI_Q7_13" runat="server" OnClick="javascript:PPAI_Q7();" /><asp:Label ID="lbl_PPAI_Q7_13" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_PPAI_Q7_14" runat="server" OnClick="javascript:PPAI_Q7();" /><asp:Label ID="lbl_PPAI_Q7_14" runat="server"></asp:Label>
                            <br />
                            Note example:<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td class="q">If <3 of the above criteria are met, score 1.
                </td>
                <td class="q">If 3-4 of the criteria are met, score 3. 
                </td>
                <td class="q">If 5-7 of the criteria are met, score 5.
                </td>
                <td class="q">If ≥8 of the above criteria are met, score 7.
                </td>
            </tr>
            <tr>
                <td class="scoring" colspan="4">Score:<asp:Label ID="lblScore_PPAI_Q7" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <%-- <tr>
             <td class="d" aria-orientation="horizontal" colspan="4">
                <asp:RadioButtonList ID="chkScore_PPAI_Q7" runat="server" RepeatDirection="Horizontal" Width="100%" ValidationGroup="Val1">
                   <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Required-(D2, IR 1)" ControlToValidate="chkScore_PPAI_Q7" ValidationGroup="Val1"></asp:RequiredFieldValidator>
            </td>
            </tr>--%>
            <tr>
                <td class="d">
                    <asp:RadioButton ID="chkScore_PPAI_Q7_1" GroupName="chkScore_PPAI_Q7" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_PPAI_Q7_1" runat="server" /><br />--%>
                1<br />
                    Low Quality<br />
                    Management staff have minimal skills in program planning.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_PPAI_Q7_2" GroupName="chkScore_PPAI_Q7" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_PPAI_Q7_2" runat="server" /><br />--%>
                3<br />
                    Average Quality<br />
                    Management staff show some skills in program planning.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_PPAI_Q7_3" GroupName="chkScore_PPAI_Q7" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_PPAI_Q7_3" runat="server" /><br />--%>
                5<br />
                    Above Average Quality<br />
                    Management staff have solid skills in program planning.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_PPAI_Q7_4" GroupName="chkScore_PPAI_Q7" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_PPAI_Q7_4" runat="server" /><br />--%>
                7<br />
                    High Quality<br />
                    Management staff have advanced skills in program planning.
                </td>
            </tr>
        </table>
    </div>
    <!---------------------------------------------------------------------------------->
    <script type="text/javascript">
        function GFTSP_Q8() {
            if (document.getElementById('<%=chk_GFTSP_Q8_1.ClientID%>').checked != true
           && document.getElementById('<%=chk_GFTSP_Q8_2.ClientID%>').checked != true
           && document.getElementById('<%=chk_GFTSP_Q8_3.ClientID%>').checked != true
           && document.getElementById('<%=chk_GFTSP_Q8_4.ClientID%>').checked == true
           && document.getElementById('<%=chk_GFTSP_Q8_5.ClientID%>').checked == true
           && document.getElementById('<%=chk_GFTSP_Q8_6.ClientID%>').checked == true
           && document.getElementById('<%=chk_GFTSP_Q8_7.ClientID%>').checked == true
           && document.getElementById('<%=chk_GFTSP_Q8_8.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_GFTSP_Q8.ClientID%>').innerHTML = 7;
            }
            else if ((document.getElementById('<%=chk_GFTSP_Q8_1.ClientID%>').checked != true
            && document.getElementById('<%=chk_GFTSP_Q8_2.ClientID%>').checked != true
            && document.getElementById('<%=chk_GFTSP_Q8_3.ClientID%>').checked != true
            && document.getElementById('<%=chk_GFTSP_Q8_4.ClientID%>').checked == true
            && document.getElementById('<%=chk_GFTSP_Q8_5.ClientID%>').checked == true
            && document.getElementById('<%=chk_GFTSP_Q8_6.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_GFTSP_Q8.ClientID%>').innerHTML = 5;
            }
            else if (document.getElementById('<%=chk_GFTSP_Q8_1.ClientID%>').checked != true
           && document.getElementById('<%=chk_GFTSP_Q8_2.ClientID%>').checked != true
            && document.getElementById('<%=chk_GFTSP_Q8_3.ClientID%>').checked != true
            && document.getElementById('<%=chk_GFTSP_Q8_4.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_GFTSP_Q8.ClientID%>').innerHTML = 3;
            }


            else if (document.getElementById('<%=chk_GFTSP_Q8_1.ClientID%>').checked == true
            || document.getElementById('<%=chk_GFTSP_Q8_2.ClientID%>').checked == true
            || document.getElementById('<%=chk_GFTSP_Q8_3.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_GFTSP_Q8.ClientID%>').innerHTML = 1;
            }
            else {
                document.getElementById('<%=lblScore_GFTSP_Q8.ClientID%>').innerHTML = " ";
            }
    var score = 0;
    score = document.getElementById('<%=lblScore_GFTSP_Q8.ClientID%>').textContent;
    document.getElementById('<%=hf_GFTSP_Q8.ClientID%>').value = score;

            scoring(score, '<%=chkScore_GFTSP_Q8_1.ClientID%>', '<%=chkScore_GFTSP_Q8_2.ClientID%>',
             '<%=chkScore_GFTSP_Q8_3.ClientID%>', '<%=chkScore_GFTSP_Q8_4.ClientID%>');
        }
    </script>
    <div style="cursor: pointer;" onclick="javascript:DivClicked('GFTSP_Q8');">
        <h3 class="scoringTitle">
            <img src="../Images/edit_add.png" height="40" style="width: 40px" />PROGRAM RECRUITMENT AND ENROLLMENT: GUIDELINES FOR TARGET SERVICE POPULATION (Scale B1, IR 1)</h3>
    </div>
    <asp:HiddenField ID="hf_GFTSP_Q8" runat="server" />
    <div id="GFTSP_Q8" style="display: none;">
        <table class="d">
            <tr>
                <td colspan="4">
                    <h3>SCORING</h3>
                </td>
            </tr>
            <tr>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_GFTSP_Q8_1" runat="server" OnClick="javascript:GFTSP_Q8();" /><asp:Label ID="lbl_GFTSP_Q8_1" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_GFTSP_Q8_2" runat="server" OnClick="javascript:GFTSP_Q8();" /><asp:Label ID="lbl_GFTSP_Q8_2" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_GFTSP_Q8_3" runat="server" OnClick="javascript:GFTSP_Q8();" /><asp:Label ID="lbl_GFTSP_Q8_3" runat="server"></asp:Label>
                        </li>
                    </ul>

                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_GFTSP_Q8_4" runat="server" OnClick="javascript:GFTSP_Q8();" /><asp:Label ID="lbl_GFTSP_Q8_4" runat="server"></asp:Label>
                        </li>
                    </ul>
                    &nbsp;</td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_GFTSP_Q8_5" runat="server" OnClick="javascript:GFTSP_Q8();" /><asp:Label ID="lbl_GFTSP_Q8_5" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_GFTSP_Q8_6" runat="server" OnClick="javascript:GFTSP_Q8();" /><asp:Label ID="lbl_GFTSP_Q8_6" runat="server"></asp:Label>
                        </li>

                    </ul>
                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_GFTSP_Q8_7" runat="server" OnClick="javascript:GFTSP_Q8();" /><asp:Label ID="lbl_GFTSP_Q8_7" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_GFTSP_Q8_8" runat="server" OnClick="javascript:GFTSP_Q8();" /><asp:Label ID="lbl_GFTSP_Q8_8" runat="server"></asp:Label>
                        </li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td class="q">If ANY criteria are met, score 1; otherwise, continue.
                </td>
                <td class="q">If the above criterion is met, continue; otherwise, score 1.
                </td>
                <td class="q">If BOTH criteria are met, continue; otherwise, score 3.
                </td>
                <td class="q">If BOTH criteria are met, score 7; otherwise, score 5.
                </td>
            </tr>
            <tr>
                <td class="scoring" colspan="4">Score:<asp:Label ID="lblScore_GFTSP_Q8" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <%--  <tr>
            <td class="d" aria-orientation="horizontal" colspan="4">
                <asp:RadioButtonList ID="chkScore_GFTSP_Q8" runat="server" RepeatDirection="Horizontal" Width="100%" ValidationGroup="Val1">
                   <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Required-(B1, IR 1)" ControlToValidate="chkScore_GFTSP_Q8" ValidationGroup="Val1"></asp:RequiredFieldValidator>
            </td>
            </tr>--%>
            <tr>
                <td class="d">
                    <asp:RadioButton ID="chkScore_GFTSP_Q8_1" GroupName="chkScore_GFTSP_Q8" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_GFTSP_Q8_1" runat="server" /><br />--%>
                1<br />
                    Low Quality<br />
                    No specific guidelines for recruitment or goals for enrollment (or tracking of goals) OR <85% of families reflect recruitment and enrollment guidelines.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_GFTSP_Q8_2" GroupName="chkScore_GFTSP_Q8" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_GFTSP_Q8_2" runat="server" /><br />--%>
                3<br />
                    Average Quality<br />
                    ≥85% of enrolled families reflect recruitment and enrollment guidelines.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_GFTSP_Q8_3" GroupName="chkScore_GFTSP_Q8" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_GFTSP_Q8_3" runat="server" /><br />--%>
                5<br />
                    Above Average Quality<br />
                    100% of enrolled families reflect recruitment and enrollment guidelines and utilize a weighted system of eligibility based on highest need.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_GFTSP_Q8_4" GroupName="chkScore_GFTSP_Q8" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_GFTSP_Q8_4" runat="server" /><br />--%>
                7<br />
                    High Quality<br />
                    100% of enrolled families reflect recruitment and enrollment guidelines. Weighted eligibility system is specific to community needs.
                </td>
            </tr>
        </table>
    </div>

    <!---------------------------------------------------------------------------------->
    <script type="text/javascript">
        function AIFN_Q9() {
            if (document.getElementById('<%=chk_AIFN_Q9_1.ClientID%>').checked != true
           && document.getElementById('<%=chk_AIFN_Q9_2.ClientID%>').checked != true
           && document.getElementById('<%=chk_AIFN_Q9_3.ClientID%>').checked != true
           && document.getElementById('<%=chk_AIFN_Q9_4.ClientID%>').checked != true
           && document.getElementById('<%=chk_AIFN_Q9_5.ClientID%>').checked == true
           && document.getElementById('<%=chk_AIFN_Q9_6.ClientID%>').checked == true
           && document.getElementById('<%=chk_AIFN_Q9_7.ClientID%>').checked == true
           && document.getElementById('<%=chk_AIFN_Q9_7.ClientID%>').checked == true
           && document.getElementById('<%=chk_AIFN_Q9_8.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_AIFN_Q9.ClientID%>').innerHTML = 7;
            }
            else if ((document.getElementById('<%=chk_AIFN_Q9_1.ClientID%>').checked != true
            && document.getElementById('<%=chk_AIFN_Q9_2.ClientID%>').checked != true
            && document.getElementById('<%=chk_AIFN_Q9_3.ClientID%>').checked != true
            && document.getElementById('<%=chk_AIFN_Q9_4.ClientID%>').checked != true
            && document.getElementById('<%=chk_AIFN_Q9_5.ClientID%>').checked == true)
            && (document.getElementById('<%=chk_AIFN_Q9_6.ClientID%>').checked == true
            || document.getElementById('<%=chk_AIFN_Q9_7.ClientID%>').checked == true
            || document.getElementById('<%=chk_AIFN_Q9_8.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_AIFN_Q9.ClientID%>').innerHTML = 5;
            }
            else if ((document.getElementById('<%=chk_AIFN_Q9_1.ClientID%>').checked != true
            && document.getElementById('<%=chk_AIFN_Q9_2.ClientID%>').checked != true
            && document.getElementById('<%=chk_AIFN_Q9_3.ClientID%>').checked != true
            && document.getElementById('<%=chk_AIFN_Q9_4.ClientID%>').checked != true)
            && (document.getElementById('<%=chk_AIFN_Q9_5.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_AIFN_Q9.ClientID%>').innerHTML = 5;
            }

            else if ((document.getElementById('<%=chk_AIFN_Q9_1.ClientID%>').checked != true)
           && (document.getElementById('<%=chk_AIFN_Q9_2.ClientID%>').checked == true
            || document.getElementById('<%=chk_AIFN_Q9_3.ClientID%>').checked == true
            || document.getElementById('<%=chk_AIFN_Q9_4.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_AIFN_Q9.ClientID%>').innerHTML = 3;
            }


            else if (document.getElementById('<%=chk_AIFN_Q9_1.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_AIFN_Q9.ClientID%>').innerHTML = 1;
            }
            else {
                document.getElementById('<%=lblScore_AIFN_Q9.ClientID%>').innerHTML = " ";
            }
    var score = 0;
    score = document.getElementById('<%=lblScore_AIFN_Q9.ClientID%>').textContent;
    document.getElementById('<%=hf_AIFN_Q9.ClientID%>').value = score;

            scoring(score, '<%=chkScore_AIFN_Q9_1.ClientID%>', '<%=chkScore_AIFN_Q9_2.ClientID%>',
             '<%=chkScore_AIFN_Q9_3.ClientID%>', '<%=chkScore_AIFN_Q9_4.ClientID%>');
        }
    </script>
    <div style="cursor: pointer;" onclick="javascript:DivClicked('AIFN_Q9');">
        <h3 class="scoringTitle">
            <img src="../Images/edit_add.png" height="40" style="width: 40px" />SERVICES TAILORED TO FAMILY STRENGTHS AND NEEDS: ASSESSING INDIVIDUAL FAMILY NEEDS (Scale C4, IR 1)</h3>
    </div>
    <asp:HiddenField ID="hf_AIFN_Q9" runat="server" />
    <div id="AIFN_Q9" style="display: none;">

        <table class="d">
            <tr>
                <td colspan="4">
                    <h3>SCORING</h3>
                </td>
            </tr>
            <tr>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_AIFN_Q9_1" runat="server" OnClick="javascript:AIFN_Q9();" /><asp:Label ID="lbl_AIFN_Q9_1" runat="server"></asp:Label>
                        </li>
                    </ul>

                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_AIFN_Q9_2" runat="server" OnClick="javascript:AIFN_Q9();" /><asp:Label ID="lbl_AIFN_Q9_2" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_AIFN_Q9_3" runat="server" OnClick="javascript:AIFN_Q9();" /><asp:Label ID="lbl_AIFN_Q9_3" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_AIFN_Q9_4" runat="server" OnClick="javascript:AIFN_Q9();" /><asp:Label ID="lbl_AIFN_Q9_4" runat="server"></asp:Label>
                        </li>
                    </ul>
                    &nbsp;</td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_AIFN_Q9_5" runat="server" OnClick="javascript:AIFN_Q9();" /><asp:Label ID="lbl_AIFN_Q9_5" runat="server"></asp:Label>
                        </li>

                    </ul>
                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_AIFN_Q9_6" runat="server" OnClick="javascript:AIFN_Q9();" /><asp:Label ID="lbl_AIFN_Q9_6" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_AIFN_Q9_7" runat="server" OnClick="javascript:AIFN_Q9();" /><asp:Label ID="lbl_AIFN_Q9_7" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_AIFN_Q9_8" runat="server" OnClick="javascript:AIFN_Q9();" /><asp:Label ID="lbl_AIFN_Q9_8" runat="server"></asp:Label>
                        </li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td class="q">If the above criterion is met, score 1; otherwise, continue.

                </td>
                <td class="q">If ANY criteria are met, score 3; otherwise, continue.
                </td>
                <td class="q">If the above criterion is met, continue; otherwise, score 3.
                </td>
                <td class="q">If ALL criteria are met, score 7; otherwise, score 5.
                </td>
            </tr>
            <tr>
                <td class="scoring" colspan="4">Score:<asp:Label ID="lblScore_AIFN_Q9" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <%--  <tr>
            <td class="d" aria-orientation="horizontal" colspan="4">
                <asp:RadioButtonList ID="chkScore_AIFN_Q9" runat="server" RepeatDirection="Horizontal" Width="100%" ValidationGroup="Val1">
                   <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Required-(C4, IR 1)" ControlToValidate="chkScore_AIFN_Q9" ValidationGroup="Val1"></asp:RequiredFieldValidator>
            </td>
            </tr>--%>
            <tr>
                <td class="d">
                    <asp:RadioButton ID="chkScore_AIFN_Q9_1" GroupName="chkScore_AIFN_Q9" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_AIFN_Q9_1" runat="server" /><br />--%>
                1<br />
                    Low Quality<br />
                    Program does not have a process in place for monitoring family needs.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_AIFN_Q9_2" GroupName="chkScore_AIFN_Q9" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_AIFN_Q9_2" runat="server" /><br />--%>
              3<br />
                    Average Quality<br />
                    Limited family needs assessments are conducted.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_AIFN_Q9_3" GroupName="chkScore_AIFN_Q9" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_AIFN_Q9_3" runat="server" /><br />--%>
               5<br />
                    Above Average Quality<br />
                    Comprehensive family needs assessments are conducted at least annually.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_AIFN_Q9_4" GroupName="chkScore_AIFN_Q9" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_AIFN_Q9_4" runat="server" /><br />--%>
                7<br />
                    High Quality<br />
                    Family needs assessments are monitored on an ongoing basis, including both risk and protective factors, and are actively used to tailor services.  
                </td>
            </tr>
        </table>
    </div>
    <!---------------------------------------------------------------------------------->
    <script type="text/javascript">
        function GFSI_Q10() {
            if (document.getElementById('<%=chk_GFSI_Q10_4.ClientID%>').checked == true
         && document.getElementById('<%=chk_GFSI_Q10_5.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_GFSI_Q10.ClientID%>').innerHTML = 7;
                document.getElementById('<%=chk_GFSI_Q10_1.ClientID%>').checked = false;
                document.getElementById('<%=chk_GFSI_Q10_2.ClientID%>').checked = false;
                document.getElementById('<%=chk_GFSI_Q10_3.ClientID%>').checked = false;
            }
            else if (document.getElementById('<%=chk_GFSI_Q10_4.ClientID%>').checked == true
            || document.getElementById('<%=chk_GFSI_Q10_5.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_GFSI_Q10.ClientID%>').innerHTML = 5;
                document.getElementById('<%=chk_GFSI_Q10_1.ClientID%>').checked = false;
                document.getElementById('<%=chk_GFSI_Q10_2.ClientID%>').checked = false;
                document.getElementById('<%=chk_GFSI_Q10_3.ClientID%>').checked = false;
            }
            else if (document.getElementById('<%=chk_GFSI_Q10_3.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_GFSI_Q10.ClientID%>').innerHTML = 5;
                document.getElementById('<%=chk_GFSI_Q10_1.ClientID%>').checked = false;
                document.getElementById('<%=chk_GFSI_Q10_2.ClientID%>').checked = false;
                document.getElementById('<%=chk_GFSI_Q10_4.ClientID%>').checked = false;
                document.getElementById('<%=chk_GFSI_Q10_5.ClientID%>').checked = false;
            }
            else if (document.getElementById('<%=chk_GFSI_Q10_2.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_GFSI_Q10.ClientID%>').innerHTML = 3;
                    document.getElementById('<%=chk_GFSI_Q10_1.ClientID%>').checked = false;
                    document.getElementById('<%=chk_GFSI_Q10_3.ClientID%>').checked = false;
                    document.getElementById('<%=chk_GFSI_Q10_4.ClientID%>').checked = false;
                    document.getElementById('<%=chk_GFSI_Q10_5.ClientID%>').checked = false;
                }
                else if (document.getElementById('<%=chk_GFSI_Q10_1.ClientID%>').checked == true) {
                    document.getElementById('<%=lblScore_GFSI_Q10.ClientID%>').innerHTML = 1;
                    document.getElementById('<%=chk_GFSI_Q10_2.ClientID%>').checked = false;
                    document.getElementById('<%=chk_GFSI_Q10_3.ClientID%>').checked = false;
                    document.getElementById('<%=chk_GFSI_Q10_4.ClientID%>').checked = false;
                    document.getElementById('<%=chk_GFSI_Q10_5.ClientID%>').checked = false;
                }
                else {
                    document.getElementById('<%=lblScore_GFSI_Q10.ClientID%>').innerHTML = " ";
                }
    var score = 0;
    score = document.getElementById('<%=lblScore_GFSI_Q10.ClientID%>').textContent;
    document.getElementById('<%=hf_GFSI_Q10.ClientID%>').value = score;

            scoring(score, '<%=chkScore_GFSI_Q10_1.ClientID%>', '<%=chkScore_GFSI_Q10_2.ClientID%>',
             '<%=chkScore_GFSI_Q10_3.ClientID%>', '<%=chkScore_GFSI_Q10_4.ClientID%>');
        }
    </script>
    <div style="cursor: pointer;" onclick="javascript:DivClicked('GFSI_Q10');">
        <h3 class="scoringTitle">
            <img src="../Images/edit_add.png" height="40" style="width: 40px" />PROGRAM RECRUITMENT AND ENROLLMENT: GUIDELINES FOR SERVICE INITIATION (Scale B1, IR 2)</h3>
    </div>
    <asp:HiddenField ID="hf_GFSI_Q10" runat="server" />
    <div id="GFSI_Q10" style="display: none;">

        <table class="d">
            <tr>
                <td colspan="4">
                    <h3>SCORING</h3>
                </td>
            </tr>
            <tr>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_GFSI_Q10_1" runat="server" OnClick="javascript:GFSI_Q10();" /><asp:Label ID="lbl_GFSI_Q10_1" runat="server"></asp:Label>
                        </li>
                    </ul>

                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_GFSI_Q10_2" runat="server" OnClick="javascript:GFSI_Q10();" /><asp:Label ID="lbl_GFSI_Q10_2" runat="server"></asp:Label>
                        </li>
                    </ul>
                    &nbsp;</td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_GFSI_Q10_3" runat="server" OnClick="javascript:GFSI_Q10();" /><asp:Label ID="lbl_GFSI_Q10_3" runat="server"></asp:Label>
                        </li>

                    </ul>
                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_GFSI_Q10_4" runat="server" OnClick="javascript:GFSI_Q10();" /><asp:Label ID="lbl_GFSI_Q10_4" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_GFSI_Q10_5" runat="server" OnClick="javascript:GFSI_Q10();" /><asp:Label ID="lbl_GFSI_Q10_5" runat="server"></asp:Label>
                        </li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td class="q">If the above criterion is met, score 1; otherwise, continue.

                </td>
                <td class="q">If the above criterion is met, score 3; otherwise, continue.
                </td>
                <td class="q">If the above criterion is met, score 5; otherwise, continue.
                </td>
                <td class="q">Both criteria are met, score 7; otherwise score 5.
                </td>
            </tr>
            <tr>
                <td class="scoring" colspan="4">Score:<asp:Label ID="lblScore_GFSI_Q10" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <%--  <tr>
             <td class="d" aria-orientation="horizontal" colspan="4">
                <asp:RadioButtonList ID="chkScore_GFSI_Q10" runat="server" RepeatDirection="Horizontal" Width="100%" ValidationGroup="Val1">
                   <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Required-(B1, IR 2)" ControlToValidate="chkScore_GFSI_Q10" ValidationGroup="Val1"></asp:RequiredFieldValidator>
            </td>
            </tr>--%>
            <tr>
                <td class="d">
                    <asp:RadioButton ID="chkScore_GFSI_Q10_1" GroupName="chkScore_GFSI_Q10" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_GFSI_Q10_1" runat="server" /><br />--%>
                1<br />
                    Low Quality<br />
                    No guidelines for time and services to be offered between family agreement to participate and initiation of regularly scheduled visits.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_GFSI_Q10_2" GroupName="chkScore_GFSI_Q10" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_GFSI_Q10_2" runat="server" /><br />--%>
                3<br />
                    Average Quality<br />
                    Informal and flexible guidelines for time and services to be offered between family agreement to participate and initiation of regularly scheduled visits.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_GFSI_Q10_3" GroupName="chkScore_GFSI_Q10" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_GFSI_Q10_3" runat="server" /><br />--%>
               5<br />
                    Above Average Quality<br />
                    Formal but general written guidelines for time and services to be offered between family agreement to participate and initiation of regularly scheduled visits.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_GFSI_Q10_4" GroupName="chkScore_GFSI_Q10" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_GFSI_Q10_4" runat="server" /><br />--%>
                7<br />
                    High Quality<br />
                    Formal, specific, and comprehensive written guidelines for time and services to be offered between family agreement to participate and initiation of regularly scheduled visits. Program monitors and measures compliance with guidelines.
                </td>
            </tr>
        </table>
    </div>

    <!---------------------------------------------------------------------------------->
    <script type="text/javascript">
        function SI_Q11() {
            if (document.getElementById('<%=chk_SI_Q11_7.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_SI_Q11.ClientID%>').innerHTML = 7;
            }

            else if (document.getElementById('<%=chk_SI_Q11_5.ClientID%>').checked == true
               && document.getElementById('<%=chk_SI_Q11_6.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_SI_Q11.ClientID%>').innerHTML = 5;
            }

            else if (document.getElementById('<%=chk_SI_Q11_5.ClientID%>').checked == true
                   || document.getElementById('<%=chk_SI_Q11_6.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_SI_Q11.ClientID%>').innerHTML = 3;
            }
            else if (document.getElementById('<%=chk_SI_Q11_3.ClientID%>').checked == true
           && document.getElementById('<%=chk_SI_Q11_4.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_SI_Q11.ClientID%>').innerHTML = 3;
            }
            else if (document.getElementById('<%=chk_SI_Q11_3.ClientID%>').checked == true
      || document.getElementById('<%=chk_SI_Q11_4.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_SI_Q11.ClientID%>').innerHTML = 1;
            }

            else if (document.getElementById('<%=chk_SI_Q11_1.ClientID%>').checked == true
                || document.getElementById('<%=chk_SI_Q11_2.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_SI_Q11.ClientID%>').innerHTML = 1;
            }
            else {
                document.getElementById('<%=lblScore_SI_Q11.ClientID%>').innerHTML = " ";
            }
    var score = 0;
    score = document.getElementById('<%=lblScore_SI_Q11.ClientID%>').textContent;
    document.getElementById('<%=hf_SI_Q11.ClientID%>').value = score;

            scoring(score, '<%=chkScore_SI_Q11_1.ClientID%>', '<%=chkScore_SI_Q11_2.ClientID%>',
             '<%=chkScore_SI_Q11_3.ClientID%>', '<%=chkScore_SI_Q11_4.ClientID%>');
        }
    </script>
    <div style="cursor: pointer;" onclick="javascript:DivClicked('SI_Q11');">
        <h3 class="scoringTitle">
            <img src="../Images/edit_add.png" height="40" style="width: 40px" />PROGRAM RECRUITMENT AND ENROLLMENT: SERVICE INITIATION (Scale B1, IR 3)</h3>
    </div>
    <asp:HiddenField ID="hf_SI_Q11" runat="server" />
    <div id="SI_Q11" style="display: none;">
        <table class="d">
            <tr>
                <td colspan="4">
                    <h3>SCORING</h3>
                </td>
            </tr>
            <tr>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_SI_Q11_1" runat="server" OnClick="javascript:SI_Q11();" /><asp:Label ID="lbl_SI_Q11_1" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_SI_Q11_2" runat="server" OnClick="javascript:SI_Q11();" /><asp:Label ID="lbl_SI_Q11_2" runat="server"></asp:Label>
                        </li>
                    </ul>

                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_SI_Q11_3" runat="server" OnClick="javascript:SI_Q11();" /><asp:Label ID="lbl_SI_Q11_3" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_SI_Q11_4" runat="server" OnClick="javascript:SI_Q11();" /><asp:Label ID="lbl_SI_Q11_4" runat="server"></asp:Label>
                        </li>
                    </ul>
                    &nbsp;</td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_SI_Q11_5" runat="server" OnClick="javascript:SI_Q11();" /><asp:Label ID="lbl_SI_Q11_5" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_SI_Q11_6" runat="server" OnClick="javascript:SI_Q11();" /><asp:Label ID="lbl_SI_Q11_6" runat="server"></asp:Label>
                        </li>

                    </ul>
                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_SI_Q11_7" runat="server" OnClick="javascript:SI_Q11();" /><asp:Label ID="lbl_SI_Q11_7" runat="server"></asp:Label>
                        </li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td class="q">If EITHER criterion is met, score 1; otherwise, continue. </td>
                <td class="q">If BOTH criteria are met, score 3;  otherwise, score 1.</td>
                <td class="q">If BOTH criteria are met, score 5; otherwise, score 3.</td>
                <td class="q">If the above criterion is met, score 7;  otherwise, score 5.</td>
            </tr>
            <tr>
                <td class="scoring" colspan="4">Score:<asp:Label ID="lblScore_SI_Q11" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <%--<tr>
            <td class="d" aria-orientation="horizontal" colspan="4">
                <asp:RadioButtonList ID="chkScore_SI_Q11" runat="server" RepeatDirection="Horizontal" Width="100%" ValidationGroup="Val1">
                   <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Required-(B1, IR 3)" ControlToValidate="chkScore_SI_Q11" ValidationGroup="Val1"></asp:RequiredFieldValidator>
            </td>
            </tr>--%>
            <tr>
                <td class="d">
                    <asp:RadioButton ID="chkScore_SI_Q11_1" GroupName="chkScore_SI_Q11" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_SI_Q11_1" runat="server" /><br />--%>
                1<br />
                    Low Quality<br />
                    >50% of families have more than one month of no service between agreeing to participate and initiation of regularly scheduled visits OR No program data available to assess indicator.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_SI_Q11_2" GroupName="chkScore_SI_Q11" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_SI_Q11_2" runat="server" /><br />--%>
              3<br />
                    Average Quality<br />
                    ≥50% of families initiate regularly scheduled visits within one month of agreeing to participate.  Families with longer gaps receive at least one standard service during this period (e.g. standard resource guides or written information).
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_SI_Q11_3" GroupName="chkScore_SI_Q11" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_SI_Q11_3" runat="server" /><br />--%>
               5<br />
                    Above Average Quality<br />
                    ≥75% of families initiate regularly scheduled visits within one month of agreeing to participate. Families with longer gaps receive partial or individualized alternative services (e.g. phone calls, e-mails, individualized resource guides and written information)
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_SI_Q11_4" GroupName="chkScore_SI_Q11" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_SI_Q11_4" runat="server" /><br />--%>
                7<br />
                    High Quality<br />
                    ≥90% of families initiate regularly scheduled visits within one month of agreeing to participate.
                </td>
            </tr>
        </table>
    </div>
    <!---------------------------------------------------------------------------------->
    <script type="text/javascript">
        function PS_Q12() {
            if (document.getElementById('<%=chk_PS_Q12_1.ClientID%>').checked != true
           && document.getElementById('<%=chk_PS_Q12_2.ClientID%>').checked != true
           && document.getElementById('<%=chk_PS_Q12_3.ClientID%>').checked != true
           && document.getElementById('<%=chk_PS_Q12_4.ClientID%>').checked == true
           && document.getElementById('<%=chk_PS_Q12_5.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_PS_Q12.ClientID%>').innerHTML = 7;
            }
            else if (document.getElementById('<%=chk_PS_Q12_1.ClientID%>').checked != true
           && document.getElementById('<%=chk_PS_Q12_2.ClientID%>').checked != true
           && document.getElementById('<%=chk_PS_Q12_3.ClientID%>').checked != true
           && document.getElementById('<%=chk_PS_Q12_4.ClientID%>').checked == true
           && document.getElementById('<%=chk_PS_Q12_5.ClientID%>').checked != true) {
                document.getElementById('<%=lblScore_PS_Q12.ClientID%>').innerHTML = 5;
            }
            else if (document.getElementById('<%=chk_PS_Q12_1.ClientID%>').checked != true
            && document.getElementById('<%=chk_PS_Q12_2.ClientID%>').checked != true
            && document.getElementById('<%=chk_PS_Q12_3.ClientID%>').checked != true
            && document.getElementById('<%=chk_PS_Q12_4.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_PS_Q12.ClientID%>').innerHTML = 5;
            }
            else if (document.getElementById('<%=chk_PS_Q12_1.ClientID%>').checked != true
        && document.getElementById('<%=chk_PS_Q12_2.ClientID%>').checked != true
            && document.getElementById('<%=chk_PS_Q12_3.ClientID%>').checked != true
            && document.getElementById('<%=chk_PS_Q12_4.ClientID%>').checked != true) {
                document.getElementById('<%=lblScore_PS_Q12.ClientID%>').innerHTML = 3;
            }
            else if (document.getElementById('<%=chk_PS_Q12_1.ClientID%>').checked != true
           && document.getElementById('<%=chk_PS_Q12_2.ClientID%>').checked != true
            && document.getElementById('<%=chk_PS_Q12_3.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_PS_Q12.ClientID%>').innerHTML = 3;
            }

            else if (document.getElementById('<%=chk_PS_Q12_1.ClientID%>').checked == true
                || document.getElementById('<%=chk_PS_Q12_2.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_PS_Q12.ClientID%>').innerHTML = 1;
            }
            else {
                document.getElementById('<%=lblScore_PS_Q12.ClientID%>').innerHTML = " ";
            }
    var score = 0;
    score = document.getElementById('<%=lblScore_PS_Q12.ClientID%>').textContent;

    scoring(score, '<%=chkScore_PS_Q12_1.ClientID%>', '<%=chkScore_PS_Q12_2.ClientID%>',
                             '<%=chkScore_PS_Q12_3.ClientID%>', '<%=chkScore_PS_Q12_4.ClientID%>');
}
    </script>
    <div style="cursor: pointer;" onclick="javascript:DivClicked('PS_Q12');">
        <h3 class="scoringTitle">
            <img src="../Images/edit_add.png" height="40" style="width: 40px" />PRENATAL ENROLLMENT: PRENATAL SERVICES (Scale B2, IR 1)</h3>
    </div>
    <div id="PS_Q12" style="display: none;">
        <table class="d">
            <tr>
                <td colspan="4">
                    <h3>SCORING</h3>
                </td>
            </tr>
            <tr>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_PS_Q12_1" runat="server" OnClick="javascript:PS_Q12();" /><asp:Label ID="lbl_PS_Q12_1" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_PS_Q12_2" runat="server" OnClick="javascript:PS_Q12();" /><asp:Label ID="lbl_PS_Q12_2" runat="server"></asp:Label>
                        </li>
                    </ul>

                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_PS_Q12_3" runat="server" OnClick="javascript:PS_Q12();" /><asp:Label ID="lbl_PS_Q12_3" runat="server"></asp:Label>
                        </li>

                    </ul>
                    &nbsp;</td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_PS_Q12_4" runat="server" OnClick="javascript:PS_Q12();" /><asp:Label ID="lbl_PS_Q12_4" runat="server"></asp:Label>
                        </li>

                    </ul>
                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_PS_Q12_5" runat="server" OnClick="javascript:PS_Q12();" /><asp:Label ID="lbl_PS_Q12_5" runat="server"></asp:Label>
                        </li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td class="q">If EITHER criterion is met, score 1; otherwise, continue. 
                </td>
                <td class="q">If the above criterion is met, score 3; otherwise, continue.
                </td>
                <td class="q">If the above criterion is met, continue; otherwise, score 3.
                </td>
                <td class="q">If the above criterion is met, score 7; otherwise, score 5.
                </td>
            </tr>
            <tr>
                <td class="scoring" colspan="4">Score:<asp:Label ID="lblScore_PS_Q12" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <%-- <tr>
             <td class="d" aria-orientation="horizontal" colspan="4">
                <asp:RadioButtonList ID="chkScore_PS_Q12" runat="server" RepeatDirection="Horizontal" Width="100%" ValidationGroup="Val1">
                   <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Required-(B2, IR 1)" ControlToValidate="chkScore_PS_Q12" ValidationGroup="Val1"></asp:RequiredFieldValidator>
            </td>
            </tr>--%>
            <tr>
                <td class="d">
                    <asp:RadioButton ID="chkScore_PS_Q12_1" GroupName="chkScore_PS_Q12" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_PS_Q12_1" runat="server" /><br />--%>
                1<br />
                    Low Quality<br />
                    Program does not offer prenatal support services or coordinate with other prenatal services.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_PS_Q12_2" GroupName="chkScore_PS_Q12" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_PS_Q12_2" runat="server" /><br />--%>
                3<br />
                    Average Quality<br />
                    Program offers at least some prenatal support services (e.g., educational groups), but may not be at same frequency level as postnatal services OR program coordinates with prenatal support services or prenatal group based program.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_PS_Q12_3" GroupName="chkScore_PS_Q12" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_PS_Q12_3" runat="server" /><br />--%>
                5<br />
                    Above Average Quality<br />
                    Program offers prenatal home visiting services at the same frequency (or higher) as post-natal home visiting.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_PS_Q12_4" GroupName="chkScore_PS_Q12" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_PS_Q12_4" runat="server" /><br />--%>
                7<br />
                    High Quality<br />
                    Program has seamless transition to post-natal home visiting by having the same home visitor the mother had prenatally.
                </td>
            </tr>
        </table>
    </div>

    <!---------------------------------------------------------------------------------->
    <script type="text/javascript">
        function POFEP_Q13() {
            var c = false;
            if (document.getElementById('<%=chk_POFEP_Q13_5.ClientID%>').checked == true) {
                c = true;
                document.getElementById('<%=lblScore_POFEP_Q13.ClientID%>').innerHTML = 7;
                document.getElementById('<%=chk_POFEP_Q13_4.ClientID%>').checked = false;
                document.getElementById('<%=chk_POFEP_Q13_3.ClientID%>').checked = false;
                document.getElementById('<%=chk_POFEP_Q13_1.ClientID%>').checked = false;
                document.getElementById('<%=chk_POFEP_Q13_2.ClientID%>').checked = false;
            }
            if (document.getElementById('<%=chk_POFEP_Q13_4.ClientID%>').checked == true) {
                c = true;
                document.getElementById('<%=lblScore_POFEP_Q13.ClientID%>').innerHTML = 5;
                document.getElementById('<%=chk_POFEP_Q13_5.ClientID%>').checked = false;
                document.getElementById('<%=chk_POFEP_Q13_3.ClientID%>').checked = false;
                document.getElementById('<%=chk_POFEP_Q13_1.ClientID%>').checked = false;
                document.getElementById('<%=chk_POFEP_Q13_2.ClientID%>').checked = false;
            }
            if (document.getElementById('<%=chk_POFEP_Q13_3.ClientID%>').checked == true) {
                c = true;
                document.getElementById('<%=lblScore_POFEP_Q13.ClientID%>').innerHTML = 3;
                document.getElementById('<%=chk_POFEP_Q13_5.ClientID%>').checked = false;
                document.getElementById('<%=chk_POFEP_Q13_4.ClientID%>').checked = false;
                document.getElementById('<%=chk_POFEP_Q13_1.ClientID%>').checked = false;
                document.getElementById('<%=chk_POFEP_Q13_2.ClientID%>').checked = false;
            }

            if (document.getElementById('<%=chk_POFEP_Q13_1.ClientID%>').checked == true
                || document.getElementById('<%=chk_POFEP_Q13_2.ClientID%>').checked == true) {
                c = true;
                document.getElementById('<%=lblScore_POFEP_Q13.ClientID%>').innerHTML = 1;
                document.getElementById('<%=chk_POFEP_Q13_4.ClientID%>').checked = false;
                document.getElementById('<%=chk_POFEP_Q13_3.ClientID%>').checked = false;
            }
            if (c == false) {
                document.getElementById('<%=lblScore_POFEP_Q13.ClientID%>').innerHTML = " ";
            }
            var score = 0;
            score = document.getElementById('<%=lblScore_POFEP_Q13.ClientID%>').textContent;


            scoring(score, '<%=chkScore_POFEP_Q13_1.ClientID%>', '<%=chkScore_POFEP_Q13_2.ClientID%>',
           '<%=chkScore_POFEP_Q13_3.ClientID%>', '<%=chkScore_POFEP_Q13_4.ClientID%>');
        }
    </script>
    <div style="cursor: pointer;" onclick="javascript:DivClicked('POFEP_Q13');">
        <h3 class="scoringTitle">
            <img src="../Images/edit_add.png" height="40" style="width: 40px" />PRENATAL ENROLLMENT: PERCENTAGE OF FAMILIES ENROLLING PRENATALLY (Scale B2, IR 2)</h3>
    </div>
    <div id="POFEP_Q13" style="display: none;">
        <table class="d">
            <tr>
                <td colspan="4">
                    <h3>SCORING</h3>
                </td>
            </tr>
            <tr>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_POFEP_Q13_1" runat="server" OnClick="javascript:POFEP_Q13();" /><asp:Label ID="lbl_POFEP_Q13_1" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_POFEP_Q13_2" runat="server" OnClick="javascript:POFEP_Q13();" /><asp:Label ID="lbl_POFEP_Q13_2" runat="server"></asp:Label>
                        </li>
                    </ul>

                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_POFEP_Q13_3" runat="server" OnClick="javascript:POFEP_Q13();" /><asp:Label ID="lbl_POFEP_Q13_3" runat="server"></asp:Label>
                        </li>

                    </ul>
                    &nbsp;</td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_POFEP_Q13_4" runat="server" OnClick="javascript:POFEP_Q13();" /><asp:Label ID="lbl_POFEP_Q13_4" runat="server"></asp:Label>
                        </li>

                    </ul>
                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_POFEP_Q13_5" runat="server" OnClick="javascript:POFEP_Q13();" /><asp:Label ID="lbl_POFEP_Q13_5" runat="server"></asp:Label>
                        </li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td class="q">If EITHER criteria are met, score 1; otherwise, continue.
                </td>
                <td class="q">If the above criterion is met, score 3; otherwise, continue.
                </td>
                <td class="q">If the above criterion is met, score 5; otherwise, continue.
                </td>
                <td class="q">If the above criterion is met, score 7.
                </td>
            </tr>
            <tr>
                <td class="scoring" colspan="4">Score:<asp:Label ID="lblScore_POFEP_Q13" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <%--<tr>
             <td class="d" aria-orientation="horizontal" colspan="4">
                <asp:RadioButtonList ID="chkScore_POFEP_Q13" runat="server" RepeatDirection="Horizontal" Width="100%" ValidationGroup="Val1">
                   <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="Required-(B2, IR 2)" ControlToValidate="chkScore_POFEP_Q13" ValidationGroup="Val1"></asp:RequiredFieldValidator>
            </td>
            </tr>--%>
            <tr>
                <td class="d">
                    <asp:RadioButton ID="chkScore_POFEP_Q13_1" GroupName="chkScore_POFEP_Q13" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_POFEP_Q13_1" runat="server" /><br />--%>
                1<br />
                    Low Quality<br />
                    < 20% of program participants enrolled prenatally or transitioned from prenatal support services.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_POFEP_Q13_2" GroupName="chkScore_POFEP_Q13" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_POFEP_Q13_2" runat="server" /><br />--%>
              3<br />
                    Average Quality<br />
                    ≥20% of program participants enrolled prenatally OR transitioned from collaborating prenatal support services to home visiting services (or currently receiving prenatal support services from collaborating agency).
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_POFEP_Q13_3" GroupName="chkScore_POFEP_Q13" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_POFEP_Q13_3" runat="server" /><br />--%>
               5<br />
                    Above Average Quality<br />
                    ≥50% of program participants enrolled prenatally OR transitioned from collaborating prenatal support services to home visiting services (or currently receiving prenatal support services from collaborating agency).
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_POFEP_Q13_4" GroupName="chkScore_POFEP_Q13" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_POFEP_Q13_4" runat="server" /><br />--%>
                7<br />
                    High Quality<br />
                    ≥80% of program participants enrolled prenatally OR transitioned from collaborating prenatal support services to home visiting services (or currently receiving prenatal support services from collaborating agency).
                </td>
            </tr>
        </table>
    </div>
    <!---------------------------------------------------------------------------------->
    <script type="text/javascript">
        function FOV_Q14() {
            if (document.getElementById('<%=chk_FOV_Q14_6.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_FOV_Q14.ClientID%>').innerHTML = 7;
                document.getElementById('<%=chk_FOV_Q14_1.ClientID%>').checked = false;
            }
            else if (document.getElementById('<%=chk_FOV_Q14_3.ClientID%>').checked == true
            && document.getElementById('<%=chk_FOV_Q14_4.ClientID%>').checked == true
            && document.getElementById('<%=chk_FOV_Q14_5.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_FOV_Q14.ClientID%>').innerHTML = 5;
                document.getElementById('<%=chk_FOV_Q14_1.ClientID%>').checked = false;
            }
            else if (document.getElementById('<%=chk_FOV_Q14_3.ClientID%>').checked == true
            || document.getElementById('<%=chk_FOV_Q14_4.ClientID%>').checked == true
            || document.getElementById('<%=chk_FOV_Q14_5.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_FOV_Q14.ClientID%>').innerHTML = 3;
                document.getElementById('<%=chk_FOV_Q14_1.ClientID%>').checked = false;

                document.getElementById('<%=chk_FOV_Q14_6.ClientID%>').checked = false;
            }

            else if (document.getElementById('<%=chk_FOV_Q14_1.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_FOV_Q14.ClientID%>').innerHTML = 1;
                document.getElementById('<%=chk_FOV_Q14_3.ClientID%>').checked = false;
                document.getElementById('<%=chk_FOV_Q14_4.ClientID%>').checked = false;
                document.getElementById('<%=chk_FOV_Q14_5.ClientID%>').checked = false;
                document.getElementById('<%=chk_FOV_Q14_6.ClientID%>').checked = false;
            }
            else {
                document.getElementById('<%=lblScore_FOV_Q14.ClientID%>').innerHTML = " ";
            }
    var score = 0;
    score = document.getElementById('<%=lblScore_FOV_Q14.ClientID%>').textContent;


    scoring(score, '<%=chkScore_FOV_Q14_1.ClientID%>', '<%=chkScore_FOV_Q14_2.ClientID%>',
                           '<%=chkScore_FOV_Q14_3.ClientID%>', '<%=chkScore_FOV_Q14_4.ClientID%>');
}
    </script>
    <div style="cursor: pointer;" onclick="javascript:DivClicked('FOV_Q14');">
        <h3 class="scoringTitle">
            <img src="../Images/edit_add.png" height="40" style="width: 40px" />FREQUENCY AND LENGTH OF SERVICES: FREQUENCY OF VISITS (Scale B3, IR 1)</h3>
    </div>
    <div id="FOV_Q14" style="display: none;">
        <table class="d">
            <tr>
                <td colspan="4">
                    <h3>SCORING</h3>
                </td>
            </tr>
            <tr>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_FOV_Q14_1" runat="server" OnClick="javascript:FOV_Q14();" /><asp:Label ID="lbl_FOV_Q14_1" runat="server"></asp:Label>
                        </li>
                    </ul>
                </td>
                <%--<td class="q">
                <ul style="list-style-type: none">
                    <li>
                        <asp:CheckBox ID="chk_FOV_Q14_2" runat="server" OnClick="javascript:FOV_Q14();"/><asp:Label ID="lbl_FOV_Q14_2" runat="server"></asp:Label>
                    </li>   
                                                   
                </ul>
                &nbsp;</td>--%>
                <td class="q" colspan="2">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_FOV_Q14_3" runat="server" OnClick="javascript:FOV_Q14();" /><asp:Label ID="lbl_FOV_Q14_3" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_FOV_Q14_4" runat="server" OnClick="javascript:FOV_Q14();" /><asp:Label ID="lbl_FOV_Q14_4" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_FOV_Q14_5" runat="server" OnClick="javascript:FOV_Q14();" /><asp:Label ID="lbl_FOV_Q14_5" runat="server"></asp:Label>
                        </li>

                    </ul>
                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_FOV_Q14_6" runat="server" OnClick="javascript:FOV_Q14();" /><asp:Label ID="lbl_FOV_Q14_6" runat="server"></asp:Label>
                        </li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td class="q">If the above criterion is met, score 1; otherwise, continue.
                </td>
                <%--<td class="q">If the above criterion is met, score 3; otherwise, continue.
            </td>--%>
                <td class="q" colspan="2">If ALL criteria are met, continue; otherwise, score 3.
                </td>
                <td class="q">If the above criterion is met, score 7; otherwise, continue.
                </td>
            </tr>
            <tr>
                <td class="scoring" colspan="4">Score:<asp:Label ID="lblScore_FOV_Q14" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <%--<tr>
            <td class="d" aria-orientation="horizontal" colspan="4">
                <asp:RadioButtonList ID="chkScore_FOV_Q14" runat="server" RepeatDirection="Horizontal" Width="100%" ValidationGroup="Val1">
                   <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="Required-(B2, IR 2)" ControlToValidate="chkScore_FOV_Q14" ValidationGroup="Val1"></asp:RequiredFieldValidator>
            </td>
            </tr>--%>
            <tr>
                <td class="d">
                    <asp:RadioButton ID="chkScore_FOV_Q14_1" GroupName="chkScore_FOV_Q14" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_FOV_Q14_1" runat="server" /><br />--%>
                1<br />
                    Low Quality<br />
                    Intended visits are less than monthly for >25% of families.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_FOV_Q14_2" GroupName="chkScore_FOV_Q14" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_FOV_Q14_2" runat="server" /><br />--%>
              3<br />
                    Average Quality<br />
                    Intended visits are at least monthly for ≥75% of families.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_FOV_Q14_3" GroupName="chkScore_FOV_Q14" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_FOV_Q14_2" runat="server" /><br />--%>
               5<br />
                    Above Average Quality<br />
                    Intended visits are at least monthly for ≥90% of families and more than monthly for > 70% of families. Intended visits are intensive (more than twice per month) for families in need of extra services.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_FOV_Q14_4" GroupName="chkScore_FOV_Q14" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_FOV_Q14_4" runat="server" /><br />--%>
                7<br />
                    High Quality<br />
                    Intended visits are more than monthly for ≥90% of families.
                </td>
            </tr>
        </table>
    </div>
    <!---------------------------------------------------------------------------------->
    <script type="text/javascript">
        function POIVC_Q15() {
            if (document.getElementById('<%=chk_POIVC_Q15_5.ClientID%>').checked == true
           || document.getElementById('<%=chk_POIVC_Q15_6.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_POIVC_Q15.ClientID%>').innerHTML = 7;
                document.getElementById('<%=chk_POIVC_Q15_1.ClientID%>').checked = false;
                document.getElementById('<%=chk_POIVC_Q15_2.ClientID%>').checked = false;
                document.getElementById('<%=chk_POIVC_Q15_3.ClientID%>').checked = false;
                document.getElementById('<%=chk_POIVC_Q15_4.ClientID%>').checked = false;
            }
            else if (document.getElementById('<%=chk_POIVC_Q15_3.ClientID%>').checked == true
            || document.getElementById('<%=chk_POIVC_Q15_4.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_POIVC_Q15.ClientID%>').innerHTML = 5;
                document.getElementById('<%=chk_POIVC_Q15_1.ClientID%>').checked = false;
                document.getElementById('<%=chk_POIVC_Q15_2.ClientID%>').checked = false;
                document.getElementById('<%=chk_POIVC_Q15_5.ClientID%>').checked = false;
                document.getElementById('<%=chk_POIVC_Q15_6.ClientID%>').checked = false;
            }
            else if (document.getElementById('<%=chk_POIVC_Q15_2.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_POIVC_Q15.ClientID%>').innerHTML = 3;
                document.getElementById('<%=chk_POIVC_Q15_1.ClientID%>').checked = false;
                document.getElementById('<%=chk_POIVC_Q15_3.ClientID%>').checked = false;
                document.getElementById('<%=chk_POIVC_Q15_4.ClientID%>').checked = false;
                document.getElementById('<%=chk_POIVC_Q15_5.ClientID%>').checked = false;
                document.getElementById('<%=chk_POIVC_Q15_6.ClientID%>').checked = false;
            }

            else if (document.getElementById('<%=chk_POIVC_Q15_1.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_POIVC_Q15.ClientID%>').innerHTML = 1;
                document.getElementById('<%=chk_POIVC_Q15_2.ClientID%>').checked = false;
                document.getElementById('<%=chk_POIVC_Q15_3.ClientID%>').checked = false;
                document.getElementById('<%=chk_POIVC_Q15_4.ClientID%>').checked = false;
                document.getElementById('<%=chk_POIVC_Q15_5.ClientID%>').checked = false;
                document.getElementById('<%=chk_POIVC_Q15_6.ClientID%>').checked = false;
            }
            else {
                document.getElementById('<%=lblScore_POIVC_Q15.ClientID%>').innerHTML = " ";
            }
    var score = 0;
    score = document.getElementById('<%=lblScore_POIVC_Q15.ClientID%>').textContent;


    scoring(score, '<%=chkScore_POIVC_Q15_1.ClientID%>', '<%=chkScore_POIVC_Q15_2.ClientID%>',
                           '<%=chkScore_POIVC_Q15_3.ClientID%>', '<%=chkScore_POIVC_Q15_4.ClientID%>');
}
    </script>
    <div style="cursor: pointer;" onclick="javascript:DivClicked('POIVC_Q15');">
        <h3 class="scoringTitle">
            <img src="../Images/edit_add.png" height="40" style="width: 40px" />FREQUENCY AND LENGTH OF SERVICES: PERCENTAGE OF INTENDED VISITS COMPLETED (Scale B3, IR 2)</h3>
    </div>
    <div id="POIVC_Q15" style="display: none;">
        <table class="d">
            <tr>
                <td colspan="4">
                    <h3>SCORING</h3>
                </td>
            </tr>
            <tr>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_POIVC_Q15_1" runat="server" OnClick="javascript:POIVC_Q15();" /><asp:Label ID="lbl_POIVC_Q15_1" runat="server"></asp:Label>
                        </li>

                    </ul>

                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_POIVC_Q15_2" runat="server" OnClick="javascript:POIVC_Q15();" /><asp:Label ID="lbl_POIVC_Q15_2" runat="server"></asp:Label>
                        </li>

                    </ul>
                    &nbsp;</td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_POIVC_Q15_3" runat="server" OnClick="javascript:POIVC_Q15();" /><asp:Label ID="lbl_POIVC_Q15_3" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_POIVC_Q15_4" runat="server" OnClick="javascript:POIVC_Q15();" /><asp:Label ID="lbl_POIVC_Q15_4" runat="server"></asp:Label>
                        </li>
                    </ul>
                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_POIVC_Q15_5" runat="server" OnClick="javascript:POIVC_Q15();" /><asp:Label ID="lbl_POIVC_Q15_5" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_POIVC_Q15_6" runat="server" OnClick="javascript:POIVC_Q15();" /><asp:Label ID="lbl_POIVC_Q15_6" runat="server"></asp:Label>
                        </li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td class="q">If the above criterion is met, score 1; otherwise, continue.
                </td>
                <td class="q">If the above criterion is met, score 3; otherwise, continue.
                </td>
                <td class="q">If EITHER criterion is met, score 5; otherwise, continue.
                </td>
                <td class="q">If EITHER criterion is met, score 7.
                </td>
            </tr>
            <tr>
                <td class="scoring" colspan="4">Score:<asp:Label ID="lblScore_POIVC_Q15" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <%--<tr>
             <td class="d" aria-orientation="horizontal" colspan="4">
                <asp:RadioButtonList ID="chkScore_POIVC_Q15" runat="server" RepeatDirection="Horizontal" Width="100%" ValidationGroup="Val1">
                   <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="Required-(B3, IR 2)" ControlToValidate="chkScore_POIVC_Q15" ValidationGroup="Val1"></asp:RequiredFieldValidator>
            </td>
            </tr>--%>
            <tr>
                <td class="d">
                    <asp:RadioButton ID="chkScore_POIVC_Q15_1" GroupName="chkScore_POIVC_Q15" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_POIVC_Q15_1" runat="server" /><br />--%>
                1<br />
                    Low Quality<br />
                    <30% of intended visits are completed.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_POIVC_Q15_2" GroupName="chkScore_POIVC_Q15" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_POIVC_Q15_2" runat="server" /><br />--%>
              3<br />
                    Average Quality<br />
                    ≥30% of intended visits are completed.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_POIVC_Q15_3" GroupName="chkScore_POIVC_Q15" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_POIVC_Q15_3" runat="server" /><br />--%>
               5<br />
                    Above Average Quality<br />
                    ≥60% of intended visits are completed.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_POIVC_Q15_4" GroupName="chkScore_POIVC_Q15" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_POIVC_Q15_4" runat="server" /><br />--%>
                7<br />
                    High Quality<br />
                    ≥75% of intended visits are completed.
                </td>
            </tr>
        </table>
    </div>
    <!---------------------------------------------------------------------------------->
    <script type="text/javascript">
        function LOE_Q16() {
            if (document.getElementById('<%=chk_LOE_Q16_7.ClientID%>').checked == true
           || document.getElementById('<%=chk_LOE_Q16_8.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_LOE_Q16.ClientID%>').innerHTML = 7;
                document.getElementById('<%=chk_LOE_Q16_1.ClientID%>').checked = false;
                document.getElementById('<%=chk_LOE_Q16_2.ClientID%>').checked = false;
                document.getElementById('<%=chk_LOE_Q16_3.ClientID%>').checked = false;
                document.getElementById('<%=chk_LOE_Q16_4.ClientID%>').checked = false;
                document.getElementById('<%=chk_LOE_Q16_5.ClientID%>').checked = false;
                document.getElementById('<%=chk_LOE_Q16_6.ClientID%>').checked = false;
            }
            else if (document.getElementById('<%=chk_LOE_Q16_5.ClientID%>').checked == true
            || document.getElementById('<%=chk_LOE_Q16_6.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_LOE_Q16.ClientID%>').innerHTML = 5;
                document.getElementById('<%=chk_LOE_Q16_1.ClientID%>').checked = false;
                document.getElementById('<%=chk_LOE_Q16_2.ClientID%>').checked = false;
                document.getElementById('<%=chk_LOE_Q16_3.ClientID%>').checked = false;
                document.getElementById('<%=chk_LOE_Q16_4.ClientID%>').checked = false;
                document.getElementById('<%=chk_LOE_Q16_7.ClientID%>').checked = false;
                document.getElementById('<%=chk_LOE_Q16_8.ClientID%>').checked = false;
            }
            else if (document.getElementById('<%=chk_LOE_Q16_3.ClientID%>').checked == true
           || document.getElementById('<%=chk_LOE_Q16_4.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_LOE_Q16.ClientID%>').innerHTML = 3;
                document.getElementById('<%=chk_LOE_Q16_1.ClientID%>').checked = false;
                document.getElementById('<%=chk_LOE_Q16_2.ClientID%>').checked = false;
                document.getElementById('<%=chk_LOE_Q16_5.ClientID%>').checked = false;
                document.getElementById('<%=chk_LOE_Q16_6.ClientID%>').checked = false;
                document.getElementById('<%=chk_LOE_Q16_8.ClientID%>').checked = false;
            }

            else if (document.getElementById('<%=chk_LOE_Q16_1.ClientID%>').checked == true
                || document.getElementById('<%=chk_LOE_Q16_2.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_LOE_Q16.ClientID%>').innerHTML = 1;
                document.getElementById('<%=chk_LOE_Q16_3.ClientID%>').checked = false;
                document.getElementById('<%=chk_LOE_Q16_4.ClientID%>').checked = false;
                document.getElementById('<%=chk_LOE_Q16_5.ClientID%>').checked = false;
                document.getElementById('<%=chk_LOE_Q16_6.ClientID%>').checked = false;
                document.getElementById('<%=chk_LOE_Q16_7.ClientID%>').checked = false;
                document.getElementById('<%=chk_LOE_Q16_8.ClientID%>').checked = false;
            }
            else {
                document.getElementById('<%=lblScore_LOE_Q16.ClientID%>').innerHTML = " ";
            }
    var score = 0;
    score = document.getElementById('<%=lblScore_LOE_Q16.ClientID%>').textContent;


    scoring(score, '<%=chkScore_LOE_Q16_1.ClientID%>', '<%=chkScore_LOE_Q16_2.ClientID%>',
                            '<%=chkScore_LOE_Q16_3.ClientID%>', '<%=chkScore_LOE_Q16_4.ClientID%>');
}
    </script>
    <div style="cursor: pointer;" onclick="javascript:DivClicked('LOE_Q16');">
        <h3 class="scoringTitle">
            <img src="../Images/edit_add.png" height="40" style="width: 40px" />FREQUENCY AND LENGTH OF SERVICES: LENGTH OF ENROLLMENT (Scale B3, IR 3)</h3>
    </div>
    <div id="LOE_Q16" style="display: none;">
        <table class="d">
            <tr>
                <td colspan="4">
                    <h3>SCORING</h3>
                </td>
            </tr>
            <tr>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_LOE_Q16_1" runat="server" OnClick="javascript:LOE_Q16();" /><asp:Label ID="lbl_LOE_Q16_1" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_LOE_Q16_2" runat="server" OnClick="javascript:LOE_Q16();" /><asp:Label ID="lbl_LOE_Q16_2" runat="server"></asp:Label>
                        </li>
                    </ul>

                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_LOE_Q16_3" runat="server" OnClick="javascript:LOE_Q16();" /><asp:Label ID="lbl_LOE_Q16_3" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_LOE_Q16_4" runat="server" OnClick="javascript:LOE_Q16();" /><asp:Label ID="lbl_LOE_Q16_4" runat="server"></asp:Label>
                        </li>
                    </ul>
                    &nbsp;</td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_LOE_Q16_5" runat="server" OnClick="javascript:LOE_Q16();" /><asp:Label ID="lbl_LOE_Q16_5" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_LOE_Q16_6" runat="server" OnClick="javascript:LOE_Q16();" /><asp:Label ID="lbl_LOE_Q16_6" runat="server"></asp:Label>
                        </li>
                    </ul>
                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_LOE_Q16_7" runat="server" OnClick="javascript:LOE_Q16();" /><asp:Label ID="lbl_LOE_Q16_7" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_LOE_Q16_8" runat="server" OnClick="javascript:LOE_Q16();" /><asp:Label ID="lbl_LOE_Q16_8" runat="server"></asp:Label>
                        </li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td class="q">If either criterion is met, score 1; otherwise, continue.
                </td>
                <td class="q">If either criterion is met, score 3; otherwise, continue.
                </td>
                <td class="q">If either criterion is met, score 5; otherwise, continue.
                </td>
                <td class="q">If either criterion is met, score 7.
                </td>
            </tr>
            <tr>
                <td class="scoring" colspan="4">Score:<asp:Label ID="lblScore_LOE_Q16" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <%--<tr>
            <td class="d" aria-orientation="horizontal" colspan="4">
                <asp:RadioButtonList ID="chkScore_LOE_Q16" runat="server" RepeatDirection="Horizontal" Width="100%" ValidationGroup="Val1">
                   <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ErrorMessage="Required-(B3, IR 3)" ControlToValidate="chkScore_LOE_Q16" ValidationGroup="Val1"></asp:RequiredFieldValidator>
            </td>
            </tr>--%>
            <tr>
                <td class="d">
                    <asp:RadioButton ID="chkScore_LOE_Q16_1" GroupName="chkScore_LOE_Q16" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_LOE_Q16_1" runat="server" /><br />--%>
                1<br />
                    Low Quality<br />
                    >50% of families have only minimal time (≤5 months) in program after official enrollment.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_LOE_Q16_2" GroupName="chkScore_LOE_Q16" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_LOE_Q16_2" runat="server" /><br />--%>
              3<br />
                    Average Quality<br />
                    ≥50% of families remain in program for at least 6 months.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_LOE_Q16_3" GroupName="chkScore_LOE_Q16" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_LOE_Q16_3" runat="server" /><br />--%>
               5<br />
                    Above Average Quality<br />
                    ≥75% of families remain in program for at least 13 months.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_LOE_Q16_4" GroupName="chkScore_LOE_Q16" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_LOE_Q16_4" runat="server" /><br />--%>
                7<br />
                    High Quality<br />
                    ≥75% of families remain in program for at least 19 months.
                </td>
            </tr>
        </table>
    </div>

    <!---------------------------------------------------------------------------------->
    <script type="text/javascript">
        function GAPFTP_Q17() {
            if (document.getElementById('<%=chk_GAPFTP_Q17_1.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_GAPFTP_Q17.ClientID%>').innerHTML = 1;
            }
            else if (document.getElementById('<%=chk_GAPFTP_Q17_2.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_GAPFTP_Q17.ClientID%>').innerHTML = 3;
            }
            else if (document.getElementById('<%=chk_GAPFTP_Q17_3.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_GAPFTP_Q17.ClientID%>').innerHTML = 5;
            }

            else if (document.getElementById('<%=chk_GAPFTP_Q17_4.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_GAPFTP_Q17.ClientID%>').innerHTML = 7;
             }
             else {
                 document.getElementById('<%=lblScore_GAPFTP_Q17.ClientID%>').innerHTML = " ";
             }
    var score = 0;
    score = document.getElementById('<%=lblScore_GAPFTP_Q17.ClientID%>').textContent;


    scoring(score, '<%=chkScore_GAPFTP_Q17_1.ClientID%>', '<%=chkScore_GAPFTP_Q17_2.ClientID%>',
                           '<%=chkScore_GAPFTP_Q17_3.ClientID%>', '<%=chkScore_GAPFTP_Q17_4.ClientID%>');
}
    </script>
    <div style="cursor: pointer;" onclick="javascript:DivClicked('GAPFTP_Q17');">
        <h3 class="scoringTitle">
            <img src="../Images/edit_add.png" height="40" style="width: 40px" />TRANSITION PLANS: GUIDELINES AND POLICIES FOR TRANSITION PLANS (Scale B5, IR 1)</h3>
    </div>
    <div id="GAPFTP_Q17" style="display: none;">
        <table class="d">
            <tr>
                <td colspan="4">
                    <h3>SCORING</h3>
                </td>
            </tr>
            <tr>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_GAPFTP_Q17_1" runat="server" OnClick="javascript:GAPFTP_Q17();" /><asp:Label ID="lbl_GAPFTP_Q17_1" runat="server"></asp:Label>
                        </li>
                    </ul>

                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_GAPFTP_Q17_2" runat="server" OnClick="javascript:GAPFTP_Q17();" /><asp:Label ID="lbl_GAPFTP_Q17_2" runat="server"></asp:Label>
                        </li>
                    </ul>
                    &nbsp;</td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_GAPFTP_Q17_3" runat="server" OnClick="javascript:GAPFTP_Q17();" /><asp:Label ID="lbl_GAPFTP_Q17_3" runat="server"></asp:Label>
                        </li>

                    </ul>
                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_GAPFTP_Q17_4" runat="server" OnClick="javascript:GAPFTP_Q17();" /><asp:Label ID="lbl_GAPFTP_Q17_4" runat="server"></asp:Label>
                        </li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td class="q">If the above criterion is met, score 1; otherwise, continue.
                </td>
                <td class="q">If the above criterion is met, score 3; otherwise, continue.
                </td>
                <td class="q">If the above criterion is met, score 5; otherwise, continue.
                </td>
                <td class="q">If the above criterion is met, score 7.
                </td>
            </tr>
            <tr>
                <td class="scoring" colspan="4">Score:<asp:Label ID="lblScore_GAPFTP_Q17" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <%--<tr>
             <td class="d" aria-orientation="horizontal" colspan="4">
                <asp:RadioButtonList ID="chkScore_GAPFTP_Q17" runat="server" RepeatDirection="Horizontal" Width="100%" ValidationGroup="Val1">
                   <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ErrorMessage="Required-(B5, IR 1)" ControlToValidate="chkScore_GAPFTP_Q17" ValidationGroup="Val1"></asp:RequiredFieldValidator>
            </td>
            </tr>--%>
            <tr>
                <td class="d">
                    <asp:RadioButton ID="chkScore_GAPFTP_Q17_1" GroupName="chkScore_GAPFTP_Q17" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_GAPFTP_Q17_1" runat="server" /><br />--%>
                1<br />
                    Low Quality<br />
                    Program does not consider transition plans for families graduating or leaving program OR has no guidelines for transition plans.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_GAPFTP_Q17_2" GroupName="chkScore_GAPFTP_Q17" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_GAPFTP_Q17_2" runat="server" /><br />--%>
              3<br />
                    Average Quality<br />
                    Program has at least informal guidelines and policies for transition plans.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_GAPFTP_Q17_3" GroupName="chkScore_GAPFTP_Q17" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_GAPFTP_Q17_3" runat="server" /><br />--%>
               5<br />
                    Above Average Quality<br />
                    Program has formal basic guidelines and policies for transition plans.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_GAPFTP_Q17_4" GroupName="chkScore_GAPFTP_Q17" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_GAPFTP_Q17_4" runat="server" /><br />--%>
                7<br />
                    High Quality<br />
                    Program has formal guidelines and policies for transition plans that are specific and comprehensive, outlining policies, procedures, and timelines for transition plans.
                </td>
            </tr>
        </table>

    </div>

    <!---------------------------------------------------------------------------------->
    <script type="text/javascript">
        function NOTP_Q18() {
            if ((document.getElementById('<%=chk_NOTP_Q18_3.ClientID%>').checked == true
            || document.getElementById('<%=chk_NOTP_Q18_4.ClientID%>').checked == true
            || document.getElementById('<%=chk_NOTP_Q18_5.ClientID%>').checked == true)
            && (document.getElementById('<%=chk_NOTP_Q18_6.ClientID%>').checked == true
            && document.getElementById('<%=chk_NOTP_Q18_7.ClientID%>').checked == true
            && document.getElementById('<%=chk_NOTP_Q18_8.ClientID%>').checked == true
            && document.getElementById('<%=chk_NOTP_Q18_9.ClientID%>').checked == true
            && document.getElementById('<%=chk_NOTP_Q18_10.ClientID%>').checked == true
            && document.getElementById('<%=chk_NOTP_Q18_11.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_NOTP_Q18.ClientID%>').innerHTML = 7;
                document.getElementById('<%=chk_NOTP_Q18_1.ClientID%>').checked = false;
                document.getElementById('<%=chk_NOTP_Q18_2.ClientID%>').checked = false;
            }
            else if ((document.getElementById('<%=chk_NOTP_Q18_3.ClientID%>').checked == true
           && document.getElementById('<%=chk_NOTP_Q18_4.ClientID%>').checked == true
                && document.getElementById('<%=chk_NOTP_Q18_5.ClientID%>').checked == true)) {
                     document.getElementById('<%=lblScore_NOTP_Q18.ClientID%>').innerHTML = 3;
                     document.getElementById('<%=chk_NOTP_Q18_1.ClientID%>').checked = false;
                     document.getElementById('<%=chk_NOTP_Q18_2.ClientID%>').checked = false;
                     document.getElementById('<%=chk_NOTP_Q18_6.ClientID%>').checked = false;
                     document.getElementById('<%=chk_NOTP_Q18_7.ClientID%>').checked = false;
                     document.getElementById('<%=chk_NOTP_Q18_8.ClientID%>').checked = false;
                     document.getElementById('<%=chk_NOTP_Q18_9.ClientID%>').checked = false;
                     document.getElementById('<%=chk_NOTP_Q18_10.ClientID%>').checked = false;
                     document.getElementById('<%=chk_NOTP_Q18_11.ClientID%>').checked = false;
                 }
            else if ((document.getElementById('<%=chk_NOTP_Q18_3.ClientID%>').checked == true
            || document.getElementById('<%=chk_NOTP_Q18_4.ClientID%>').checked == true
            || document.getElementById('<%=chk_NOTP_Q18_5.ClientID%>').checked == true)
            && (document.getElementById('<%=chk_NOTP_Q18_6.ClientID%>').checked == true
            || document.getElementById('<%=chk_NOTP_Q18_7.ClientID%>').checked == true
            || document.getElementById('<%=chk_NOTP_Q18_8.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_NOTP_Q18.ClientID%>').innerHTML = 5;
                document.getElementById('<%=chk_NOTP_Q18_1.ClientID%>').checked = false;
                document.getElementById('<%=chk_NOTP_Q18_2.ClientID%>').checked = false;
            }

           
                     
                            
            else if (document.getElementById('<%=chk_NOTP_Q18_1.ClientID%>').checked == true
                || document.getElementById('<%=chk_NOTP_Q18_2.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_NOTP_Q18.ClientID%>').innerHTML = 1;
                document.getElementById('<%=chk_NOTP_Q18_3.ClientID%>').checked = false;
                document.getElementById('<%=chk_NOTP_Q18_4.ClientID%>').checked = false;
                document.getElementById('<%=chk_NOTP_Q18_5.ClientID%>').checked = false;
                document.getElementById('<%=chk_NOTP_Q18_6.ClientID%>').checked = false;
                document.getElementById('<%=chk_NOTP_Q18_7.ClientID%>').checked = false;
                document.getElementById('<%=chk_NOTP_Q18_8.ClientID%>').checked = false;
                document.getElementById('<%=chk_NOTP_Q18_9.ClientID%>').checked = false;
                document.getElementById('<%=chk_NOTP_Q18_10.ClientID%>').checked = false;
                document.getElementById('<%=chk_NOTP_Q18_11.ClientID%>').checked = false;
            }
            else {
                document.getElementById('<%=lblScore_NOTP_Q18.ClientID%>').innerHTML = " ";
            }
    var score = 0;
    score = document.getElementById('<%=lblScore_NOTP_Q18.ClientID%>').textContent;


    scoring(score, '<%=chkScore_NOTP_Q18_1.ClientID%>', '<%=chkScore_NOTP_Q18_2.ClientID%>',
                           '<%=chkScore_NOTP_Q18_3.ClientID%>', '<%=chkScore_NOTP_Q18_4.ClientID%>');
}
    </script>
    <div style="cursor: pointer;" onclick="javascript:DivClicked('NOTP_Q18');">
        <h3 class="scoringTitle">
            <img src="../Images/edit_add.png" height="40" style="width: 40px" />TRANSITION PLANS: NATURE OF TRANSITION PLANS (Scale B5, IR 2)</h3>
    </div>
    <div id="NOTP_Q18" style="display: none;">
        <table class="d">
            <tr>
                <td colspan="4">
                    <h3>SCORING</h3>
                </td>
            </tr>
            <tr>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_NOTP_Q18_1" runat="server" OnClick="javascript:NOTP_Q18();" /><asp:Label ID="lbl_NOTP_Q18_1" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_NOTP_Q18_2" runat="server" OnClick="javascript:NOTP_Q18();" /><asp:Label ID="lbl_NOTP_Q18_2" runat="server"></asp:Label>
                        </li>
                    </ul>

                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_NOTP_Q18_3" runat="server" OnClick="javascript:NOTP_Q18();" /><asp:Label ID="lbl_NOTP_Q18_3" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_NOTP_Q18_4" runat="server" OnClick="javascript:NOTP_Q18();" /><asp:Label ID="lbl_NOTP_Q18_4" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_NOTP_Q18_5" runat="server" OnClick="javascript:NOTP_Q18();" /><asp:Label ID="lbl_NOTP_Q18_5" runat="server"></asp:Label>
                        </li>
                        <%-- <li>
                            <asp:CheckBox ID="chk_NOTP_Q18_6" runat="server" OnClick="javascript:NOTP_Q18();" /><asp:Label ID="lbl_NOTP_Q18_6" runat="server"></asp:Label>
                        </li>--%>
                    </ul>
                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_NOTP_Q18_6" runat="server" OnClick="javascript:NOTP_Q18();" /><asp:Label ID="lbl_NOTP_Q18_6" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_NOTP_Q18_7" runat="server" OnClick="javascript:NOTP_Q18();" /><asp:Label ID="lbl_NOTP_Q18_7" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_NOTP_Q18_8" runat="server" OnClick="javascript:NOTP_Q18();" /><asp:Label ID="lbl_NOTP_Q18_8" runat="server"></asp:Label>
                        </li>
                    </ul>
                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_NOTP_Q18_9" runat="server" OnClick="javascript:NOTP_Q18();" /><asp:Label ID="lbl_NOTP_Q18_9" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_NOTP_Q18_10" runat="server" OnClick="javascript:NOTP_Q18();" /><asp:Label ID="lbl_NOTP_Q18_10" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_NOTP_Q18_11" runat="server" OnClick="javascript:NOTP_Q18();" /><asp:Label ID="lbl_NOTP_Q18_11" runat="server"></asp:Label>
                        </li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td class="q">If EITHER criterion is met, score 1; otherwise, continue.
                </td>
                <td class="q">If ALL criteria are met, score 3; otherwise, continue.
                </td>
                <td class="q">If ALL criteria are met, continue; otherwise, score 5.
                </td>
                <td class="q">If ALL criteria are met, score 7.
                </td>
            </tr>
            <tr>
                <td class="scoring" colspan="4">Score:<asp:Label ID="lblScore_NOTP_Q18" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <%-- <tr>
             <td class="d" aria-orientation="horizontal" colspan="4">
                <asp:RadioButtonList ID="chkScore_NOTP_Q18" runat="server" RepeatDirection="Horizontal" Width="100%" ValidationGroup="Val1">
                   <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ErrorMessage="Required-(B5, IR 2)" ControlToValidate="chkScore_NOTP_Q18" ValidationGroup="Val1"></asp:RequiredFieldValidator>
            </td>
            </tr>--%>
            <tr>
                <td class="d">
                    <asp:RadioButton ID="chkScore_NOTP_Q18_1" GroupName="chkScore_NOTP_Q18" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_NOTP_Q18_1" runat="server" /><br />--%>
                1<br />
                    Low Quality<br />
                    Home visitors do not plan for transitions or are limited to informal discussions with family.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_NOTP_Q18_2" GroupName="chkScore_NOTP_Q18" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_NOTP_Q18_2" runat="server" /><br />--%>
              3<br />
                    Average Quality<br />
                    Transition plans are available but developed without family input
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_NOTP_Q18_3" GroupName="chkScore_NOTP_Q18" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_NOTP_Q18_3" runat="server" /><br />--%>
               5<br />
                    Above Average Quality<br />
                    Transition plans are developed collaboratively between home visitors and families at least three months in advance of program completion.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_NOTP_Q18_4" GroupName="chkScore_NOTP_Q18" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_NOTP_Q18_4" runat="server" /><br />--%>
                7<br />
                    High Quality<br />
                    Transition plans are developed collaboratively between home visitors and families at least three months in advance of program completion.
                </td>
            </tr>
        </table>
    </div>
    <!---------------------------------------------------------------------------------->
    <script type="text/javascript">
        function CASE_Q19() {
            if (document.getElementById('<%=chk_CASE_Q19_6.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_CASE_Q19.ClientID%>').innerHTML = 7;
                document.getElementById('<%=chk_CASE_Q19_1.ClientID%>').checked = false;
                document.getElementById('<%=chk_CASE_Q19_2.ClientID%>').checked = false;
                document.getElementById('<%=chk_CASE_Q19_3.ClientID%>').checked = false;
                document.getElementById('<%=chk_CASE_Q19_4.ClientID%>').checked = false;
                document.getElementById('<%=chk_CASE_Q19_5.ClientID%>').checked = false;

            }
            else if (document.getElementById('<%=chk_CASE_Q19_4.ClientID%>').checked == true
               && document.getElementById('<%=chk_CASE_Q19_5.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_CASE_Q19.ClientID%>').innerHTML = 5;
                document.getElementById('<%=chk_CASE_Q19_1.ClientID%>').checked = false;
                document.getElementById('<%=chk_CASE_Q19_2.ClientID%>').checked = false;
                document.getElementById('<%=chk_CASE_Q19_3.ClientID%>').checked = false;
                document.getElementById('<%=chk_CASE_Q19_6.ClientID%>').checked = false;
            }
            else if (document.getElementById('<%=chk_CASE_Q19_4.ClientID%>').checked == true
            || document.getElementById('<%=chk_CASE_Q19_5.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_CASE_Q19.ClientID%>').innerHTML = 3;
                document.getElementById('<%=chk_CASE_Q19_1.ClientID%>').checked = false;
                document.getElementById('<%=chk_CASE_Q19_2.ClientID%>').checked = false;
                document.getElementById('<%=chk_CASE_Q19_3.ClientID%>').checked = false;
                document.getElementById('<%=chk_CASE_Q19_6.ClientID%>').checked = false;
            }
            else if ((document.getElementById('<%=chk_CASE_Q19_1.ClientID%>').checked != true)
           && (document.getElementById('<%=chk_CASE_Q19_2.ClientID%>').checked == true
             || document.getElementById('<%=chk_CASE_Q19_3.ClientID%>').checked == true)) {
                 document.getElementById('<%=lblScore_CASE_Q19.ClientID%>').innerHTML = 3;
                 document.getElementById('<%=chk_CASE_Q19_1.ClientID%>').checked = false;
                 document.getElementById('<%=chk_CASE_Q19_4.ClientID%>').checked = false;
                 document.getElementById('<%=chk_CASE_Q19_5.ClientID%>').checked = false;
                 document.getElementById('<%=chk_CASE_Q19_6.ClientID%>').checked = false;
             }

             else if (document.getElementById('<%=chk_CASE_Q19_1.ClientID%>').checked == true) {
                 document.getElementById('<%=lblScore_CASE_Q19.ClientID%>').innerHTML = 1;
                 document.getElementById('<%=chk_CASE_Q19_2.ClientID%>').checked = false;
                 document.getElementById('<%=chk_CASE_Q19_3.ClientID%>').checked = false;
                 document.getElementById('<%=chk_CASE_Q19_4.ClientID%>').checked = false;
                 document.getElementById('<%=chk_CASE_Q19_5.ClientID%>').checked = false;
                 document.getElementById('<%=chk_CASE_Q19_6.ClientID%>').checked = false;
             }
             else {
                 document.getElementById('<%=lblScore_CASE_Q19.ClientID%>').innerHTML = " ";
             }
    var score = 0;
    score = document.getElementById('<%=lblScore_CASE_Q19.ClientID%>').textContent;


    scoring(score, '<%=chkScore_CASE_Q19_1.ClientID%>', '<%=chkScore_CASE_Q19_2.ClientID%>',
                        '<%=chkScore_CASE_Q19_3.ClientID%>', '<%=chkScore_CASE_Q19_4.ClientID%>');
}
    </script>
    <div style="cursor: pointer;" onclick="javascript:DivClicked('CASE_Q19');">
        <h3 class="scoringTitle">
            <img src="../Images/edit_add.png" height="40" style="width: 40px" />EMPHASIZES STRONG WORKING RELATIONSHIPS WITH FAMILIES: CASELOADS (Scale C3, IR 2)</h3>
    </div>
    <div id="CASE_Q19" style="display: none;">

        <table class="d">
            <tr>
                <td colspan="4">
                    <h3>SCORING</h3>
                </td>
            </tr>
            <tr>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_CASE_Q19_1" runat="server" OnClick="javascript:CASE_Q19();" /><asp:Label ID="lbl_CASE_Q19_1" runat="server"></asp:Label>
                        </li>

                    </ul>

                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_CASE_Q19_2" runat="server" OnClick="javascript:CASE_Q19();" /><asp:Label ID="lbl_CASE_Q19_2" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_CASE_Q19_3" runat="server" OnClick="javascript:CASE_Q19();" /><asp:Label ID="lbl_CASE_Q19_3" runat="server"></asp:Label>
                        </li>
                    </ul>
                    &nbsp;</td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_CASE_Q19_4" runat="server" OnClick="javascript:CASE_Q19();" /><asp:Label ID="lbl_CASE_Q19_4" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_CASE_Q19_5" runat="server" OnClick="javascript:CASE_Q19();" /><asp:Label ID="lbl_CASE_Q19_5" runat="server"></asp:Label>
                        </li>
                    </ul>
                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_CASE_Q19_6" runat="server" OnClick="javascript:CASE_Q19();" /><asp:Label ID="lbl_CASE_Q19_6" runat="server"></asp:Label>
                        </li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td class="q">If the above criterion is met, score 1; otherwise, continue.
                </td>
                <td class="q">If EITHER criterion is met, score 3; otherwise, continue.
                </td>
                <td class="q">If BOTH criteria are met, score 5; otherwise, continue.
                </td>
                <td class="q">If the above criterion is met, score 7.
                </td>
            </tr>
            <%-- <tr>
             <td class="d" aria-orientation="horizontal" colspan="4">
                <asp:RadioButtonList ID="chkScore_CASE_Q19" runat="server" RepeatDirection="Horizontal" Width="100%" ValidationGroup="Val1">
                   <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ErrorMessage="Required-(C3, IR 2)" ControlToValidate="chkScore_CASE_Q19" ValidationGroup="Val1"></asp:RequiredFieldValidator>
            </td>
            </tr>--%>
            <tr>
                <td class="scoring" colspan="4">Score:<asp:Label ID="lblScore_CASE_Q19" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="d">
                    <asp:RadioButton ID="chkScore_CASE_Q19_1" GroupName="chkScore_CASE_Q19" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_CASE_Q19_1" runat="server" /><br />--%>
                1<br />
                    Low Quality<br />
                    Visitors have caseloads too large to allow individual attention to families (>80 visits completed in a month per full-time visitor).
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_CASE_Q19_2" GroupName="chkScore_CASE_Q19" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_CASE_Q19_2" runat="server" /><br />--%>
              3<br />
                    Average Quality<br />
                    Caseloads are adequate (≤80 visits completed in a month per full-time visitor).
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_CASE_Q19_3" GroupName="chkScore_CASE_Q19" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_CASE_Q19_3" runat="server" /><br />--%>
               5<br />
                    Above Average Quality<br />
                    Caseloads ensure visitors are able to devote sufficient time and attention to individual families (≤60 visits completed in a month per full time visitor); caseloads are adjusted for new home visitors or for level of risk/need of individual families.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_CASE_Q19_4" GroupName="chkScore_CASE_Q19" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_CASE_Q19_4" runat="server" /><br />--%>
                7<br />
                    High Quality<br />
                    Caseloads are carefully managed to promote optimal relationship formation (≤50 visits completed in a month per full-time visitor).
                </td>
            </tr>
        </table>
    </div>
    <!---------------------------------------------------------------------------------->
    <script type="text/javascript">
        function PM_Q20() {
            if ((document.getElementById('<%=chk_PM_Q20_1.ClientID%>').checked != true
                || document.getElementById('<%=chk_PM_Q20_2.ClientID%>').checked != true)
                 && (document.getElementById('<%=chk_PM_Q20_3.ClientID%>').checked == true
                 && document.getElementById('<%=chk_PM_Q20_4.ClientID%>').checked == true
                && document.getElementById('<%=chk_PM_Q20_5.ClientID%>').checked == true
                && document.getElementById('<%=chk_PM_Q20_6.ClientID%>').checked == true
                && document.getElementById('<%=chk_PM_Q20_7.ClientID%>').checked == true
                && document.getElementById('<%=chk_PM_Q20_8.ClientID%>').checked == true
                && document.getElementById('<%=chk_PM_Q20_9.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_PM_Q20.ClientID%>').innerHTML = 7;
                document.getElementById('<%=chk_PM_Q20_1.ClientID%>').checked = false;
                document.getElementById('<%=chk_PM_Q20_2.ClientID%>').checked = false;
            }

            else if ((document.getElementById('<%=chk_PM_Q20_1.ClientID%>').checked != true
                || document.getElementById('<%=chk_PM_Q20_2.ClientID%>').checked != true)
                 && (document.getElementById('<%=chk_PM_Q20_3.ClientID%>').checked == true
                 && document.getElementById('<%=chk_PM_Q20_4.ClientID%>').checked == true
                && document.getElementById('<%=chk_PM_Q20_5.ClientID%>').checked == true
                && document.getElementById('<%=chk_PM_Q20_6.ClientID%>').checked == true
                && document.getElementById('<%=chk_PM_Q20_7.ClientID%>').checked == true)
                && (document.getElementById('<%=chk_PM_Q20_8.ClientID%>').checked == true
                || document.getElementById('<%=chk_PM_Q20_9.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_PM_Q20.ClientID%>').innerHTML = 5;
                document.getElementById('<%=chk_PM_Q20_1.ClientID%>').checked = false;
                document.getElementById('<%=chk_PM_Q20_2.ClientID%>').checked = false;
            }
            else if ((document.getElementById('<%=chk_PM_Q20_1.ClientID%>').checked != true
                || document.getElementById('<%=chk_PM_Q20_2.ClientID%>').checked != true)
                 && (document.getElementById('<%=chk_PM_Q20_3.ClientID%>').checked == true
                 && document.getElementById('<%=chk_PM_Q20_4.ClientID%>').checked == true
                && document.getElementById('<%=chk_PM_Q20_5.ClientID%>').checked == true
                && document.getElementById('<%=chk_PM_Q20_6.ClientID%>').checked == true
                && document.getElementById('<%=chk_PM_Q20_7.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_PM_Q20.ClientID%>').innerHTML = 5;
                document.getElementById('<%=chk_PM_Q20_1.ClientID%>').checked = false;
                document.getElementById('<%=chk_PM_Q20_2.ClientID%>').checked = false;
            }
            else if ((document.getElementById('<%=chk_PM_Q20_1.ClientID%>').checked != true
                || document.getElementById('<%=chk_PM_Q20_2.ClientID%>').checked != true)
                 && (document.getElementById('<%=chk_PM_Q20_3.ClientID%>').checked == true
                 && document.getElementById('<%=chk_PM_Q20_4.ClientID%>').checked == true)
                && (document.getElementById('<%=chk_PM_Q20_5.ClientID%>').checked == true
                || document.getElementById('<%=chk_PM_Q20_6.ClientID%>').checked == true
                || document.getElementById('<%=chk_PM_Q20_7.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_PM_Q20.ClientID%>').innerHTML = 3;
                document.getElementById('<%=chk_PM_Q20_1.ClientID%>').checked = false;
                document.getElementById('<%=chk_PM_Q20_2.ClientID%>').checked = false;
            }
            else if ((document.getElementById('<%=chk_PM_Q20_1.ClientID%>').checked != true
                || document.getElementById('<%=chk_PM_Q20_2.ClientID%>').checked != true)
                && (document.getElementById('<%=chk_PM_Q20_3.ClientID%>').checked == true
                && document.getElementById('<%=chk_PM_Q20_4.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_PM_Q20.ClientID%>').innerHTML = 3;
                document.getElementById('<%=chk_PM_Q20_1.ClientID%>').checked = false;
                document.getElementById('<%=chk_PM_Q20_2.ClientID%>').checked = false;
            }
            else if ((document.getElementById('<%=chk_PM_Q20_1.ClientID%>').checked != true
            || document.getElementById('<%=chk_PM_Q20_2.ClientID%>').checked != true)
                && (document.getElementById('<%=chk_PM_Q20_3.ClientID%>').checked == true
                || document.getElementById('<%=chk_PM_Q20_4.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_PM_Q20.ClientID%>').innerHTML = 1;
                document.getElementById('<%=chk_PM_Q20_1.ClientID%>').checked = false;
                document.getElementById('<%=chk_PM_Q20_2.ClientID%>').checked = false;
            }

            else if (document.getElementById('<%=chk_PM_Q20_1.ClientID%>').checked == true
                || document.getElementById('<%=chk_PM_Q20_2.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_PM_Q20.ClientID%>').innerHTML = 1;
                document.getElementById('<%=chk_PM_Q20_3.ClientID%>').checked = false;
                document.getElementById('<%=chk_PM_Q20_4.ClientID%>').checked = false;
                document.getElementById('<%=chk_PM_Q20_5.ClientID%>').checked = false;
                document.getElementById('<%=chk_PM_Q20_6.ClientID%>').checked = false;
                document.getElementById('<%=chk_PM_Q20_7.ClientID%>').checked = false;
                document.getElementById('<%=chk_PM_Q20_8.ClientID%>').checked = false;
                document.getElementById('<%=chk_PM_Q20_9.ClientID%>').checked = false;
            }
            else {
                document.getElementById('<%=lblScore_PM_Q20.ClientID%>').innerHTML = " ";
            }
    var score = 0;
    score = document.getElementById('<%=lblScore_PM_Q20.ClientID%>').textContent;


    scoring(score, '<%=chkScore_PM_Q20_1.ClientID%>', '<%=chkScore_PM_Q20_2.ClientID%>',
                        '<%=chkScore_PM_Q20_3.ClientID%>', '<%=chkScore_PM_Q20_4.ClientID%>');
}
    </script>
    <div style="cursor: pointer;" onclick="javascript:DivClicked('PM_Q20');">
        <h3 class="scoringTitle">
            <img src="../Images/edit_add.png" height="40" style="width: 40px" />EMPHASIZES STRONG WORKING RELATIONSHIPS WITH FAMILIES: PROGRAM MATERIALS (Scale C3, IR 1)</h3>
    </div>
    <div id="PM_Q20" style="display: none;">

        <table class="d">
            <tr>
                <td colspan="4">
                    <h3>SCORING</h3>
                </td>
            </tr>
            <tr>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_PM_Q20_1" runat="server" OnClick="javascript:PM_Q20();" /><asp:Label ID="lbl_PM_Q20_1" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_PM_Q20_2" runat="server" OnClick="javascript:PM_Q20();" /><asp:Label ID="lbl_PM_Q20_2" runat="server"></asp:Label>
                        </li>
                    </ul>

                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_PM_Q20_3" runat="server" OnClick="javascript:PM_Q20();" /><asp:Label ID="lbl_PM_Q20_3" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_PM_Q20_4" runat="server" OnClick="javascript:PM_Q20();" /><asp:Label ID="lbl_PM_Q20_4" runat="server"></asp:Label>
                        </li>
                    </ul>
                    &nbsp;</td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_PM_Q20_5" runat="server" OnClick="javascript:PM_Q20();" /><asp:Label ID="lbl_PM_Q20_5" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_PM_Q20_6" runat="server" OnClick="javascript:PM_Q20();" /><asp:Label ID="lbl_PM_Q20_6" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_PM_Q20_7" runat="server" OnClick="javascript:PM_Q20();" /><asp:Label ID="lbl_PM_Q20_7" runat="server"></asp:Label>
                        </li>
                    </ul>
                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_PM_Q20_8" runat="server" OnClick="javascript:PM_Q20();" /><asp:Label ID="lbl_PM_Q20_8" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_PM_Q20_9" runat="server" OnClick="javascript:PM_Q20();" /><asp:Label ID="lbl_PM_Q20_9" runat="server"></asp:Label>
                        </li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td class="q">If EITHER criterion is met, score 1; otherwise, continue.
                </td>
                <td class="q">If BOTH criteria are met, continue; otherwise, score 1.
                </td>
                <td class="q">If ALL criteria are met, continue; otherwise, score 3.
                </td>
                <td class="q">If BOTH criteria are met, score 7; otherwise, score 5.
                </td>
            </tr>
            <tr>
                <td class="scoring" colspan="4">Score:<asp:Label ID="lblScore_PM_Q20" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <%--  <tr>
             <td class="d" aria-orientation="horizontal" colspan="4">
                <asp:RadioButtonList ID="chkScore_PM_Q20" runat="server" RepeatDirection="Horizontal" Width="100%" ValidationGroup="Val1">
                   <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ErrorMessage="Required-(C3, IR 1)" ControlToValidate="chkScore_PM_Q20" ValidationGroup="Val1"></asp:RequiredFieldValidator>
            </td>
            </tr>--%>
            <tr>
                <td class="d">
                    <asp:RadioButton ID="chkScore_PM_Q20_1" GroupName="chkScore_PM_Q20" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_PM_Q20_1" runat="server" /><br />--%>
                1<br />
                    Low Quality<br />
                    Program pays little attention to positive relationships and partnerships with families.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_PM_Q20_2" GroupName="chkScore_PM_Q20" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_PM_Q20_2" runat="server" /><br />--%>
              3<br />
                    Average Quality<br />
                    Program materials and training note the importance of positive relationships and partnerships with families.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_PM_Q20_3" GroupName="chkScore_PM_Q20" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_PM_Q20_3" runat="server" /><br />--%>
               5<br />
                    Above Average Quality<br />
                    Program uses multiple specific strategies to promote positive relationships and partnerships with families, including strategies for hard to engage families and families from different cultural backgrounds.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_PM_Q20_4" GroupName="chkScore_PM_Q20" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_PM_Q20_4" runat="server" /><br />--%>
                7<br />
                    High Quality<br />
                    Program model views positive relationships and partnerships with families as a central task of the home visitor and provides consistent support for home visitor through curriculum, training, and supervision.
                </td>
            </tr>
        </table>
    </div>
    <!---------------------------------------------------------------------------------->
    <script type="text/javascript">
        function MOHR_Q21() {
            if ((document.getElementById('<%=chk_MOHR_Q21_1.ClientID%>').checked != true)
                && (document.getElementById('<%=chk_MOHR_Q21_2.ClientID%>').checked != true
                || document.getElementById('<%=chk_MOHR_Q21_3.ClientID%>').checked != true)
                && (document.getElementById('<%=chk_MOHR_Q21_4.ClientID%>').checked == true
                && document.getElementById('<%=chk_MOHR_Q21_5.ClientID%>').checked == true)
                && (document.getElementById('<%=chk_MOHR_Q21_6.ClientID%>').checked == true
                && document.getElementById('<%=chk_MOHR_Q21_7.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_MOHR_Q21.ClientID%>').innerHTML = 7;
            }

            else if ((document.getElementById('<%=chk_MOHR_Q21_1.ClientID%>').checked != true)
                && (document.getElementById('<%=chk_MOHR_Q21_2.ClientID%>').checked != true
                || document.getElementById('<%=chk_MOHR_Q21_3.ClientID%>').checked != true)
                && (document.getElementById('<%=chk_MOHR_Q21_4.ClientID%>').checked == true
                && document.getElementById('<%=chk_MOHR_Q21_5.ClientID%>').checked == true)
                && (document.getElementById('<%=chk_MOHR_Q21_6.ClientID%>').checked == true
                || document.getElementById('<%=chk_MOHR_Q21_7.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_MOHR_Q21.ClientID%>').innerHTML = 5;
            }
            else if ((document.getElementById('<%=chk_MOHR_Q21_1.ClientID%>').checked != true)
           && (document.getElementById('<%=chk_MOHR_Q21_2.ClientID%>').checked != true
                || document.getElementById('<%=chk_MOHR_Q21_3.ClientID%>').checked != true)
                && (document.getElementById('<%=chk_MOHR_Q21_4.ClientID%>').checked == true
                && document.getElementById('<%=chk_MOHR_Q21_5.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_MOHR_Q21.ClientID%>').innerHTML = 5;
            }
            else if ((document.getElementById('<%=chk_MOHR_Q21_1.ClientID%>').checked != true)
                && (document.getElementById('<%=chk_MOHR_Q21_2.ClientID%>').checked != true
                || document.getElementById('<%=chk_MOHR_Q21_3.ClientID%>').checked != true)
                && (document.getElementById('<%=chk_MOHR_Q21_4.ClientID%>').checked == true
                || document.getElementById('<%=chk_MOHR_Q21_5.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_MOHR_Q21.ClientID%>').innerHTML = 3;
            }
            else if ((document.getElementById('<%=chk_MOHR_Q21_1.ClientID%>').checked != true)
                && (document.getElementById('<%=chk_MOHR_Q21_2.ClientID%>').checked == true
                || document.getElementById('<%=chk_MOHR_Q21_3.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_MOHR_Q21.ClientID%>').innerHTML = 3;
            }

            else if (document.getElementById('<%=chk_MOHR_Q21_1.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_MOHR_Q21.ClientID%>').innerHTML = 1;
            }
            else {
                document.getElementById('<%=lblScore_MOHR_Q21.ClientID%>').innerHTML = " ";
            }
    var score = 0;
    score = document.getElementById('<%=lblScore_MOHR_Q21.ClientID%>').textContent;


    scoring(score, '<%=chkScore_MOHR_Q21_1.ClientID%>', '<%=chkScore_MOHR_Q21_2.ClientID%>',
                          '<%=chkScore_MOHR_Q21_3.ClientID%>', '<%=chkScore_MOHR_Q21_4.ClientID%>');
}
    </script>
    <div style="cursor: pointer;" onclick="javascript:DivClicked('MOHR_Q21');">
        <h3 class="scoringTitle">
            <img src="../Images/edit_add.png" height="40" style="width: 40px" />EMPHASIZES STRONG WORKING RELATIONSHIPS WITH FAMILIES: MONITORING OF HELPING RELATIONSHIP (Scale C3, IR 3)</h3>
    </div>
    <div id="MOHR_Q21" style="display: none;">

        <table class="d">
            <tr>
                <td colspan="4">
                    <h3>SCORING</h3>
                </td>
            </tr>
            <tr>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_MOHR_Q21_1" runat="server" OnClick="javascript:MOHR_Q21();" /><asp:Label ID="lbl_MOHR_Q21_1" runat="server" Text="Label"></asp:Label>
                        </li>
                    </ul>

                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_MOHR_Q21_2" runat="server" OnClick="javascript:MOHR_Q21();" /><asp:Label ID="lbl_MOHR_Q21_2" runat="server" Text="Label"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_MOHR_Q21_3" runat="server" OnClick="javascript:MOHR_Q21();" /><asp:Label ID="lbl_MOHR_Q21_3" runat="server" Text="Label"></asp:Label>
                        </li>
                    </ul>
                    &nbsp;</td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_MOHR_Q21_4" runat="server" OnClick="javascript:MOHR_Q21();" /><asp:Label ID="lbl_MOHR_Q21_4" runat="server" Text="Label"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_MOHR_Q21_5" runat="server" OnClick="javascript:MOHR_Q21();" /><asp:Label ID="lbl_MOHR_Q21_5" runat="server" Text="Label"></asp:Label>
                        </li>
                    </ul>
                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_MOHR_Q21_6" runat="server" OnClick="javascript:MOHR_Q21();" /><asp:Label ID="lbl_MOHR_Q21_6" runat="server" Text="Label"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_MOHR_Q21_7" runat="server" OnClick="javascript:MOHR_Q21();" /><asp:Label ID="lbl_MOHR_Q21_7" runat="server" Text="Label"></asp:Label>
                        </li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td class="q">If the above criterion is met, score 1; otherwise, continue.
                </td>
                <td class="q">If EITHER criterion is met, score 3; otherwise, continue.
                </td>
                <td class="q">If BOTH criteria are met, continue; otherwise, score 3.
                </td>
                <td class="q">If BOTH criteria are met, score 7; otherwise, score 5.
                </td>
            </tr>
            <tr>
                <td class="scoring" colspan="4">Score:<asp:Label ID="lblScore_MOHR_Q21" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <%--<tr>
            <td class="d" aria-orientation="horizontal" colspan="4">
                <asp:RadioButtonList ID="chkScore_MOHR_Q21" runat="server" RepeatDirection="Horizontal" Width="100%" ValidationGroup="Val1">
                   <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ErrorMessage="Required-(C3, IR 3)" ControlToValidate="chkScore_MOHR_Q21" ValidationGroup="Val1"></asp:RequiredFieldValidator>
            </td>
            </tr>--%>
            <tr>
                <td class="d">
                    <asp:RadioButton ID="chkScore_MOHR_Q21_1" GroupName="chkScore_MOHR_Q21" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_MOHR_Q21_1" runat="server" /><br />--%>
                1<br />
                    Low Quality<br />
                    Program does not track quality of helping relationship.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_MOHR_Q21_2" GroupName="chkScore_MOHR_Q21" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_MOHR_Q21_2" runat="server" /><br />--%>
              3<br />
                    Average Quality<br />
                    Quality of the helping relationship is tracked at least informally or inconsistently.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_MOHR_Q21_3" GroupName="chkScore_MOHR_Q21" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_MOHR_Q21_3" runat="server" /><br />--%>
               5<br />
                    Above Average Quality<br />
                    Formal monitoring of helping relationship between home visitor and family occurs at least annually.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_MOHR_Q21_4" GroupName="chkScore_MOHR_Q21" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_MOHR_Q21_4" runat="server" /><br />--%>
                7<br />
                    High Quality<br />
                    Program has ongoing monitoring of home visitors’ quality of helping relationship with families through multiple ways.
                </td>
            </tr>
        </table>
    </div>
    <!---------------------------------------------------------------------------------->
    <script type="text/javascript">
        function APMDFN_Q22() {
            if ((document.getElementById('<%=chk_APMDFN_Q22_2.ClientID%>').checked == true
                 && document.getElementById('<%=chk_APMDFN_Q22_3.ClientID%>').checked == true
                && document.getElementById('<%=chk_APMDFN_Q22_4.ClientID%>').checked == true)
                 && (document.getElementById('<%=chk_APMDFN_Q22_5.ClientID%>').checked == true
                 || document.getElementById('<%=chk_APMDFN_Q22_6.ClientID%>').checked == true
                  || document.getElementById('<%=chk_APMDFN_Q22_7.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_APMDFN_Q22.ClientID%>').innerHTML = 7;
            }

            else if (document.getElementById('<%=chk_APMDFN_Q22_2.ClientID%>').checked == true
                && document.getElementById('<%=chk_APMDFN_Q22_3.ClientID%>').checked == true
                && document.getElementById('<%=chk_APMDFN_Q22_4.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_APMDFN_Q22.ClientID%>').innerHTML = 5;
            }

            else if (document.getElementById('<%=chk_APMDFN_Q22_2.ClientID%>').checked == true
                || document.getElementById('<%=chk_APMDFN_Q22_3.ClientID%>').checked == true
                 || document.getElementById('<%=chk_APMDFN_Q22_4.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_APMDFN_Q22.ClientID%>').innerHTML = 3;
            }

            else if (document.getElementById('<%=chk_APMDFN_Q22_1.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_APMDFN_Q22.ClientID%>').innerHTML = 1;
             }
             else {
                 document.getElementById('<%=lblScore_APMDFN_Q22.ClientID%>').innerHTML = " ";
             }
    var score = 0;
    score = document.getElementById('<%=lblScore_APMDFN_Q22.ClientID%>').textContent;


    scoring(score, '<%=chkScore_APMDFN_Q22_1.ClientID%>', '<%=chkScore_APMDFN_Q22_2.ClientID%>',
                       '<%=chkScore_APMDFN_Q22_3.ClientID%>', '<%=chkScore_APMDFN_Q22_4.ClientID%>');
}
    </script>
    <div style="cursor: pointer;" onclick="javascript:DivClicked('APMDFN_Q22');">
        <h3 class="scoringTitle">
            <img src="../Images/edit_add.png" height="40" style="width: 40px" />SERVICES TAILORED TO FAMILY STRENGTH AND NEEDS: ADAPTATION OF PROGRAM MATERIALS TO DIVERSE FAMILY NEEDS (Scale C4, IR 2)</h3>
    </div>
    <div id="APMDFN_Q22" style="display: none;">
        <table class="d">
            <tr>
                <td colspan="4">
                    <h3>SCORING</h3>
                </td>
            </tr>
            <tr>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_APMDFN_Q22_1" runat="server" OnClick="javascript:APMDFN_Q22();" /><asp:Label ID="lbl_APMDFN_Q22_1" runat="server" Text="Label"></asp:Label>
                        </li>
                    </ul>

                </td>
                <td class="q" colspan="2">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_APMDFN_Q22_2" runat="server" OnClick="javascript:APMDFN_Q22();" /><asp:Label ID="lbl_APMDFN_Q22_2" runat="server" Text="Label"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_APMDFN_Q22_3" runat="server" OnClick="javascript:APMDFN_Q22();" /><asp:Label ID="lbl_APMDFN_Q22_3" runat="server" Text="Label"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_APMDFN_Q22_4" runat="server" OnClick="javascript:APMDFN_Q22();" /><asp:Label ID="lbl_APMDFN_Q22_4" runat="server" Text="Label"></asp:Label>
                        </li>
                    </ul>
                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_APMDFN_Q22_5" runat="server" OnClick="javascript:APMDFN_Q22();" /><asp:Label ID="lbl_APMDFN_Q22_5" runat="server" Text="Label"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_APMDFN_Q22_6" runat="server" OnClick="javascript:APMDFN_Q22();" /><asp:Label ID="lbl_APMDFN_Q22_6" runat="server" Text="Label"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_APMDFN_Q22_7" runat="server" OnClick="javascript:APMDFN_Q22();" /><asp:Label ID="lbl_APMDFN_Q22_7" runat="server" Text="Label"></asp:Label>
                        </li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td class="q">If the above criterion is met, score 1; otherwise, continue.
                </td>
                <td class="q" colspan="2">If ALL criteria are met, continue, otherwise, score 3; otherwise, continue.
                </td>
                <td class="q">If AT LEAST one criterion is met, score 7; otherwise, score 5.
                </td>
            </tr>
            <tr>
                <td class="scoring" colspan="4">Score:<asp:Label ID="lblScore_APMDFN_Q22" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <%-- <tr>
             <td class="d" aria-orientation="horizontal" colspan="4">
                <asp:RadioButtonList ID="chkScore_APMDFN_Q22" runat="server" RepeatDirection="Horizontal" Width="100%" ValidationGroup="Val1">
                   <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ErrorMessage="Required-(C4, IR 2)" ControlToValidate="chkScore_APMDFN_Q22" ValidationGroup="Val1"></asp:RequiredFieldValidator>
            </td>
            </tr>--%>
            <tr>
                <td class="d">
                    <asp:RadioButton ID="chkScore_APMDFN_Q22_1" GroupName="chkScore_APMDFN_Q22" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_APMDFN_Q22_1" runat="server" /><br />--%>
                1<br />
                    Low Quality<br />
                    Home visiting materials are not adapted to accommodate family diversity.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_APMDFN_Q22_2" GroupName="chkScore_APMDFN_Q22" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_APMDFN_Q22_2" runat="server" /><br />--%>
              3<br />
                    Average Quality<br />
                    Program adapts some home visiting materials to accommodate family diversity.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_APMDFN_Q22_3" GroupName="chkScore_APMDFN_Q22" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_APMDFN_Q22_3" runat="server" /><br />--%>
               5<br />
                    Above Average Quality<br />
                    Home visiting materials are adapted to families’ cultural, linguistic, and educational backgrounds.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_APMDFN_Q22_4" GroupName="chkScore_APMDFN_Q22" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_APMDFN_Q22_4" runat="server" /><br />--%>
                7<br />
                    High Quality<br />
                    Program collaborates with family, community, or cultural representatives to ensure relevance of program content and materials.Program has ongoing monitoring of home visitors’ quality of helping relationship with families through multiple ways.
                </td>
            </tr>
        </table>
    </div>

    <!---------------------------------------------------------------------------------->
    <script type="text/javascript">
        function FEBHV_23() {
            if ((document.getElementById('<%=chk_FEBHV_23_1.ClientID%>').checked != true
                 && document.getElementById('<%=chk_FEBHV_23_2.ClientID%>').checked == true
                && document.getElementById('<%=chk_FEBHV_23_3.ClientID%>').checked == true
                && document.getElementById('<%=chk_FEBHV_23_4.ClientID%>').checked == true)
                 && (document.getElementById('<%=chk_FEBHV_23_5.ClientID%>').checked == true
                 && document.getElementById('<%=chk_FEBHV_23_6.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_FEBHV_23.ClientID%>').innerHTML = 7;
            }
            else if (document.getElementById('<%=chk_FEBHV_23_1.ClientID%>').checked != true
                && document.getElementById('<%=chk_FEBHV_23_2.ClientID%>').checked == true
                  && document.getElementById('<%=chk_FEBHV_23_3.ClientID%>').checked == true
               && document.getElementById('<%=chk_FEBHV_23_4.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_FEBHV_23.ClientID%>').innerHTML = 5;
            }
            else if (document.getElementById('<%=chk_FEBHV_23_1.ClientID%>').checked != true
               && document.getElementById('<%=chk_FEBHV_23_2.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_FEBHV_23.ClientID%>').innerHTML = 3;
            }

            else if (document.getElementById('<%=chk_FEBHV_23_1.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_FEBHV_23.ClientID%>').innerHTML = 1;
            }
            else {
                document.getElementById('<%=lblScore_FEBHV_23.ClientID%>').innerHTML = " ";
            }
    var score = 0;
    score = document.getElementById('<%=lblScore_FEBHV_23.ClientID%>').textContent;


    scoring(score, '<%=chkScore_FEBHV_23_1.ClientID%>', '<%=chkScore_FEBHV_23_2.ClientID%>',
                         '<%=chkScore_FEBHV_23_3.ClientID%>', '<%=chkScore_FEBHV_23_4.ClientID%>');
}
    </script>
    <div style="cursor: pointer;" onclick="javascript:DivClicked('FEBHV_23');">
        <h3 class="scoringTitle">
            <img src="../Images/edit_add.png" height="40" style="width: 40px" />FAMILY OUTREACH AND INVOLVEMENT: FAMILY EVENTS BEYOND HOME VISITS (Scale B4, IR 2)</h3>
    </div>
    <div id="FEBHV_23" style="display: none;">

        <table class="d">
            <tr>
                <td colspan="4">
                    <h3>SCORING</h3>
                </td>
            </tr>
            <tr>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_FEBHV_23_1" runat="server" OnClick="javascript:FEBHV_23();" /><asp:Label ID="lbl_FEBHV_23_1" runat="server" Text="Label"></asp:Label>
                        </li>
                    </ul>

                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_FEBHV_23_2" runat="server" OnClick="javascript:FEBHV_23();" /><asp:Label ID="lbl_FEBHV_23_2" runat="server" Text="Label"></asp:Label>
                        </li>
                    </ul>

                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_FEBHV_23_3" runat="server" OnClick="javascript:FEBHV_23();" /><asp:Label ID="lbl_FEBHV_23_3" runat="server" Text="Label"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_FEBHV_23_4" runat="server" OnClick="javascript:FEBHV_23();" /><asp:Label ID="lbl_FEBHV_23_4" runat="server" Text="Label"></asp:Label>
                        </li>
                    </ul>
                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_FEBHV_23_5" runat="server" OnClick="javascript:FEBHV_23();" /><asp:Label ID="lbl_FEBHV_23_5" runat="server" Text="Label"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_FEBHV_23_6" runat="server" OnClick="javascript:FEBHV_23();" /><asp:Label ID="lbl_FEBHV_23_6" runat="server" Text="Label"></asp:Label>
                        </li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td class="q">If the above criterion is met, score 1, otherwise continue.
                </td>
                <td class="q">If the above criterion is met, continue; otherwise, score 1.
                </td>
                <td class="q">If BOTH criteria are met, continue; otherwise, score 3.
                </td>
                <td class="q">If BOTH criteria are met, score 7; otherwise, score 5.
                </td>
            </tr>
            <tr>
                <td class="scoring" colspan="4">Score:<asp:Label ID="lblScore_FEBHV_23" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <%--  <tr>
            <td class="d" aria-orientation="horizontal" colspan="4">
                <asp:RadioButtonList ID="chkScore_FEBHV_23" runat="server" RepeatDirection="Horizontal" Width="100%" ValidationGroup="Val1">
                   <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ErrorMessage="Required-(B4, IR 2)" ControlToValidate="chkScore_FEBHV_23" ValidationGroup="Val1"></asp:RequiredFieldValidator>
            </td>
            </tr>--%>
            <tr>
                <td class="d">
                    <asp:RadioButton ID="chkScore_FEBHV_23_1" GroupName="chkScore_FEBHV_23" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_FEBHV_23_1" runat="server" /><br />--%>
                1<br />
                    Low Quality<br />
                    Program offers family socialization events less than 9 times a year.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_FEBHV_23_2" GroupName="chkScore_FEBHV_23" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_FEBHV_23_2" runat="server" /><br />--%>
              3<br />
                    Average Quality<br />
                    Program offers parent groups or trainings at least 9 times a year.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_FEBHV_23_3" GroupName="chkScore_FEBHV_23" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_FEBHV_23_3" runat="server" /><br />--%>
               5<br />
                    Above Average Quality<br />
                    Program offers parent groups or trainings at least monthly, plus at least one annual additional family socialization event.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_FEBHV_23_4" GroupName="chkScore_FEBHV_23" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_FEBHV_23_4" runat="server" /><br />--%>
                7<br />
                    High Quality<br />
                    Program offers at least monthly parent groups or trainings, plus at least quarterly additional family socialization events.
                </td>
            </tr>
        </table>
    </div>
    <!---------------------------------------------------------------------------------->
    <script type="text/javascript">
        function FIBHVSFV_Q24() {
            if ((document.getElementById('<%=chk_FIBHVSFV_Q24_2.ClientID%>').checked != true
                 && document.getElementById('<%=chk_FIBHVSFV_Q24_3.ClientID%>').checked != true
                && document.getElementById('<%=chk_FIBHVSFV_Q24_4.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_FIBHVSFV_Q24.ClientID%>').innerHTML = 7;
                document.getElementById('<%=chk_FIBHVSFV_Q24_1.ClientID%>').checked = false;
                document.getElementById('<%=chk_FIBHVSFV_Q24_2.ClientID%>').checked = false;
                document.getElementById('<%=chk_FIBHVSFV_Q24_3.ClientID%>').checked = false;
            }
            else if (document.getElementById('<%=chk_FIBHVSFV_Q24_1.ClientID%>').checked != true
                && document.getElementById('<%=chk_FIBHVSFV_Q24_2.ClientID%>').checked != true
               && document.getElementById('<%=chk_FIBHVSFV_Q24_3.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_FIBHVSFV_Q24.ClientID%>').innerHTML = 5;
                document.getElementById('<%=chk_FIBHVSFV_Q24_1.ClientID%>').checked = false;
                document.getElementById('<%=chk_FIBHVSFV_Q24_2.ClientID%>').checked = false;
                document.getElementById('<%=chk_FIBHVSFV_Q24_4.ClientID%>').checked = false;
            }
            else if (document.getElementById('<%=chk_FIBHVSFV_Q24_1.ClientID%>').checked != true
               && document.getElementById('<%=chk_FIBHVSFV_Q24_2.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_FIBHVSFV_Q24.ClientID%>').innerHTML = 3;
                document.getElementById('<%=chk_FIBHVSFV_Q24_1.ClientID%>').checked = false;
                document.getElementById('<%=chk_FIBHVSFV_Q24_3.ClientID%>').checked = false;
                document.getElementById('<%=chk_FIBHVSFV_Q24_4.ClientID%>').checked = false;
            }

            else if (document.getElementById('<%=chk_FIBHVSFV_Q24_1.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_FIBHVSFV_Q24.ClientID%>').innerHTML = 1;
                document.getElementById('<%=chk_FIBHVSFV_Q24_2.ClientID%>').checked = false;
                document.getElementById('<%=chk_FIBHVSFV_Q24_3.ClientID%>').checked = false;
                document.getElementById('<%=chk_FIBHVSFV_Q24_4.ClientID%>').checked = false;
            }
            else {
                document.getElementById('<%=lblScore_FIBHVSFV_Q24.ClientID%>').innerHTML = " ";
            }
    var score = 0;
    score = document.getElementById('<%=lblScore_FIBHVSFV_Q24.ClientID%>').textContent;


    scoring(score, '<%=chkScore_FIBHVSFV_Q24_1.ClientID%>', '<%=chkScore_FIBHVSFV_Q24_2.ClientID%>',
                      '<%=chkScore_FIBHVSFV_Q24_3.ClientID%>', '<%=chkScore_FIBHVSFV_Q24_4.ClientID%>');
}
    </script>
    <div style="cursor: pointer;" onclick="javascript:DivClicked('FIBHVSFV_Q24');">
        <h3 class="scoringTitle">
            <img src="../Images/edit_add.png" height="40" style="width: 40px" />FAMILY OUTREACH AND INVOLVEMENT: FAMILY INVOLVEMENT BEYOND HOME VISITS & SCHEDULED FAMILY EVENTS (Scale B4, IR 3)</h3>
    </div>
    <div id="FIBHVSFV_Q24" style="display: none;">

        <table class="d">
            <tr>
                <td colspan="4">
                    <h3>SCORING</h3>
                </td>
            </tr>
            <tr>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_FIBHVSFV_Q24_1" runat="server" OnClick="javascript:FIBHVSFV_Q24();" /><asp:Label ID="lbl_FIBHVSFV_Q24_1" runat="server" Text="Label"></asp:Label>
                        </li>
                    </ul>

                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_FIBHVSFV_Q24_2" runat="server" OnClick="javascript:FIBHVSFV_Q24();" /><asp:Label ID="lbl_FIBHVSFV_Q24_2" runat="server" Text="Label"></asp:Label>
                        </li>
                    </ul>

                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_FIBHVSFV_Q24_3" runat="server" OnClick="javascript:FIBHVSFV_Q24();" /><asp:Label ID="lbl_FIBHVSFV_Q24_3" runat="server" Text="Label"></asp:Label>
                        </li>
                    </ul>
                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_FIBHVSFV_Q24_4" runat="server" OnClick="javascript:FIBHVSFV_Q24();" /><asp:Label ID="lbl_FIBHVSFV_Q24_4" runat="server" Text="Label"></asp:Label>
                        </li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td class="q">If the above criterion is met, score 1; otherwise, continue.
                </td>
                <td class="q">If the above criterion is met, score 3; otherwise, continue.
                </td>
                <td class="q">If the above criterion is met, score 5; otherwise, continue.
                </td>
                <td class="q">If the above criterion is met, score 7.
                </td>
            </tr>
            <tr>
                <td class="scoring" colspan="4">Score:<asp:Label ID="lblScore_FIBHVSFV_Q24" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <%-- <tr>
            <td class="d" aria-orientation="horizontal" colspan="4">
                <asp:RadioButtonList ID="chkScore_FIBHVSFV_Q24" runat="server" RepeatDirection="Horizontal" Width="100%" ValidationGroup="Val1">
                   <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ErrorMessage="Required-(B4, IR 3)" ControlToValidate="chkScore_FIBHVSFV_Q24" ValidationGroup="Val1"></asp:RequiredFieldValidator>
            </td>
            </tr>--%>
            <tr>
                <td class="d">
                    <asp:RadioButton ID="chkScore_FIBHVSFV_Q24_1" GroupName="chkScore_FIBHVSFV_Q24" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_FIBHVSFV_Q24_1" runat="server" /><br />--%>
                1<br />
                    Low Quality<br />
                    No instances of parent or family involvement beyond home visits and scheduled family events.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_FIBHVSFV_Q24_2" GroupName="chkScore_FIBHVSFV_Q24" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_FIBHVSFV_Q24_2" runat="server" /><br />--%>
              3<br />
                    Average Quality<br />
                    Isolated instances of parent or family involvement beyond home visits and scheduled family events, with only one example (e.g. parent council, employment).
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_FIBHVSFV_Q24_3" GroupName="chkScore_FIBHVSFV_Q24" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_FIBHVSFV_Q24_3" runat="server" /><br />--%>
               5<br />
                    Above Average Quality<br />
                    Multiple instances of active parent or family involvement beyond home visits or scheduled family events. At least two unique examples.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_FIBHVSFV_Q24_4" GroupName="chkScore_FIBHVSFV_Q24" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_FIBHVSFV_Q24_4" runat="server" /><br />--%>
                7<br />
                    High Quality<br />
                    Evidence of dedicated attention to parent or family involvement beyond home visits or scheduled family events. At least three unique examples.
                </td>
            </tr>
        </table>
    </div>
    <!---------------------------------------------------------------------------------->
    <!---HERE-->
    <script type="text/javascript">
        function FRM_Q25() {
            var add = 0;
            if (document.getElementById('<%=chk_FRM_Q25_1.ClientID%>').checked == true) {
                add++;
                //document.getElementById('<%=lblScore_FRM_Q25.ClientID%>').innerHTML = 7;
            }
            if (document.getElementById('<%=chk_FRM_Q25_2.ClientID%>').checked == true) {
                add++;
                //document.getElementById('<%=lblScore_FRM_Q25.ClientID%>').innerHTML = 5;
            }
            if (document.getElementById('<%=chk_FRM_Q25_3.ClientID%>').checked == true) {
                add++;
                //document.getElementById('<%=lblScore_FRM_Q25.ClientID%>').innerHTML = 5;
            }
            if (document.getElementById('<%=chk_FRM_Q25_4.ClientID%>').checked == true) {
                add++;
                //document.getElementById('<%=lblScore_FRM_Q25.ClientID%>').innerHTML = 5;
            }
            if (document.getElementById('<%=chk_FRM_Q25_5.ClientID%>').checked == true) {
                add++;
                //document.getElementById('<%=lblScore_FRM_Q25.ClientID%>').innerHTML = 5;
            }
            if (document.getElementById('<%=chk_FRM_Q25_6.ClientID%>').checked == true) {
                add++;
                //document.getElementById('<%=lblScore_FRM_Q25.ClientID%>').innerHTML = 5;
            }
            if (document.getElementById('<%=chk_FRM_Q25_7.ClientID%>').checked == true) {
                add++;
                //document.getElementById('<%=lblScore_FRM_Q25.ClientID%>').innerHTML = 5;
            }
            if (document.getElementById('<%=chk_FRM_Q25_8.ClientID%>').checked == true) {
                add++;
                //document.getElementById('<%=lblScore_FRM_Q25.ClientID%>').innerHTML = 5;
            }
            if (document.getElementById('<%=chk_FRM_Q25_9.ClientID%>').checked == true) {
                add++;

            }


            if (add >= 8) {
                document.getElementById('<%=lblScore_FRM_Q25.ClientID%>').innerHTML = 7;
            }

            else if (add >= 5 && add < 7) {
                document.getElementById('<%=lblScore_FRM_Q25.ClientID%>').innerHTML = 5;
            }

            else if (add >= 3 && add <= 4) {
                document.getElementById('<%=lblScore_FRM_Q25.ClientID%>').innerHTML = 3;
            }
            else if (add < 3) {
                document.getElementById('<%=lblScore_FRM_Q25.ClientID%>').innerHTML = 1;
            }
            else {
                document.getElementById('<%=lblScore_FRM_Q25.ClientID%>').innerHTML = " ";
            }
    var score = 0;
    score = document.getElementById('<%=lblScore_FRM_Q25.ClientID%>').textContent;


    scoring(score, '<%=chkScore_FRM_Q25_1.ClientID%>', '<%=chkScore_FRM_Q25_2.ClientID%>',
                       '<%=chkScore_FRM_Q25_3.ClientID%>', '<%=chkScore_FRM_Q25_4.ClientID%>');
}
    </script>
    <div style="cursor: pointer;" onclick="javascript:DivClicked('FRM_Q25');">
        <h3 class="scoringTitle">
            <img src="../Images/edit_add.png" height="40" style="width: 40px" />LEADERSHIP PRACTICE: FISCAL RESOURCE MANAGEMENT (Scale D2, IR 2)</h3>
    </div>
    <div id="FRM_Q25" style="display: none;">

        <table class="d">
            <tr>
                <td colspan="4">
                    <h3>SCORING</h3>
                </td>
            </tr>
            <tr>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_FRM_Q25_1" runat="server" OnClick="javascript:FRM_Q25();" /><asp:Label ID="lbl_FRM_Q25_1" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_FRM_Q25_2" runat="server" OnClick="javascript:FRM_Q25();" /><asp:Label ID="lbl_FRM_Q25_2" runat="server"></asp:Label>
                        </li>
                    </ul>

                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_FRM_Q25_3" runat="server" OnClick="javascript:FRM_Q25();" /><asp:Label ID="lbl_FRM_Q25_3" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_FRM_Q25_4" runat="server" OnClick="javascript:FRM_Q25();" /><asp:Label ID="lbl_FRM_Q25_4" runat="server"></asp:Label>
                        </li>
                    </ul>

                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_FRM_Q25_5" runat="server" OnClick="javascript:FRM_Q25();" /><asp:Label ID="lbl_FRM_Q25_5" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_FRM_Q25_6" runat="server" OnClick="javascript:FRM_Q25();" /><asp:Label ID="lbl_FRM_Q25_6" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_FRM_Q25_7" runat="server" OnClick="javascript:FRM_Q25();" /><asp:Label ID="lbl_FRM_Q25_7" runat="server"></asp:Label>
                        </li>
                    </ul>
                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_FRM_Q25_8" runat="server" OnClick="javascript:FRM_Q25();" /><asp:Label ID="lbl_FRM_Q25_8" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_FRM_Q25_9" runat="server" OnClick="javascript:FRM_Q25();" /><asp:Label ID="lbl_FRM_Q25_9" runat="server"></asp:Label>
                        </li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td class="q">If <3 of the criteria are met, score 1.
                </td>
                <td class="q">If 3-4 of the criteria met, score 3.
                </td>
                <td class="q">If 5-7 of the criteria are met, score 5.
                </td>
                <td class="q">If ≥8 of the criteria are met including both in the above column, score 7.
                </td>
            </tr>
            <tr>
                <td class="scoring" colspan="4">Score:<asp:Label ID="lblScore_FRM_Q25" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <%--<tr>
             <td class="d" aria-orientation="horizontal" colspan="4">
                <asp:RadioButtonList ID="chkScore_FRM_Q25" runat="server" RepeatDirection="Horizontal" Width="100%" ValidationGroup="Val1">
                   <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ErrorMessage="Required-(D2, IR 2)" ControlToValidate="chkScore_FRM_Q25" ValidationGroup="Val1"></asp:RequiredFieldValidator>
            </td>
            </tr>--%>
            <tr>
                <td class="d">
                    <asp:RadioButton ID="chkScore_FRM_Q25_1" GroupName="chkScore_FRM_Q25" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_FRM_Q25_1" runat="server" /><br />--%>
                1<br />
                    Low Quality<br />
                    Management staff have minimal skills in fiscal resource management.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_FRM_Q25_2" GroupName="chkScore_FRM_Q25" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_FRM_Q25_2" runat="server" /><br />--%>
              3<br />
                    Average Quality<br />
                    Management staff shows some skills in fiscal resource management.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_FRM_Q25_3" GroupName="chkScore_FRM_Q25" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_FRM_Q25_3" runat="server" /><br />--%>
               5<br />
                    Above Average Quality<br />
                    Management staff have solid skills in fiscal resource management.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_FRM_Q25_4" GroupName="chkScore_FRM_Q25" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_FRM_Q25_4" runat="server" /><br />--%>
                7<br />
                    High Quality<br />
                    Management staff have advanced skills in fiscal resource management.
                </td>
            </tr>
        </table>
    </div>
    <!---------------------------------------------------------------------------------->
    <script type="text/javascript">
        function SAI_Q26() {
            if (document.getElementById('<%=chk_SAI_Q26_1.ClientID%>').checked != true
               && document.getElementById('<%=chk_SAI_Q26_2.ClientID%>').checked == true
                && document.getElementById('<%=chk_SAI_Q26_3.ClientID%>').checked == true
                && document.getElementById('<%=chk_SAI_Q26_4.ClientID%>').checked == true
                && document.getElementById('<%=chk_SAI_Q26_5.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_SAI_Q26.ClientID%>').innerHTML = 7;
            }
            else if (document.getElementById('<%=chk_SAI_Q26_1.ClientID%>').checked != true
               && document.getElementById('<%=chk_SAI_Q26_2.ClientID%>').checked == true
                && document.getElementById('<%=chk_SAI_Q26_3.ClientID%>').checked == true
                && document.getElementById('<%=chk_SAI_Q26_4.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_SAI_Q26.ClientID%>').innerHTML = 5;
            }
            else if ((document.getElementById('<%=chk_SAI_Q26_1.ClientID%>').checked != true)
               && (document.getElementById('<%=chk_SAI_Q26_2.ClientID%>').checked == true
                || document.getElementById('<%=chk_SAI_Q26_3.ClientID%>').checked == true
                || document.getElementById('<%=chk_SAI_Q26_4.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_SAI_Q26.ClientID%>').innerHTML = 3;
            }

            else if (document.getElementById('<%=chk_SAI_Q26_1.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_SAI_Q26.ClientID%>').innerHTML = 1;
            }
            else {
                document.getElementById('<%=lblScore_SAI_Q26.ClientID%>').innerHTML = " ";
            }
    var score = 0;
    score = document.getElementById('<%=lblScore_SAI_Q26.ClientID%>').textContent;


    scoring(score, '<%=chkScore_SAI_Q26_1.ClientID%>', '<%=chkScore_SAI_Q26_2.ClientID%>',
                     '<%=chkScore_SAI_Q26_3.ClientID%>', '<%=chkScore_SAI_Q26_4.ClientID%>');
}
    </script>
    <div style="cursor: pointer;" onclick="javascript:DivClicked('SAI_Q26');">
        <h3 class="scoringTitle">
            <img src="../Images/edit_add.png" height="40" style="width: 40px" />POLICIES AND GUIDELINES: STAFF AWARENESS/INVOLVEMENT (Scale D4, IR 2)</h3>
    </div>
    <div id="SAI_Q26" style="display: none;">

        <table class="d">
            <tr>
                <td colspan="4">
                    <h3>SCORING</h3>
                </td>
            </tr>
            <tr>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_SAI_Q26_1" runat="server" OnClick="javascript:SAI_Q26();" /><asp:Label ID="lbl_SAI_Q26_1" runat="server" Text="Label"></asp:Label>
                        </li>
                    </ul>

                </td>
                <td class="q" colspan="2">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_SAI_Q26_2" runat="server" OnClick="javascript:SAI_Q26();" /><asp:Label ID="lbl_SAI_Q26_2" runat="server" Text="Label"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_SAI_Q26_3" runat="server" OnClick="javascript:SAI_Q26();" /><asp:Label ID="lbl_SAI_Q26_3" runat="server" Text="Label"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_SAI_Q26_4" runat="server" OnClick="javascript:SAI_Q26();" /><asp:Label ID="lbl_SAI_Q26_4" runat="server" Text="Label"></asp:Label>
                        </li>
                    </ul>

                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_SAI_Q26_5" runat="server" OnClick="javascript:SAI_Q26();" /><asp:Label ID="lbl_SAI_Q26_5" runat="server" Text="Label"></asp:Label>
                        </li>
                    </ul>

                    Note: Does not need to cover all policies/procedures annually but should show deliberate action to
                    focus on policies that are relevant to program operations, concerns, or issues. Noting that policies and
                    procedures are discussed “as necessary” without a sense that this is planned or considered does not score a 7.                                            
                </td>
            </tr>
            <tr>
                <td class="q">If the above criterion is met, score 1; otherwise, continue.
                </td>
                <td class="q" colspan="2">If ALL criteria are met, continue; otherwise, score 3.
                </td>
                <td class="q">If the above criterion is met, score 7; otherwise, score 5.
                </td>
            </tr>
            <tr>
                <td class="scoring" colspan="4">Score:<asp:Label ID="lblScore_SAI_Q26" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <%--<tr>
            <td class="d" aria-orientation="horizontal" colspan="4">
                <asp:RadioButtonList ID="chkScore_SAI_Q26" runat="server" RepeatDirection="Horizontal" Width="100%" ValidationGroup="Val1">
                   <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ErrorMessage="Required-(D4, IR 2)" ControlToValidate="chkScore_SAI_Q26" ValidationGroup="Val1"></asp:RequiredFieldValidator>
            </td>
            </tr>--%>
            <tr>
                <td class="d">
                    <asp:RadioButton ID="chkScore_SAI_Q26_1" GroupName="chkScore_SAI_Q26" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_SAI_Q26_1" runat="server" /><br />--%>
                1<br />
                    Low Quality<br />
                    Staff are unaware of written policies/ procedures.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_SAI_Q26_2" GroupName="chkScore_SAI_Q26" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_SAI_Q26_2" runat="server" /><br />--%>
              3<br />
                    Average Quality<br />
                    Staff have at least minimal knowledge of policies (e.g., they see policies and procedures when first hired).
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_SAI_Q26_3" GroupName="chkScore_SAI_Q26" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_SAI_Q26_3" runat="server" /><br />--%>
               5<br />
                    Above Average Quality<br />
                    Staff read and sign written policies and procedures. Staff are made aware of changes or updates in a timely manner.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_SAI_Q26_4" GroupName="chkScore_SAI_Q26" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_SAI_Q26_4" runat="server" /><br />--%>
                7<br />
                    High Quality<br />
                    Staff read and sign written policies and procedures. These policies and procedures are reviewed on an annual basis.
                </td>
            </tr>
        </table>
    </div>
    <!---------------------------------------------------------------------------------->
    <script type="text/javascript">
        function FREQUENCY_Q27() {
            if (document.getElementById('<%=chk_FREQUENCY_Q27_1.ClientID%>').checked != true
               && document.getElementById('<%=chk_FREQUENCY_Q27_2.ClientID%>').checked != true
                && document.getElementById('<%=chk_FREQUENCY_Q27_3.ClientID%>').checked == true
                && document.getElementById('<%=chk_FREQUENCY_Q27_4.ClientID%>').checked == true
                && document.getElementById('<%=chk_FREQUENCY_Q27_5.ClientID%>').checked == true
                && document.getElementById('<%=chk_FREQUENCY_Q27_6.ClientID%>').checked == true
                && document.getElementById('<%=chk_FREQUENCY_Q27_7.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_FREQUENCY_Q27.ClientID%>').innerHTML = 7;
            }
            else if ((document.getElementById('<%=chk_FREQUENCY_Q27_1.ClientID%>').checked != true
               && document.getElementById('<%=chk_FREQUENCY_Q27_2.ClientID%>').checked != true
                && document.getElementById('<%=chk_FREQUENCY_Q27_3.ClientID%>').checked == true
                && document.getElementById('<%=chk_FREQUENCY_Q27_4.ClientID%>').checked == true
                && document.getElementById('<%=chk_FREQUENCY_Q27_5.ClientID%>').checked == true)
                && (document.getElementById('<%=chk_FREQUENCY_Q27_6.ClientID%>').checked == true
                || document.getElementById('<%=chk_FREQUENCY_Q27_7.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_FREQUENCY_Q27.ClientID%>').innerHTML = 5;
            }
            else if ((document.getElementById('<%=chk_FREQUENCY_Q27_1.ClientID%>').checked != true
                && document.getElementById('<%=chk_FREQUENCY_Q27_2.ClientID%>').checked != true
                && document.getElementById('<%=chk_FREQUENCY_Q27_3.ClientID%>').checked == true
                && document.getElementById('<%=chk_FREQUENCY_Q27_4.ClientID%>').checked == true
                && document.getElementById('<%=chk_FREQUENCY_Q27_5.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_FREQUENCY_Q27.ClientID%>').innerHTML = 5;
            }
            else if ((document.getElementById('<%=chk_FREQUENCY_Q27_1.ClientID%>').checked != true
                && document.getElementById('<%=chk_FREQUENCY_Q27_2.ClientID%>').checked != true
                && document.getElementById('<%=chk_FREQUENCY_Q27_3.ClientID%>').checked == true
                && document.getElementById('<%=chk_FREQUENCY_Q27_4.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_FREQUENCY_Q27.ClientID%>').innerHTML = 3;
            }

            else if ((document.getElementById('<%=chk_FREQUENCY_Q27_1.ClientID%>').checked != true
                && document.getElementById('<%=chk_FREQUENCY_Q27_2.ClientID%>').checked != true)
                && (document.getElementById('<%=chk_FREQUENCY_Q27_3.ClientID%>').checked == true
                || document.getElementById('<%=chk_FREQUENCY_Q27_4.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_FREQUENCY_Q27.ClientID%>').innerHTML = 1;
            }
            else if (document.getElementById('<%=chk_FREQUENCY_Q27_1.ClientID%>').checked != true
           && document.getElementById('<%=chk_FREQUENCY_Q27_2.ClientID%>').checked != true) {
                document.getElementById('<%=lblScore_FREQUENCY_Q27.ClientID%>').innerHTML = 1;
            }
            else {
                document.getElementById('<%=lblScore_FREQUENCY_Q27.ClientID%>').innerHTML = 1;
            }
    var score = 0;
    score = document.getElementById('<%=lblScore_FREQUENCY_Q27.ClientID%>').textContent;


    scoring(score, '<%=chkScore_FREQUENCY_Q27_1.ClientID%>', '<%=chkScore_FREQUENCY_Q27_2.ClientID%>',
                     '<%=chkScore_FREQUENCY_Q27_3.ClientID%>', '<%=chkScore_FREQUENCY_Q27_4.ClientID%>');
}
    </script>
    <div style="cursor: pointer;" onclick="javascript:DivClicked('FREQUENCY_Q27');">
        <h3 class="scoringTitle">
            <img src="../Images/edit_add.png" height="40" style="width: 40px" />SUPERVISION: FREQUENCY (Scale D5, IR 1)</h3>
    </div>
    <div id="FREQUENCY_Q27" style="display: none;">

        <table class="d">
            <tr>
                <td colspan="4">
                    <h3>SCORING</h3>
                </td>
            </tr>
            <tr>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_FREQUENCY_Q27_1" runat="server" OnClick="javascript:FREQUENCY_Q27();" /><asp:Label ID="lbl_FREQUENCY_Q27_1" runat="server" Text="Label"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_FREQUENCY_Q27_2" runat="server" OnClick="javascript:FREQUENCY_Q27();" /><asp:Label ID="lbl_FREQUENCY_Q27_2" runat="server" Text="Label"></asp:Label>
                        </li>
                    </ul>

                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_FREQUENCY_Q27_3" runat="server" OnClick="javascript:FREQUENCY_Q27();" /><asp:Label ID="lbl_FREQUENCY_Q27_3" runat="server" Text="Label"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_FREQUENCY_Q27_4" runat="server" OnClick="javascript:FREQUENCY_Q27();" /><asp:Label ID="lbl_FREQUENCY_Q27_4" runat="server" Text="Label"></asp:Label>
                        </li>

                    </ul>

                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_FREQUENCY_Q27_5" runat="server" OnClick="javascript:FREQUENCY_Q27();" /><asp:Label ID="lbl_FREQUENCY_Q27_5" runat="server" Text="Label"></asp:Label>
                        </li>
                    </ul>
                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_FREQUENCY_Q27_6" runat="server" OnClick="javascript:FREQUENCY_Q27();" /><asp:Label ID="lbl_FREQUENCY_Q27_6" runat="server" Text="Label"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_FREQUENCY_Q27_7" runat="server" OnClick="javascript:FREQUENCY_Q27();" /><asp:Label ID="lbl_FREQUENCY_Q27_7" runat="server" Text="Label"></asp:Label>
                        </li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td class="q">If EITHER criterion is met, score 1; otherwise, continue.
                </td>
                <td class="q">If BOTH criteria are met, continue; otherwise, score 1.
                </td>
                <td class="q">If the above criterion is met, continue; otherwise, score 3.
                </td>
                <td class="q">If BOTH criteria are met, score 7; otherwise, score 5.
                </td>
            </tr>
            <tr>
                <td class="scoring" colspan="4">Score:<asp:Label ID="lblScore_FREQUENCY_Q27" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <%--<tr>
            <td class="d" aria-orientation="horizontal" colspan="4">
                <asp:RadioButtonList ID="chkScore_FREQUENCY_Q27" runat="server" RepeatDirection="Horizontal" Width="100%" ValidationGroup="Val1">
                   <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" ErrorMessage="Required-(D5, IR 1)" ControlToValidate="chkScore_FREQUENCY_Q27" ValidationGroup="Val1"></asp:RequiredFieldValidator>
            </td>
            </tr>--%>
            <tr>
                <td class="d">
                    <asp:RadioButton ID="chkScore_FREQUENCY_Q27_1" GroupName="chkScore_FREQUENCY_Q27" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_FREQUENCY_Q27_1" runat="server" /><br />--%>
                1<br />
                    Low Quality<br />
                    Program lacks clear expectations for ongoing individual supervision or supervision occurs less than monthly.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_FREQUENCY_Q27_2" GroupName="chkScore_FREQUENCY_Q27" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_FREQUENCY_Q27_2" runat="server" /><br />--%>
              3<br />
                    Average Quality<br />
                    Individual supervision is specified in policies and occurs at least monthly.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_FREQUENCY_Q27_3" GroupName="chkScore_FREQUENCY_Q27" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_FREQUENCY_Q27_3" runat="server" /><br />--%>
               5<br />
                    Above Average Quality<br />
                    Regular and consistent individual supervision is provided at least twice a month.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_FREQUENCY_Q27_4" GroupName="chkScore_FREQUENCY_Q27" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_FREQUENCY_Q27_4" runat="server" /><br />--%>
                7<br />
                    High Quality<br />
                    Regular and consistent weekly individual supervision is provided. Frequency of individual supervision is tracked and monitored.
                </td>
            </tr>
        </table>
    </div>
    <!---------------------------------------------------------------------------------->
    <script type="text/javascript">
        function GPS_Q28() {
            var add = 0; chk = true;
            if (document.getElementById('<%=chk_GPS_Q28_4.ClientID%>').checked == true) {
                add++;
                chk = false;
                document.getElementById('<%=lblScore_GPS_Q28.ClientID%>').innerHTML = 7;
            }

            if (document.getElementById('<%=chk_GPS_Q28_3.ClientID%>').checked == true) {
                add++;
                chk = false;
                document.getElementById('<%=lblScore_GPS_Q28.ClientID%>').innerHTML = 5;
            }

            if (document.getElementById('<%=chk_GPS_Q28_2.ClientID%>').checked == true) {
                add++;
                chk = false;
                document.getElementById('<%=lblScore_GPS_Q28.ClientID%>').innerHTML = 3;
            }

            if (document.getElementById('<%=chk_GPS_Q28_1.ClientID%>').checked == true) {
                add++;
                chk = false;
                document.getElementById('<%=lblScore_GPS_Q28.ClientID%>').innerHTML = 1;
            }
            if (chk == true) {
                document.getElementById('<%=lblScore_GPS_Q28.ClientID%>').innerHTML = " ";
            }

            if (add > 1) {
                alert("Only 1 option can be checked");
            }
            var score = 0;
            score = document.getElementById('<%=lblScore_GPS_Q28.ClientID%>').textContent;


            scoring(score, '<%=chkScore_GPS_Q28_1.ClientID%>', '<%=chkScore_GPS_Q28_2.ClientID%>',
    '<%=chkScore_GPS_Q28_3.ClientID%>', '<%=chkScore_GPS_Q28_4.ClientID%>');
        }
    </script>
    <div style="cursor: pointer;" onclick="javascript:DivClicked('GPS_Q28');">
        <h3 class="scoringTitle">
            <img src="../Images/edit_add.png" height="40" style="width: 40px" />SUPERVISION: GROUP/PEER SUPERVISION (Scale D5, IR 4)</h3>
    </div>
    <div id="GPS_Q28" style="display: none;">
        <table class="d">
            <tr>
                <td colspan="4">
                    <h3>SCORING</h3>
                </td>
            </tr>
            <tr>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_GPS_Q28_1" runat="server" OnClick="javascript:GPS_Q28();" /><asp:Label ID="lbl_GPS_Q28_1" runat="server"></asp:Label>
                        </li>
                    </ul>

                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_GPS_Q28_2" runat="server" OnClick="javascript:GPS_Q28();" /><asp:Label ID="lbl_GPS_Q28_2" runat="server"></asp:Label>
                        </li>
                    </ul>

                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_GPS_Q28_3" runat="server" OnClick="javascript:GPS_Q28();" /><asp:Label ID="lbl_GPS_Q28_3" runat="server"></asp:Label>
                        </li>
                    </ul>
                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_GPS_Q28_4" runat="server" OnClick="javascript:GPS_Q28();" /><asp:Label ID="lbl_GPS_Q28_4" runat="server"></asp:Label>
                        </li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td class="q">If the above criterion is met, score 1; otherwise, continue.
                </td>
                <td class="q">If the above criterion is met, score 3; otherwise, continue.
                </td>
                <td class="q">If the above criterion is met, score 5; otherwise, continue.
                </td>
                <td class="q">If the above criterion is met, score 7.
                </td>
            </tr>
            <tr>
                <td class="scoring" colspan="4">Score:<asp:Label ID="lblScore_GPS_Q28" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <%-- <tr>
            <td class="d" aria-orientation="horizontal" colspan="4">
                <asp:RadioButtonList ID="chkScore_GPS_Q28" runat="server" RepeatDirection="Horizontal" Width="100%" ValidationGroup="Val1">
                   <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ErrorMessage="Required-(D5, IR 4)" ControlToValidate="chkScore_GPS_Q28" ValidationGroup="Val1"></asp:RequiredFieldValidator>
            </td>
            </tr>--%>
            <tr>
                <td class="d">
                    <asp:RadioButton ID="chkScore_GPS_Q28_1" GroupName="chkScore_GPS_Q28" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_GPS_Q28_1" runat="server" /><br />--%>
                1<br />
                    Low Quality<br />
                    Program does not provide group supervision or peer-to-peer sessions.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_GPS_Q28_2" GroupName="chkScore_GPS_Q28" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_GPS_Q28_2" runat="server" /><br />--%>
              3<br />
                    Average Quality<br />
                    Home visitors have at least infrequent (≤ every other month) group supervision or peer-to-peer sessions.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_GPS_Q28_3" GroupName="chkScore_GPS_Q28" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_GPS_Q28_3" runat="server" /><br />--%>
               5<br />
                    Above Average Quality<br />
                    Home visitors have group supervision or peer-to-peer sessions at least once a month.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_GPS_Q28_4" GroupName="chkScore_GPS_Q28" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_GPS_Q28_4" runat="server" /><br />--%>
                7<br />
                    High Quality<br />
                    Home visitors have group supervision or peer-to-peer sessions at least twice a month.
                </td>
            </tr>
        </table>
    </div>
    <!---------------------------------------------------------------------------------->
    <script type="text/javascript">
        function STSR_Q29() {
            var add = 0; chk = true;
            if (document.getElementById('<%=chk_STSR_Q29_4.ClientID%>').checked == true) {
                add++;
                chk = false;
                document.getElementById('<%=lblScore_STSR_Q29.ClientID%>').innerHTML = 7;
            }
            if (document.getElementById('<%=chk_STSR_Q29_3.ClientID%>').checked == true) {
                add++;
                chk = false;
                document.getElementById('<%=lblScore_STSR_Q29.ClientID%>').innerHTML = 5;
            }
            if (document.getElementById('<%=chk_STSR_Q29_2.ClientID%>').checked == true) {
                add++;
                chk = false;
                document.getElementById('<%=lblScore_STSR_Q29.ClientID%>').innerHTML = 3;
            }

            if (document.getElementById('<%=chk_STSR_Q29_1.ClientID%>').checked == true) {
                add++;
                chk = false;
                document.getElementById('<%=lblScore_STSR_Q29.ClientID%>').innerHTML = 1;
            }
            if (chk == true) {
                document.getElementById('<%=lblScore_GPS_Q28.ClientID%>').innerHTML = " ";
            }

            if (add > 1) {
                alert("Only 1 option can be checked");
            }
            var score = 0;
            score = document.getElementById('<%=lblScore_STSR_Q29.ClientID%>').textContent;


            scoring(score, '<%=chkScore_STSR_Q29_1.ClientID%>', '<%=chkScore_STSR_Q29_2.ClientID%>',
   '<%=chkScore_STSR_Q29_3.ClientID%>', '<%=chkScore_STSR_Q29_4.ClientID%>');
        }
    </script>
    <div style="cursor: pointer;" onclick="javascript:DivClicked('STSR_Q29');">
        <h3 class="scoringTitle">
            <img src="../Images/edit_add.png" height="40" style="width: 40px" />SUPERVISION: SUPERVISOR TO STAFF RATIO (Scale D5, IR 3)</h3>
    </div>
    <div id="STSR_Q29" style="display: none;">
        <table class="d">
            <tr>
                <td colspan="4">
                    <h3>SCORING</h3>
                </td>
            </tr>
            <tr>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_STSR_Q29_1" runat="server" OnClick="javascript:STSR_Q29();" /><asp:Label ID="lbl_STSR_Q29_1" runat="server" Text="Label"></asp:Label>
                        </li>
                    </ul>

                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_STSR_Q29_2" runat="server" OnClick="javascript:STSR_Q29();" /><asp:Label ID="lbl_STSR_Q29_2" runat="server" Text="Label"></asp:Label>
                        </li>
                    </ul>

                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_STSR_Q29_3" runat="server" OnClick="javascript:STSR_Q29();" /><asp:Label ID="lbl_STSR_Q29_3" runat="server" Text="Label"></asp:Label>
                        </li>
                    </ul>
                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_STSR_Q29_4" runat="server" OnClick="javascript:STSR_Q29();" /><asp:Label ID="lbl_STSR_Q29_4" runat="server" Text="Label"></asp:Label>
                        </li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td class="q">If the above criterion is met, score 1; otherwise, continue.
                </td>
                <td class="q">If the above criterion is met, score 3; otherwise, continue.
                </td>
                <td class="q">If the above criterion is met, score 5; otherwise, continue.
                </td>
                <td class="q">If the above criterion is met, score 7.
                </td>
            </tr>
            <tr>
                <td class="scoring" colspan="4">Score:<asp:Label ID="lblScore_STSR_Q29" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <%--  <tr>
            <td class="d" aria-orientation="horizontal" colspan="4">
                <asp:RadioButtonList ID="chkScore_STSR_Q29" runat="server" RepeatDirection="Horizontal" Width="100%" ValidationGroup="Val1">
                   <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" ErrorMessage="Required-(D5, IR 3)" ControlToValidate="chkScore_STSR_Q29" ValidationGroup="Val1"></asp:RequiredFieldValidator>
            </td>
            </tr>--%>
            <tr>
                <td class="d">
                    <asp:RadioButton ID="chkScore_STSR_Q29_1" GroupName="chkScore_STSR_Q29" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_STSR_Q29_1" runat="server" /><br />--%>
                1<br />
                    Low Quality<br />
                    Supervisor to home visitor ratio is higher than 15 to 1.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_STSR_Q29_2" GroupName="chkScore_STSR_Q29" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_STSR_Q29_2" runat="server" /><br />--%>
              3<br />
                    Average Quality<br />
                    Supervisor to home visitor ratio is no more than 15 to 1.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_STSR_Q29_3" GroupName="chkScore_STSR_Q29" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_STSR_Q29_3" runat="server" /><br />--%>
               5<br />
                    Above Average Quality<br />
                    Supervisor to home visitor ratio is no more than 10 to 1.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_STSR_Q29_4" GroupName="chkScore_STSR_Q29" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_STSR_Q29_4" runat="server" /><br />--%>
                7<br />
                    High Quality<br />
                    Supervisor to home visitor ratio no more than 8 to 1.
                </td>
            </tr>
        </table>
    </div>

    <!---------------------------------------------------------------------------------->
    <script type="text/javascript">
        function SO_Q30() {
            if (document.getElementById('<%=chk_SO_Q30_1.ClientID%>').checked != true
               && document.getElementById('<%=chk_SO_Q30_2.ClientID%>').checked != true
                && document.getElementById('<%=chk_SO_Q30_3.ClientID%>').checked == true
                && document.getElementById('<%=chk_SO_Q30_4.ClientID%>').checked == true
                 && document.getElementById('<%=chk_SO_Q30_5.ClientID%>').checked == true
                && document.getElementById('<%=chk_SO_Q30_6.ClientID%>').checked == true
                && document.getElementById('<%=chk_SO_Q30_7.ClientID%>').checked == true
                 && document.getElementById('<%=chk_SO_Q30_8.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_SO_Q30.ClientID%>').innerHTML = 7;
            }
            else if ((document.getElementById('<%=chk_SO_Q30_1.ClientID%>').checked != true
         && document.getElementById('<%=chk_SO_Q30_2.ClientID%>').checked != true)
                && (document.getElementById('<%=chk_SO_Q30_3.ClientID%>').checked == true
                && document.getElementById('<%=chk_SO_Q30_4.ClientID%>').checked == true)
                && (document.getElementById('<%=chk_SO_Q30_5.ClientID%>').checked == true
                || document.getElementById('<%=chk_SO_Q30_6.ClientID%>').checked == true
                 || document.getElementById('<%=chk_SO_Q30_7.ClientID%>').checked == true
                 || document.getElementById('<%=chk_SO_Q30_8.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_SO_Q30.ClientID%>').innerHTML = 5;
            }
            else if ((document.getElementById('<%=chk_SO_Q30_1.ClientID%>').checked != true
         && document.getElementById('<%=chk_SO_Q30_2.ClientID%>').checked != true)
                && (document.getElementById('<%=chk_SO_Q30_3.ClientID%>').checked == true
                && document.getElementById('<%=chk_SO_Q30_4.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_SO_Q30.ClientID%>').innerHTML = 5;
            }
            else if ((document.getElementById('<%=chk_SO_Q30_1.ClientID%>').checked != true
                && document.getElementById('<%=chk_SO_Q30_2.ClientID%>').checked != true)
                 && (document.getElementById('<%=chk_SO_Q30_3.ClientID%>').checked == true
                 || document.getElementById('<%=chk_SO_Q30_4.ClientID%>').checked == true)) {
                 document.getElementById('<%=lblScore_SO_Q30.ClientID%>').innerHTML = 3;
             }
             else if ((document.getElementById('<%=chk_SO_Q30_1.ClientID%>').checked != true)
                && (document.getElementById('<%=chk_SO_Q30_2.ClientID%>').checked == true)) {
                 document.getElementById('<%=lblScore_SO_Q30.ClientID%>').innerHTML = 3;
             }

             else if (document.getElementById('<%=chk_SO_Q30_1.ClientID%>').checked == true) {
                 document.getElementById('<%=lblScore_SO_Q30.ClientID%>').innerHTML = 1;
             }
             else {
                 document.getElementById('<%=lblScore_SO_Q30.ClientID%>').innerHTML = " ";
             }
    var score = 0;
    score = document.getElementById('<%=lblScore_SO_Q30.ClientID%>').textContent;


    scoring(score, '<%=chkScore_SO_Q30_1.ClientID%>', '<%=chkScore_SO_Q30_2.ClientID%>',
                   '<%=chkScore_SO_Q30_3.ClientID%>', '<%=chkScore_SO_Q30_4.ClientID%>');
}
    </script>
    <div style="cursor: pointer;" onclick="javascript:DivClicked('SO_Q30');">
        <h3 class="scoringTitle">
            <img src="../Images/edit_add.png" height="40" style="width: 40px" />SUPERVISION: SUPERVISOR OBSERVATIONS (Scale D5, IR 5)</h3>
    </div>
    <div id="SO_Q30" style="display: none;">

        <table class="d">
            <tr>
                <td colspan="4">
                    <h3>SCORING</h3>
                </td>
            </tr>
            <tr>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_SO_Q30_1" runat="server" OnClick="javascript:SO_Q30();" /><asp:Label ID="lbl_SO_Q30_1" runat="server" Text="Label"></asp:Label>
                        </li>
                    </ul>

                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_SO_Q30_2" runat="server" OnClick="javascript:SO_Q30();" /><asp:Label ID="lbl_SO_Q30_2" runat="server"></asp:Label>
                        </li>
                    </ul>

                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_SO_Q30_3" runat="server" OnClick="javascript:SO_Q30();" /><asp:Label ID="lbl_SO_Q30_3" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_SO_Q30_4" runat="server" OnClick="javascript:SO_Q30();" /><asp:Label ID="lbl_SO_Q30_4" runat="server"></asp:Label>
                        </li>
                    </ul>
                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_SO_Q30_5" runat="server" OnClick="javascript:SO_Q30();" /><asp:Label ID="lbl_SO_Q30_5" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_SO_Q30_6" runat="server" OnClick="javascript:SO_Q30();" /><asp:Label ID="lbl_SO_Q30_6" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_SO_Q30_7" runat="server" OnClick="javascript:SO_Q30();" /><asp:Label ID="lbl_SO_Q30_7" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_SO_Q30_8" runat="server" OnClick="javascript:SO_Q30();" /><asp:Label ID="lbl_SO_Q30_8" runat="server"></asp:Label>
                        </li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td class="q">If the above criterion is met, score 1; otherwise, continue.
                </td>
                <td class="q">If the above criterion is met, score 3; otherwise, continue.
                </td>
                <td class="q">If BOTH criteria are met, continue; otherwise, score 3.
                </td>
                <td class="q">If ALL criteria are met, score 7; otherwise, score 5.
                </td>
            </tr>
            <tr>
                <td class="scoring" colspan="4">Score:<asp:Label ID="lblScore_SO_Q30" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <%--<tr>
             <td class="d" aria-orientation="horizontal" colspan="4">
                <asp:RadioButtonList ID="chkScore_SO_Q30" runat="server" RepeatDirection="Horizontal" Width="100%" ValidationGroup="Val1">
                   <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" ErrorMessage="Required-(D5, IR 5)" ControlToValidate="chkScore_SO_Q30" ValidationGroup="Val1"></asp:RequiredFieldValidator>
            </td>
            </tr>--%>
            <tr>
                <td class="d">
                    <asp:RadioButton ID="chkScore_SO_Q30_1" GroupName="chkScore_SO_Q30" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_SO_Q30_1" runat="server" /><br />--%>
                1<br />
                    Low Quality<br />
                    Program does not conduct supervisor observations of home visits.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_SO_Q30_2" GroupName="chkScore_SO_Q30" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_SO_Q30_2" runat="server" /><br />--%>
              3<br />
                    Average Quality<br />
                    At least limited supervisor observations of home visits occur (e.g., may be limited to new hires).
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_SO_Q30_3" GroupName="chkScore_SO_Q30" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_SO_Q30_3" runat="server" /><br />--%>
               5<br />
                    Above Average Quality<br />
                    Supervisor observations of home visits occur at least annually for all home visitors and are tied to professional development plans or training goals.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_SO_Q30_4" GroupName="chkScore_SO_Q30" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_SO_Q30_4" runat="server" /><br />--%>
                7<br />
                    High Quality<br />
                    Supervision includes ongoing supervisor and peer/mentor observations of home visits through formalized observational protocols and explicit efforts to link observations with future service delivery and reflective supervision. 
                </td>
            </tr>
        </table>
    </div>
    <!---------------------------------------------------------------------------------->
    <script type="text/javascript">
        function MIIPD_Q31() {
            if ((document.getElementById('<%=chk_MIIPD_Q31_1.ClientID%>').checked != true
                && document.getElementById('<%=chk_MIIPD_Q31_2.ClientID%>').checked == true)
                && (document.getElementById('<%=chk_MIIPD_Q31_3.ClientID%>').checked == true
                && document.getElementById('<%=chk_MIIPD_Q31_4.ClientID%>').checked == true)
                && (document.getElementById('<%=chk_MIIPD_Q31_5.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_MIIPD_Q31.ClientID%>').innerHTML = 7;
            }
            else if (document.getElementById('<%=chk_MIIPD_Q31_1.ClientID%>').checked != true
            && document.getElementById('<%=chk_MIIPD_Q31_2.ClientID%>').checked == true
                && document.getElementById('<%=chk_MIIPD_Q31_3.ClientID%>').checked == true
                && document.getElementById('<%=chk_MIIPD_Q31_4.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_MIIPD_Q31.ClientID%>').innerHTML = 5;
            }
            else if ((document.getElementById('<%=chk_MIIPD_Q31_1.ClientID%>').checked != true
                && document.getElementById('<%=chk_MIIPD_Q31_2.ClientID%>').checked == true)
               && (document.getElementById('<%=chk_MIIPD_Q31_3.ClientID%>').checked == true
               || document.getElementById('<%=chk_MIIPD_Q31_4.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_MIIPD_Q31.ClientID%>').innerHTML = 3;
            }
            else if ((document.getElementById('<%=chk_MIIPD_Q31_1.ClientID%>').checked != true)
               && (document.getElementById('<%=chk_MIIPD_Q31_2.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_MIIPD_Q31.ClientID%>').innerHTML = 3;
            }

            else if (document.getElementById('<%=chk_MIIPD_Q31_1.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_MIIPD_Q31.ClientID%>').innerHTML = 1;
            }
            else {
                document.getElementById('<%=lblScore_MIIPD_Q31.ClientID%>').innerHTML = " ";
            }
    var score = 0;
    score = document.getElementById('<%=lblScore_MIIPD_Q31.ClientID%>').textContent;


    scoring(score, '<%=chkScore_MIIPD_Q31_1.ClientID%>', '<%=chkScore_MIIPD_Q31_2.ClientID%>',
                    '<%=chkScore_MIIPD_Q31_3.ClientID%>', '<%=chkScore_MIIPD_Q31_4.ClientID%>');
}
    </script>
    <div style="cursor: pointer;" onclick="javascript:DivClicked('MIIPD_Q31');">
        <h3 class="scoringTitle">
            <img src="../Images/edit_add.png" height="40" style="width: 40px" />STAFF MONITORING: MANAGEMENT INVOLVEMENT IN PD (Scale E2, IR 2)</h3>
    </div>
    <div id="MIIPD_Q31" style="display: none;">

        <table class="d">
            <tr>
                <td colspan="4">
                    <h3>SCORING</h3>
                </td>
            </tr>
            <tr>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_MIIPD_Q31_1" runat="server" OnClick="javascript:MIIPD_Q31();" /><asp:Label ID="lbl_MIIPD_Q31_1" runat="server"></asp:Label>
                        </li>
                    </ul>

                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_MIIPD_Q31_2" runat="server" OnClick="javascript:MIIPD_Q31();" /><asp:Label ID="lbl_MIIPD_Q31_2" runat="server"></asp:Label>
                        </li>
                    </ul>
                    (Ex: Retrospective review of completion of PD hours, informal discussion of home visitor goals and plans)
                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_MIIPD_Q31_3" runat="server" OnClick="javascript:MIIPD_Q31();" /><asp:Label ID="lbl_MIIPD_Q31_3" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_MIIPD_Q31_4" runat="server" OnClick="javascript:MIIPD_Q31();" /><asp:Label ID="lbl_MIIPD_Q31_4" runat="server"></asp:Label>
                        </li>
                    </ul>
                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_MIIPD_Q31_5" runat="server" OnClick="javascript:MIIPD_Q31();" /><asp:Label ID="lbl_MIIPD_Q31_5" runat="server"></asp:Label>
                        </li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td class="q">If the above criterion is met, score 1; otherwise, continue.
                </td>
                <td class="q">If the above criterion is met, continue, otherwise, score 1.
                </td>
                <td class="q">If BOTH criteria are met, continue; otherwise, score 3.
                </td>
                <td class="q">If the above criterion is met, score 7; otherwise, score 5.
                </td>
            </tr>
            <tr>
                <td class="scoring" colspan="4">Score:<asp:Label ID="lblScore_MIIPD_Q31" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <%-- <tr>
            <td class="d" aria-orientation="horizontal" colspan="4">
                <asp:RadioButtonList ID="chkScore_MIIPD_Q31" runat="server" RepeatDirection="Horizontal" Width="100%" ValidationGroup="Val1">
                   <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" ErrorMessage="Required-(E2, IR 2)" ControlToValidate="chkScore_MIIPD_Q31" ValidationGroup="Val1"></asp:RequiredFieldValidator>
            </td>
            </tr>--%>
            <tr>
                <td class="d">
                    <asp:RadioButton ID="chkScore_MIIPD_Q31_1" GroupName="chkScore_MIIPD_Q31" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_MIIPD_Q31_1" runat="server" /><br />--%>
                1<br />
                    Low Quality<br />
                    Management staff have no involvement in professional development.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_MIIPD_Q31_2" GroupName="chkScore_MIIPD_Q31" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_MIIPD_Q31_2" runat="server" /><br />--%>
              3<br />
                    Average Quality<br />
                    Management staff are involved in professional development in at least in a limited way (e.g., retrospective review of completed professional
                    development hours).
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_MIIPD_Q31_3" GroupName="chkScore_MIIPD_Q31" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_MIIPD_Q31_3" runat="server" /><br />--%>
               5<br />
                    Above Average Quality<br />
                    Management staff are actively involved in planning individual staff professional development.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_MIIPD_Q31_4" GroupName="chkScore_MIIPD_Q31" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_MIIPD_Q31_4" runat="server" /><br />--%>
                7<br />
                    High Quality<br />
                    Staff’s individual professional development plans are tied to performance reviews.
                </td>
            </tr>
        </table>
    </div>
    <!---------------------------------------------------------------------------------->
    <script type="text/javascript">
        function CP_Q32() {
            var add = 0;
            if (document.getElementById('<%=chk_CP_Q32_7.ClientID%>').checked == true)
            { ++add; }
            if (document.getElementById('<%=chk_CP_Q32_8.ClientID%>').checked == true)
            { ++add; }
            if (document.getElementById('<%=chk_CP_Q32_9.ClientID%>').checked == true)
            { ++add; }
            if (document.getElementById('<%=chk_CP_Q32_10.ClientID%>').checked == true)
            { ++add; }
            if (document.getElementById('<%=chk_CP_Q32_11.ClientID%>').checked == true)
            { ++add; }

            if ((document.getElementById('<%=chk_CP_Q32_1.ClientID%>').checked != true
                && document.getElementById('<%=chk_CP_Q32_2.ClientID%>').checked != true
                 && (document.getElementById('<%=chk_CP_Q32_3.ClientID%>').checked == true
                || document.getElementById('<%=chk_CP_Q32_4.ClientID%>').checked == true)
                && document.getElementById('<%=chk_CP_Q32_5.ClientID%>').checked == true)
                && (((document.getElementById('<%=chk_CP_Q32_6.ClientID%>').checked == true)
                && (add >= 2))
                && document.getElementById('<%=chk_CP_Q32_12.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_CP_Q32.ClientID%>').innerHTML = 7;
            }
            else if ((document.getElementById('<%=chk_CP_Q32_1.ClientID%>').checked != true
                && document.getElementById('<%=chk_CP_Q32_2.ClientID%>').checked != true
                 && (document.getElementById('<%=chk_CP_Q32_3.ClientID%>').checked == true
                || document.getElementById('<%=chk_CP_Q32_4.ClientID%>').checked == true)
                && document.getElementById('<%=chk_CP_Q32_5.ClientID%>').checked == true)
                && (((document.getElementById('<%=chk_CP_Q32_6.ClientID%>').checked == true)
                && (add >= 2))
                || document.getElementById('<%=chk_CP_Q32_12.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_CP_Q32.ClientID%>').innerHTML = 5;
            }
            else if (document.getElementById('<%=chk_CP_Q32_1.ClientID%>').checked != true
           && document.getElementById('<%=chk_CP_Q32_2.ClientID%>').checked != true
                 && (document.getElementById('<%=chk_CP_Q32_3.ClientID%>').checked == true
                || document.getElementById('<%=chk_CP_Q32_4.ClientID%>').checked == true)
                && document.getElementById('<%=chk_CP_Q32_5.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_CP_Q32.ClientID%>').innerHTML = 5;
            }
            else if ((document.getElementById('<%=chk_CP_Q32_1.ClientID%>').checked != true
                && document.getElementById('<%=chk_CP_Q32_2.ClientID%>').checked != true)
                 && (document.getElementById('<%=chk_CP_Q32_3.ClientID%>').checked == true
                && document.getElementById('<%=chk_CP_Q32_4.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_CP_Q32.ClientID%>').innerHTML = 3;
            }
            else if ((document.getElementById('<%=chk_CP_Q32_1.ClientID%>').checked != true
               && document.getElementById('<%=chk_CP_Q32_2.ClientID%>').checked != true)
                && (document.getElementById('<%=chk_CP_Q32_3.ClientID%>').checked == true
               || document.getElementById('<%=chk_CP_Q32_4.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_CP_Q32.ClientID%>').innerHTML = 1;
            }

            else if (document.getElementById('<%=chk_CP_Q32_1.ClientID%>').checked == true
                && document.getElementById('<%=chk_CP_Q32_1.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_CP_Q32.ClientID%>').innerHTML = 1;
            }
            else {
                document.getElementById('<%=lblScore_CP_Q32.ClientID%>').innerHTML = " ";
            }
    var score = 0;
    score = document.getElementById('<%=lblScore_CP_Q32.ClientID%>').textContent;


    scoring(score, '<%=chkScore_CP_Q32_1.ClientID%>', '<%=chkScore_CP_Q32_2.ClientID%>',
                     '<%=chkScore_CP_Q32_3.ClientID%>', '<%=chkScore_CP_Q32_4.ClientID%>');
}
    </script>
    <div style="cursor: pointer;" onclick="javascript:DivClicked('CP_Q32');">
        <h3 class="scoringTitle">
            <img src="../Images/edit_add.png" height="40" style="width: 40px" />COMMUNITY PARTNERSHIPS/RESOURCE NETWORK: COMMUNITY PRESENCE (Scale D6, IR 1)</h3>
    </div>
    <div id="CP_Q32" style="display: none;">
        <table class="d">
            <tr>
                <td colspan="4">
                    <h3>SCORING</h3>
                </td>
            </tr>
            <tr>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_CP_Q32_1" runat="server" OnClick="javascript:CP_Q32();" /><asp:Label ID="lbl_CP_Q32_1" runat="server" Text="Label"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_CP_Q32_2" runat="server" OnClick="javascript:CP_Q32();" /><asp:Label ID="lbl_CP_Q32_2" runat="server" Text="Label"></asp:Label>
                        </li>
                    </ul>

                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_CP_Q32_3" runat="server" OnClick="javascript:CP_Q32();" /><asp:Label ID="lbl_CP_Q32_3" runat="server" Text="Label"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_CP_Q32_4" runat="server" OnClick="javascript:CP_Q32();" /><asp:Label ID="lbl_CP_Q32_4" runat="server" Text="Label"></asp:Label>
                        </li>
                    </ul>
                    Note examples from past year (at least 2 needed):
                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_CP_Q32_5" runat="server" OnClick="javascript:CP_Q32();" /><asp:Label ID="lbl_CP_Q32_5" runat="server" Text="Label"></asp:Label>
                        </li>
                    </ul>

                    Note: Do not count presentations to own program oversight board.
                <br />
                    <br />
                    Note examples (at least 2 needed):                    
                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_CP_Q32_6" runat="server" OnClick="javascript:CP_Q32();" /><asp:Label ID="lbl_CP_Q32_6" runat="server"></asp:Label>
                            <ul style="list-style-type: none">
                                <li>
                                    <asp:CheckBox ID="chk_CP_Q32_7" runat="server" OnClick="javascript:CP_Q32();" /><asp:Label ID="lbl_CP_Q32_7" runat="server"></asp:Label>
                                </li>
                                <li>
                                    <asp:CheckBox ID="chk_CP_Q32_8" runat="server" OnClick="javascript:CP_Q32();" /><asp:Label ID="lbl_CP_Q32_8" runat="server"></asp:Label>
                                </li>
                                <li>
                                    <asp:CheckBox ID="chk_CP_Q32_9" runat="server" OnClick="javascript:CP_Q32();" /><asp:Label ID="lbl_CP_Q32_9" runat="server"></asp:Label>
                                </li>
                                <li>
                                    <asp:CheckBox ID="chk_CP_Q32_10" runat="server" OnClick="javascript:CP_Q32();" /><asp:Label ID="lbl_CP_Q32_10" runat="server"></asp:Label>
                                </li>
                                <li>
                                    <asp:CheckBox ID="chk_CP_Q32_11" runat="server" OnClick="javascript:CP_Q32();" /><asp:Label ID="lbl_CP_Q32_11" runat="server"></asp:Label>
                                    <asp:TextBox ID="txt_CP_Q32_11" runat="server"></asp:TextBox>
                                </li>
                            </ul>
                            <br />
                            Must note example from at least two categories.
                            <br />
                            <br />
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_CP_Q32_12" runat="server" OnClick="javascript:CP_Q32();" /><asp:Label ID="lbl_CP_Q32_12" runat="server"></asp:Label>
                        </li>
                    </ul>
                    Note examples (at least 2 needed):
                </td>
            </tr>
            <tr>
                <td class="q">If EITHER criterion is met, score 1; otherwise, continue.
                </td>
                <td class="q">If EITHER criterion is met, continue; otherwise, score 1.
                </td>
                <td class="q">If the above criterion is met, continue; otherwise, score 3.
                </td>
                <td class="q">If BOTH criteria are met, score 7; otherwise, score 5.
                </td>
            </tr>
            <tr>
                <td class="scoring" colspan="4">Score:<asp:Label ID="lblScore_CP_Q32" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <%--<tr>
             <td class="d" aria-orientation="horizontal" colspan="4">
                <asp:RadioButtonList ID="chkScore_CP_Q32" runat="server" RepeatDirection="Horizontal" Width="100%" ValidationGroup="Val1">
                   <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" ErrorMessage="Required-(D6, IR 1)" ControlToValidate="chkScore_CP_Q32" ValidationGroup="Val1"></asp:RequiredFieldValidator>
            </td>
            </tr>--%>
            <tr>
                <td class="d">
                    <asp:RadioButton ID="chkScore_CP_Q32_1" GroupName="chkScore_CP_Q32" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_CP_Q32_1" runat="server" /><br />--%>
                1<br />
                    Low Quality<br />
                    Program has few relationships with other community organizations.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_CP_Q32_2" GroupName="chkScore_CP_Q32" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_CP_Q32_2" runat="server" /><br />--%>
              3<br />
                    Average Quality<br />
                    Program leaders show some involvement in local early childhood, health or social service community.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_CP_Q32_3" GroupName="chkScore_CP_Q32" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_CP_Q32_3" runat="server" /><br />--%>
               5<br />
                    Above Average Quality<br />
                    Program leaders and staff are able to clearly articulate the program’s mission and vision to multiple stakeholders. 
                Program plans for an active role in the local early childhood, health or social service community.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_CP_Q32_4" GroupName="chkScore_CP_Q32" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_CP_Q32_4" runat="server" /><br />--%>
                7<br />
                    High Quality<br />
                    Community support for program is demonstrated at multiple levels. Program leadership and/or home visiting staff are considered leaders 
                in local early childhood, health or social service efforts.
                </td>
            </tr>
        </table>
    </div>


    <!---------------------------------------------------------------------------------->
    <script type="text/javascript">
        function RAAR_Q33() {
            var add = 0;
            if (document.getElementById('<%=chk_RAAR_Q33_8.ClientID%>').checked == true) {
                add++;
            }
            if (document.getElementById('<%=chk_RAAR_Q33_9.ClientID%>').checked == true) {
                add++;
            }
            if (document.getElementById('<%=chk_RAAR_Q33_10.ClientID%>').checked == true) {
                add++;
            }
            if (document.getElementById('<%=chk_RAAR_Q33_11.ClientID%>').checked == true) {
                add++;
            }
            if (document.getElementById('<%=chk_RAAR_Q33_12.ClientID%>').checked == true) {
                add++;
            }
            if (document.getElementById('<%=chk_RAAR_Q33_13.ClientID%>').checked == true) {
                add++;
            }
            if (document.getElementById('<%=chk_RAAR_Q33_1.ClientID%>').checked != true
                && document.getElementById('<%=chk_RAAR_Q33_2.ClientID%>').checked != true
                && document.getElementById('<%=chk_RAAR_Q33_3.ClientID%>').checked == true
                && document.getElementById('<%=chk_RAAR_Q33_4.ClientID%>').checked == true
                && document.getElementById('<%=chk_RAAR_Q33_5.ClientID%>').checked == true
                && document.getElementById('<%=chk_RAAR_Q33_6.ClientID%>').checked == true
                && document.getElementById('<%=chk_RAAR_Q33_7.ClientID%>').checked == true
                && add >= 2) {
                document.getElementById('<%=lblScore_RAAR_Q33.ClientID%>').innerHTML = 7;
            }
            else if ((document.getElementById('<%=chk_RAAR_Q33_1.ClientID%>').checked != true
                && document.getElementById('<%=chk_RAAR_Q33_2.ClientID%>').checked != true)
                && (document.getElementById('<%=chk_RAAR_Q33_3.ClientID%>').checked == true
                && document.getElementById('<%=chk_RAAR_Q33_4.ClientID%>').checked == true)
                && (document.getElementById('<%=chk_RAAR_Q33_5.ClientID%>').checked == true
                && document.getElementById('<%=chk_RAAR_Q33_6.ClientID%>').checked == true
                && document.getElementById('<%=chk_RAAR_Q33_7.ClientID%>').checked == true)
                && (document.getElementById('<%=chk_RAAR_Q33_8.ClientID%>').checked == true
                && add < 2)) {
                document.getElementById('<%=lblScore_RAAR_Q33.ClientID%>').innerHTML = 5;
            }
            else if ((document.getElementById('<%=chk_RAAR_Q33_1.ClientID%>').checked != true
           && document.getElementById('<%=chk_RAAR_Q33_2.ClientID%>').checked != true)
                 && (document.getElementById('<%=chk_RAAR_Q33_3.ClientID%>').checked == true
                && document.getElementById('<%=chk_RAAR_Q33_4.ClientID%>').checked == true)
                && (document.getElementById('<%=chk_RAAR_Q33_5.ClientID%>').checked == true
                && document.getElementById('<%=chk_RAAR_Q33_6.ClientID%>').checked == true
                && document.getElementById('<%=chk_RAAR_Q33_7.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_RAAR_Q33.ClientID%>').innerHTML = 5;
            }
            else if ((document.getElementById('<%=chk_RAAR_Q33_1.ClientID%>').checked != true
                && document.getElementById('<%=chk_RAAR_Q33_2.ClientID%>').checked != true)
                 && (document.getElementById('<%=chk_RAAR_Q33_3.ClientID%>').checked == true
                && document.getElementById('<%=chk_RAAR_Q33_4.ClientID%>').checked == true)
                && (document.getElementById('<%=chk_RAAR_Q33_5.ClientID%>').checked == true
                || document.getElementById('<%=chk_RAAR_Q33_6.ClientID%>').checked == true
                 || document.getElementById('<%=chk_RAAR_Q33_7.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_RAAR_Q33.ClientID%>').innerHTML = 3;
            }
            else if ((document.getElementById('<%=chk_RAAR_Q33_1.ClientID%>').checked != true
                && document.getElementById('<%=chk_RAAR_Q33_2.ClientID%>').checked != true)
                && (document.getElementById('<%=chk_RAAR_Q33_3.ClientID%>').checked == true
                && document.getElementById('<%=chk_RAAR_Q33_4.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_RAAR_Q33.ClientID%>').innerHTML = 3;
            }
            else if ((document.getElementById('<%=chk_RAAR_Q33_1.ClientID%>').checked != true
               && document.getElementById('<%=chk_RAAR_Q33_2.ClientID%>').checked != true)
                && (document.getElementById('<%=chk_RAAR_Q33_3.ClientID%>').checked == true
               || document.getElementById('<%=chk_RAAR_Q33_4.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_RAAR_Q33.ClientID%>').innerHTML = 1;
            }

            else if (document.getElementById('<%=chk_RAAR_Q33_1.ClientID%>').checked == true
                || document.getElementById('<%=chk_RAAR_Q33_2.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_RAAR_Q33.ClientID%>').innerHTML = 1;
            }
            else {
                document.getElementById('<%=lblScore_RAAR_Q33.ClientID%>').innerHTML = " ";
            }
    var score = 0;
    score = document.getElementById('<%=lblScore_RAAR_Q33.ClientID%>').textContent;


    scoring(score, '<%=chkScore_RAAR_Q33_1.ClientID%>', '<%=chkScore_RAAR_Q33_2.ClientID%>',
                     '<%=chkScore_RAAR_Q33_3.ClientID%>', '<%=chkScore_RAAR_Q33_4.ClientID%>');
}
    </script>
    <div style="cursor: pointer;" onclick="javascript:DivClicked('RAAR_Q33');">
        <h3 class="scoringTitle">
            <img src="../Images/edit_add.png" height="40" style="width: 40px" />COMMUNITY PARTNERSHIPS/ RESOURCE NETWORK: RESOURCE AWARENESS AND RELATIONSHIPS (Scale D6, IR 2)</h3>
    </div>
    <div id="RAAR_Q33" style="display: none;">

        <table class="d">
            <tr>
                <td colspan="4">
                    <h3>SCORING</h3>
                </td>
            </tr>
            <tr>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_RAAR_Q33_1" runat="server" OnClick="javascript:RAAR_Q33();" /><asp:Label ID="lbl_RAAR_Q33_1" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_RAAR_Q33_2" runat="server" OnClick="javascript:RAAR_Q33();" /><asp:Label ID="lbl_RAAR_Q33_2" runat="server"></asp:Label>
                        </li>
                    </ul>

                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_RAAR_Q33_3" runat="server" OnClick="javascript:RAAR_Q33();" /><asp:Label ID="lbl_RAAR_Q33_3" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_RAAR_Q33_4" runat="server" OnClick="javascript:RAAR_Q33();" /><asp:Label ID="lbl_RAAR_Q33_4" runat="server"></asp:Label>
                        </li>
                    </ul>
                    Note examples from past year (at least 2 needed):
                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_RAAR_Q33_5" runat="server" OnClick="javascript:RAAR_Q33();" /><asp:Label ID="lbl_RAAR_Q33_5" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_RAAR_Q33_6" runat="server" OnClick="javascript:RAAR_Q33();" /><asp:Label ID="lbl_RAAR_Q33_6" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_RAAR_Q33_7" runat="server" OnClick="javascript:RAAR_Q33();" /><asp:Label ID="lbl_RAAR_Q33_7" runat="server"></asp:Label>
                        </li>
                    </ul>
                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:Label ID="lbl_RAAR_Q33_8" runat="server"></asp:Label>
                            <ul style="list-style-type: none">
                                <li>
                                    <asp:CheckBox ID="chk_RAAR_Q33_8" runat="server" OnClick="javascript:RAAR_Q33();" /><asp:Label ID="lbl_RAAR_Q33_9" runat="server"></asp:Label>
                                </li>
                                <li>
                                    <asp:CheckBox ID="chk_RAAR_Q33_9" runat="server" OnClick="javascript:RAAR_Q33();" /><asp:Label ID="lbl_RAAR_Q33_10" runat="server"></asp:Label>
                                </li>
                                <li>
                                    <asp:CheckBox ID="chk_RAAR_Q33_10" runat="server" OnClick="javascript:RAAR_Q33();" /><asp:Label ID="lbl_RAAR_Q33_11" runat="server"></asp:Label>
                                </li>
                                <li>
                                    <asp:CheckBox ID="chk_RAAR_Q33_11" runat="server" OnClick="javascript:RAAR_Q33();" /><asp:Label ID="lbl_RAAR_Q33_12" runat="server"></asp:Label>
                                </li>
                                <li>
                                    <asp:CheckBox ID="chk_RAAR_Q33_12" runat="server" OnClick="javascript:RAAR_Q33();" /><asp:Label ID="lbl_RAAR_Q33_13" runat="server"></asp:Label>
                                </li>
                                <li>
                                    <asp:CheckBox ID="chk_RAAR_Q33_13" runat="server" OnClick="javascript:RAAR_Q33();" /><asp:Label ID="lbl_RAAR_Q33_14" runat="server"></asp:Label>
                                    <asp:TextBox ID="txt_RAAR_Q33_13" runat="server"></asp:TextBox>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td class="q">If EITHER criterion is met, score 1; otherwise, continue.
                </td>
                <td class="q">If BOTH criteria are met, continue; otherwise, score 1.
                </td>
                <td class="q">If ALL criteria are met, continue; otherwise, score 3.
                </td>
                <td class="q">If the above criterion is met, score 7; otherwise, score 5.
                </td>
            </tr>
            <tr>
                <td class="scoring" colspan="4">Score:<asp:Label ID="lblScore_RAAR_Q33" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <%-- <tr>
             <td class="d" aria-orientation="horizontal" colspan="4">
                <asp:RadioButtonList ID="chkScore_RAAR_Q33" runat="server" RepeatDirection="Horizontal" Width="100%" ValidationGroup="Val1">
                   <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" ErrorMessage="Required-(D6, IR 2)" ControlToValidate="chkScore_RAAR_Q33" ValidationGroup="Val1"></asp:RequiredFieldValidator>
            </td>
            </tr>--%>
            <tr>
                <td class="d">
                    <asp:RadioButton ID="chkScore_RAAR_Q33_1" GroupName="chkScore_RAAR_Q33" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_RAAR_Q33_1" runat="server" /><br />--%>
                1<br />
                    Low Quality<br />
                    Connections to other organizations are limited to providing program resource and contact information.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_RAAR_Q33_2" GroupName="chkScore_RAAR_Q33" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_RAAR_Q33_2" runat="server" /><br />--%>
              3<br />
                    Average Quality<br />
                    Program has an updated community resource guide to provide referrals and helps families access program services.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_RAAR_Q33_3" GroupName="chkScore_RAAR_Q33" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_RAAR_Q33_3" runat="server" /><br />--%>
               5<br />
                    Above Average Quality<br />
                    Program collaborates with a variety of community programs to meet immediate and long-term family needs, prevent duplication of services, and provide coordination
                of services.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_RAAR_Q33_4" GroupName="chkScore_RAAR_Q33" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_RAAR_Q33_4" runat="server" /><br />--%>
                7<br />
                    High Quality<br />
                    Program has substantial relationships and formal  partnerships with a variety of community programs that provide
                services to families or will refer families for home visiting services.
                </td>
            </tr>
        </table>
    </div>
    <!---------------------------------------------------------------------------------->
    <script type="text/javascript">
        function POPP_Q34() {
            if ((document.getElementById('<%=chk_POPP_Q34_1.ClientID%>').checked != true
                && document.getElementById('<%=chk_POPP_Q34_2.ClientID%>').checked == true)
                && (document.getElementById('<%=chk_POPP_Q34_3.ClientID%>').checked == true
                && document.getElementById('<%=chk_POPP_Q34_4.ClientID%>').checked == true)
                && (document.getElementById('<%=chk_POPP_Q34_5.ClientID%>').checked == true
                && document.getElementById('<%=chk_POPP_Q34_6.ClientID%>').checked == true
                && document.getElementById('<%=chk_POPP_Q34_7.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_POPP_Q34.ClientID%>').innerHTML = 7;
            }
            else if ((document.getElementById('<%=chk_POPP_Q34_1.ClientID%>').checked != true
                && document.getElementById('<%=chk_POPP_Q34_2.ClientID%>').checked == true)
                && (document.getElementById('<%=chk_POPP_Q34_3.ClientID%>').checked == true
                && document.getElementById('<%=chk_POPP_Q34_4.ClientID%>').checked == true)
                && (document.getElementById('<%=chk_POPP_Q34_5.ClientID%>').checked == true
                && document.getElementById('<%=chk_POPP_Q34_6.ClientID%>').checked == true
                && document.getElementById('<%=chk_POPP_Q34_7.ClientID%>').checked != true)) {
                document.getElementById('<%=lblScore_POPP_Q34.ClientID%>').innerHTML = 5;
            }
            else if ((document.getElementById('<%=chk_POPP_Q34_1.ClientID%>').checked != true
                && document.getElementById('<%=chk_POPP_Q34_2.ClientID%>').checked == true
                && document.getElementById('<%=chk_POPP_Q34_3.ClientID%>').checked == true)
                && (document.getElementById('<%=chk_POPP_Q34_4.ClientID%>').checked == true
                || document.getElementById('<%=chk_POPP_Q34_5.ClientID%>').checked == true
                || document.getElementById('<%=chk_POPP_Q34_6.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_POPP_Q34.ClientID%>').innerHTML = 3;
            }
            else if (document.getElementById('<%=chk_POPP_Q34_1.ClientID%>').checked != true
           && document.getElementById('<%=chk_POPP_Q34_2.ClientID%>').checked == true
                 && document.getElementById('<%=chk_POPP_Q34_3.ClientID%>').checked == true) {
               document.getElementById('<%=lblScore_POPP_Q34.ClientID%>').innerHTML = 3;
           }
           else if ((document.getElementById('<%=chk_POPP_Q34_1.ClientID%>').checked != true)
              && (document.getElementById('<%=chk_POPP_Q34_2.ClientID%>').checked == true
                 || document.getElementById('<%=chk_POPP_Q34_3.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_POPP_Q34.ClientID%>').innerHTML = 1;
            }

            else if (document.getElementById('<%=chk_POPP_Q34_1.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_POPP_Q34.ClientID%>').innerHTML = 1;
            }
            else {
                document.getElementById('<%=lblScore_POPP_Q34.ClientID%>').innerHTML = " ";
            }
    var score = 0;
    score = document.getElementById('<%=lblScore_POPP_Q34.ClientID%>').textContent;


    scoring(score, '<%=chkScore_POPP_Q34_1.ClientID%>', '<%=chkScore_POPP_Q34_2.ClientID%>',
                      '<%=chkScore_POPP_Q34_3.ClientID%>', '<%=chkScore_POPP_Q34_4.ClientID%>');
}
    </script>
    <div style="cursor: pointer;" onclick="javascript:DivClicked('POPP_Q34');">
        <h3 class="scoringTitle">
            <img src="../Images/edit_add.png" height="40" style="width: 40px" />STAFF MONITORING: PRESENCE OF PD PLANS (Scale E2, IR 1)</h3>
    </div>
    <div id="POPP_Q34" style="display: none;">

        <table class="d">
            <tr>
                <td colspan="4">
                    <h3>SCORING</h3>
                </td>
            </tr>
            <tr>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_POPP_Q34_1" runat="server" OnClick="javascript:POPP_Q34();" /><asp:Label ID="lbl_POPP_Q34_1" runat="server"></asp:Label>
                        </li>
                    </ul>

                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_POPP_Q34_2" runat="server" OnClick="javascript:POPP_Q34();" /><asp:Label ID="lbl_POPP_Q34_2" runat="server"></asp:Label>
                        </li>
                        <li>
                            <asp:CheckBox ID="chk_POPP_Q34_3" runat="server" OnClick="javascript:POPP_Q34();" /><asp:Label ID="lbl_POPP_Q34_3" runat="server"></asp:Label>
                        </li>
                    </ul>
                    Note examples from past year (at least 2 needed):
                </td>
                <td class="q">Check if following items are in all of reviewed professional development plans:
                <ul style="list-style-type: none">
                    <li>
                        <asp:CheckBox ID="chk_POPP_Q34_4" runat="server" OnClick="javascript:POPP_Q34();" /><asp:Label ID="lbl_POPP_Q34_4" runat="server"></asp:Label>
                    </li>
                    <li>
                        <asp:CheckBox ID="chk_POPP_Q34_5" runat="server" OnClick="javascript:POPP_Q34();" /><asp:Label ID="lbl_POPP_Q34_5" runat="server"></asp:Label>
                    </li>
                    <li>
                        <asp:CheckBox ID="chk_POPP_Q34_6" runat="server" OnClick="javascript:POPP_Q34();" /><asp:Label ID="lbl_POPP_Q34_6" runat="server"></asp:Label>
                    </li>
                </ul>
                </td>
                <td class="q">
                    <ul style="list-style-type: none">
                        <li>
                            <asp:CheckBox ID="chk_POPP_Q34_7" runat="server" OnClick="javascript:POPP_Q34();" /><asp:Label ID="lbl_POPP_Q34_7" runat="server"></asp:Label>
                        </li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td class="q">If the above criterion is met, score 1; otherwise, continue.
                </td>
                <td class="q">If BOTH criteria are met, continue; otherwise, score 1.
                </td>
                <td class="q">If ALL criteria are met in ALL of the reviewed professional development plans, continue; otherwise, score 3.
                </td>
                <td class="q">If the above criterion is met, score 7; otherwise, score 5.
                </td>
            </tr>
            <tr>
                <td class="scoring" colspan="4">Score:<asp:Label ID="lblScore_POPP_Q34" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <%--  <tr>
             <td class="d" aria-orientation="horizontal" colspan="4">
                <asp:RadioButtonList ID="chkScore_POPP_Q34" runat="server" RepeatDirection="Horizontal" Width="100%" ValidationGroup="Val1">
                   <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" ErrorMessage="Required-(E2, IR 1)" ControlToValidate="chkScore_POPP_Q34" ValidationGroup="Val1"></asp:RequiredFieldValidator>
            </td>
            </tr>--%>
            <tr>
                <td class="d">
                    <asp:RadioButton ID="chkScore_POPP_Q34_1" GroupName="chkScore_POPP_Q34" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_POPP_Q34_1" runat="server" /><br />--%>
                1<br />
                    Low Quality<br />
                    >25% of home visiting staff do not formally track training through individual professional development plans.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_POPP_Q34_2" GroupName="chkScore_POPP_Q34" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_POPP_Q34_2" runat="server" /><br />--%>
              3<br />
                    Average Quality<br />
                    ≥75% of home visiting staff have individual professional development plans that formally track training.  </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_POPP_Q34_3" GroupName="chkScore_POPP_Q34" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_POPP_Q34_3" runat="server" /><br />--%>
                5<br />
                    Above Average Quality<br />
                    100% of home visiting staff have current professional development plans that articulate training goals and document progress towards goals, updated/reviewed within past 12 months.
                </td>
                <td class="d">
                    <asp:RadioButton ID="chkScore_POPP_Q34_4" GroupName="chkScore_POPP_Q34" runat="server" />
                    <%--<asp:CheckBox ID="chkScore_POPP_Q34_4" runat="server" /><br />--%>
                7<br />
                    High Quality<br />
                    100% of home visiting and management staff have professional development plans, updated/reviewed within past 6 months.
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div>
        <asp:Button ID="btnSubmit" runat="server" BackColor="#F3F3F3" BorderStyle="Solid" BorderWidth="5px" Font-Bold="True" Font-Italic="False" Font-Size="X-Large" Font-Strikeout="False" Font-Underline="False" ForeColor="Black" Height="50px" Text="Save/Submit" OnClick="btnSubmit_Click" ValidationGroup="Val1" OnClientClick="window.onbeforeunload=null;" />
    </div>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="Val1" />
</asp:Content>
