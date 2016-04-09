<%@ Page Title="" Language="C#" MasterPageFile="~/GroupObservation/GropObservation.master" AutoEventWireup="true" CodeBehind="GroupObservation.aspx.cs" Inherits="HVP.GroupObservation.GroupObservation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="border: solid 1px;" class="grop-survey">
        <h3 class="finaltoolTitle_1">PRE-OBSERVATION QUESTIONS</h3>
        <asp:HiddenField ID="hfsiteid" runat="server" />
        <asp:HiddenField ID="hfSchdId" runat="server" />
        <p>Ask the group leader the following questions before the group begins.</p>
        <ol>
            <li>
                <asp:Label ID="lblQ1_Pre" runat="server"></asp:Label>
                <ul style="list-style-type: none" class="checkbox-list">
                    <li>
                        <asp:RadioButtonList ID="rdobtnlstQ1_Pre" runat="server">
                            <asp:ListItem Value="1">Parents as Teachers</asp:ListItem>
                            <asp:ListItem Value="2">BabyTalk</asp:ListItem>
                            <asp:ListItem Value="3">Healthy Families           </asp:ListItem>
                            <asp:ListItem Value="4">Other (Specify) </asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:TextBox ID="txtQ1_Pre_other" runat="server"></asp:TextBox>
                    </li>
                </ul>
            </li>
            <li>
                <asp:Label ID="lblQ2_Pre" runat="server"></asp:Label>
                <ul style="list-style-type: none" class="checkbox-list">
                    <li>
                        <asp:CheckBox ID="chkbxQ2_Pre_1" runat="server" />Enhance positive caregiver-child relationship 
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbxQ2_Pre_2" runat="server" />Provide parent training on child development / school readiness / child care
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbxQ2_Pre_3" runat="server" />Improve children’s social emotional skills / development in general
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbxQ2_Pre_4" runat="server" />Space for caregivers to interact and learn from each other
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbxQ2_Pre_5" runat="server" />Prepare children for school: school-related knowledge, environment
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbxQ2_Pre_6" runat="server" />Other:</asp:CheckBox>  
                        <br>
                        <asp:TextBox ID="txtQ2_Pre_other" runat="server"></asp:TextBox>
                    </li>
                </ul>
            </li>
            <%--Need A Repeater for Q3--%>
            <li>
                <asp:Label ID="lblQ3_Pre" runat="server"></asp:Label>
                <ul style="list-style-type: none" class="checkbox-list">
                    <li>
                        <asp:CheckBox ID="chkbxQ3_Pre_1" runat="server" />
                        Further children’s knowledge of
                        <%--<asp:TextBox ID="txtQ3_Pre_1" runat="server"></asp:TextBox>--%>
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbxQ3_Pre_2" runat="server" />
                        Further caregivers’ knowledge of 
                        <%--<asp:TextBox ID="txtQ3_Pre_2" runat="server"></asp:TextBox>--%>
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbxQ3_Pre_3" runat="server" />
                        Improve children’s skills in 
                        <%--<asp:TextBox ID="txtQ3_Pre_3" runat="server"></asp:TextBox>--%>
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbxQ3_Pre_4" runat="server" />
                        No specific goal
                        <%--<asp:TextBox ID="txtQ3_Pre_4" runat="server"></asp:TextBox>--%>
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbxQ3_Pre_5" runat="server" />
                        Other:<br>
                        <asp:TextBox ID="txtQ3_Pre_5" runat="server"></asp:TextBox>
                    </li>
                </ul>
            </li>
            <li>
                <asp:Label ID="lblQ4_Pre" runat="server"></asp:Label>
                <ul style="list-style-type: none">
                    <li>
                        <asp:RadioButtonList ID="rdobtnlstQ4_pre" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="1">Yes</asp:ListItem>
                            <asp:ListItem Value="2">No</asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:Label ID="lblQ4_Pre_1" runat="server"></asp:Label><br />
                        <asp:TextBox ID="txtQ4_Pre_1" runat="server" Width="300px" Height="40px"></asp:TextBox>
                    </li>
                </ul>
            </li>
            <li>
                <asp:Label ID="lblQ5_Pre" runat="server"></asp:Label>
                <ul style="list-style-type: none" class="checkbox-list">
                    <li>
                        <asp:CheckBox ID="chkbxQ5_Pre_1" runat="server" />Those receiving home visits
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbxQ5_Pre_2" runat="server" />At-risk families
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbxQ5_Pre_3" runat="server" />Multicultural / Multilingual families  
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbxQ5_Pre_4" runat="server" />Any family from the community
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbxQ5_Pre_5" runat="server" />Those on the waitlist
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbxQ5_Pre_6" runat="server" />Other (note language of multilingual families if applicable): 
                    </li>
                </ul>
            </li>
            <li>
                <asp:Label ID="lblQ6_Pre" runat="server"></asp:Label>
                <ul style="list-style-type: none">
                    <li>
                        <asp:RadioButtonList ID="rdobtnlstQ6_pre" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="1">Yes</asp:ListItem>
                            <asp:ListItem Value="2">No</asp:ListItem>
                        </asp:RadioButtonList>
                        If yes:
                 <asp:RadioButtonList ID="rdobtnlstQ6_pre_1" runat="server" RepeatDirection="Horizontal">
                     <asp:ListItem Value="1">PT Home Visitor</asp:ListItem>
                     <asp:ListItem Value="2">FT Home Visitor</asp:ListItem>
                 </asp:RadioButtonList>
                    </li>
                </ul>
            </li>
        </ol>
        <h3 class="finaltoolTitle_1">OBSERVATION TOOL</h3>
        <p>Answer the following questions based on your observations.</p>
        <ol>
            <%--<li>
                <asp:Label ID="lblQ1_OT" runat="server"></asp:Label>
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                <asp:Label ID="lblQ1_OT_id" runat="server"></asp:Label>
            </li>
            <li>
                <asp:Label ID="lblQ2_OT_1" runat="server"></asp:Label><asp:TextBox ID="txtQ2_OT_1" runat="server"></asp:TextBox>
                <asp:Label ID="lblQ2_OT_2" runat="server"></asp:Label><asp:TextBox ID="txtQ2_OT_2" runat="server"></asp:TextBox>
            </li>
            <li>
                <asp:Label ID="lblQ3_OT" runat="server"></asp:Label><asp:TextBox ID="txtQ3_OT" runat="server"></asp:TextBox>
            </li>--%>
            <li>
                <h4>Program ID: 
                <asp:Label ID="lblProgramID" runat="server"></asp:Label>
                </h4>
            </li>
            <li>
                <h4>Session Start Time: <asp:TextBox ID="txtStartTime" runat="server"></asp:TextBox>&nbsp; End Time: <asp:TextBox ID="txtendTime" runat="server"></asp:TextBox></h4>
            </li>
            <li>
                <h4>Number of Facilitators:
                    <asp:TextBox ID="txtFacilitators" runat="server"></asp:TextBox></h4>
            </li>
            <li>
                <p>Attendance:</p>
                <asp:Label ID="lblQ4_OT" runat="server"></asp:Label>
                <ol type="A">
                    <li>
                        <asp:Label ID="lblQ4_OT_1" runat="server"></asp:Label>
                        <%--Number of adults/parents attending (Count 20 minutes after group begins)--%>
                        <br />
                        <asp:TextBox ID="txtQ4_OT_1" runat="server"></asp:TextBox>
                    </li>
                    <li>
                        <asp:Label ID="lblQ4_OT_2" runat="server"></asp:Label>
                        <%--Number of children attending (Count 20 minutes after group begins)--%>
                        <br />
                        <asp:TextBox ID="txtQ4_OT_2" runat="server"></asp:TextBox>
                    </li>
                    <li>
                        <asp:Label ID="lblQ4_OT_3" runat="server"></asp:Label>
                        <%--Number of parents present at end--%>
                        <br />
                        <asp:TextBox ID="txtQ4_OT_3" runat="server"></asp:TextBox>
                    </li>
                    <li>
                        <asp:Label ID="lblQ4_OT_4" runat="server"></asp:Label>
                        <%--Number of children present at end--%>
                        <br />
                        <asp:TextBox ID="txtQ4_OT_4" runat="server"></asp:TextBox>
                    </li>
                    <li>
                        <asp:Label ID="lblQ4_OT_5" runat="server"></asp:Label>
                        <%--Number of staff present--%>
                        <br />
                        <asp:TextBox ID="txtQ4_OT_5" runat="server"></asp:TextBox>
                    </li>
                </ol>
                <%--<asp:Repeater ID="Repeater1" runat="server">
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
                </asp:Repeater>--%>
            </li>
            <li>
                <p>Language of Instruction:</p>
                <asp:Label ID="lblQ5_OT" runat="server"></asp:Label>
                <ul style="list-style-type: none">
                    <li>
                        <asp:RadioButtonList ID="rdobtnQ5_OT" runat="server">
                            <asp:ListItem Value="1">All English    </asp:ListItem>
                            <asp:ListItem Value="2">Mostly English</asp:ListItem>
                            <asp:ListItem Value="3">Mostly Spanish    </asp:ListItem>
                            <asp:ListItem Value="4">All Spanish   </asp:ListItem>
                            <asp:ListItem Value="5">Other  </asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:TextBox ID="txyQ5_OT" runat="server"></asp:TextBox>
                    </li>
                </ul>
            </li>
            <li>
                <p>Physical Room Setup:</p>
                <asp:Label ID="lblQ6_OT" runat="server"></asp:Label>
                <ul style="list-style-type: none">
                    <li>
                        <asp:RadioButtonList ID="rdobtnQ6_OT" runat="server">
                            <asp:ListItem Value="1">Classroom</asp:ListItem>
                            <asp:ListItem Value="2">Multipurpose room</asp:ListItem>
                            <asp:ListItem Value="3">Daycare center</asp:ListItem>
                            <asp:ListItem Value="4">Other (please describe): </asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:TextBox ID="txyQ6_OT" runat="server"></asp:TextBox>
                    </li>
                </ul>
            </li>
            <li>
                <asp:Label ID="lblQ7_OT" runat="server"></asp:Label>
                <ul style="list-style-type: none" class="checkbox-list">
                    <li>
                        <asp:CheckBox ID="chkbxQ7_OT_1" runat="server" />
                        Multiple stations/areas for children to play with 
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbxQ7_OT_2" runat="server" />
                        Room setup was conducive to interaction
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbxQ7_OT_3" runat="server" />
                        Age appropriate toys/materials that were available for children to play with
                    </li>
                    <li>
                        <asp:CheckBox ID="chkbxQ7_OT_4" runat="server" />
                        Room size was inadequate:<br>
                        <%--second section, radiobutton--%>
                        <ul style="list-style-type: none">
                            <li>
                                <asp:RadioButtonList ID="rdobtnQ7_OT_4" runat="server" RepeatDirection="Vertical">
                                    <asp:ListItem Value="1">too small</asp:ListItem>
                                    <asp:ListItem Value="2">too small</asp:ListItem>
                                </asp:RadioButtonList>
                            </li>
                        </ul>

                        <%--second section, radiobutton--%></li>
                    <li>
                        <asp:CheckBox ID="chkbxQ7_OT_5" runat="server" />Other (please describe):</asp:CheckBox><br>
                        <asp:TextBox ID="txtQ7_OT_5" runat="server"></asp:TextBox>
                    </li>
                </ul>
            </li>
            <li>
                <asp:Label ID="lblQ8_OT" runat="server"></asp:Label>
                <table class="HVSurvey">
                    <tr>
                        <td class="HVSurvey"></td>
                        <td class="HVSurvey">1 = Poor,  3= Neutral,     5 = Excellent
                        </td>
                    </tr>
                    <tr>
                        <td class="HVSurvey">Location:
                            <asp:Label ID="lblQ8_OT_1" runat="server"></asp:Label>
                        </td>
                        <td class="HVSurvey">
                            <asp:RadioButtonList ID="rdobtnlstQ8_OT_1" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="HVSurvey">Convenience:
                            <asp:Label ID="lblQ8_OT_2" runat="server"></asp:Label>
                        </td>
                        <td class="HVSurvey">
                            <asp:RadioButtonList ID="rdobtnlstQ8_OT_2" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="HVSurvey">Distractions:
                            <asp:Label ID="lblQ8_OT_3" runat="server"></asp:Label>
                        </td>
                        <td class="HVSurvey">
                            <asp:RadioButtonList ID="rdobtnlstQ8_OT_3" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="HVSurvey">Obstructions:
                            <asp:Label ID="lblQ8_OT_4" runat="server"></asp:Label>
                        </td>
                        <td class="HVSurvey">
                            <asp:RadioButtonList ID="rdobtnlstQ8_OT_4" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="HVSurvey">Seating:
                            <asp:Label ID="lblQ8_OT_5" runat="server"></asp:Label>
                        </td>
                        <td class="HVSurvey">
                            <asp:RadioButtonList ID="rdobtnlstQ8_OT_5" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="HVSurvey">Lighting:
                            <asp:Label ID="lblQ8_OT_6" runat="server"></asp:Label>
                        </td>
                        <td class="HVSurvey">
                            <asp:RadioButtonList ID="rdobtnlstQ8_OT_6" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="HVSurvey">Acoustics:
                            <asp:Label ID="lblQ8_OT_7" runat="server"></asp:Label>
                        </td>
                        <td class="HVSurvey">
                            <asp:RadioButtonList ID="rdobtnlstQ8_OT_7" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                </table>
            </li>
            <li>
                <asp:Label ID="lblQ9_OT" runat="server"></asp:Label>
                <ul style="list-style-type: none">
                    <li>
                        <asp:TextBox ID="txtQ9_OT" runat="server" Width="300px" Height="50px"></asp:TextBox>
                    </li>
                </ul>
            </li>

            <li>
                <asp:Label ID="lblQ10_OT" runat="server"></asp:Label>
                <table class="HVSurvey">
                    <tr>
                        <td class="HVSurvey">
                            <strong>Please respond to the following questions:</strong>
                        </td>
                        <td class="HVSurvey">
                            <p><strong>Strongly Disagree = 1, Disagree = 2, Neutral = 3, Agree = 4, Strongly Agree =5,  Not Applicable = NA</strong></p>

                        </td>
                    </tr>
                    <tr>
                        <td class="HVSurvey" colspan="2"><span style="color: #FF6600">Welcome / Ice Breaker</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="HVSurvey">
                            <asp:Label ID="lblQ10_OT_1_1" runat="server"></asp:Label>
                        </td>
                        <td class="HVSurvey">
                            <asp:RadioButtonList ID="rdobtnQ10_OT_1_1" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem Value="0">NA</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="HVSurvey">
                            <asp:Label ID="lblQ10_OT_1_2" runat="server"></asp:Label>
                        </td>
                        <td class="HVSurvey">
                            <asp:RadioButtonList ID="rdobtnQ10_OT_1_2" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>                               
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="HVSurvey">
                            <asp:Label ID="lblQ10_OT_1_3" runat="server"></asp:Label>
                        </td>
                        <td class="HVSurvey">
                            <asp:RadioButtonList ID="rdobtnQ10_OT_1_3" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>                               
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="HVSurvey" colspan="2"><span style="color: #FF6600">Facilitator and Facilitation Skills</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="HVSurvey">
                            <asp:Label ID="lblQ10_OT_2_1" runat="server"></asp:Label>
                        </td>
                        <td class="HVSurvey">
                            <asp:RadioButtonList ID="rdobtnQ10_OT_2_1" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>                                
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="HVSurvey" style="height: 39px">
                            <asp:Label ID="lblQ10_OT_2_2" runat="server"></asp:Label>
                        </td>
                        <td class="HVSurvey" style="height: 39px">
                            <asp:RadioButtonList ID="rdobtnQ10_OT_2_2" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem Value="0">NA</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="HVSurvey">
                            <asp:Label ID="lblQ10_OT_2_3" runat="server"></asp:Label>
                        </td>
                        <td class="HVSurvey">
                            <asp:RadioButtonList ID="rdobtnQ10_OT_2_3" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem Value="0">NA</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="HVSurvey">
                            <asp:Label ID="lblQ10_OT_2_4" runat="server"></asp:Label>
                        </td>
                        <td class="HVSurvey">
                            <asp:RadioButtonList ID="rdobtnQ10_OT_2_4" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem Value="0">NA</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="HVSurvey">
                            <asp:Label ID="lblQ10_OT_2_5" runat="server"></asp:Label>
                        </td>
                        <td class="HVSurvey">
                            <asp:RadioButtonList ID="rdobtnQ10_OT_2_5" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>                                
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="HVSurvey">
                            <asp:Label ID="lblQ10_OT_2_6" runat="server"></asp:Label>
                        </td>
                        <td class="HVSurvey">
                            <asp:RadioButtonList ID="rdobtnQ10_OT_2_6" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem Value="0">NA</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="HVSurvey">
                            <asp:Label ID="lblQ10_OT_2_7" runat="server"></asp:Label>
                        </td>
                        <td class="HVSurvey">
                            <asp:RadioButtonList ID="rdobtnQ10_OT_2_7" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem Value="0">NA</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="HVSurvey" style="height: 39px">
                            <asp:Label ID="lblQ10_OT_2_8" runat="server"></asp:Label>
                        </td>
                        <td class="HVSurvey" style="height: 39px">
                            <asp:RadioButtonList ID="rdobtnQ10_OT_2_8" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>                                
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="HVSurvey">
                            <asp:Label ID="lblQ10_OT_2_9" runat="server"></asp:Label>
                        </td>
                        <td class="HVSurvey">
                            <asp:RadioButtonList ID="rdobtnQ10_OT_2_9" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>                                
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="HVSurvey" colspan="2"><span style="color: #FF6600">Content</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="HVSurvey">
                            <asp:Label ID="lblQ10_OT_3_1" runat="server"></asp:Label>
                        </td>
                        <td class="HVSurvey">
                            <asp:RadioButtonList ID="rdobtnQ10_OT_3_1" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>                                
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="HVSurvey">
                            <asp:Label ID="lblQ10_OT_3_2" runat="server"></asp:Label>
                        </td>
                        <td class="HVSurvey">
                            <asp:RadioButtonList ID="rdobtnQ10_OT_3_2" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>                               
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="HVSurvey">
                            <asp:Label ID="lblQ10_OT_3_3" runat="server"></asp:Label>
                        </td>
                        <td class="HVSurvey">
                            <asp:RadioButtonList ID="rdobtnQ10_OT_3_3" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>                               
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="HVSurvey">
                            <asp:Label ID="lblQ10_OT_3_4" runat="server"></asp:Label>
                        </td>
                        <td class="HVSurvey">
                            <asp:RadioButtonList ID="rdobtnQ10_OT_3_4" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>                               
                            </asp:RadioButtonList>
                        </td>
                    </tr>

                    <tr>
                        <td class="HVSurvey" colspan="2" style="color: #006600"><span style="color: #FF6600">Early Childhood Development</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="HVSurvey">
                            <asp:Label ID="lblQ10_OT_4_1" runat="server"></asp:Label>
                        </td>
                        <td class="HVSurvey">
                            <asp:RadioButtonList ID="rdobtnQ10_OT_4_1" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>                                
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="HVSurvey">
                            <asp:Label ID="lblQ10_OT_4_2" runat="server"></asp:Label>
                        </td>
                        <td class="HVSurvey">
                            <asp:RadioButtonList ID="rdobtnQ10_OT_4_2" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>                              
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="HVSurvey">
                            <asp:Label ID="lblQ10_OT_4_3" runat="server"></asp:Label>
                        </td>
                        <td class="HVSurvey">
                            <asp:RadioButtonList ID="rdobtnQ10_OT_4_3" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>                               
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="HVSurvey">
                            <asp:Label ID="lblQ10_OT_4_4" runat="server"></asp:Label>
                        </td>
                        <td class="HVSurvey">
                            <asp:RadioButtonList ID="rdobtnQ10_OT_4_4" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>                              
                            </asp:RadioButtonList>
                        </td>
                    </tr>

                    <tr>
                        <td class="HVSurvey" colspan="2"><span style="color: #FF6600">Handouts</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="HVSurvey">
                            <asp:Label ID="lblQ10_OT_5_1" runat="server"></asp:Label>
                        </td>
                        <td class="HVSurvey">
                            <asp:RadioButtonList ID="rdobtnQ10_OT_5_1" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="1">Y</asp:ListItem>
                                <asp:ListItem Value="2">N</asp:ListItem>                                
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="HVSurvey">
                            <asp:Label ID="lblQ10_OT_5_2" runat="server"></asp:Label>
                        </td>
                        <td class="HVSurvey">
                            <asp:RadioButtonList ID="rdobtnQ10_OT_5_2" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="1">Y</asp:ListItem>
                                <asp:ListItem Value="2">N</asp:ListItem>
                                <asp:ListItem Value="0">NA</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="HVSurvey">
                            <asp:Label ID="lblQ10_OT_5_3" runat="server"></asp:Label>
                        </td>
                        <td class="HVSurvey">
                            <asp:RadioButtonList ID="rdobtnQ10_OT_5_3" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="1">Y</asp:ListItem>
                                <asp:ListItem Value="2">N</asp:ListItem>
                                <asp:ListItem Value="0">NA</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="HVSurvey">
                            <asp:Label ID="lblQ10_OT_5_4" runat="server"></asp:Label>
                        </td>
                        <td class="HVSurvey">
                            <asp:RadioButtonList ID="rdobtnQ10_OT_5_4" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="1">Y</asp:ListItem>
                                <asp:ListItem Value="2">N</asp:ListItem>
                                <asp:ListItem Value="0">NA</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="HVSurvey" colspan="2"><span style="color: #FF6600">Interaction</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="HVSurvey">
                            <asp:Label ID="lblQ10_OT_6_1" runat="server"></asp:Label>
                        </td>
                        <td class="HVSurvey">
                            <asp:RadioButtonList ID="rdobtnQ10_OT_6_1" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>                               
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="HVSurvey">
                            <asp:Label ID="lblQ10_OT_6_2" runat="server"></asp:Label>
                        </td>
                        <td class="HVSurvey">
                            <asp:RadioButtonList ID="rdobtnQ10_OT_6_2" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem Value="0">NA</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="HVSurvey">
                            <asp:Label ID="lblQ10_OT_6_3" runat="server"></asp:Label>
                        </td>
                        <td class="HVSurvey">
                            <asp:RadioButtonList ID="rdobtnQ10_OT_6_3" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem Value="0">NA</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="HVSurvey">
                            <asp:Label ID="lblQ10_OT_6_4" runat="server"></asp:Label>
                        </td>
                        <td class="HVSurvey">
                            <asp:RadioButtonList ID="rdobtnQ10_OT_6_4" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem Value="0">NA</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                </table>
            </li>
        </ol>
        <p><strong>(Add notes to this section post facilitator interview):</strong></p>
        <ol start="11">

            <li>
                <asp:Label ID="lblQ11_OT" runat="server"></asp:Label><br />
                <asp:TextBox ID="txtQ11_OT" runat="server" Height="75px" Width="300px" TextMode="MultiLine"></asp:TextBox>
            </li>
            <li>
                <asp:Label ID="lblQ12_OT" runat="server"></asp:Label><br />
                <asp:TextBox ID="txtQ12_OT" runat="server" Height="75px" Width="300px" TextMode="MultiLine"></asp:TextBox>

            </li>
            <li>
                <asp:Label ID="lblQ13_OT" runat="server"></asp:Label><br />
                <asp:TextBox ID="txtQ13_OT" runat="server" Height="75px" Width="300px" TextMode="MultiLine"></asp:TextBox>

            </li>
            <li>
                <asp:Label ID="lblQ14_OT" runat="server"></asp:Label><br />
                <asp:TextBox ID="txtQ14_OT" runat="server" Height="75px" Width="300px" TextMode="MultiLine"></asp:TextBox>

            </li>
        </ol>

        <h3 class="finaltoolTitle_1">POST-OBSERVATION QUESTIONS</h3>
        <p>Ask the group leader the following questions after the group ends.</p>
        <ol>
            <li>
                <asp:Label ID="lblQ1_Post" runat="server"></asp:Label>
                <asp:RadioButtonList ID="rdobtnQ1_Post" runat="server">
                    <asp:ListItem Value="1">Very well (I certainly accomplished what I had hoped</asp:ListItem>
                    <asp:ListItem Value="2">Well</asp:ListItem>
                    <asp:ListItem Value="3">Fairly well (I did not accomplish as much as I had hoped)</asp:ListItem>
                    <asp:ListItem Value="4">Not well</asp:ListItem>
                </asp:RadioButtonList>
                Comments:<br />
                <asp:TextBox ID="txtQ1_Post" runat="server" Height="75px" Width="300px" TextMode="MultiLine"></asp:TextBox>
            </li>
            <li>
                <asp:Label ID="lblQ2_Post" runat="server"></asp:Label>
                <asp:RadioButtonList ID="rdobtnQ2_Post" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1">Yes</asp:ListItem>
                    <asp:ListItem Value="2">No</asp:ListItem>
                </asp:RadioButtonList>
                <ul style="list-style-type: none">
                    <li>
                        <asp:Label ID="lblQ2_Post_1" runat="server"></asp:Label><br />
                        <asp:CheckBox ID="chkQ2_post_1" runat="server" />
                        Low attendance<br />
                        <asp:CheckBox ID="chkQ2_post_2" runat="server" />
                        Larger group<br />
                        <asp:CheckBox ID="chkQ2_post_3" runat="server" />
                        Different families attended
                        <br />
                        Comments:<br />
                        <asp:TextBox ID="txtQ2_Post" runat="server" Height="75px" Width="300px" TextMode="MultiLine"></asp:TextBox>
                    </li>
                </ul>
            </li>
            <li>
                <asp:Label ID="lblQ3_Post" runat="server"></asp:Label>
                <asp:RadioButtonList ID="rdobtnQ3_Post" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1">0-3</asp:ListItem>
                    <asp:ListItem Value="2">4-5</asp:ListItem>
                    <asp:ListItem Value="3">Over 5 years</asp:ListItem>
                </asp:RadioButtonList>
            </li>
            <li>
                <asp:Label ID="lblQ4_Post" runat="server"></asp:Label>
                <asp:RadioButtonList ID="rdobtnQ4_Post" runat="server">
                    <asp:ListItem Value="1">Attendance log </asp:ListItem>
                    <asp:ListItem Value="1">Agenda and/or lesson plan / handouts</asp:ListItem>
                    <asp:ListItem Value="1">Post-session notes</asp:ListItem>
                    <asp:ListItem Value="1">List of materials/resources used</asp:ListItem>
                    <asp:ListItem Value="1">Parent feedback</asp:ListItem>
                    <asp:ListItem Value="1">Other</asp:ListItem>
                </asp:RadioButtonList>
                <asp:TextBox ID="txtQ4_Post" runat="server"></asp:TextBox>
            </li>
            <li>
                <asp:Label ID="lblQ5_Post" runat="server"></asp:Label>
                <asp:RadioButtonList ID="rdobtnQ5_Post" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1">Yes</asp:ListItem>
                    <asp:ListItem Value="2">No</asp:ListItem>
                </asp:RadioButtonList>
                If YES, how?
                <ul style="list-style-type: none">
                    <li>
                        <asp:RadioButton ID="rdobtnQ5_Post_1" GroupName="Q5_post" runat="server" />Designated program (Eg: Visit Tracker.)
                        <%--<asp:TextBox ID="TextBox20" runat="server"></asp:TextBox><br />--%>
                    </li>
                    <li>
                        <asp:RadioButton ID="rdobtnQ5_Post_2" GroupName="Q5_post" runat="server" />Attendance log (i.e. paper copy only)
                        <%--<asp:TextBox ID="TextBox20" runat="server"></asp:TextBox><br />--%>
                    </li>
                    <li>
                        <asp:RadioButton ID="rdobtnQ5_Post_3" GroupName="Q5_post" runat="server" />Spreadsheet (data is entered into computer)
                        <%--<asp:TextBox ID="TextBox20" runat="server"></asp:TextBox><br />--%>
                    </li>
                    <li>
                        <asp:RadioButton ID="rdobtnQ5_Post_4" GroupName="Q5_post" runat="server" />Other
                        <asp:TextBox ID="txtQ5_Post_4" runat="server"></asp:TextBox>
                    </li>
                </ul>
            </li>
            <li>
                <asp:Label ID="lblQ6_Post" runat="server"></asp:Label>
                <ul style="list-style-type: none">
                    <li>
                        <asp:RadioButton ID="rdobtnQ6_Post_1" runat="server" GroupName="Q6_post" />Same theme (Theme:)
                        <asp:TextBox ID="txtQ6_Post_1" runat="server"></asp:TextBox>
                    </li>
                    <li>
                        <asp:RadioButton ID="rdobtnQ6_Post_2" runat="server" GroupName="Q6_post" />Different theme (state theme if known:)
                        <asp:TextBox ID="txtQ6_Post_2" runat="server"></asp:TextBox>
                    </li>
                    <li>
                        <asp:RadioButton ID="rdobtnQ6_Post_3" runat="server" GroupName="Q6_post" />Nothing planned yet
                        <asp:TextBox ID="txtQ6_Post_3" runat="server"></asp:TextBox>
                    </li>
                </ul>
            </li>
            <li>
                <asp:Label ID="lblQ7_Post" runat="server"></asp:Label><br />
                <asp:TextBox ID="txtQ7_Post" runat="server" Height="75px" Width="300px" TextMode="MultiLine"></asp:TextBox>
            </li>
        </ol>
         <div>
            <asp:Button ID="btnSubmit" runat="server" BackColor="#0095DA" Class="btn-submit" BorderStyle="Solid" BorderWidth="5px" Font-Bold="True" Font-Italic="False" Font-Size="X-Large" Font-Strikeout="False" Font-Underline="False" ForeColor="White" Height="50px" Text="Submit" Width="150px" OnClick="btnSubmit_Click" />
        </div>
    </div>
   
</asp:Content>
