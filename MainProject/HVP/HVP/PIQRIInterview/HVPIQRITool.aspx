<%@ Page Title="" Language="C#" MasterPageFile="~/PIQRIInterview/PIQRIInterview.Master" AutoEventWireup="true" CodeBehind="HVPIQRITool.aspx.cs" Inherits="HVP.PIQRIInterview.HVPIQRITool" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
     <h3 style="text-align:center">Individual Home Visitor Interview</h3>
     <h4>For each home visitor interviewed, use the Individual Home Visitor Interview. This tool has summary ratings at the end to be filled out for each indicator row. These summary ratings are to be used to determine the final indicator score for the quality rating scales. </h4> 
        <h4>
            While on site, conduct the interview and document the interviewee’s responses in the sections labeled “Monitor Notes.” After returning to the office, you can use your notes to score the home visitors on each indicator.  
        </h4>
        <h4>DO NOT TRY TO SIMULTANEOUSLY ASK THE QUESTIONS AND SCORE THE INTERVIEW.  THERE WILL BE TIME AT THE OFFICE TO DO THE SCORING. 
            <asp:HiddenField ID="hfschd" runat="server" />
            <asp:HiddenField ID="hfID" runat="server" />
     </h4> 
    <%--<asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">    --%>
      
     <div style="cursor:pointer;"  onclick="javascript:DivClicked('PMQ1');"><h3 class="scoringTitle"><img src="../Images/edit_add.png" height="40" style="width: 40px" />PROGRAM MODEL: HOME VISITOR UNDERSTANDING OF PROGRAM MODEL (Scale C1, IR 3)</h3></div>
    <asp:HiddenField ID="hf_PMQ1" runat="server" />
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
        function programmodel() {
            if (document.getElementById('<%=chkbx_PMQ1_1.ClientID%>').checked == true
                && document.getElementById('<%=chkbx_PMQ1_2.ClientID%>').checked == true
                 && document.getElementById('<%=chkbx_PMQ1_3.ClientID%>').checked == true
                && document.getElementById('<%=chkbx_PMQ1_4.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_PMQ1.ClientID%>').innerHTML = 7;
            }
            else if (document.getElementById('<%=chkbx_PMQ1_1.ClientID%>').checked == true
            && document.getElementById('<%=chkbx_PMQ1_2.ClientID%>').checked == true
                 && document.getElementById('<%=chkbx_PMQ1_3.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_PMQ1.ClientID%>').innerHTML = 5;
            }
            else if (document.getElementById('<%=chkbx_PMQ1_1.ClientID%>').checked == true
           && ((document.getElementById('<%=chkbx_PMQ1_2.ClientID%>').checked == true)
                || document.getElementById('<%=chkbx_PMQ1_3.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_PMQ1.ClientID%>').innerHTML = 3;
            }
            else if (document.getElementById('<%=chkbx_PMQ1_1.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_PMQ1.ClientID%>').innerHTML = 3;
            }
            else {
                document.getElementById('<%=lblScore_PMQ1.ClientID%>').innerHTML = 1;
            }
            var score = 0;
            score = document.getElementById('<%=lblScore_PMQ1.ClientID%>').textContent;
            document.getElementById('<%=hf_PMQ1.ClientID%>').value = score;
            switch (score)
            {
                case "1":
                    {
                        document.getElementById('<%=chkbxPMQ1_1.ClientID%>').checked = true;
                        document.getElementById('<%=chkbxPMQ1_2.ClientID%>').checked = false;
                        document.getElementById('<%=chkbxPMQ1_3.ClientID%>').checked = false;
                        document.getElementById('<%=chkbxPMQ1_4.ClientID%>').checked = false;
                        break;
                    }
                case "3":
                    {
                        document.getElementById('<%=chkbxPMQ1_1.ClientID%>').checked = false;
                        document.getElementById('<%=chkbxPMQ1_2.ClientID%>').checked = true;
                        document.getElementById('<%=chkbxPMQ1_3.ClientID%>').checked = false;
                        document.getElementById('<%=chkbxPMQ1_4.ClientID%>').checked = false;
                        break;
                    }
                case "5":
                    {
                        document.getElementById('<%=chkbxPMQ1_1.ClientID%>').checked = false;
                        document.getElementById('<%=chkbxPMQ1_2.ClientID%>').checked = false;
                        document.getElementById('<%=chkbxPMQ1_3.ClientID%>').checked = true;
                        document.getElementById('<%=chkbxPMQ1_4.ClientID%>').checked = false;
                        break;
                    }
                case "7":
                    {
                        document.getElementById('<%=chkbxPMQ1_1.ClientID%>').checked = false;
                        document.getElementById('<%=chkbxPMQ1_2.ClientID%>').checked = false;
                        document.getElementById('<%=chkbxPMQ1_3.ClientID%>').checked = false;
                        document.getElementById('<%=chkbxPMQ1_4.ClientID%>').checked = true;
                        break;
                    }

            }

            //if( document.getElementById('<%=chkbxPMQ1_1.ClientID%>').value =)
}
    </script>
            <div id="PMQ1" style="display:none;">
    <table class="d">
        <tr>
            <td colspan="4">
                <h3>SCORING</h3>
            </td>
        </tr>
        <tr>
            <td class="q" colspan="2">
                <ul style="list-style-type: none">
                    <li>
                        <asp:CheckBox ID="chkbx_PMQ1_1" runat="server" OnClick="programmodel();" />
                        <asp:Label ID="lblPMQ1_A" runat="server"></asp:Label>
                    </li>
                </ul>
            </td>
            <td class="q">
                <ul style="list-style-type: none">
                    <li>
                        <asp:CheckBox ID="chkbx_PMQ1_2" runat="server" OnClick="programmodel();" />
                        <asp:Label ID="lblPMQ1_B" runat="server"></asp:Label>
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbx_PMQ1_3" runat="server" OnClick="programmodel();" />
                        <asp:Label ID="lblPMQ1_C" runat="server"></asp:Label>
                    </li>
                </ul>
            </td>
            <td class="q">
                <ul style="list-style-type: none">
                    <li>
                        <asp:CheckBox ID="chkbx_PMQ1_4" runat="server" OnClick="programmodel();" />
                        <asp:Label ID="lblPMQ1_D" runat="server"></asp:Label>
                    </li>
                </ul>
            </td>
        </tr>
        <tr>
            <td class="q" colspan="2">If the above criterion is met, continue; otherwise, score 1. 
            </td>
            <td class="q">If both criteria are met, continue; otherwise, score 3. 
            </td>
            <td class="q">If the above criterion is met, score 7; otherwise, score 5.
            </td>
        </tr>
        <tr>
            <td class="scoring" colspan="4">Score:<asp:Label ID="lblScore_PMQ1" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="d">
                <asp:RadioButton ID="chkbxPMQ1_1" GroupName="chkbxPMQ1" runat="server" />
                <%--<asp:CheckBox ID="chkbxPMQ1_1" runat="server" /><br />--%>
                1<br />
                Low Quality<br />
                The home visitor demonstrates limited awareness of program goals.
            </td>
            <td class="d">
                <asp:RadioButton ID="chkbxPMQ1_2" GroupName="chkbxPMQ1" runat="server" />
                <%--<asp:CheckBox ID="chkbxPMQ1_2" runat="server" /><br />--%>
                3<br />
                Average Quality<br />
                The home visitor is aware of program’s goals.
            </td>
            <td class="d">
                <asp:RadioButton ID="chkbxPMQ1_3" GroupName="chkbxPMQ1" runat="server" />
                <%--<asp:CheckBox ID="chkbxPMQ1_3" runat="server" /><br />--%>
                5<br />
                Above Average Quality<br />
                The home visitor can link program services to at least one specific outcome.
            </td>
            <td class="d">
                <asp:RadioButton ID="chkbxPMQ1_4" GroupName="chkbxPMQ1" runat="server" />
                <%--<asp:CheckBox ID="chkbxPMQ1_4" runat="server" /><br />--%>
                7<br />
                High Quality<br />
                The home visitor can link his/her work to two or more specific outcomes.
            </td>
        </tr>
    </table>
                </div>
           
    <%--   </asp:View>
        <asp:View ID="View2" runat="server">--%>
    <!--Second One-->
  
             <div style="cursor:pointer;" onclick="javascript:DivClicked('CDQ2');"><h3 class="scoringTitle"><img src="../Images/edit_add.png" height="40" style="width: 40px" />PROMOTION OF CHILD DEVELOPMENT AND WELL-BEING: CHILD DEVELOPMENT (Scale A2, IR1)</h3></div>
   <%-- <h3 class="scoringTitle"><asp:ImageButton ID="imgbtn_CDQ2" runat="server" ImageUrl="~/Images/edit_add.png" Height="40px" OnClick="imgbtn_CDQ2_Click" />PROMOTION OF CHILD DEVELOPMENT AND WELL-BEING: CHILD DEVELOPMENT</h3>--%>
            <asp:HiddenField ID="hf_CDQ2" runat="server" />
    <script type="text/javascript">
        function CDQ2() {
            if (document.getElementById('<%=chkbx_CDQ2_8.ClientID%>').checked == true
                && document.getElementById('<%=chkbx_CDQ2_7.ClientID%>').checked == true
                 && document.getElementById('<%=chkbx_CDQ2_6.ClientID%>').checked == true
                 && document.getElementById('<%=chkbx_CDQ2_5.ClientID%>').checked == true
                && document.getElementById('<%=chkbx_CDQ2_4.ClientID%>').checked == true
             && document.getElementById('<%=chkbx_CDQ2_3.ClientID%>').checked == true
                 && document.getElementById('<%=chkbx_CDQ2_2.ClientID%>').checked == true
                && document.getElementById('<%=chkbx_CDQ2_1.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_CDQ2.ClientID%>').innerHTML = 7;
            }
            else if ((document.getElementById('<%=chkbx_CDQ2_1.ClientID%>').checked == true
            && document.getElementById('<%=chkbx_CDQ2_2.ClientID%>').checked == true
                && document.getElementById('<%=chkbx_CDQ2_3.ClientID%>').checked == true
                && document.getElementById('<%=chkbx_CDQ2_4.ClientID%>').checked == true
                 && document.getElementById('<%=chkbx_CDQ2_5.ClientID%>').checked == true)
                || (document.getElementById('<%=chkbx_CDQ2_6.ClientID%>').checked == true
                || document.getElementById('<%=chkbx_CDQ2_7.ClientID%>').checked == true
                || document.getElementById('<%=chkbx_CDQ2_8.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_CDQ2.ClientID%>').innerHTML = 5;
            }
            else if ((document.getElementById('<%=chkbx_CDQ2_1.ClientID%>').checked == true
           && document.getElementById('<%=chkbx_CDQ2_2.ClientID%>').checked == true)
                && (document.getElementById('<%=chkbx_CDQ2_3.ClientID%>').checked == true
                || document.getElementById('<%=chkbx_CDQ2_4.ClientID%>').checked == true
                || document.getElementById('<%=chkbx_CDQ2_5.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_CDQ2.ClientID%>').innerHTML = 3;
            }
            else if ((document.getElementById('<%=chkbx_CDQ2_1.ClientID%>').checked == true)
                && (document.getElementById('<%=chkbx_CDQ2_2.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_CDQ2.ClientID%>').innerHTML = 3;
            }
            else if ((document.getElementById('<%=chkbx_CDQ2_1.ClientID%>').checked == true)
          || (document.getElementById('<%=chkbx_CDQ2_2.ClientID%>').checked == true)) {
                      document.getElementById('<%=lblScore_CDQ2.ClientID%>').innerHTML = 1;
                  }
            else {
                document.getElementById('<%=lblScore_CDQ2.ClientID%>').innerHTML = " ";
            }
            var score = 0;
            score = document.getElementById('<%=lblScore_CDQ2.ClientID%>').textContent;
            document.getElementById('<%=hf_CDQ2.ClientID%>').value = score;
            switch (score) {
                case "1":
                    {
                        document.getElementById('<%=chkbxCDQ2_1.ClientID%>').checked = true;
                        document.getElementById('<%=chkbxCDQ2_2.ClientID%>').checked = false;
                        document.getElementById('<%=chkbxCDQ2_3.ClientID%>').checked = false;
                        document.getElementById('<%=chkbxCDQ2_4.ClientID%>').checked = false;
                        break;
                    }
                case "3":
                    {
                        document.getElementById('<%=chkbxCDQ2_1.ClientID%>').checked = false;
                        document.getElementById('<%=chkbxCDQ2_2.ClientID%>').checked = true;
                        document.getElementById('<%=chkbxCDQ2_3.ClientID%>').checked = false;
                        document.getElementById('<%=chkbxCDQ2_4.ClientID%>').checked = false;
                        break;
                    }
                case "5":
                    {
                        document.getElementById('<%=chkbxCDQ2_1.ClientID%>').checked = false;
                        document.getElementById('<%=chkbxCDQ2_2.ClientID%>').checked = false;
                        document.getElementById('<%=chkbxCDQ2_3.ClientID%>').checked = true;
                        document.getElementById('<%=chkbxCDQ2_4.ClientID%>').checked = false;
                        break;
                    }
                case "7":
                    {
                        document.getElementById('<%=chkbxCDQ2_1.ClientID%>').checked = false;
                        document.getElementById('<%=chkbxCDQ2_2.ClientID%>').checked = false;
                        document.getElementById('<%=chkbxCDQ2_3.ClientID%>').checked = false;
                        document.getElementById('<%=chkbxCDQ2_4.ClientID%>').checked = true;
                        break;
                    }

            }
            
}
    </script>
             <div id="CDQ2" style="display:none;">
   <table class="d">
        <tr>
            <td colspan="4">
                <h3>SCORING</h3>
            </td>
        </tr>
        <tr>
            <td class="q" colspan="2">
                <ul style="list-style-type: none">
                    <li>
                        <asp:CheckBox ID="chkbx_CDQ2_1" runat="server" OnClick="CDQ2();" />
                        <asp:Label ID="lblCDQ2_A" runat="server"></asp:Label>
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbx_CDQ2_2" runat="server" OnClick="CDQ2();" />
                        <asp:Label ID="lblCDQ2_B" runat="server"></asp:Label>
                        <br />
                        Name:<asp:TextBox ID="txtName_CDQ2" runat="server" Width="200px"></asp:TextBox></li>
                </ul>
            </td>
            <td class="q">
                <ul style="list-style-type: none">
                    <li>
                        <asp:CheckBox ID="chkbx_CDQ2_3" runat="server" OnClick="CDQ2();" />
                        <asp:Label ID="lblCDQ2_C" runat="server"></asp:Label>
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbx_CDQ2_4" runat="server" OnClick="CDQ2();" />
                        <asp:Label ID="lblCDQ2_D" runat="server"></asp:Label>
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbx_CDQ2_5" runat="server" OnClick="CDQ2();" />
                        <asp:Label ID="lblCDQ2_E" runat="server"></asp:Label>
                    </li>
                </ul>
            </td>
            <td class="q">
                <ul style="list-style-type: none">
                    <li>
                        <asp:CheckBox ID="chkbx_CDQ2_6" runat="server" OnClick="CDQ2();" />
                        <asp:Label ID="lblCDQ2_F" runat="server"></asp:Label>
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbx_CDQ2_7" runat="server" OnClick="CDQ2();" />
                        <asp:Label ID="lblCDQ2_G" runat="server"></asp:Label>
                        <br />
                        Activity 1:<asp:TextBox ID="txt_CDQ2_Activity_1" runat="server" Width="175px"></asp:TextBox><br />
                        Activity 2:<asp:TextBox ID="txt_CDQ2_Activity_2" runat="server" Width="175px"></asp:TextBox><br />
                        Ex: Resources/referrals, role-modeling, incorporation into everyday activities, texting developmental tips
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbx_CDQ2_8" runat="server" OnClick="CDQ2();" />
                        <asp:Label ID="lblCDQ2_H" runat="server"></asp:Label>
                    </li>
                </ul>
            </td>
        </tr>
        <tr>
            <td class="q" colspan="2">If BOTH criteria are met, continue; otherwise, score 1.  
            </td>
            <td class="q">If ALL criteria are met, continue; otherwise, score 3.</td>
            <td class="q">If All criterion are met, score 7; otherwise, score 5.</td>
        </tr>
        <tr>
            <td class="scoring" colspan="4">Score:<asp:Label ID="lblScore_CDQ2" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="d">
                 <asp:RadioButton ID="chkbxCDQ2_1" GroupName="chkbxCDQ2" runat="server" />
                <%--<asp:CheckBox ID="chkbxCDQ2_1" runat="server" /><br />--%>
                1<br />
                Low Quality<br />
                The home visitor does not incorporate child development information into home visits.
            </td>
            <td class="d">
                 <asp:RadioButton ID="chkbxCDQ2_2" GroupName="chkbxCDQ2" runat="server" />
                <%--<asp:CheckBox ID="chkbxCDQ2_2" runat="server" /><br />--%>
                3<br />
                Average Quality<br />
                The home visitor incorporates child development information into work with families in basic ways, such as using annual screenings or providing informational materials to families.
            </td>
            <td class="d">
                 <asp:RadioButton ID="chkbxCDQ2_3" GroupName="chkbxCDQ2" runat="server" />
                <%--<asp:CheckBox ID="chkbxCDQ2_3" runat="server" /><br />--%>
                5<br />
                Above Average Quality<br />
                The home visitor incorporates child development information into work with families, conducts screening collaboratively with family and uses feedback from screenings to plan home visits every 6 months.
            </td>
            <td class="d">
                 <asp:RadioButton ID="chkbxCDQ2_4" GroupName="chkbxCDQ2" runat="server" />
                <%--<asp:CheckBox ID="chkbxCDQ2_4" runat="server" /><br />--%>
                7<br />
                High Quality<br />
                The home visitor partners with families to achieve mutual goals for a child’s development. He/She incorporates child development information through individualized activities and uses multiple methods to address developmental issues.
            </td>
        </tr>
    </table>
                 </div>
          
    <%-- </asp:View>
        <asp:View ID="View3" runat="server">--%>
    <!-- Thrid One -->
   
            <div style="cursor:pointer;" onclick="javascript:DivClicked('CHWBQ3');"><h3 class="scoringTitle"><img src="../Images/edit_add.png" height="40" style="width: 40px" />PROMOTION OF CHILD DEVELOPMENT AND WELL-BEING: CHILD HEALTH AND WELL-BEING (Scale A2, IR2)</h3></div>
   <%-- <h3 class="scoringTitle"><asp:ImageButton ID="imgbtn_CHWBQ3" runat="server" ImageUrl="~/Images/edit_add.png" Height="40px" OnClick="imgbtn_CHWBQ3_Click" />PROMOTION OF CHILD DEVELOPMENT AND WELL-BEING: CHILD HEALTH AND WELL-BEING</h3>--%>
            <asp:HiddenField ID="hf_CHWBQ3" runat="server" />
    <script type="text/javascript">
        function CHWBQ3() {

            if (document.getElementById('<%=chkbxCHWBQ3_1.ClientID%>').checked == true
                && document.getElementById('<%=chkbxCHWBQ3_2.ClientID%>').checked == true
                 && document.getElementById('<%=chkbxCHWBQ3_3.ClientID%>').checked == true
                 && document.getElementById('<%=chkbxCHWBQ3_4.ClientID%>').checked == true
                && document.getElementById('<%=chkbxCHWBQ3_5.ClientID%>').checked == true
             && document.getElementById('<%=chkbxCHWBQ3_6.ClientID%>').checked == true
                 && document.getElementById('<%=chkbxCHWBQ3_7.ClientID%>').checked == true
                  && document.getElementById('<%=chkbxCHWBQ3_8.ClientID%>').checked == true
                  && document.getElementById('<%=chkbxCHWBQ3_9.ClientID%>').checked == true
                && document.getElementById('<%=chkbxCHWBQ3_10.ClientID%>').checked == true
                 && document.getElementById('<%=chkbxCHWBQ3_11.ClientID%>').checked == true
                 && document.getElementById('<%=chkbxCHWBQ3_12.ClientID%>').checked == true) {
                 document.getElementById('<%=lblScore_CHWBQ3.ClientID%>').innerHTML = 7;
             }
             else if ((document.getElementById('<%=chkbxCHWBQ3_1.ClientID%>').checked == true
                  && document.getElementById('<%=chkbxCHWBQ3_2.ClientID%>').checked == true
                && document.getElementById('<%=chkbxCHWBQ3_3.ClientID%>').checked == true
                && document.getElementById('<%=chkbxCHWBQ3_4.ClientID%>').checked == true
                && document.getElementById('<%=chkbxCHWBQ3_5.ClientID%>').checked == true
                && document.getElementById('<%=chkbxCHWBQ3_6.ClientID%>').checked == true
                && document.getElementById('<%=chkbxCHWBQ3_7.ClientID%>').checked == true
                && document.getElementById('<%=chkbxCHWBQ3_8.ClientID%>').checked == true
                && document.getElementById('<%=chkbxCHWBQ3_9.ClientID%>').checked == true)
                 && (document.getElementById('<%=chkbxCHWBQ3_10.ClientID%>').checked == true
                 || document.getElementById('<%=chkbxCHWBQ3_11.ClientID%>').checked == true
                 || document.getElementById('<%=chkbxCHWBQ3_12.ClientID%>').checked == true)) {
                 document.getElementById('<%=lblScore_CHWBQ3.ClientID%>').innerHTML = 5;
             }

             else if (document.getElementById('<%=chkbxCHWBQ3_1.ClientID%>').checked == true
            && document.getElementById('<%=chkbxCHWBQ3_2.ClientID%>').checked == true
                && document.getElementById('<%=chkbxCHWBQ3_3.ClientID%>').checked == true
                && document.getElementById('<%=chkbxCHWBQ3_4.ClientID%>').checked == true
                && document.getElementById('<%=chkbxCHWBQ3_5.ClientID%>').checked == true
                && document.getElementById('<%=chkbxCHWBQ3_6.ClientID%>').checked == true
                && document.getElementById('<%=chkbxCHWBQ3_7.ClientID%>').checked == true
                && document.getElementById('<%=chkbxCHWBQ3_8.ClientID%>').checked == true
                && document.getElementById('<%=chkbxCHWBQ3_9.ClientID%>').checked == true) {
                 document.getElementById('<%=lblScore_CHWBQ3.ClientID%>').innerHTML = 5;
             }
             else if ((document.getElementById('<%=chkbxCHWBQ3_1.ClientID%>').checked == true
                 && document.getElementById('<%=chkbxCHWBQ3_2.ClientID%>').checked == true
                && document.getElementById('<%=chkbxCHWBQ3_3.ClientID%>').checked == true
                && document.getElementById('<%=chkbxCHWBQ3_4.ClientID%>').checked == true)
                && (document.getElementById('<%=chkbxCHWBQ3_5.ClientID%>').checked == true
                || document.getElementById('<%=chkbxCHWBQ3_6.ClientID%>').checked == true
                || document.getElementById('<%=chkbxCHWBQ3_7.ClientID%>').checked == true
                || document.getElementById('<%=chkbxCHWBQ3_8.ClientID%>').checked == true
                || document.getElementById('<%=chkbxCHWBQ3_9.ClientID%>').checked == true)) {
                 document.getElementById('<%=lblScore_CHWBQ3.ClientID%>').innerHTML = 3;
             }
             else if (document.getElementById('<%=chkbxCHWBQ3_1.ClientID%>').checked == true
           && document.getElementById('<%=chkbxCHWBQ3_2.ClientID%>').checked == true
                && document.getElementById('<%=chkbxCHWBQ3_3.ClientID%>').checked == true
                && document.getElementById('<%=chkbxCHWBQ3_4.ClientID%>').checked == true) {
                 document.getElementById('<%=lblScore_CHWBQ3.ClientID%>').innerHTML = 3;
             }
             else if (document.getElementById('<%=chkbxCHWBQ3_1.ClientID%>').checked == true
                 || document.getElementById('<%=chkbxCHWBQ3_2.ClientID%>').checked == true
                 || document.getElementById('<%=chkbxCHWBQ3_3.ClientID%>').checked == true
                 || document.getElementById('<%=chkbxCHWBQ3_4.ClientID%>').checked == true) {
                 document.getElementById('<%=lblScore_CHWBQ3.ClientID%>').innerHTML = 1;
             }
             else {
                 document.getElementById('<%=lblScore_CHWBQ3.ClientID%>').innerHTML = " ";
             }

            var score = 0;
            score = document.getElementById('<%=lblScore_CHWBQ3.ClientID%>').textContent;
            document.getElementById('<%=hf_CHWBQ3.ClientID%>').value = score;
            switch (score) {
                case "1":
                    {
                        document.getElementById('<%=chkbx_CHWBQ3_1.ClientID%>').checked = true;
                        document.getElementById('<%=chkbx_CHWBQ3_2.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_CHWBQ3_3.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_CHWBQ3_4.ClientID%>').checked = false;
                        break;
                    }
                case "3":
                    {
                        document.getElementById('<%=chkbx_CHWBQ3_1.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_CHWBQ3_2.ClientID%>').checked = true;
                        document.getElementById('<%=chkbx_CHWBQ3_3.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_CHWBQ3_4.ClientID%>').checked = false;
                        break;
                    }
                case "5":
                    {
                        document.getElementById('<%=chkbx_CHWBQ3_1.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_CHWBQ3_2.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_CHWBQ3_3.ClientID%>').checked = true;
                        document.getElementById('<%=chkbx_CHWBQ3_4.ClientID%>').checked = false;
                        break;
                    }
                case "7":
                    {
                        document.getElementById('<%=chkbx_CHWBQ3_1.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_CHWBQ3_2.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_CHWBQ3_3.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_CHWBQ3_4.ClientID%>').checked = true;
                        break;
                    }

            }
}
    </script>
            <div  id="CHWBQ3"  style="display:none;">
    <table class="d">
        <tr>
            <td colspan="4">
                <h3>SCORING</h3>
            </td>
        </tr>
        <tr>
            <td class="q" colspan="2">
                <ul style="list-style-type: none">
                    <li>
                        <asp:CheckBox ID="chkbxCHWBQ3_1" runat="server" OnClick="CHWBQ3();" />
                        <asp:Label ID="lblCHWBQ3_A" runat="server"></asp:Label>
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbxCHWBQ3_2" runat="server" OnClick="CHWBQ3();" />
                        <asp:Label ID="lblCHWBQ3_B" runat="server"></asp:Label>
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbxCHWBQ3_3" runat="server" OnClick="CHWBQ3();" />
                        <asp:Label ID="lblCHWBQ3_C" runat="server"></asp:Label>
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbxCHWBQ3_4" runat="server" OnClick="CHWBQ3();" />
                        <asp:Label ID="lblCHWBQ3_D" runat="server"></asp:Label>
                    </li>
                </ul>
            </td>
            <td class="q">
                <ul style="list-style-type: none">
                    <li>
                        <asp:CheckBox ID="chkbxCHWBQ3_5" runat="server" OnClick="CHWBQ3();" />
                        <asp:Label ID="lblCHWBQ3_E" runat="server"></asp:Label>
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbxCHWBQ3_6" runat="server" OnClick="CHWBQ3();" />
                        <asp:Label ID="lblCHWBQ3_F" runat="server"></asp:Label>
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbxCHWBQ3_7" runat="server" OnClick="CHWBQ3();" />
                        <asp:Label ID="lblCHWBQ3_G" runat="server"></asp:Label>
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbxCHWBQ3_8" runat="server" OnClick="CHWBQ3();" />
                        <asp:Label ID="lblCHWBQ3_H" runat="server"></asp:Label>
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbxCHWBQ3_9" runat="server" OnClick="CHWBQ3();" />
                        <asp:Label ID="lblCHWBQ3_I" runat="server"></asp:Label>
                    </li>
                </ul>
            </td>
            <td class="q">
                <ul style="list-style-type: none">
                    <li>
                        <asp:CheckBox ID="chkbxCHWBQ3_10" runat="server" OnClick="CHWBQ3();" />
                        <asp:Label ID="lblCHWBQ3_J" runat="server"></asp:Label>
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbxCHWBQ3_11" runat="server" OnClick="CHWBQ3();" />
                        <asp:Label ID="lblCHWBQ3_K" runat="server"></asp:Label>
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbxCHWBQ3_12" runat="server" OnClick="CHWBQ3();" />
                        <asp:Label ID="lblCHWBQ3_L" runat="server"></asp:Label>
                        <br />
                        EX 1:<asp:TextBox ID="txtCHWBQ3_1" runat="server"></asp:TextBox>
                        <br />
                        EX 2:
                        <asp:TextBox ID="txtCHWBQ3_2" runat="server"></asp:TextBox>
                        <br />
                        Examples: Establishing informal supports, referrals, promoting strategies for healthy behaviors (exercise nutrition, etc.)
                    </li>
                </ul>
            </td>
        </tr>
        <tr>
            <td class="q" colspan="2">If ALL criteria are met, continue; otherwise, score 1. 
            </td>
            <td class="q">If ALL criteria are met, continue; otherwise, score 3.</td>
            <td class="q">If ALL criteria are met, score 7; otherwise, score 5.
            </td>
        </tr>
        <tr>
            <td class="scoring" colspan="4">Score:<asp:Label ID="lblScore_CHWBQ3" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="d">
                 <asp:RadioButton ID="chkbx_CHWBQ3_1" GroupName="chkbx_CHWBQ3" runat="server" />
                <%--<asp:CheckBox ID="chkbx_CHWBQ3_1" runat="server" /><br />--%>
                1<br />
                Low Quality<br />
                The home visitor does not incorporate basic child health and safety information into home visits.
            </td>
            <td class="d">
                 <asp:RadioButton ID="chkbx_CHWBQ3_2" GroupName="chkbx_CHWBQ3" runat="server" />
                <%--<asp:CheckBox ID="chkbx_CHWBQ3_2" runat="server" /><br />--%>
                3<br />
                Average Quality<br />
                The home visitor  incorporates basic health and safety information into work with families and monitors child health, home safety, and maternal depression.
            </td>
            <td class="d">
                 <asp:RadioButton ID="chkbx_CHWBQ3_3" GroupName="chkbx_CHWBQ3" runat="server" />
                <%--<asp:CheckBox ID="chkbx_CHWBQ3_3" runat="server" /><br />--%>
                5<br />
                Above Average Quality<br />
                The home visitor addresses issues of child health and safety in his/her work with families using screening/assessments and tracking systems to include establishing medical homes for children and addressing caregiver depression.
            </td>
            <td class="d">
                 <asp:RadioButton ID="chkbx_CHWBQ3_4" GroupName="chkbx_CHWBQ3" runat="server" />
                <%--<asp:CheckBox ID="chkbx_CHWBQ3_4" runat="server" /><br />--%>
                7<br />
                High Quality<br />
                The home visitor consistently incorporates child health and safety information through activities individualized to families that include multiple methods to address health and safety issues of the family and caregiver health concerns.
            </td>
        </tr>
    </table>
                </div>
        
    <%-- </asp:View>
        <asp:View ID="View4" runat="server">--%>
    <!-- Fourth One -->
   
         <div style="cursor:pointer;" onclick="javascript:DivClicked('PCRQ4');"><h3 class="scoringTitle"><img src="../Images/edit_add.png" height="40" style="width: 40px" />PROMOTION OF CHILD DEVELOPMENT AND WELL-BEING: PARENT–CHILD RELATIONSHIP (Scale A2, IR3)</h3></div>
    <%--<h3 class="scoringTitle"><asp:ImageButton ID="imgbtn_PCRQ4" runat="server" ImageUrl="~/Images/edit_add.png" Height="40px" OnClick="imgbtn_PCRQ4_Click" />PROMOTION OF CHILD DEVELOPMENT AND WELL-BEING: PARENT–CHILD RELATIONSHIP</h3>--%>
        <asp:HiddenField ID="hfPCRQ4" runat="server" />
    <script type="text/javascript">
        function PCRQ4() {

            if (document.getElementById('<%=chkbxPCRQ4_1.ClientID%>').checked == true
                && document.getElementById('<%=chkbxPCRQ4_2.ClientID%>').checked == true
                 && document.getElementById('<%=chkbxPCRQ4_3.ClientID%>').checked == true
                 && document.getElementById('<%=chkbxPCRQ4_4.ClientID%>').checked == true
                && document.getElementById('<%=chkbxPCRQ4_5.ClientID%>').checked == true
             && document.getElementById('<%=chkbxPCRQ4_6.ClientID%>').checked == true
                 && document.getElementById('<%=chkbxPCRQ4_7.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_PCRQ4.ClientID%>').innerHTML = 7;
            }
            else if ((document.getElementById('<%=chkbxPCRQ4_1.ClientID%>').checked == true
                && document.getElementById('<%=chkbxPCRQ4_2.ClientID%>').checked == true
                 && document.getElementById('<%=chkbxPCRQ4_3.ClientID%>').checked == true
                 && document.getElementById('<%=chkbxPCRQ4_4.ClientID%>').checked == true)
                && (document.getElementById('<%=chkbxPCRQ4_5.ClientID%>').checked == true
                || document.getElementById('<%=chkbxPCRQ4_6.ClientID%>').checked == true
                 || document.getElementById('<%=chkbxPCRQ4_7.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_PCRQ4.ClientID%>').innerHTML = 5;
            }
            else if (document.getElementById('<%=chkbxPCRQ4_1.ClientID%>').checked == true
           && document.getElementById('<%=chkbxPCRQ4_2.ClientID%>').checked == true
                 && document.getElementById('<%=chkbxPCRQ4_3.ClientID%>').checked == true
                 && document.getElementById('<%=chkbxPCRQ4_4.ClientID%>').checked == true
                && document.getElementById('<%=chkbxPCRQ4_5.ClientID%>').checked == true) {
                     document.getElementById('<%=lblScore_PCRQ4.ClientID%>').innerHTML = 5;
                 }
            else if ((document.getElementById('<%=chkbxPCRQ4_1.ClientID%>').checked == true
                && document.getElementById('<%=chkbxPCRQ4_2.ClientID%>').checked == true)
                 && (document.getElementById('<%=chkbxPCRQ4_3.ClientID%>').checked == true
                 || document.getElementById('<%=chkbxPCRQ4_4.ClientID%>').checked == true
                || document.getElementById('<%=chkbxPCRQ4_5.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_PCRQ4.ClientID%>').innerHTML = 3;
            }
            else if (document.getElementById('<%=chkbxPCRQ4_1.ClientID%>').checked == true
            && document.getElementById('<%=chkbxPCRQ4_2.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_PCRQ4.ClientID%>').innerHTML = 3;
            }
            else if (document.getElementById('<%=chkbxPCRQ4_1.ClientID%>').checked == true
                 || document.getElementById('<%=chkbxPCRQ4_2.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_PCRQ4.ClientID%>').innerHTML = 1;
            }
            else {
                document.getElementById('<%=lblScore_PCRQ4.ClientID%>').innerHTML = " ";
            }

            var score = 0;
            score = document.getElementById('<%=lblScore_PCRQ4.ClientID%>').textContent;
              document.getElementById('<%=hfPCRQ4.ClientID%>').value = score;
            switch (score) {
                case "1":
                    {
                        document.getElementById('<%=chkbx_PCRQ4_1.ClientID%>').checked = true;
                        document.getElementById('<%=chkbx_PCRQ4_2.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_PCRQ4_3.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_PCRQ4_4.ClientID%>').checked = false;
                        break;
                    }
                case "3":
                    {
                        document.getElementById('<%=chkbx_PCRQ4_1.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_PCRQ4_2.ClientID%>').checked = true;
                        document.getElementById('<%=chkbx_PCRQ4_3.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_PCRQ4_4.ClientID%>').checked = false;
                        break;
                    }
                case "5":
                    {
                        document.getElementById('<%=chkbx_PCRQ4_1.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_PCRQ4_2.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_PCRQ4_3.ClientID%>').checked = true;
                        document.getElementById('<%=chkbx_PCRQ4_4.ClientID%>').checked = false;
                        break;
                    }
                case "7":
                    {
                        document.getElementById('<%=chkbx_PCRQ4_1.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_PCRQ4_2.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_PCRQ4_3.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_PCRQ4_4.ClientID%>').checked = true;
                        break;
                    }

            }
}
    </script>
        <div  id="PCRQ4"  style="display:none;">
    <table class="d">
        <tr>
            <td colspan="4">
                <h3>SCORING</h3>
            </td>
        </tr>
        <tr>
            <td class="q" colspan="2">
                <ul style="list-style-type: none">
                    <li>
                        <asp:CheckBox ID="chkbxPCRQ4_1" runat="server" OnClick="PCRQ4();" />
                        <asp:Label ID="lblPCRQ4_A" runat="server"></asp:Label>
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbxPCRQ4_2" runat="server" OnClick="PCRQ4();" />
                        <asp:Label ID="lblPCRQ4_B" runat="server"></asp:Label>
                    </li>
                </ul>
            </td>
            <td class="q">
                <ul style="list-style-type: none">
                    <li>
                        <asp:CheckBox ID="chkbxPCRQ4_3" runat="server" OnClick="PCRQ4();" />
                        <asp:Label ID="lblPCRQ4_C" runat="server"></asp:Label>
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbxPCRQ4_4" runat="server" OnClick="PCRQ4();" />
                        <asp:Label ID="lblPCRQ4_D" runat="server"></asp:Label>
                        <br />
                        Name of tool(s):
                        <br />
                        <asp:TextBox ID="txtPCRQ4" runat="server" Width="200px" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                    </li>
                     <li>
                        <asp:CheckBox ID="chkbxPCRQ4_5" runat="server" OnClick="PCRQ4();" />
                        <asp:Label ID="lblPCRQ4_E" runat="server"></asp:Label>
                    </li>
                </ul>
                <br />
                * Tool should specifically monitor parent-child interaction or relationships. More general tools such as ASQ-SE,ITSEA or Life Skills Progression  count only if specifically used in regards to parent-child assessment or intervention.
            </td>
            <td class="q">
                <ul style="list-style-type: none">                   
                    <li>
                        <asp:CheckBox ID="chkbxPCRQ4_6" runat="server" OnClick="PCRQ4();" />
                        <asp:Label ID="lblPCRQ4_F" runat="server"></asp:Label>
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbxPCRQ4_7" runat="server" OnClick="PCRQ4();" />
                        <asp:Label ID="lblPCRQ4_G" runat="server"></asp:Label>
                    </li>
                </ul>
            </td>
        </tr>
        <tr>
            <td class="q" colspan="2">If BOTH criteria are met, continue; otherwise, score 1. 
            </td>
            <td class="q">If ALL criteria are met, continue; otherwise, score 3.</td>
            <td class="q">If BOTH criteria are met, score 7; otherwise, score 5.
            </td>
        </tr>
        <tr>
            <td class="scoring" colspan="4">Score:<asp:Label ID="lblScore_PCRQ4" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="d">
                <asp:RadioButton ID="chkbx_PCRQ4_1" GroupName="chkbx_PCRQ4" runat="server" />
                <%--<asp:CheckBox ID="chkbx_PCRQ4_1" runat="server" /><br />--%>
                1<br />
                Low Quality<br />
                The home visitor does not facilitate positive parent-child interactions.
            </td>
            <td class="d">
                <asp:RadioButton ID="chkbx_PCRQ4_2" GroupName="chkbx_PCRQ4" runat="server" />
                <%--<asp:CheckBox ID="chkbx_PCRQ4_2" runat="server" /><br />--%>
                3<br />
                Average Quality<br />
                The home visitor shows some evidence of promoting parent-child relationships in his/her work with families, at least informally monitoring the quality of the relationships.
            </td>
            <td class="d">
                <asp:RadioButton ID="chkbx_PCRQ4_3" GroupName="chkbx_PCRQ4" runat="server" />
                <%--<asp:CheckBox ID="chkbx_PCRQ4_3" runat="server" /><br />--%>
                5<br />
                Above Average Quality<br />
                The home visitor focuses on parent-child relationships in his/her work with families, including administering formal screening/ assessments of the parent-child relationship, and using results to plan home visits.
            </td>
            <td class="d">
                <asp:RadioButton ID="chkbx_PCRQ4_4" GroupName="chkbx_PCRQ4" runat="server" />
                <%--<asp:CheckBox ID="chkbx_PCRQ4_4" runat="server" /><br />--%>
                7<br />
                High Quality<br />
                The home visitor consistently focuses on parent-child relationships, even when assisting families in other areas or dealing with crisis situations.
            </td>
        </tr>
    </table>
            </div>
        
    <%--</asp:View>
        <asp:View ID="View5" runat="server">--%>
    <!-- Fifth One -->
     
            <div style="cursor:pointer;"  onclick="javascript:DivClicked('HRDQ5');"><h3 class="scoringTitle"><img src="../Images/edit_add.png" height="40" style="width: 40px" />WORKING WITH FAMILIES: HELPING RELATIONSHIP DEVELOPMENT (Scale A3, IR1)</h3></div>      
    <%--<h3 class="scoringTitle"><asp:ImageButton ID="imgbtn_HRDQ5" runat="server" ImageUrl="~/Images/edit_add.png" Height="40px" OnClick="imgbtn_HRDQ5_Click" />WORKING WITH FAMILIES: HELPING RELATIONSHIP DEVELOPMENT</h3>--%>
            <asp:HiddenField ID="hf_HRDQ5" runat="server" />
    <script type="text/javascript">
        function HRDQ5() {
            var add = 0, add1 = 0;
            if (document.getElementById('<%=chkbxHRDQ5_1.ClientID%>').checked == true) {
                 add++;
             }
             if (document.getElementById('<%=chkbxHRDQ5_2.ClientID%>').checked == true) {
                 add++;
             }
             if (document.getElementById('<%=chkbxHRDQ5_3.ClientID%>').checked == true) {
                 add++;
             }
             if (document.getElementById('<%=chkbxHRDQ5_4.ClientID%>').checked == true) {
                 add++;
             }
             if (document.getElementById('<%=chkbxHRDQ5_5.ClientID%>').checked == true) {
                 add++;
             }
             if (document.getElementById('<%=chkbxHRDQ5_6.ClientID%>').checked == true) {
                 add++;
             }
             if (document.getElementById('<%=chkbxHRDQ5_7.ClientID%>').checked == true) {
                 add++;
             }
             if (document.getElementById('<%=chkbxHRDQ5_8.ClientID%>').checked == true) {
                 add++;
             }
             if (document.getElementById('<%=chkbxHRDQ5_9.ClientID%>').checked == true) {
                 add++;
                 //document.getElementById('<%=lblScore_HRDQ5.ClientID%>').innerHTML = 7;
             }
            if (document.getElementById('<%=chkbxHRDQ5_10.ClientID%>').checked == true) {
                add1++;
            }
            if (document.getElementById('<%=chkbxHRDQ5_11.ClientID%>').checked == true) {
                add1++;
            }
            if (document.getElementById('<%=chkbxHRDQ5_12.ClientID%>').checked == true) {
                add1++;
            }
            if (document.getElementById('<%=chkbxHRDQ5_13.ClientID%>').checked == true) {
                add1++;
            }
            if (document.getElementById('<%=chkbxHRDQ5_14.ClientID%>').checked == true) {
                add1++;
            }
            if (document.getElementById('<%=chkbxHRDQ5_15.ClientID%>').checked == true) {
                add1++;
            }
            if (document.getElementById('<%=chkbxHRDQ5_16.ClientID%>').checked == true) {
                add1++;
            }
            if (document.getElementById('<%=chkbxHRDQ5_17.ClientID%>').checked == true) {
                add1++;
                //document.getElementById('<%=lblScore_PCRQ4.ClientID%>').innerHTML = 5;
            }
             if (add >= 2 && add1 >= 3) {
                 document.getElementById('<%=lblScore_HRDQ5.ClientID%>').innerHTML = 7;
             }
             else if (add >= 2 && add1 >= 2) {
                 document.getElementById('<%=lblScore_HRDQ5.ClientID%>').innerHTML = 5;
             }
             else if (add >= 2 && add1 >= 1) {
                 document.getElementById('<%=lblScore_HRDQ5.ClientID%>').innerHTML = 3;
             }
             else if (add >= 2) {
                 document.getElementById('<%=lblScore_HRDQ5.ClientID%>').innerHTML = 3;
             }
             else if (add < 2 && add >= 1) {
                 document.getElementById('<%=lblScore_HRDQ5.ClientID%>').innerHTML = 1;
                  }
             else {
                 document.getElementById('<%=lblScore_HRDQ5.ClientID%>').innerHTML = " ";
             }

            var score = 0;
            score = document.getElementById('<%=lblScore_HRDQ5.ClientID%>').textContent;
               document.getElementById('<%=hf_HRDQ5.ClientID%>').value = score;
            switch (score) {
                case "1":
                    {
                        document.getElementById('<%=chkbx_HRDQ5_1.ClientID%>').checked = true;
                        document.getElementById('<%=chkbx_HRDQ5_2.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_HRDQ5_3.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_HRDQ5_4.ClientID%>').checked = false;
                        break;
                    }
                case "3":
                    {
                        document.getElementById('<%=chkbx_HRDQ5_1.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_HRDQ5_2.ClientID%>').checked = true;
                        document.getElementById('<%=chkbx_HRDQ5_3.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_HRDQ5_4.ClientID%>').checked = false;
                        break;
                    }
                case "5":
                    {
                        document.getElementById('<%=chkbx_HRDQ5_1.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_HRDQ5_2.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_HRDQ5_3.ClientID%>').checked = true;
                        document.getElementById('<%=chkbx_HRDQ5_4.ClientID%>').checked = false;
                        break;
                    }
                case "7":
                    {
                        document.getElementById('<%=chkbx_HRDQ5_1.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_HRDQ5_2.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_HRDQ5_3.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_HRDQ5_4.ClientID%>').checked = true;
                        break;
                    }

            }
}
    </script>
             <div  id="HRDQ5"  style="display:none;">
    <table class="d">
        <tr>
            <td colspan="4">
                <h3>SCORING</h3>
            </td>
        </tr>
        <tr>
            <td class="q" colspan="2">
                <asp:Label ID="lblHRDQ5_A" runat="server"></asp:Label>
                <ul style="list-style-type: none">
                    <li>
                        <asp:CheckBox ID="chkbxHRDQ5_1" runat="server" OnClick="HRDQ5();" />
                        parent happy-eager to see home visitor, 
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbxHRDQ5_2" runat="server" OnClick="HRDQ5();" />
                        parent refers to previous session 
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbxHRDQ5_3" runat="server" OnClick="HRDQ5();" />
                        parent follows through on activities or “homework”, 
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbxHRDQ5_4" runat="server" OnClick="HRDQ5();" />
                        parent asks HV questions, 
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbxHRDQ5_5" runat="server" OnClick="HRDQ5();" />
                        parent refers friends to visitor or program
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbxHRDQ5_6" runat="server" OnClick="HRDQ5();" />
                        parent initiates calls/texts between visits, 
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbxHRDQ5_7" runat="server" OnClick="HRDQ5();" />
                        parent reveals personal info suggesting increased trust
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbxHRDQ5_8" runat="server" OnClick="HRDQ5();" />
                        other Note:<asp:TextBox ID="txt_HRDQ5_1" runat="server"></asp:TextBox>
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbxHRDQ5_9" runat="server" OnClick="HRDQ5();" />
                        other Note:<asp:TextBox ID="txt_HRDQ5_2" runat="server"></asp:TextBox>
                    </li>
                </ul>
            </td>
            <td class="q" colspan="2">
                <asp:Label ID="lblHRDQ5_B" runat="server"></asp:Label>
                <ul style="list-style-type: none">
                    <li>
                        <asp:CheckBox ID="chkbxHRDQ5_10" runat="server" OnClick="HRDQ5();" />
                        checks in by phone/text, 
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbxHRDQ5_11" runat="server" OnClick="HRDQ5();" />
                        uses active listening strategies, 
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbxHRDQ5_12" runat="server" OnClick="HRDQ5();" />
                        expresses interest in family life/activities, 
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbxHRDQ5_13" runat="server" OnClick="HRDQ5();" />
                        keeps strength-based focus as engagement strategy
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbxHRDQ5_14" runat="server" OnClick="HRDQ5();" />
                        strategically reveals elements of own personal life
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbxHRDQ5_15" runat="server" OnClick="HRDQ5();" />
                        other Note:<asp:TextBox ID="txt_HRDQ5_3" runat="server"></asp:TextBox>
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbxHRDQ5_16" runat="server" OnClick="HRDQ5();" />
                        other Note:<asp:TextBox ID="txt_HRDQ5_4" runat="server"></asp:TextBox>
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbxHRDQ5_17" runat="server" OnClick="HRDQ5();" />
                        other Note:<asp:TextBox ID="txt_HRDQ5_5" runat="server"></asp:TextBox>
                    </li>
                </ul>
                Note: bringing gifts/material goods does not count.
                <br />
            </td>
        </tr>
        <tr>
            <td class="q" colspan="2">If at least 2 examples present, continue; otherwise, score 1. 
            </td>
            <td class="q" colspan="2">If less than 2 examples present, score 3.<br />
                If at least 2 examples present, score 5;<br />
                If at least 3 examples present, score 7.
            </td>
        </tr>
        <tr>
            <td class="scoring" colspan="4">Score:<asp:Label ID="lblScore_HRDQ5" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="d">
                <asp:RadioButton ID="chkbx_HRDQ5_1" GroupName="chkbx_HRDQ5" runat="server" />
                <%--<asp:CheckBox ID="chkbx_HRDQ5_1" runat="server" /><br />--%>
                1<br />
                Low Quality<br />
                The home visitor does not pay attention to relationship-formation with families.
            </td>
            <td class="d">
                <asp:RadioButton ID="chkbx_HRDQ5_2" GroupName="chkbx_HRDQ5" runat="server" />
                <%--<asp:CheckBox ID="chkbx_HRDQ5_2" runat="server" /><br />--%>
                3<br />
                Average Quality<br />
                The home visitor recognizes basic signs of engagement with families, even if they cannot articulate specific strategies for forming positive helping relationships.
            </td>
            <td class="d">
                <asp:RadioButton ID="chkbx_HRDQ5_3" GroupName="chkbx_HRDQ5" runat="server" />
                <%--<asp:CheckBox ID="chkbx_HRDQ5_3" runat="server" /><br />--%>
                5<br />
                Above Average Quality<br />
                The home visitor articulates specific strategies to develop positive helping relationships with families.
            </td>
            <td class="d">
                <asp:RadioButton ID="chkbx_HRDQ5_4" GroupName="chkbx_HRDQ5" runat="server" />
                <%--<asp:CheckBox ID="chkbx_HRDQ5_4" runat="server" /><br />--%>
                7<br />
                High Quality<br />
                The home visitor has multiple strategies to develop positive helping relationships with families.
            </td>
        </tr>
    </table>
                 </div>
             
    <%--</asp:View>
        <asp:View ID="View6" runat="server">--%>
    <!-- Sixth One -->
   
            <div style="cursor:pointer;" onclick="javascript:DivClicked('IAQ6');"><h3 class="scoringTitle"><img src="../Images/edit_add.png" height="40" style="width: 40px" />WORKING WITH FAMILIES: INDIVIDUALIZING APPROACH (Scale A3, IR2)</h3></div>
    <%--<h3 class="scoringTitle"><asp:ImageButton ID="imgbtn_IAQ6" runat="server" ImageUrl="~/Images/edit_add.png" Height="40px" OnClick="imgbtn_IAQ6_Click" />WORKING WITH FAMILIES: INDIVIDUALIZING APPROACH</h3>--%>
            <asp:HiddenField ID="hfIAQ6" runat="server" />
    <script type="text/javascript">
        function IAQ6() {

            if (document.getElementById('<%=chkbxIAQ6_1.ClientID%>').checked == true
                && document.getElementById('<%=chkbxIAQ6_2.ClientID%>').checked == true
                 && document.getElementById('<%=chkbxIAQ6_3.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_IAQ6.ClientID%>').innerHTML = 7;
            }
            else if (document.getElementById('<%=chkbxIAQ6_1.ClientID%>').checked == true
                && document.getElementById('<%=chkbxIAQ6_2.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_IAQ6.ClientID%>').innerHTML = 5;
            }
            else if (document.getElementById('<%=chkbxIAQ6_1.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_IAQ6.ClientID%>').innerHTML = 3;
            }                
           // else if (document.getElementById('<%=chkbxPCRQ4_1.ClientID%>').checked == true
                 //|| document.getElementById('<%=chkbxPCRQ4_2.ClientID%>').checked == true) {
               // document.getElementById('<%=lblScore_IAQ6.ClientID%>').innerHTML = 1;
           // }
            else {
                document.getElementById('<%=lblScore_IAQ6.ClientID%>').innerHTML = 1;
            }

            var score = 0;
            score = document.getElementById('<%=lblScore_IAQ6.ClientID%>').textContent;
             document.getElementById('<%=hfIAQ6.ClientID%>').value = score;
            switch (score) {
                case "1":
                    {
                        document.getElementById('<%=chkbx_IAQ6_1.ClientID%>').checked = true;
                        document.getElementById('<%=chkbx_IAQ6_2.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_IAQ6_3.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_IAQ6_4.ClientID%>').checked = false;
                        break;
                    }
                case "3":
                    {
                        document.getElementById('<%=chkbx_IAQ6_1.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_IAQ6_2.ClientID%>').checked = true;
                        document.getElementById('<%=chkbx_IAQ6_3.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_IAQ6_4.ClientID%>').checked = false;
                        break;
                    }
                case "5":
                    {
                        document.getElementById('<%=chkbx_IAQ6_1.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_IAQ6_2.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_IAQ6_3.ClientID%>').checked = true;
                        document.getElementById('<%=chkbx_IAQ6_4.ClientID%>').checked = false;
                        break;
                    }
                case "7":
                    {
                        document.getElementById('<%=chkbx_IAQ6_1.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_IAQ6_2.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_IAQ6_3.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_IAQ6_4.ClientID%>').checked = true;
                        break;
                    }

            }
}
    </script>
              <div  id="IAQ6"  style="display:none;">
    <table class="d">
        <tr>
            <td colspan="4">
                <h3>SCORING</h3>
            </td>
        </tr>
        <tr>
            <td class="q" colspan="2">
                <ul style="list-style-type: none">
                    <li>
                        <asp:CheckBox ID="chkbxIAQ6_1" runat="server" OnClick="IAQ6();"/>
                        <asp:Label ID="lblIAQ6_A" runat="server"></asp:Label>
                    </li>
                </ul>
                Note: look for signs that home visitor does not use “one size fits all” approach and can adapt to family needs
            </td>
            <td class="q">
                <ul style="list-style-type: none">
                    <li>
                        <asp:CheckBox ID="chkbxIAQ6_2" runat="server" OnClick="IAQ6();"/>
                        <asp:Label ID="lblIAQ6_B" runat="server"></asp:Label>
                    </li>
                </ul>
            </td>
            <td class="q">
                <ul style="list-style-type: none">
                    <li>
                        <asp:CheckBox ID="chkbxIAQ6_3" runat="server" OnClick="IAQ6();"/>
                        <asp:Label ID="lblIAQ6_C" runat="server"></asp:Label>
                    </li>
                </ul>
            </td>
        </tr>
        <tr>
            <td class="q" colspan="2">If the above criterion is met, continue; otherwise, score 1. 
            </td>
            <td class="q">If the above criterion is met, continue; otherwise, score 3.             
            </td>
            <td>If the above criterion is met, score 7; otherwise, score 5. 
            </td>
        </tr>
        <tr>
            <td class="scoring" colspan="4">Score:<asp:Label ID="lblScore_IAQ6" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="d">
                 <asp:RadioButton ID="chkbx_IAQ6_1" GroupName="chkbx_IAQ6" runat="server" />
                <%--<asp:CheckBox ID="chkbx_IAQ6_1" runat="server" /><br />--%>
                1<br />
                Low Quality<br />
                The home visitor approaches relationships with families in an undifferentiated manner, with little accommodation to unique needs or issues.
            </td>
            <td class="d">
                 <asp:RadioButton ID="chkbx_IAQ6_2" GroupName="chkbx_IAQ6" runat="server" />
                <%--<asp:CheckBox ID="chkbx_IAQ6_2" runat="server" /><br />--%>
                3<br />
                Average Quality<br />
                The home visitor is aware of the need to individualize relationships, even if he/she cannot articulate specific approaches to do so.
            </td>
            <td class="d">
                 <asp:RadioButton ID="chkbx_IAQ6_3" GroupName="chkbx_IAQ6" runat="server" />
                <%--<asp:CheckBox ID="chkbx_IAQ6_3" runat="server" /><br />--%>
                5<br />
                Above Average Quality<br />
                The home visitor is able to articulate strategies for individualizing relationships.
            </td>
            <td class="d">
                 <asp:RadioButton ID="chkbx_IAQ6_4" GroupName="chkbx_IAQ6" runat="server" />
                <%--<asp:CheckBox ID="chkbx_IAQ6_4" runat="server" /><br />--%>
                7<br />
                High Quality<br />
                The home visitor recognizes “mutual competence” between himself and families, even areas where there is active disagreement
            </td>
        </tr>
    </table>    
                  </div>        
        
    <%-- </asp:View>
        <asp:View ID="View7" runat="server">--%>
    <%--  Seventh One --%>
    
            <div style="cursor:pointer;" onclick="javascript:DivClicked('RCCQ7');"><h3 class="scoringTitle"><img src="../Images/edit_add.png" height="40" style="width: 40px" />WORKING WITH FAMILIES: RECOGNIZES CULTURAL CONSIDERATIONS (Scale A3, IR3)</h3></div>
    <%--<h3 class="scoringTitle"><asp:ImageButton ID="imgbtn_RCCQ7" runat="server" ImageUrl="~/Images/edit_add.png" Height="40px" OnClick="imgbtn_RCCQ7_Click" />WORKING WITH FAMILIES: RECOGNIZES CULTURAL CONSIDERATIONS</h3>--%>
            <asp:HiddenField ID="hfRCCQ7" runat="server" />
     <script type="text/javascript">
         function RCCQ7() {
             var add = 0;
             if (document.getElementById('<%=chkbxRCCQ7_EX_1.ClientID%>').checked == true) {
                 add++;
             }
             if (document.getElementById('<%=chkbxRCCQ7_EX_2.ClientID%>').checked == true) {
                 add++;
             }
             if (document.getElementById('<%=chkbxRCCQ7_EX_3.ClientID%>').checked == true) {
                 add++;
             }
             if (document.getElementById('<%=chkbxRCCQ7_EX_4.ClientID%>').checked == true) {
                 add++;
             }
             if (document.getElementById('<%=chkbxRCCQ7_EX_5.ClientID%>').checked == true) {
                 add++;
             }

             if  ((document.getElementById('<%=chkbxRCCQ7_1.ClientID%>').checked == true)
                && (add >= 1)
                 &&(document.getElementById('<%=chkbxRCCQ7_3.ClientID%>').checked == true)) {
                document.getElementById('<%=lblScore_RCCQ7.ClientID%>').innerHTML = 7;
            }
             else if (document.getElementById('<%=chkbxRCCQ7_1.ClientID%>').checked == true
                 && (add >= 2)) {
                document.getElementById('<%=lblScore_RCCQ7.ClientID%>').innerHTML = 5;
            }
             else if (document.getElementById('<%=chkbxRCCQ7_1.ClientID%>').checked == true
                 && (add < 2)) {
                 document.getElementById('<%=lblScore_RCCQ7.ClientID%>').innerHTML = 3;
             }
             else if (document.getElementById('<%=chkbxRCCQ7_1.ClientID%>').checked == true) {
                 document.getElementById('<%=lblScore_RCCQ7.ClientID%>').innerHTML = 3;
             }
                 // else if (document.getElementById('<%=chkbxPCRQ4_1.ClientID%>').checked == true
                 //|| document.getElementById('<%=chkbxPCRQ4_2.ClientID%>').checked == true) {
                 // document.getElementById('<%=lblScore_RCCQ7.ClientID%>').innerHTML = 1;
                 // }
             else {
                 document.getElementById('<%=lblScore_RCCQ7.ClientID%>').innerHTML = 1;
             }

             var score = 0;
             score = document.getElementById('<%=lblScore_RCCQ7.ClientID%>').textContent;
             document.getElementById('<%=hfRCCQ7.ClientID%>').value = score;
             switch (score) {
                 case "1":
                     {
                         document.getElementById('<%=chkbx_RCCQ7_1.ClientID%>').checked = true;
                        document.getElementById('<%=chkbx_RCCQ7_2.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_RCCQ7_3.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_RCCQ7_4.ClientID%>').checked = false;
                        break;
                    }
                case "3":
                    {
                        document.getElementById('<%=chkbx_RCCQ7_1.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_RCCQ7_2.ClientID%>').checked = true;
                        document.getElementById('<%=chkbx_RCCQ7_3.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_RCCQ7_4.ClientID%>').checked = false;
                        break;
                    }
                case "5":
                    {
                        document.getElementById('<%=chkbx_RCCQ7_1.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_RCCQ7_2.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_RCCQ7_3.ClientID%>').checked = true;
                        document.getElementById('<%=chkbx_RCCQ7_4.ClientID%>').checked = false;
                        break;
                    }
                case "7":
                    {
                        document.getElementById('<%=chkbx_RCCQ7_1.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_RCCQ7_2.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_RCCQ7_3.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_RCCQ7_4.ClientID%>').checked = true;
                        break;
                    }

            }
}
    </script>
              <div  id="RCCQ7"  style="display:none;">
    <table class="d">
        <tr>
            <td colspan="4">
                <h3>SCORING</h3>
            </td>
        </tr>
        <tr>
            <td class="q" colspan="2">
                <ul style="list-style-type: none">
                    <li>
                        <asp:CheckBox ID="chkbxRCCQ7_1" runat="server" OnClick="RCCQ7();"/>
                        <asp:Label ID="lblRCCQ7_A" runat="server"></asp:Label>
                    </li>
                </ul>
            </td>
            <td class="q">
                <ul style="list-style-type: none">
                    <li>
                        <%--<asp:CheckBox ID="chkbxRCCQ7_2" runat="server" />--%>
                        <asp:Label ID="lblRCCQ7_B" runat="server"></asp:Label>
                    </li>
                </ul>
                Examples:
                <dl>
                    <dd>
                        <asp:CheckBox ID="chkbxRCCQ7_EX_1" runat="server" OnClick="RCCQ7();"/>Seek out education/consultation/training</dd>
                    <dd>
                        <asp:CheckBox ID="chkbxRCCQ7_EX_2" runat="server" OnClick="RCCQ7();"/>Ask family what expectations they have</dd>
                    <dd>
                        <asp:CheckBox ID="chkbxRCCQ7_EX_3" runat="server" OnClick="RCCQ7();"/>Use online resources/books (note specific references)</dd>
                    <dd>
                        <asp:CheckBox ID="chkbxRCCQ7_EX_4" runat="server" OnClick="RCCQ7();"/>Use cultural assessments</dd>
                    <dd>
                        <asp:CheckBox ID="chkbxRCCQ7_EX_5" runat="server" OnClick="RCCQ7();"/>Other;note:<asp:TextBox ID="txtRCCQ7" runat="server"></asp:TextBox>
                    </dd>
                </dl>
                Note: Use of translators should not be counted as an example
            </td>
            <td class="q">
                <ul style="list-style-type: none">
                    <li>
                        <asp:CheckBox ID="chkbxRCCQ7_3" runat="server" OnClick="RCCQ7();"/>
                        <asp:Label ID="lblRCCQ7_C" runat="server"></asp:Label>
                    </li>
                </ul>
            </td>
        </tr>
        <tr>
            <td class="q" colspan="2">If the above criterion is met, continue; otherwise, score 1. 
            </td>
            <td class="q">If at least 2 strategies provided, continue; otherwise, score 3.             
            </td>
            <td>If the above criterion is met, score 7; otherwise, score 5.  
            </td>
        </tr>
        <tr>
            <td class="scoring" colspan="4">Score:<asp:Label ID="lblScore_RCCQ7" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="d">
                <asp:RadioButton ID="chkbx_RCCQ7_1" GroupName="chkbx_RCCQ7" runat="server" />
                <%--<asp:CheckBox ID="chkbx_RCCQ7_1" runat="server" />--%>
                    1<br />
                Low Quality<br />
               The home visitor shows little awareness of the impact of culture on childrearing practices or beliefs and help-seeking in families.
            </td>
            <td class="d">
                <asp:RadioButton ID="chkbx_RCCQ7_2" GroupName="chkbx_RCCQ7" runat="server" />
                <%--<asp:CheckBox ID="chkbx_RCCQ7_2" runat="server" />--%>
                3<br />
                Average Quality<br />
              The home visitor generally recognizes the impact of culture, even if they do not apply this to specific work with families.
            </td>
            <td class="d">
                <asp:RadioButton ID="chkbx_RCCQ7_3" GroupName="chkbx_RCCQ7" runat="server" />
                <%--<asp:CheckBox ID="chkbx_RCCQ7_3" runat="server" />5<br />--%>
                5<br />
                Above Average Quality<br />
              The home visitor can articulate strategies to avoid imposing their own beliefs upon families.
            </td>
            <td class="d">
                <asp:RadioButton ID="chkbx_RCCQ7_4" GroupName="chkbx_RCCQ7" runat="server" />
                <%--<asp:CheckBox ID="chkbx_RCCQ7_4" runat="server" />7<br />--%>
                7<br />
                High Quality<br />
                The home visitor demonstrates an awareness of the impact of their own backgrounds on their practices and beliefs and can directly link this to their work with families.
            </td>
        </tr>
    </table>
                  </div>
             
    <%-- </asp:View>
        </asp:MultiView>--%>
   
             <div style="cursor:pointer;" onclick="javascript:DivClicked('REFQ8');"><h3 class="scoringTitle"><img src="../Images/edit_add.png" height="40" style="width: 40px" />REFERRALS AND FOLLOW-UP: REFERRALS (Scale A4, IR1)</h3></div>     
    <%--<h3 class="scoringTitle"><asp:ImageButton ID="imgbtn_REFQ8" runat="server" ImageUrl="~/Images/edit_add.png" Height="40px" OnClick="imgbtn_REFQ8_Click" />REFERRALS AND FOLLOW-UP: REFERRALS</h3>--%>
            <asp:HiddenField ID="hfREFQ8" runat="server" />
    <script type="text/javascript">
        function REFQ8() {

            if (document.getElementById('<%=chkbxREFQ8_1.ClientID%>').checked == true
                && document.getElementById('<%=chkbxREFQ8_2.ClientID%>').checked == true
                && document.getElementById('<%=chkbxREFQ8_3.ClientID%>').checked == true
                && document.getElementById('<%=chkbxREFQ8_4.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_REFQ8.ClientID%>').innerHTML = 7;
            }
            else if (document.getElementById('<%=chkbxREFQ8_1.ClientID%>').checked == true
                && document.getElementById('<%=chkbxREFQ8_2.ClientID%>').checked == true
                && document.getElementById('<%=chkbxREFQ8_3.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_REFQ8.ClientID%>').innerHTML = 5;
            }
            else if (document.getElementById('<%=chkbxREFQ8_1.ClientID%>').checked == true
                || document.getElementById('<%=chkbxREFQ8_2.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_REFQ8.ClientID%>').innerHTML = 3;
            }
                // else if (document.getElementById('<%=chkbxPCRQ4_1.ClientID%>').checked == true
                //|| document.getElementById('<%=chkbxPCRQ4_2.ClientID%>').checked == true) {
                // document.getElementById('<%=lblScore_REFQ8.ClientID%>').innerHTML = 1;
                // }
            else {
                document.getElementById('<%=lblScore_REFQ8.ClientID%>').innerHTML = 1;
            }

            var score = 0;
            score = document.getElementById('<%=lblScore_REFQ8.ClientID%>').textContent;
              document.getElementById('<%=hfREFQ8.ClientID%>').value = score;
            switch (score) {
                case "1":
                    {
                        document.getElementById('<%=chkbx_REFQ8_1.ClientID%>').checked = true;
                         document.getElementById('<%=chkbx_REFQ8_2.ClientID%>').checked = false;
                         document.getElementById('<%=chkbx_REFQ8_3.ClientID%>').checked = false;
                         document.getElementById('<%=chkbx_REFQ8_4.ClientID%>').checked = false;
                         break;
                     }
                 case "3":
                     {
                         document.getElementById('<%=chkbx_REFQ8_1.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_REFQ8_2.ClientID%>').checked = true;
                        document.getElementById('<%=chkbx_REFQ8_3.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_REFQ8_4.ClientID%>').checked = false;
                        break;
                    }
                case "5":
                    {
                        document.getElementById('<%=chkbx_REFQ8_1.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_REFQ8_2.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_REFQ8_3.ClientID%>').checked = true;
                        document.getElementById('<%=chkbx_REFQ8_4.ClientID%>').checked = false;
                        break;
                    }
                case "7":
                    {
                        document.getElementById('<%=chkbx_REFQ8_1.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_REFQ8_2.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_REFQ8_3.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_REFQ8_4.ClientID%>').checked = true;
                        break;
                    }

            }
}
    </script>
            <div  id="REFQ8"  style="display:none;">
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
                        <asp:CheckBox ID="chkbxREFQ8_1" runat="server" OnClick="REFQ8();"/>
                        <asp:Label ID="lblREFQ8_A" runat="server"></asp:Label>
                    </li>
                </ul>
            </td>
            <td class="q">
                <ul style="list-style-type: none">
                    <li>
                        <asp:CheckBox ID="chkbxREFQ8_2" runat="server" OnClick="REFQ8();"/>
                        <asp:Label ID="lblREFQ8_B" runat="server"></asp:Label>
                    </li>
                </ul>
            </td>
            <td class="q">
                <ul style="list-style-type: none">
                    <li>
                        <asp:CheckBox ID="chkbxREFQ8_3" runat="server" OnClick="REFQ8();"/>
                        <asp:Label ID="lblREFQ8_C" runat="server"></asp:Label>
                    </li>
                </ul>
            </td>
            <td class="q">
                <ul style="list-style-type: none">
                    <li>
                        <asp:CheckBox ID="chkbxREFQ8_4" runat="server" OnClick="REFQ8();"/>
                        <asp:Label ID="lblREFQ8_D" runat="server"></asp:Label>
                    </li>
                </ul>
            </td>
        </tr>
        <tr>
            <td class="q">If the above criterion is met, continue; otherwise, score 1. 
            </td>
            <td class="q">If the above criterion is met, continue; otherwise, score 3.              
            </td>
            <td class="q">If the above criterion is met, score 5; otherwise, score 3.</td>
            <td>If the above criterion is met, score 7; otherwise, score 5.  
            </td>
        </tr>
        <tr>
            <td class="scoring" colspan="4">Score:<asp:Label ID="lblScore_REFQ8" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="d">
                 <asp:RadioButton ID="chkbx_REFQ8_1" GroupName="chkbx_REFQ8" runat="server" />
                <%--<asp:CheckBox ID="chkbx_REFQ8_1" runat="server" />--%>
                1<br />
                Low Quality<br />
                The home visitor shows little evidence of offering referrals.
            </td>
            <td class="d">
                 <asp:RadioButton ID="chkbx_REFQ8_2" GroupName="chkbx_REFQ8" runat="server" />
                <%--<asp:CheckBox ID="chkbx_REFQ8_2" runat="server" />--%>
                3<br />
                Average Quality<br />
                The home visitor provides referrals as necessary and follows up through informal discussions with families.
            </td>
            <td class="d">
                 <asp:RadioButton ID="chkbx_REFQ8_3" GroupName="chkbx_REFQ8" runat="server" />
                <%--<asp:CheckBox ID="chkbx_REFQ8_3" runat="server" />--%>
                5<br />
                Above Average Quality<br />
               The home visitor provides referrals and formally tracks access and use of these services.
            </td>
            <td class="d">
                 <asp:RadioButton ID="chkbx_REFQ8_4" GroupName="chkbx_REFQ8" runat="server" />
                <%--<asp:CheckBox ID="chkbx_REFQ8_4" runat="server" />--%>
                7<br />
                High Quality<br />
                The home visitor works with families to access and track services, and problem-solve around access barriers.
            </td>
        </tr>
    </table>
                </div>
            
    <%--<%------------------------------------------------------%>
    
            <div style="cursor:pointer;" onclick="javascript:DivClicked('ACRQ9');"><h3 class="scoringTitle"><img src="../Images/edit_add.png" height="40" style="width: 40px" />REFERRALS AND FOLLOW-UP: AWARENESS OF COMMUNITY RESOURCES (Scale A4, IR2)</h3></div>     
    <%--<h3 class="scoringTitle"><asp:ImageButton ID="imgbtn_ACRQ9" runat="server" ImageUrl="~/Images/edit_add.png" Height="40px" OnClick="imgbtn_ACRQ9_Click" />REFERRALS AND FOLLOW-UP: AWARENESS OF COMMUNITY RESOURCES</h3>--%>
            <asp:HiddenField ID="hfACRQ9" runat="server" />
       <script type="text/javascript">
           function ACRQ9() {

               if ((document.getElementById('<%=chkbxACRQ9_1.ClientID%>').checked == true)
                && (document.getElementById('<%=chkbxACRQ9_2.ClientID%>').checked == true
                || document.getElementById('<%=chkbxACRQ9_3.ClientID%>').checked == true)
                && document.getElementById('<%=chkbxACRQ9_4.ClientID%>').checked == true
                && document.getElementById('<%=chkbxACRQ9_5.ClientID%>').checked == true) {
                document.getElementById('<%=lblScore_ACRQ9.ClientID%>').innerHTML = 7;
            }
               else if (document.getElementById('<%=chkbxACRQ9_1.ClientID%>').checked == true
                   && document.getElementById('<%=chkbxACRQ9_2.ClientID%>').checked == true
                && (document.getElementById('<%=chkbxACRQ9_3.ClientID%>').checked == true
                   || document.getElementById('<%=chkbxACRQ9_4.ClientID%>').checked == true
                   || document.getElementById('<%=chkbxACRQ9_5.ClientID%>').checked == true)) {
                   document.getElementById('<%=lblScore_ACRQ9.ClientID%>').innerHTML = 5;
               }
               else if (document.getElementById('<%=chkbxACRQ9_1.ClientID%>').checked == true                   
                   && (document.getElementById('<%=chkbxACRQ9_2.ClientID%>').checked == true
                   || document.getElementById('<%=chkbxACRQ9_3.ClientID%>').checked == true)) {
                   document.getElementById('<%=lblScore_ACRQ9.ClientID%>').innerHTML = 5;
               }

               else if (document.getElementById('<%=chkbxACRQ9_1.ClientID%>').checked == true) {
                   document.getElementById('<%=lblScore_ACRQ9.ClientID%>').innerHTML = 3;
               }
               else {
                   document.getElementById('<%=lblScore_ACRQ9.ClientID%>').innerHTML = 1;
               }


               var score = 0;
               score = document.getElementById('<%=lblScore_ACRQ9.ClientID%>').textContent;
            document.getElementById('<%=hfACRQ9.ClientID%>').value = score;
               switch (score) {
                   case "1":
                       {
                           document.getElementById('<%=chkbx_ACRQ9_1.ClientID%>').checked = true;
                        document.getElementById('<%=chkbx_ACRQ9_2.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_ACRQ9_3.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_ACRQ9_4.ClientID%>').checked = false;
                        break;
                    }
                case "3":
                    {
                        document.getElementById('<%=chkbx_ACRQ9_1.ClientID%>').checked = false;
                         document.getElementById('<%=chkbx_ACRQ9_2.ClientID%>').checked = true;
                         document.getElementById('<%=chkbx_ACRQ9_3.ClientID%>').checked = false;
                         document.getElementById('<%=chkbx_ACRQ9_4.ClientID%>').checked = false;
                         break;
                     }
                 case "5":
                     {
                         document.getElementById('<%=chkbx_ACRQ9_1.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_ACRQ9_2.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_ACRQ9_3.ClientID%>').checked = true;
                        document.getElementById('<%=chkbx_ACRQ9_4.ClientID%>').checked = false;
                        break;
                    }
                case "7":
                    {
                        document.getElementById('<%=chkbx_ACRQ9_1.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_ACRQ9_2.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_ACRQ9_3.ClientID%>').checked = false;
                        document.getElementById('<%=chkbx_ACRQ9_4.ClientID%>').checked = true;
                        break;
                    }

            }
}
    </script>
              <div  id="ACRQ9"  style="display:none;">
    <table class="d">
        <tr>
            <td class="scoring" colspan="4">
                <h3>SCORING</h3>
            </td>
        </tr>
        <tr>
            <td class="q">
                <ul style="list-style-type: none">
                    <li>
                        <asp:CheckBox ID="chkbxACRQ9_1" runat="server" OnClick="ACRQ9();"/>
                        <asp:Label ID="lblACRQ9_A" runat="server"></asp:Label>
                    </li>
                </ul>
            </td>
            <td class="q" colspan="2">Example:<asp:TextBox ID="txtACRQ9" runat="server" Width="150px"></asp:TextBox>
                &nbsp;<ul style="list-style-type: none">
                    <li>
                        <asp:CheckBox ID="chkbxACRQ9_2" runat="server" OnClick="ACRQ9();"/>
                        <asp:Label ID="lblACRQ9_B" runat="server"></asp:Label>
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbxACRQ9_3" runat="server" OnClick="ACRQ9();"/>
                        <asp:Label ID="lblACRQ9_C" runat="server"></asp:Label>
                    </li>
                </ul>
            </td>
            <td class="q" >
                <ul style="list-style-type: none">
                    <li>
                        <asp:CheckBox ID="chkbxACRQ9_4" runat="server" OnClick="ACRQ9();"/>
                        <asp:Label ID="lblACRQ9_D" runat="server"></asp:Label>
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbxACRQ9_5" runat="server" OnClick="ACRQ9();"/>
                        <asp:Label ID="lblACRQ9_E" runat="server"></asp:Label>
                        </li>

                </ul>
            </td>
        </tr>
        <tr>
            <td class="q">If the above criterion is met, continue; otherwise, score 1. 
            </td>
            <td class="q" colspan="2">If AT LEAST one criterion is met, continue; otherwise, score 3.              
            </td>
            <td class="q">If BOTH criteria are met, score 7; otherwise, score 5. </td>
        </tr>
        <tr>
            <td class="scoring" colspan="4">Score:<asp:Label ID="lblScore_ACRQ9" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="d">
                 <asp:RadioButton ID="chkbx_ACRQ9_1" GroupName="chkbx_ACRQ9" runat="server" />
                <%--<asp:CheckBox ID="chkbx_ACRQ9_1" runat="server" />--%>
                1<br />
                Low Quality<br />
                The home visitor is unaware of available community resources or referral sources for families.
            </td>
            <td class="d">
                 <asp:RadioButton ID="chkbx_ACRQ9_2" GroupName="chkbx_ACRQ9" runat="server" />
                <%--<asp:CheckBox ID="chkbx_ACRQ9_2" runat="server" />--%>
                3<br />
                Average Quality<br />
                The home visitor is aware of at least some community resources and referral sources for families.
            </td>
            <td class="d">
                 <asp:RadioButton ID="chkbx_ACRQ9_3" GroupName="chkbx_ACRQ9" runat="server" />
                <%--<asp:CheckBox ID="chkbx_ACRQ9_3" runat="server" />--%>
                5<br />
                Above Average Quality<br />
                The home visitor is aware of a variety of community resources and referral sources, as well as enrollment requirements and primary contact persons.
            </td>
            <td class="d">
                 <asp:RadioButton ID="chkbx_ACRQ9_4" GroupName="chkbx_ACRQ9" runat="server" />
                <%--<asp:CheckBox ID="chkbx_ACRQ9_4" runat="server" />--%>
                7<br />
                High Quality<br />
                The home visitor has established working relationships with various community resources and/or referral agencies. The home visitor knows referral agencies’ service capacities and works to find alternative resources for families.
            </td>
        </tr>
    </table>       
                  </div>     
        
    <%--<%------------------------------------------------------%>
    <asp:HiddenField ID="hf_vignete_ChildDevelopment" runat="server" />
    <asp:HiddenField ID="hf_vignete_ChildHealthWellBeing" runat="server" />
    <asp:HiddenField ID="hf_vignete_FocusParentChildRelationship" runat="server" />
    <asp:HiddenField ID="hf_vignete_WorkingWithFamilies" runat="server" />
    <asp:HiddenField ID="hf_vignete_IndividualizingApproach" runat="server" />
    <asp:HiddenField ID="hf_vignete_RecognizesCulturalConsiderations" runat="server" />
    <asp:HiddenField ID="hf_vignete_Referrals" runat="server" />    
    <script type="text/javascript">
        function ChildDevelopment() {
            var x = 0;
            if (document.getElementById('<%=chkbx_vignete_ChildDevelopment_1_1.ClientID%>').checked == true
                || document.getElementById('<%=chkbx_vignete_ChildDevelopment_2_1.ClientID%>').checked == true
                || document.getElementById('<%=chkbx_vignete_ChildDevelopment_3_1.ClientID%>').checked == true) {
                x++;
                document.getElementById('<%=lblRange_ChildDevelopment.ClientID%>').innerHTML = x;
            }
            if (document.getElementById('<%=chkbx_vignete_ChildDevelopment_1_2.ClientID%>').checked == true
                || document.getElementById('<%=chkbx_vignete_ChildDevelopment_2_2.ClientID%>').checked == true
                || document.getElementById('<%=chkbx_vignete_ChildDevelopment_3_2.ClientID%>').checked == true) {
                x++;
                document.getElementById('<%=lblRange_ChildDevelopment.ClientID%>').innerHTML = x;
            }
            if (document.getElementById('<%=chkbx_vignete_ChildDevelopment_1_3.ClientID%>').checked == true
               || document.getElementById('<%=chkbx_vignete_ChildDevelopment_2_3.ClientID%>').checked == true
                || document.getElementById('<%=chkbx_vignete_ChildDevelopment_3_3.ClientID%>').checked == true) {
                 x++;
                 document.getElementById('<%=lblRange_ChildDevelopment.ClientID%>').innerHTML = x;
            }
            document.getElementById('<%=hf_vignete_ChildDevelopment.ClientID%>').value = x;
            if (x == 0) {
                document.getElementById('<%=lblRange_ChildDevelopment.ClientID%>').innerHTML = " ";
                document.getElementById('<%=lblVg_ChildDevelopment_final.ClientID%>').innerHTML = "0 responses = 1";
            }
            else if (x == 1) {
                document.getElementById('<%=lblVg_ChildDevelopment_final.ClientID%>').innerHTML = "1 responses = 3";
            }
            else if (x == 2) {
                document.getElementById('<%=lblVg_ChildDevelopment_final.ClientID%>').innerHTML = "2 responses = 5";
            }
            else if (x == 3) {
                document.getElementById('<%=lblVg_ChildDevelopment_final.ClientID%>').innerHTML = "3 responses = 7";
            }
}
    </script>
    <script type="text/javascript">
        function ChildHealthWellBeing() {
            var x = 0;
            if (document.getElementById('<%=chkbx_ChildHealthWellBeing_1_1.ClientID%>').checked == true
                    || document.getElementById('<%=chkbx_ChildHealthWellBeing_2_1.ClientID%>').checked == true
                    || document.getElementById('<%=chkbx_ChildHealthWellBeing_3_1.ClientID%>').checked == true
                    || document.getElementById('<%=chkbx_ChildHealthWellBeing_4_1.ClientID%>').checked == true
                    || document.getElementById('<%=chkbx_ChildHealthWellBeing_5_1.ClientID%>').checked == true) {
                         x++;
                         document.getElementById('<%=chkbx_ChildHealthWellBeing_Range.ClientID%>').innerHTML = x;
                }
                if (document.getElementById('<%=chkbx_ChildHealthWellBeing_1_2.ClientID%>').checked == true
                         || document.getElementById('<%=chkbx_ChildHealthWellBeing_2_2.ClientID%>').checked == true
                    || document.getElementById('<%=chkbx_ChildHealthWellBeing_3_2.ClientID%>').checked == true
                    || document.getElementById('<%=chkbx_ChildHealthWellBeing_4_2.ClientID%>').checked == true
                    || document.getElementById('<%=chkbx_ChildHealthWellBeing_5_2.ClientID%>').checked == true) {
                    x++;
                    document.getElementById('<%=chkbx_ChildHealthWellBeing_Range.ClientID%>').innerHTML = x;
                }
                if (document.getElementById('<%=chkbx_ChildHealthWellBeing_1_3.ClientID%>').checked == true
                         || document.getElementById('<%=chkbx_ChildHealthWellBeing_2_3.ClientID%>').checked == true
                    || document.getElementById('<%=chkbx_ChildHealthWellBeing_3_3.ClientID%>').checked == true
                    || document.getElementById('<%=chkbx_ChildHealthWellBeing_4_3.ClientID%>').checked == true
                    || document.getElementById('<%=chkbx_ChildHealthWellBeing_5_3.ClientID%>').checked == true) {
                    x++;
                    document.getElementById('<%=chkbx_ChildHealthWellBeing_Range.ClientID%>').innerHTML = x;
                }
            document.getElementById('<%=hf_vignete_ChildHealthWellBeing.ClientID%>').value = x;
                if (x == 0) {
                    document.getElementById('<%=chkbx_ChildHealthWellBeing_Range.ClientID%>').innerHTML = " ";
                    document.getElementById('<%=chkbx_ChildHealthWellBeing_Final.ClientID%>').innerHTML = "0 responses = 1";
                }
                else if (x == 1) {
                    document.getElementById('<%=chkbx_ChildHealthWellBeing_Final.ClientID%>').innerHTML = "1 responses = 3";
                }
                else if (x == 2) {
                    document.getElementById('<%=chkbx_ChildHealthWellBeing_Final.ClientID%>').innerHTML = "2 responses = 5";
                }
                else if (x == 3) {
                    document.getElementById('<%=chkbx_ChildHealthWellBeing_Final.ClientID%>').innerHTML = "3 responses = 7";
                }
}
        </script>
        <script type="text/javascript">
            function FocusParentChildRelationship() {
                var x = 0;
                if (document.getElementById('<%=chkbx_FocusParentChildRelationship_1_1.ClientID%>').checked == true
                    || document.getElementById('<%=chkbx_FocusParentChildRelationship_2_1.ClientID%>').checked == true) {
                    x++;
                    document.getElementById('<%=chkbx_FocusParentChildRelationship_Range.ClientID%>').innerHTML = x;
                }

                if (document.getElementById('<%=chkbx_FocusParentChildRelationship_1_2.ClientID%>').checked == true
                    || document.getElementById('<%=chkbx_FocusParentChildRelationship_2_2.ClientID%>').checked == true) {

                    x++;
                    document.getElementById('<%=chkbx_FocusParentChildRelationship_Range.ClientID%>').innerHTML = x;
                }
                if (document.getElementById('<%=chkbx_FocusParentChildRelationship_1_3.ClientID%>').checked == true
                    || document.getElementById('<%=chkbx_FocusParentChildRelationship_2_3.ClientID%>').checked == true) {
                    x++;
                    document.getElementById('<%=chkbx_FocusParentChildRelationship_Range.ClientID%>').innerHTML = x;
                }

                document.getElementById('<%=hf_vignete_FocusParentChildRelationship.ClientID%>').value = x;
                if (x == 0) {
                    document.getElementById('<%=chkbx_FocusParentChildRelationship_Range.ClientID%>').innerHTML = " ";
                    document.getElementById('<%=chkbx_FocusParentChildRelationship_Final.ClientID%>').innerHTML = "0 responses = 1";
                }
                else if (x == 1) {
                    document.getElementById('<%=chkbx_FocusParentChildRelationship_Final.ClientID%>').innerHTML = "1 responses = 3";
                }
                else if (x == 2) {
                    document.getElementById('<%=chkbx_FocusParentChildRelationship_Final.ClientID%>').innerHTML = "2 responses = 5";
                }
                else if (x == 3) {
                    document.getElementById('<%=chkbx_FocusParentChildRelationship_Final.ClientID%>').innerHTML = "3 responses = 7";
                }
}
        </script>
       <script type="text/javascript">
           function WorkingWithFamilies() {
               var x = 0;
               if (document.getElementById('<%=chkbx_WorkingWithFamilies_1_1.ClientID%>').checked == true
                    || document.getElementById('<%=chkbx_WorkingWithFamilies_2_1.ClientID%>').checked == true) {
                    x++;
                    document.getElementById('<%=chkbx_WorkingWithFamilies_Range.ClientID%>').innerHTML = x;
                }
                if (document.getElementById('<%=chkbx_WorkingWithFamilies_1_2.ClientID%>').checked == true
                    || document.getElementById('<%=chkbx_WorkingWithFamilies_2_2.ClientID%>').checked == true) {
                    x++;
                    document.getElementById('<%=chkbx_WorkingWithFamilies_Range.ClientID%>').innerHTML = x;
                }
                if (document.getElementById('<%=chkbx_WorkingWithFamilies_1_3.ClientID%>').checked == true
                   || document.getElementById('<%=chkbx_WorkingWithFamilies_2_3.ClientID%>').checked == true) {
                    x++;
                    document.getElementById('<%=chkbx_WorkingWithFamilies_Range.ClientID%>').innerHTML = x;
                }
               document.getElementById('<%=hf_vignete_WorkingWithFamilies.ClientID%>').value = x;
                if (x == 0) {
                    document.getElementById('<%=chkbx_WorkingWithFamilies_Range.ClientID%>').innerHTML = " ";
                    document.getElementById('<%=chkbx_WorkingWithFamilies_Final.ClientID%>').innerHTML = "0 responses = 1";
                }
                else if (x == 1) {
                    document.getElementById('<%=chkbx_WorkingWithFamilies_Final.ClientID%>').innerHTML = "1 responses = 3";
                }
                else if (x == 2) {
                    document.getElementById('<%=chkbx_WorkingWithFamilies_Final.ClientID%>').innerHTML = "2 responses = 5";
                }
                else if (x == 3) {
                    document.getElementById('<%=chkbx_WorkingWithFamilies_Final.ClientID%>').innerHTML = "3 responses = 7";
                }
}
        </script>
     <script type="text/javascript">
         function IndividualizingApproach() {
             var x = 0;
             if (document.getElementById('<%=chkbx_IndividualizingApproach_1_1.ClientID%>').checked == true) {
                    x++;
                    document.getElementById('<%=chkbx_IndividualizingApproach_Range.ClientID%>').innerHTML = x;
                }
                if (document.getElementById('<%=chkbx_IndividualizingApproach_1_2.ClientID%>').checked == true) {
                    x++;
                    document.getElementById('<%=chkbx_IndividualizingApproach_Range.ClientID%>').innerHTML = x;
                }
                if (document.getElementById('<%=chkbx_IndividualizingApproach_1_3.ClientID%>').checked == true) {
                    x++;
                    document.getElementById('<%=chkbx_IndividualizingApproach_Range.ClientID%>').innerHTML = x;
                }
             document.getElementById('<%=hf_vignete_IndividualizingApproach.ClientID%>').value = x;
                if (x == 0) {
                    document.getElementById('<%=chkbx_IndividualizingApproach_Range.ClientID%>').innerHTML = " ";
                    document.getElementById('<%=chkbx_IndividualizingApproach_Final.ClientID%>').innerHTML = "0 responses = 1";
                }
                else if (x == 1) {
                    document.getElementById('<%=chkbx_IndividualizingApproach_Final.ClientID%>').innerHTML = "1 responses = 3";
                }
                else if (x == 2) {
                    document.getElementById('<%=chkbx_IndividualizingApproach_Final.ClientID%>').innerHTML = "2 responses = 5";
                }
                else if (x == 3) {
                    document.getElementById('<%=chkbx_IndividualizingApproach_Final.ClientID%>').innerHTML = "3 responses = 7";
                }
}
        </script>
       <script type="text/javascript">
           function RecognizesCulturalConsiderations() {
               var x = 0;
               if (document.getElementById('<%=chkbx_RecognizesCulturalConsiderations_1_1.ClientID%>').checked == true
                    || document.getElementById('<%=chkbx_RecognizesCulturalConsiderations_2_1.ClientID%>').checked == true) {
                    x++;
                    document.getElementById('<%=chkbx_RecognizesCulturalConsiderations_Range.ClientID%>').innerHTML = x;
                }
                if (document.getElementById('<%=chkbx_RecognizesCulturalConsiderations_1_2.ClientID%>').checked == true
                    || document.getElementById('<%=chkbx_RecognizesCulturalConsiderations_2_2.ClientID%>').checked == true) {
                    x++;
                    document.getElementById('<%=chkbx_RecognizesCulturalConsiderations_Range.ClientID%>').innerHTML = x;
                }
                if (document.getElementById('<%=chkbx_RecognizesCulturalConsiderations_1_3.ClientID%>').checked == true
                    || document.getElementById('<%=chkbx_RecognizesCulturalConsiderations_2_3.ClientID%>').checked == true) {
                    x++;
                    document.getElementById('<%=chkbx_RecognizesCulturalConsiderations_Range.ClientID%>').innerHTML = x;
                }

               document.getElementById('<%=hf_vignete_RecognizesCulturalConsiderations.ClientID%>').value = x;
                if (x == 0) {
                    document.getElementById('<%=chkbx_RecognizesCulturalConsiderations_Range.ClientID%>').innerHTML = " ";
                    document.getElementById('<%=chkbx_RecognizesCulturalConsiderations_Final.ClientID%>').innerHTML = "0 responses = 3";
                }
                else if (x == 1) {
                    document.getElementById('<%=chkbx_RecognizesCulturalConsiderations_Final.ClientID%>').innerHTML = "1 responses = 5";
                }
                else if (x >= 2) {
                    document.getElementById('<%=chkbx_RecognizesCulturalConsiderations_Final.ClientID%>').innerHTML = "2-3 responses = 7";
                }
    }
        </script>
     <script type="text/javascript">
         function Referrals() {
             var x = 0;
             if (document.getElementById('<%=chkbx_Referrals_1_1.ClientID%>').checked == true
                    || document.getElementById('<%=chkbx_Referrals_2_1.ClientID%>').checked == true
                    || document.getElementById('<%=chkbx_Referrals_3_1.ClientID%>').checked == true) {
                    x++;
                    document.getElementById('<%=chkbx_Referrals_Range.ClientID%>').innerHTML = x;
                }
                if (document.getElementById('<%=chkbx_Referrals_1_2.ClientID%>').checked == true
                    || document.getElementById('<%=chkbx_Referrals_2_2.ClientID%>').checked == true
                    || document.getElementById('<%=chkbx_Referrals_3_2.ClientID%>').checked == true) {
                    x++;
                    document.getElementById('<%=chkbx_Referrals_Range.ClientID%>').innerHTML = x;
                }
                if (document.getElementById('<%=chkbx_Referrals_1_3.ClientID%>').checked == true
                    || document.getElementById('<%=chkbx_Referrals_2_3.ClientID%>').checked == true
                    || document.getElementById('<%=chkbx_Referrals_3_3.ClientID%>').checked == true) {
                    x++;
                    document.getElementById('<%=chkbx_Referrals_Range.ClientID%>').innerHTML = x;
                }
             document.getElementById('<%=hf_vignete_Referrals.ClientID%>').value = x;
                if (x == 0) {
                    document.getElementById('<%=chkbx_Referrals_Range.ClientID%>').innerHTML = " ";
                    document.getElementById('<%=chkbx_Referrals_Final.ClientID%>').innerHTML = "0 responses = 1";
                }
                else if (x == 1) {
                    document.getElementById('<%=chkbx_Referrals_Final.ClientID%>').innerHTML = "1 responses = 3";
                }
                else if (x == 2) {
                    document.getElementById('<%=chkbx_Referrals_Final.ClientID%>').innerHTML = "2 responses = 5";
                }
                else if (x >= 3) {
                    document.getElementById('<%=chkbx_Referrals_Final.ClientID%>').innerHTML = "3 responses = 7";
                }
}
        </script>      
        <div style="cursor:pointer;" onclick="javascript:DivClicked('VIGNETTE');"><h3 class="scoringTitle"><img src="../Images/edit_add.png" height="40" style="width: 40px" />CASE VIGNETTES</h3></div>                                                 
    <%--<h3 class="scoringTitle"><asp:ImageButton ID="imgbtn_VIGNETTE" runat="server" ImageUrl="~/Images/edit_add.png" Height="40px" OnClick="imgbtn_VIGNETTE_Click" />CASE VIGNETTES</h3>--%>
     <div  id="VIGNETTE"  style="display:none;">
        <table class="d">
        <tr>
            <td class="scoring" colspan="6">
                <h3>VIGNETTE SCORING</h3>
                <h4 style="font-style: italic;">Check each vignette (A-C) where content area was noted in response at least once, then total for each content area (range of 0 to 3) </h4>
            </td>
        </tr>
        <tr>
            <td class="d">Home Visitor Responses  
            </td>
            <td class="d">A<br />
                Responses
            </td>
            <td class="d">B<br />
                Responses
            </td>
            <td class="d">C<br />
                Responses
            </td>
            <td class="d">RESPONSE COUNT
            </td>
            <td class="d">Vignette Score by Indicator Row
            </td>
        </tr>
        <tr>
            <td class="scoring" colspan="6">
                <h5>Child Development</h5>
            </td>
        </tr>
        <tr>
            <td class="scoring">
                <ol>
                    <li>
                        <asp:Label ID="lblVCDQ10_1" runat="server"></asp:Label>
                    </li>
                </ol>
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_vignete_ChildDevelopment_1_1" OnClick="ChildDevelopment();" runat="server" />
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_vignete_ChildDevelopment_1_2" OnClick="ChildDevelopment();" runat="server" />
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_vignete_ChildDevelopment_1_3" OnClick="ChildDevelopment();" runat="server" />
            </td>
            <td class="d" rowspan="3">(0-3 range)<br />
                <asp:Label ID="lblRange_ChildDevelopment" runat="server" ForeColor="Red"></asp:Label>
            </td>
            <td class="d" rowspan="3">0 responses = 1<br />
                1 responses = 3<br />
                2 responses = 5<br />
                3 responses = 7
                <br />
                <br />
                <asp:Label ID="lblVg_ChildDevelopment_final" runat="server" ForeColor="Red"></asp:Label>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="scoring">
                <ol start="2">
                    <li>
                        <asp:Label ID="lblVCDQ10_2" runat="server"></asp:Label>
                    </li>
                </ol>
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_vignete_ChildDevelopment_2_1" runat="server" OnClick="ChildDevelopment();" />
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_vignete_ChildDevelopment_2_2" runat="server" OnClick="ChildDevelopment();" />
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_vignete_ChildDevelopment_2_3" runat="server" OnClick="ChildDevelopment();" />
            </td>
        </tr>
        <tr>
            <td class="scoring">
                <ol start="3">
                    <li>
                        <asp:Label ID="lblVCDQ10_3" runat="server"></asp:Label>
                    </li>
                </ol>
            </td>

            <td class="d">
                <asp:CheckBox ID="chkbx_vignete_ChildDevelopment_3_1" runat="server" OnClick="ChildDevelopment();" />
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_vignete_ChildDevelopment_3_2" runat="server" OnClick="ChildDevelopment();" />
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_vignete_ChildDevelopment_3_3" runat="server" OnClick="ChildDevelopment();" />
            </td>
        </tr>

        <%--<%------------------------------------------------------%>
        <tr>             
            <td class="scoring" colspan="6">
                <h5>Child Health and Well-Being</h5>
            </td>
        </tr>
        <tr>
            <td class="scoring">
                <ol start="4">
                    <li>
                        <asp:Label ID="lblVCDQ10_4" runat="server"></asp:Label>

                    </li>
                </ol>
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_ChildHealthWellBeing_1_1" OnClick="ChildHealthWellBeing();" runat="server" />
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_ChildHealthWellBeing_1_2" OnClick="ChildHealthWellBeing();" runat="server" />
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_ChildHealthWellBeing_1_3" OnClick="ChildHealthWellBeing();" runat="server" />
            </td>
            <td class="d" rowspan="5">(0-3 range)<br />
                <asp:Label ID="chkbx_ChildHealthWellBeing_Range" runat="server" ForeColor="Red"></asp:Label>

            </td>
            <td class="d" rowspan="5">0 responses = 1<br />
                1 responses = 3<br />
                2 responses = 5<br />
                3 responses = 7
                <br />
                <br />
                <asp:Label ID="chkbx_ChildHealthWellBeing_Final" runat="server" ForeColor="Red"></asp:Label>
                &nbsp;</td>
        </tr>

        <tr>
            <td class="scoring">
                <ol start="5">
                    <li>
                        <asp:Label ID="lblVCDQ10_5" runat="server"></asp:Label>

                    </li>
                </ol>
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_ChildHealthWellBeing_2_1" runat="server" OnClick="ChildHealthWellBeing();" />
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_ChildHealthWellBeing_2_2" runat="server" OnClick="ChildHealthWellBeing();" />
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_ChildHealthWellBeing_2_3" runat="server" OnClick="ChildHealthWellBeing();" />
            </td>
        </tr>
        <tr>
            <td class="scoring">
                <ol start="6">
                    <li>
                        <asp:Label ID="lblVCDQ10_6" runat="server"></asp:Label>
                    </li>
                </ol>
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_ChildHealthWellBeing_3_1" runat="server" OnClick="ChildHealthWellBeing();" />
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_ChildHealthWellBeing_3_2" runat="server" OnClick="ChildHealthWellBeing();" />
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_ChildHealthWellBeing_3_3" runat="server" OnClick="ChildHealthWellBeing();" />
            </td>
        </tr>
        <tr>
            <td class="scoring">
                <ol start="7">
                    <li>
                        <asp:Label ID="lblVCDQ10_7" runat="server"></asp:Label>
                    </li>
                </ol>
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_ChildHealthWellBeing_4_1" runat="server" OnClick="ChildHealthWellBeing();" />
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_ChildHealthWellBeing_4_2" runat="server" OnClick="ChildHealthWellBeing();" />
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_ChildHealthWellBeing_4_3" runat="server" OnClick="ChildHealthWellBeing();" />
            </td>
        </tr>
        <tr>
            <td class="scoring">
                <ol start="8">
                    <li>
                        <asp:Label ID="lblVCDQ10_8" runat="server"></asp:Label>
                    </li>
                </ol>
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_ChildHealthWellBeing_5_1" runat="server" OnClick="ChildHealthWellBeing();" />
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_ChildHealthWellBeing_5_2" runat="server" OnClick="ChildHealthWellBeing();" />
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_ChildHealthWellBeing_5_3" runat="server" OnClick="ChildHealthWellBeing();" />
            </td>
        </tr>

        <%--<%------------------------------------------------------%>
        <tr>
            <td class="scoring" colspan="6">
                <h5>Focus Parent-Child Relationship</h5>
            </td>
        </tr>
        <tr>
            <td class="scoring">
                <ol start="9">
                    <li>
                        <asp:Label ID="lblVCDQ10_9" runat="server"></asp:Label>
                    </li>
                </ol>
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_FocusParentChildRelationship_1_1" OnClick="FocusParentChildRelationship();" runat="server" />
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_FocusParentChildRelationship_1_2" OnClick="FocusParentChildRelationship();" runat="server" />
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_FocusParentChildRelationship_1_3" OnClick="FocusParentChildRelationship();" runat="server" />
            </td>
            <td class="d" rowspan="2">(0-3 range)<br />
                <asp:Label ID="chkbx_FocusParentChildRelationship_Range" runat="server" ForeColor="Red"></asp:Label>

            </td>
            <td class="d" rowspan="2">0 responses = 1<br />
                1 responses = 3<br />
                2 responses = 5<br />
                3 responses = 7
                <br />
                <br />
                <asp:Label ID="chkbx_FocusParentChildRelationship_Final" runat="server" ForeColor="Red"></asp:Label>
                &nbsp;</td>
        </tr>

        <tr>
            <td class="scoring">
                <ol start="10">
                    <li>
                        <asp:Label ID="lblVCDQ10_10" runat="server"></asp:Label>
                    </li>
                </ol>
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_FocusParentChildRelationship_2_1" runat="server" OnClick="FocusParentChildRelationship();" />
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_FocusParentChildRelationship_2_2" runat="server" OnClick="FocusParentChildRelationship();" />
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_FocusParentChildRelationship_2_3" runat="server" OnClick="FocusParentChildRelationship();" />
            </td>
        </tr>

        <%--<%------------------------------------------------------%>
        <tr>
            <td class="scoring" colspan="6">
                <h5>Working With Families</h5>
            </td>
        </tr>
        <tr>
            <td class="scoring">
                <ol start="11">
                    <li>
                        <asp:Label ID="lblVCDQ10_11" runat="server"></asp:Label>
                    </li>
                </ol>
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_WorkingWithFamilies_1_1" OnClick="WorkingWithFamilies();" runat="server" />
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_WorkingWithFamilies_1_2" OnClick="WorkingWithFamilies();" runat="server" />
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_WorkingWithFamilies_1_3" OnClick="WorkingWithFamilies();" runat="server" />
            </td>
            <td class="d" rowspan="2">(0-3 range)<br />
                <asp:Label ID="chkbx_WorkingWithFamilies_Range" runat="server" ForeColor="Red"></asp:Label>

            </td>
            <td class="d" rowspan="2">0 responses = 1<br />
                1 responses = 3<br />
                2 responses = 5<br />
                3 responses = 7
                <br />
                <br />
                <asp:Label ID="chkbx_WorkingWithFamilies_Final" runat="server" ForeColor="Red"></asp:Label>
                &nbsp;</td>
        </tr>

        <tr>
            <td class="scoring">
                <ol start="12">
                    <li>
                        <asp:Label ID="lblVCDQ10_12" runat="server"></asp:Label>
                    </li>
                </ol>
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_WorkingWithFamilies_2_1" runat="server" OnClick="WorkingWithFamilies();" />
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_WorkingWithFamilies_2_2" runat="server" OnClick="WorkingWithFamilies();" />
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_WorkingWithFamilies_2_3" runat="server" OnClick="WorkingWithFamilies();" />
            </td>
        </tr>

        <%--<%------------------------------------------------------%>
        <tr>
            <td class="scoring" colspan="6">
                <h5>Individualizing Approach</h5>
            </td>
        </tr>
        <tr>
            <td class="scoring">
                <ol start="13">
                    <li>
                        <asp:Label ID="lblVCDQ10_13" runat="server"></asp:Label>
                    </li>
                </ol>
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_IndividualizingApproach_1_1" OnClick="IndividualizingApproach();" runat="server" />
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_IndividualizingApproach_1_2" OnClick="IndividualizingApproach();" runat="server" />
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_IndividualizingApproach_1_3" OnClick="IndividualizingApproach();" runat="server" />
            </td>
            <td class="d">(0-3 range)<br />
                <asp:Label ID="chkbx_IndividualizingApproach_Range" runat="server" ForeColor="Red"></asp:Label>

            </td>
            <td class="d">0 responses = 1<br />
                1 responses = 3<br />
                2 responses = 5<br />
                3 responses = 7
                <br />
                <br />
                <asp:Label ID="chkbx_IndividualizingApproach_Final" runat="server" ForeColor="Red"></asp:Label>
                &nbsp;</td>
        </tr>

        <%--<%------------------------------------------------------%>
        <tr>
            <td class="scoring" colspan="6">
                <h5>Recognizes Cultural Considerations</h5>
            </td>
        </tr>
        <tr>
            <td class="scoring">
                <ol start="14">
                    <li>
                        <asp:Label ID="lblVCDQ10_14" runat="server"></asp:Label>
                    </li>
                </ol>
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_RecognizesCulturalConsiderations_1_1" OnClick="RecognizesCulturalConsiderations();" runat="server" />
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_RecognizesCulturalConsiderations_1_2" OnClick="RecognizesCulturalConsiderations();" runat="server" />
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_RecognizesCulturalConsiderations_1_3" OnClick="RecognizesCulturalConsiderations();" runat="server" />
            </td>
            <td class="d" rowspan="2">(0-3 range)<br />
                <asp:Label ID="chkbx_RecognizesCulturalConsiderations_Range" runat="server" ForeColor="Red"></asp:Label>

            </td>
            <td class="d" rowspan="2">0 responses = 3<br />
                1 responses = 5<br />
                2-3 responses = 7
                <br />
                <br />
                <asp:Label ID="chkbx_RecognizesCulturalConsiderations_Final" runat="server" ForeColor="Red"></asp:Label>
                &nbsp;</td>
        </tr>

        <tr>
            <td class="scoring">
                <ol start="15">
                    <li>
                        <asp:Label ID="lblVCDQ10_15" runat="server"></asp:Label>
                    </li>
                </ol>
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_RecognizesCulturalConsiderations_2_1" runat="server" OnClick="RecognizesCulturalConsiderations();" />
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_RecognizesCulturalConsiderations_2_2" runat="server" OnClick="RecognizesCulturalConsiderations();" />
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_RecognizesCulturalConsiderations_2_3" runat="server" OnClick="RecognizesCulturalConsiderations();" />
            </td>
        </tr>

        <%--<%------------------------------------------------------%>
       
        <tr>
            <td class="scoring" colspan="6">
                <h5>Referrals</h5>
            </td>
        </tr>
        <tr>
            <td class="scoring">
                <ol start="16">
                    <li>
                        <asp:Label ID="lblVCDQ10_16" runat="server"></asp:Label>
                    </li>
                </ol>
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_Referrals_1_1" OnClick="Referrals();" runat="server" />
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_Referrals_1_2" OnClick="Referrals();" runat="server" />
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_Referrals_1_3" OnClick="Referrals();" runat="server" />
            </td>
            <td class="d" rowspan="3">(0-3 range)<br />
                <asp:Label ID="chkbx_Referrals_Range" runat="server" ForeColor="Red"></asp:Label>

            </td>
            <td class="d" rowspan="3">0 responses = 1<br />
                1 responses = 3<br />
                2 responses = 5<br />
                3 responses = 7
                <br />
                <br />
                <asp:Label ID="chkbx_Referrals_Final" runat="server" ForeColor="Red"></asp:Label>
                &nbsp;</td>
        </tr>

        <tr>
            <td class="scoring">
                <ol start="17">
                    <li>
                        <asp:Label ID="lblVCDQ10_17" runat="server"></asp:Label>
                    </li>
                </ol>
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_Referrals_2_1" runat="server" OnClick="Referrals();" />
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_Referrals_2_2" runat="server" OnClick="Referrals();" />
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_Referrals_2_3" runat="server" OnClick="Referrals();" />
            </td>
        </tr>
        <tr>
            <td class="scoring">
                <ol start="18">
                    <li>
                        <asp:Label ID="lblVCDQ10_18" runat="server"></asp:Label>

                    </li>
                </ol>
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_Referrals_3_1" runat="server" OnClick="Referrals();" />
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_Referrals_3_2" runat="server" OnClick="Referrals();" />
            </td>
            <td class="d">
                <asp:CheckBox ID="chkbx_Referrals_3_3" runat="server" OnClick="Referrals();" />
            </td>
        </tr>        
    </table>
         </div>     
    <br />
  <div><asp:Button ID="btnSubmit" runat="server" BackColor="#F3F3F3" BorderStyle="Solid" BorderWidth="5px" Font-Bold="True" Font-Italic="False" Font-Size="X-Large" Font-Strikeout="False" Font-Underline="False" ForeColor="Black" Height="50px" Text="Save/Submit" OnClick="btnSubmit_Click" ValidationGroup="Val1" OnClientClick="window.onbeforeunload=null;"/></div>          
  </asp:Content>
