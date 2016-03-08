<%@ Page Title="" Language="C#" MasterPageFile="~/Survey/SurveyMaster.Master" AutoEventWireup="true" CodeBehind="HVSurveyOnline.aspx.cs" Inherits="HVP.Survey.HVSurveyOnline" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:HiddenField ID="hfSiteId" runat="server" />
     <asp:HiddenField ID="hsSchd_id" runat="server" />
     <script type="text/javascript">
         window.onbeforeunload = function (e) {
             var e = e || window.event;
             if (e) e.returnValue = 'All the work will be lost, Do you want to continue or Leave?.';//for IE & Firefox
             return 'All the work will be lost, Do you want to continue? or Leave?.';// for Safari and Chrome
         };

        </script>
    <asp:MultiView ID="MultiView1" runat="server">
    <asp:View ID="View0" runat="server">
         <table class="progressbar">
            <tr>
                <td class="progressbar_1"></td>                
                <td>progressing...</td>
            </tr>
        </table>
        <h3>DEMOGRAPHICS</h3>
        <ol>
        <li>
            <asp:Label ID="lblQ1" runat="server">Are you a full time or part time employee?</asp:Label>
            <asp:RadioButtonList ID="rdobtnlstQ1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Answers" DataValueField="Value" Height="29px">
            </asp:RadioButtonList>             
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="rdobtnlstQ1" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT Answer_ID, Question_ID, Answers, Value FROM HomeVisitorSurveyAnswers WHERE (Question_ID = @Question_ID)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="Q1" Name="Question_ID" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource> 
        </li>
        <li>
             <asp:Label ID="lblQ2" runat="server">Please select the option below that best describes your race/ethnicity. (Select only one)</asp:Label>
            <asp:RadioButtonList ID="rdobtnlstQ2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Answers" DataValueField="Value">
            </asp:RadioButtonList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="rdobtnlstQ2" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT Answer_ID, Question_ID, Answers, Value FROM HomeVisitorSurveyAnswers WHERE (Question_ID = @Question_ID)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="Q2" Name="Question_ID" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:TextBox ID="txtRace" runat="server"></asp:TextBox>
            <asp:Label ID="lblQ2Comment" runat="server" ForeColor="Red" ></asp:Label>
        </li>
        </ol>
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
            <asp:Label ID="lblQ3" runat="server" Visible="False">Please select the languages, other than English, that you speak fluently.</asp:Label>
                    <asp:CheckBoxList ID="chkLanguageQ3" runat="server" DataSourceID="SqlDataSource3" DataTextField="Answers" DataValueField="Value" Visible="False">
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
        <div class="btn">
             <asp:ImageButton ID="imgbtnForward0" runat="server" Height="50px" ImageUrl="~/Button/media_seek_forward.png" OnClick="imgbtnForward0_Click" ValidationGroup="Val1" OnClientClick="window.onbeforeunload=null;"/>
        </div>
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
                    <asp:Label ID="lblQ4" runat="server">What is the highest level of education you have completed?</asp:Label>
                    <asp:RadioButtonList ID="rdobtnlstQ4" runat="server" DataSourceID="SqlDataSource4" DataTextField="Answers" DataValueField="Value" AutoPostBack="True" onchange="window.onbeforeunload=null;" OnSelectedIndexChanged="rdobtnlstQ4_SelectedIndexChanged">
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="rdobtnlstQ4" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [HomeVisitorSurveyAnswers] WHERE ([Question_ID] = @Question_ID)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="Q4" Name="Question_ID" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </li>               
               
                <li runat="server" id="Q5_li" visible="false">
                    <asp:Label ID="lblQ5" runat="server" Visible="False">What area best describes your bachelors degree?</asp:Label>
                    <asp:RadioButtonList ID="rdobtnlstQ5" runat="server" DataSourceID="SqlDataSource5" DataTextField="Answers" DataValueField="Value" Visible="False">
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
            <div class="btn">
                <asp:ImageButton ID="imgbtnback1" runat="server" Height="50px" ImageUrl="~/Button/media_seek_backward.png" OnClick="imgbtnback1_Click" OnClientClick="window.onbeforeunload=null;" /> 
            </div>
          <div class="btn">
                <asp:ImageButton ID="imgbtnForward1" runat="server" Height="50px" ImageUrl="~/Button/media_seek_forward.png" OnClick="imgbtnForward1_Click" ValidationGroup="Val1" OnClientClick="window.onbeforeunload=null;"  />
            </div>
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
                    <asp:Label ID="lblQ6" runat="server">How many years of full time, supervised work experience do you have in the following
                    areas? Note: you may apply part­time work if it was supervised and will add up to equivalent full­time experience (for example, 15 hours per week for two years is equivalent to 1 year full­time experience)
                    </asp:Label>
                    <ol class="d">
                        <li>
                            <asp:Label ID="lblQ6A" runat="server">Working directly with young children, preschool and younger? (e.g., early education, child care, developmental screening)</asp:Label>
                            <asp:Radiobuttonlist ID="rdobtnlstQ6_A" runat="server" DataSourceID="SqlDataSource6" DataTextField="Answers" DataValueField="Value">
                            </asp:Radiobuttonlist>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="rdobtnlstQ6_A" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [HomeVisitorSurveyAnswers] WHERE ([Question_ID] = @Question_ID)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="Q6A" Name="Question_ID" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </li>
                        <li>
                            <asp:Label ID="lblQ6B" runat="server">Working with families (parents and/or primary caregivers) and their young children, preschool and younger? (e.g., home visiting, social work, parent support groups, parent training programs)</asp:Label>
                            <asp:Radiobuttonlist ID="rdobtnlstQ6_B" runat="server" DataSourceID="SqlDataSource7" DataTextField="Answers" DataValueField="Value">
                            </asp:Radiobuttonlist>
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
                          <asp:Label ID="lblQ7" runat="server">How many months have you been conducting home visits with your current program?</asp:Label>
                          <asp:TextBox ID="txtQ7" runat="server" AutoCompleteType="Disabled"></asp:TextBox>                 
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtQ7" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                      </li>
                       <li>
                          <asp:Label ID="lblQ8" runat="server">What is the total number of families on your home/personal visit caseload?</asp:Label>
                          <asp:TextBox ID="txtQ8" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtQ8" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                      </li>
                      <li>
                          <asp:Label ID="lblQ9" runat="server">What is the total number of children on your home/personal visit caseload? (If you work with siblings, please count those children as well)</asp:Label>
                          <asp:TextBox ID="txtQ9" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtQ9" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                      </li>
                       <li>
                          <asp:Label ID="lblQ10" runat="server">How many children on your caseload are in the following age groups?</asp:Label>
                           <br />
                          <asp:Label ID="lblQ10_comment" runat="server" Text="Please enter 0 if you have none." ForeColor="Green"></asp:Label>
                          <ol  class="d">
                          <li><asp:TextBox ID="txt10_1"  runat="server" onkeyup="sumQ10();" ></asp:TextBox>Prenatal­-3 months<asp:RequiredFieldValidator ID="RequiredFieldValidator74" runat="server" ControlToValidate="txt10_1" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                              </li>
                              <li><asp:TextBox ID="txt10_2" runat="server" onkeyup="sumQ10();" ></asp:TextBox>4­-12 months<asp:RequiredFieldValidator ID="RequiredFieldValidator75" runat="server" ControlToValidate="txt10_2" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                              </li>
                              <li><asp:TextBox ID="txt10_3"  runat="server" onkeyup="sumQ10();"></asp:TextBox>13-24 months<asp:RequiredFieldValidator ID="RequiredFieldValidator76" runat="server" ControlToValidate="txt10_3" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                              </li>
                              <li><asp:TextBox ID="txt10_4" runat="server" onkeyup="sumQ10();"></asp:TextBox>25-­36 months<asp:RequiredFieldValidator ID="RequiredFieldValidator77" runat="server" ControlToValidate="txt10_4" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                              </li>
                              <li><asp:TextBox ID="txt10_5"  runat="server" onkeyup="sumQ10();"></asp:TextBox>Older than 36 months<asp:RequiredFieldValidator ID="RequiredFieldValidator78" runat="server" ControlToValidate="txt10_5" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                              </li>
                          </ol> 
                           
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
                          <asp:Label ID="lblQ11" runat="server">How many children on your caseload are of the following race/ethnicity?</asp:Label>
&nbsp;<ol class="d"><asp:Label ID="lblQ11_comment" runat="server" Text="Please enter 0 if you have none." ForeColor="Green"></asp:Label>
                              <li><asp:TextBox ID="txt11_1" runat="server" onkeyup="sumQ11();"></asp:TextBox>White, not of Hispanic origin<asp:RequiredFieldValidator ID="RequiredFieldValidator79" runat="server" ControlToValidate="txt11_1" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                  </li>
                              <li><asp:TextBox ID="txt11_2" runat="server" onkeyup="sumQ11();"></asp:TextBox>Black, not of Hispanic origin 
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator80" runat="server" ControlToValidate="txt11_2" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                  </li>
                              <li><asp:TextBox ID="txt11_3" runat="server" onkeyup="sumQ11();"></asp:TextBox>Hispanic
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator81" runat="server" ControlToValidate="txt11_3" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                  </li>
                              <li><asp:TextBox ID="txt11_4" runat="server" onkeyup="sumQ11();"></asp:TextBox>Asian or Pacific Islander
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator82" runat="server" ControlToValidate="txt11_4" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                  </li>
                              <li><asp:TextBox ID="txt11_5" runat="server" onkeyup="sumQ11();"></asp:TextBox>American Indian or Alaskan Native
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator83" runat="server" ControlToValidate="txt11_5" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                  </li>
                              <li><asp:TextBox ID="txt11_6" runat="server" onkeyup="sumQ11();"></asp:TextBox>Other/Multiracial
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator84" runat="server" ControlToValidate="txt11_6" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                  </li>
                              <li><asp:TextBox ID="txt11_7" runat="server" onkeyup="sumQ11();"></asp:TextBox>Unknown
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator85" runat="server" ControlToValidate="txt11_7" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                  </li>
                          </ol> 
                          <br />
                          Total:<asp:TextBox ID="txt11_Total" runat="server" ReadOnly="True"></asp:TextBox>                 
                           <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="txtQ9" ControlToValidate="txt11_Total" ErrorMessage="Should be Equal to number stated in Question #9" ValidationGroup="Val1" SetFocusOnError="True"></asp:CompareValidator>
                           </li>
                       </ol>        
                                               
                      <asp:UpdatePanel ID="UpdatePanel2"  RenderMode="Inline" runat="server">
                     <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="txtQ12" EventName="TextChanged" />
                    </Triggers>    
               <ContentTemplate>   
                              <ol start="12">
                      <li>
                          <asp:Label ID="lblQ12" runat="server">How many of the families on your caseload speak a language other than English as their primary language?</asp:Label>
                          <asp:TextBox ID="txtQ12" runat="server"  onchange="window.onbeforeunload=null;" OnTextChanged="txtQ12_TextChanged" AutoPostBack="True"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtQ12" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                          <asp:Label ID="lblcommentQ13" runat="server" ForeColor="Red" Text="Please Answer Question# 13" Visible="False"></asp:Label>
                      </li>
                                   
                       <br />
                                  
                      <li id="Q13_li" runat="server" visible="false">
                          <asp:Label ID="lblQ13" runat="server">For families on your caseload whose primary language is a language that you do not speak fluently, how often do you do the following during home/personal visits?</asp:Label>
                          <ol>
                              <li>
                                  <asp:Label ID="lblQ13_1" runat="server" Visible="False">I conduct the visit in English</asp:Label>
                                  <asp:RadioButtonList ID="rdobtnlstQ13_1" runat="server"  Visible="False" RepeatDirection="Horizontal">
                           <asp:ListItem>Often</asp:ListItem>
                            <asp:ListItem>Sometimes</asp:ListItem>
                            <asp:ListItem>Rarely</asp:ListItem>
                            <asp:ListItem>Never</asp:ListItem>
                        </asp:RadioButtonList>
                                       <asp:Label ID="lblcommentQ13_1" runat="server" ForeColor="Red" Text="Required" Visible="False"></asp:Label>
                              </li>
                              <li>
                                  <asp:Label ID="lblQ13_2" runat="server" Visible="False">I bring materials in their primary language</asp:Label>
                                   <asp:RadioButtonList ID="rdobtnlstQ13_2" runat="server"  Visible="False" RepeatDirection="Horizontal">
                           <asp:ListItem>Often</asp:ListItem>
                            <asp:ListItem>Sometimes</asp:ListItem>
                            <asp:ListItem>Rarely</asp:ListItem>
                            <asp:ListItem>Never</asp:ListItem>
                          </asp:RadioButtonList>
                                  <asp:Label ID="lblcommentQ13_2" runat="server" ForeColor="Red" Text="Required" Visible="False"></asp:Label>
                                </li>
                                 <li>
                                  <asp:Label ID="lblQ13_3" runat="server" Visible="False">I have a translator accompany me to facilitate communication</asp:Label>
                                   <asp:RadioButtonList ID="rdobtnlstQ13_3" runat="server"  Visible="False" RepeatDirection="Horizontal">
                           <asp:ListItem>Often</asp:ListItem>
                            <asp:ListItem>Sometimes</asp:ListItem>
                            <asp:ListItem>Rarely</asp:ListItem>
                            <asp:ListItem>Never</asp:ListItem>
                          </asp:RadioButtonList>
                                     <asp:Label ID="lblcommentQ13_3" runat="server" ForeColor="Red" Text="Required" Visible="False"></asp:Label>
                                </li>
                              <li>
                                    <asp:Label ID="lblQ13_4" runat="server" Visible="False">I ask for assistance from other family members that are present during home visits</asp:Label>
                                     <asp:RadioButtonList ID="rdobtnlstQ13_4" runat="server"  Visible="False" RepeatDirection="Horizontal">
                           <asp:ListItem>Often</asp:ListItem>
                            <asp:ListItem>Sometimes</asp:ListItem>
                            <asp:ListItem>Rarely</asp:ListItem>
                            <asp:ListItem>Never</asp:ListItem>
                          </asp:RadioButtonList>                                   
                                       <asp:Label ID="lblcommentQ13_4" runat="server" ForeColor="Red" Text="Required" Visible="False"></asp:Label>
                                  </li>
                              <li>
                                  <asp:Label ID="lblQ13_5" runat="server" Visible="False">Other, please specify:</asp:Label>
                                          <asp:TextBox ID="txtq13_5_specify" runat="server" Visible="False"></asp:TextBox>
                                  <asp:Label ID="lblcommentQ13_5" runat="server" ForeColor="Red" Text="Required" Visible="False"></asp:Label>
                                   <asp:RadioButtonList ID="rdobtnlstQ13_5" runat="server"  Visible="False" RepeatDirection="Horizontal">
                           <asp:ListItem>Often</asp:ListItem>
                            <asp:ListItem>Sometimes</asp:ListItem>
                            <asp:ListItem>Rarely</asp:ListItem>
                            <asp:ListItem>Never</asp:ListItem>
                          </asp:RadioButtonList>                              
                                   <asp:Label ID="lblcommentQ13_5_1" runat="server" ForeColor="Red" Text="Required" Visible="False"></asp:Label>
                                  </li>
                          </ol>
                       </li>                                             
                  </ol>
                       </ContentTemplate>                                        
                          </asp:UpdatePanel> 
                <div class="btn">
                 <asp:ImageButton ID="imgV3B" runat="server"  Height="50px" ImageUrl="~/Button/media_seek_backward.png" OnClick="imgV3B_Click" OnClientClick="window.onbeforeunload=null;" /> 
            </div>
          <div class="btn">
                <asp:ImageButton ID="imgV3F" runat="server" Height="50px" ImageUrl="~/Button/media_seek_forward.png" OnClick="imgV3F_Click" ValidationGroup="Val1" OnClientClick="window.onbeforeunload=null;"   />
            </div>
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
             <ol start="14">
                 <li>
                 <asp:Label ID="lblQ14" runat="server">Our leaders engage staff in decision-making.</asp:Label>
                      <asp:RadioButtonList ID="rdobtnlstQ14" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>Strongly Disagree</asp:ListItem>
                            <asp:ListItem>Disagree</asp:ListItem>
                            <asp:ListItem>Neutral</asp:ListItem>
                            <asp:ListItem>Agree</asp:ListItem>
                            <asp:ListItem>Strongly Agree</asp:ListItem>                            
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="rdobtnlstQ14" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                 </li>
                 <li>
                     <asp:Label ID="lblQ15" runat="server">Our leaders make good decisions.</asp:Label>
                      <asp:RadioButtonList ID="rdobtnlstQ15" runat="server" RepeatDirection="Horizontal">
                          <asp:ListItem>Strongly Disagree</asp:ListItem>
                            <asp:ListItem>Disagree</asp:ListItem>
                            <asp:ListItem>Neutral</asp:ListItem>
                            <asp:ListItem>Agree</asp:ListItem>
                            <asp:ListItem>Strongly Agree</asp:ListItem>                          
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="rdobtnlstQ15" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                 </li>
                 <li>
                     <asp:Label ID="lblQ16" runat="server">Our leaders communicate in a way that builds trust.</asp:Label>
                      <asp:RadioButtonList ID="rdobtnlstQ16" runat="server" RepeatDirection="Horizontal">
                       <asp:ListItem>Strongly Disagree</asp:ListItem>
                            <asp:ListItem>Disagree</asp:ListItem>
                            <asp:ListItem>Neutral</asp:ListItem>
                            <asp:ListItem>Agree</asp:ListItem>
                            <asp:ListItem>Strongly Agree</asp:ListItem>                     
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="rdobtnlstQ16" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                 </li>
                 <li>
                     <asp:Label ID="lblQ17" runat="server">Our leaders demonstrate the ability to assess a problem, involve others in problem solving, and select the next course of action.</asp:Label>
                     <asp:RadioButtonList ID="rdobtnlstQ17" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>Strongly Disagree</asp:ListItem>
                            <asp:ListItem>Disagree</asp:ListItem>
                            <asp:ListItem>Neutral</asp:ListItem>
                            <asp:ListItem>Agree</asp:ListItem>
                            <asp:ListItem>Strongly Agree</asp:ListItem>                      
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="rdobtnlstQ17" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                 </li>
                 <li>
                     <asp:Label ID="lblQ18" runat="server">Our leaders use thoughtful communication strategies to ensure complete and accurate flow of information among staff.</asp:Label>
                       <asp:RadioButtonList ID="rdobtnlstQ18" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>Strongly Disagree</asp:ListItem>
                            <asp:ListItem>Disagree</asp:ListItem>
                            <asp:ListItem>Neutral</asp:ListItem>
                            <asp:ListItem>Agree</asp:ListItem>
                            <asp:ListItem>Strongly Agree</asp:ListItem>   
                            
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="rdobtnlstQ18" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                 </li>
                 <li>
                     <asp:Label ID="lblQ19" runat="server">Our leaders are proficient in multiple types of communication: written, spoken, electronic, and presentation.</asp:Label>
                      <asp:RadioButtonList ID="rdobtnlstQ19" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>Strongly Disagree</asp:ListItem>
                            <asp:ListItem>Disagree</asp:ListItem>
                            <asp:ListItem>Neutral</asp:ListItem>
                            <asp:ListItem>Agree</asp:ListItem>
                            <asp:ListItem>Strongly Agree</asp:ListItem> 
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="rdobtnlstQ19" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                 </li>
                 <li>
                     <asp:Label ID="lblQ20" runat="server">Our leaders keep me informed about things that concern me and my job.</asp:Label>
                     <asp:RadioButtonList ID="rdobtnlstQ20" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>Strongly Disagree</asp:ListItem>
                            <asp:ListItem>Disagree</asp:ListItem>
                            <asp:ListItem>Neutral</asp:ListItem>
                            <asp:ListItem>Agree</asp:ListItem>
                            <asp:ListItem>Strongly Agree</asp:ListItem>    
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="rdobtnlstQ20" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                 </li>
                 <li>
                     <asp:Label ID="lblQ21" runat="server">I am satisfied with the relationship I have with the leadership staff in our program.</asp:Label>
                         <asp:RadioButtonList ID="rdobtnlstQ21" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>Strongly Disagree</asp:ListItem>
                            <asp:ListItem>Disagree</asp:ListItem>
                            <asp:ListItem>Neutral</asp:ListItem>
                            <asp:ListItem>Agree</asp:ListItem>
                            <asp:ListItem>Strongly Agree</asp:ListItem>    
                                
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ControlToValidate="rdobtnlstQ21" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                 </li>
             </ol>
               <div class="btn">
                 <asp:ImageButton ID="imgbtnV4B" runat="server" Height="50px" ImageUrl="~/Button/media_seek_backward.png" OnClick="imgbtnV4B_Click" OnClientClick="window.onbeforeunload=null;"   /> 
            </div>
          <div class="btn">
                <asp:ImageButton ID="imgbtnV4F" runat="server" Height="50px" ImageUrl="~/Button/media_seek_forward.png" OnClick="imgbtnV4F_Click" ValidationGroup="Val1" OnClientClick="window.onbeforeunload=null;"    />
            </div>
             </asp:View> 
        <asp:View ID="View5" runat="server">
             <table class="progressbar">
            <tr>
                <td class="progressbar_5"></td>                
                <td>progressing...</td>
            </tr>
        </table>
             <h3>SUPPORTIVE WORK ENVIRONMENT – WAGES AND BENEFITS</h3>
            <ol start="22">
            <li>
                <asp:Label ID="lblQ22" runat="server">Pay at my program is about average or better when compared to other home visiting programs.</asp:Label>
                <asp:RadioButtonList ID="rdobtnlstQ22" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>Strongly Disagree</asp:ListItem>
                            <asp:ListItem>Disagree</asp:ListItem>
                            <asp:ListItem>Neutral</asp:ListItem>
                            <asp:ListItem>Agree</asp:ListItem>
                            <asp:ListItem>Strongly Agree</asp:ListItem>  
                                
                            </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ControlToValidate="rdobtnlstQ22" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
            </li>
                <li>
                    <asp:Label ID="lblQ23" runat="server">I am satisfied with my current benefits.</asp:Label>
                      <asp:RadioButtonList ID="rdobtnlstQ23" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>Strongly Disagree</asp:ListItem>
                            <asp:ListItem>Disagree</asp:ListItem>
                            <asp:ListItem>Neutral</asp:ListItem>
                            <asp:ListItem>Agree</asp:ListItem>
                            <asp:ListItem>Strongly Agree</asp:ListItem>  
                                
                            </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ControlToValidate="rdobtnlstQ23" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                </li>
                <li>
                    <asp:Label ID="lblQ24" runat="server">I am satisfied with my salary.</asp:Label>
                    <asp:RadioButtonList ID="rdobtnlstQ24" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>Strongly Disagree</asp:ListItem>
                            <asp:ListItem>Disagree</asp:ListItem>
                            <asp:ListItem>Neutral</asp:ListItem>
                            <asp:ListItem>Agree</asp:ListItem>
                            <asp:ListItem>Strongly Agree</asp:ListItem>  
                                
                            </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ControlToValidate="rdobtnlstQ24" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                </li>
                <li>
                    <asp:Label ID="lblQ25" runat="server">Benefits at my program are about average or better when compared to other home visiting programs.</asp:Label>
                     <asp:RadioButtonList ID="rdobtnlstQ25" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>Strongly Disagree</asp:ListItem>
                            <asp:ListItem>Disagree</asp:ListItem>
                            <asp:ListItem>Neutral</asp:ListItem>
                            <asp:ListItem>Agree</asp:ListItem>
                            <asp:ListItem>Strongly Agree</asp:ListItem>  
                                
                            </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" ControlToValidate="rdobtnlstQ25" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                </li>
            </ol>
             <div class="btn">
                   <asp:ImageButton ID="imgbtnV5B" runat="server" Height="50px" ImageUrl="~/Button/media_seek_backward.png" OnClick="imgbtnV5B_Click"  OnClientClick="window.onbeforeunload=null;" /> 
            </div>
          <div class="btn">
                <asp:ImageButton ID="imgbtnV5F" runat="server" Height="50px" ImageUrl="~/Button/media_seek_forward.png" OnClick="imgbtnV5F_Click" ValidationGroup="Val1" OnClientClick="window.onbeforeunload=null;"/>
            </div>
            </asp:View> 
         <asp:View ID="View6" runat="server">
            <table class="progressbar">
            <tr>
                <td class="progressbar_6"></td>                
                <td>progressing...</td>
            </tr>
        </table>
             <h3>SUPPORTIVE WORK ENVIRONMENT – STAFF MORALE AND SATISFACTION</h3>
             <ol start="26">
                 <li>
                 <asp:Label ID="lblQ26" runat="server">Employee morale is generally high at my program.</asp:Label>
                       <asp:RadioButtonList ID="rdobtnlstQ26" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>Strongly Disagree</asp:ListItem>
                            <asp:ListItem>Disagree</asp:ListItem>
                            <asp:ListItem>Neutral</asp:ListItem>
                            <asp:ListItem>Agree</asp:ListItem>
                            <asp:ListItem>Strongly Agree</asp:ListItem> 
                                
                            </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ControlToValidate="rdobtnlstQ26" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                 </li>
                 <li>
                     <asp:Label ID="lblQ27" runat="server">There is generally a spirit of cooperation within my program.</asp:Label>
                     <asp:RadioButtonList ID="rdobtnlstQ27" runat="server" RepeatDirection="Horizontal">
                              <asp:ListItem>Strongly Disagree</asp:ListItem>
                            <asp:ListItem>Disagree</asp:ListItem>
                            <asp:ListItem>Neutral</asp:ListItem>
                            <asp:ListItem>Agree</asp:ListItem>
                            <asp:ListItem>Strongly Agree</asp:ListItem>                         
                            </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" ControlToValidate="rdobtnlstQ27" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                 </li>
                 <li>
                     <asp:Label ID="lblQ28" runat="server">There are ample opportunities for growth and advancement.</asp:Label>
                      <asp:RadioButtonList ID="rdobtnlstQ28" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>Strongly Disagree</asp:ListItem>
                            <asp:ListItem>Disagree</asp:ListItem>
                            <asp:ListItem>Neutral</asp:ListItem>
                            <asp:ListItem>Agree</asp:ListItem>
                            <asp:ListItem>Strongly Agree</asp:ListItem>                               
                            </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" ControlToValidate="rdobtnlstQ28" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                 </li>
                 <li>
                     <asp:Label ID="lblQ29" runat="server">I enjoy working here.</asp:Label>
                     <asp:RadioButtonList ID="rdobtnlstQ29" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>Strongly Disagree</asp:ListItem>
                            <asp:ListItem>Disagree</asp:ListItem>
                            <asp:ListItem>Neutral</asp:ListItem>
                            <asp:ListItem>Agree</asp:ListItem>
                            <asp:ListItem>Strongly Agree</asp:ListItem>                             
                            </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" ControlToValidate="rdobtnlstQ29" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                 </li>
             </ol>
              <div class="btn">
                  <asp:ImageButton ID="imgbtnV6B" runat="server" Height="50px" ImageUrl="~/Button/media_seek_backward.png" OnClick="imgbtnV6B_Click" OnClientClick="window.onbeforeunload=null;" /> 
            </div>
          <div class="btn">
                <asp:ImageButton ID="imgbtnV6F" runat="server" Height="50px" ImageUrl="~/Button/media_seek_forward.png" OnClick="imgbtnV6F_Click" ValidationGroup="Val1"  OnClientClick="window.onbeforeunload=null;"   />
            </div>
             </asp:View> 
          <asp:View ID="View7" runat="server">
            <table class="progressbar">
            <tr>
                <td class="progressbar_7"></td>                
                <td>progressing...</td>
            </tr>
        </table>
             <h3>SUPPORTIVE WORK ENVIRONMENT – MATERIALS AND PHYSICAL ENVIRONMENT</h3>
              <ol start="30">
                  <li>
                      <asp:Label ID="lblQ30" runat="server">I have adequate physical workspace to do my job.</asp:Label>
                      <asp:RadioButtonList ID="rdobtnlstQ30" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>Strongly Disagree</asp:ListItem>
                            <asp:ListItem>Disagree</asp:ListItem>
                            <asp:ListItem>Neutral</asp:ListItem>
                            <asp:ListItem>Agree</asp:ListItem>
                            <asp:ListItem>Strongly Agree</asp:ListItem>                        
                            </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" ControlToValidate="rdobtnlstQ30" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                  </li>
                   <li>
                       <asp:Label ID="lblQ31" runat="server">I have adequate materials and resources to effectively do my job.</asp:Label>
                           <asp:RadioButtonList ID="rdobtnlstQ31" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>Strongly Disagree</asp:ListItem>
                            <asp:ListItem>Disagree</asp:ListItem>
                            <asp:ListItem>Neutral</asp:ListItem>
                            <asp:ListItem>Agree</asp:ListItem>
                            <asp:ListItem>Strongly Agree</asp:ListItem>                                 
                            </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" ControlToValidate="rdobtnlstQ31" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                   </li>
                  <li>
                      <asp:Label ID="lblQ32" runat="server">My workplace environment is appealing and conducive to work.</asp:Label>
                      <asp:RadioButtonList ID="rdobtnlstQ32" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>Strongly Disagree</asp:ListItem>
                            <asp:ListItem>Disagree</asp:ListItem>
                            <asp:ListItem>Neutral</asp:ListItem>
                            <asp:ListItem>Agree</asp:ListItem>
                            <asp:ListItem>Strongly Agree</asp:ListItem>                                  
                            </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" ControlToValidate="rdobtnlstQ32" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                  </li>
                  <li>
                      <asp:Label ID="lblQ33" runat="server">Program management creates a welcoming and safe environment for staff.</asp:Label>
                         <asp:RadioButtonList ID="rdobtnlstQ33" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>Strongly Disagree</asp:ListItem>
                            <asp:ListItem>Disagree</asp:ListItem>
                            <asp:ListItem>Neutral</asp:ListItem>
                            <asp:ListItem>Agree</asp:ListItem>
                            <asp:ListItem>Strongly Agree</asp:ListItem>                                 
                            </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" ControlToValidate="rdobtnlstQ33" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                  </li>
              </ol>
               <div class="btn">
                  <asp:ImageButton ID="imgbtnV7B" runat="server" Height="50px" ImageUrl="~/Button/media_seek_backward.png" OnClick="imgbtnV7B_Click" OnClientClick="window.onbeforeunload=null;" /> 
            </div>
          <div class="btn">
                <asp:ImageButton ID="imgbtnV7F" runat="server" Height="50px" ImageUrl="~/Button/media_seek_forward.png" OnClick="imgbtnV7F_Click" ValidationGroup="Val1"  OnClientClick="window.onbeforeunload=null;"    />
            </div>
              </asp:View>   
         <asp:View ID="View8" runat="server">
            <table class="progressbar">
            <tr>
                <td class="progressbar_8"></td>                
                <td>progressing...</td>
            </tr>
        </table>
             <h3>SUPPORTIVE WORK ENVIRONMENT – MATERIALS AND PHYSICAL ENVIRONMENT</h3>
             <ol start="34">
                 <li>
                     <asp:Label ID="lblQ34" runat="server">I have sufficient access to computers to do my job.</asp:Label>
                      <asp:RadioButtonList ID="rdobtnlstQ34" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>Strongly Disagree</asp:ListItem>
                            <asp:ListItem>Disagree</asp:ListItem>
                            <asp:ListItem>Neutral</asp:ListItem>
                            <asp:ListItem>Agree</asp:ListItem>
                            <asp:ListItem>Strongly Agree</asp:ListItem>                                        
                            </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator36" runat="server" ControlToValidate="rdobtnlstQ34" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                 </li>
                 <li>
                     <asp:Label ID="lblQ35" runat="server">I have adequate training to do my job.</asp:Label>
                      <asp:RadioButtonList ID="rdobtnlstQ35" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>Strongly Disagree</asp:ListItem>
                            <asp:ListItem>Disagree</asp:ListItem>
                            <asp:ListItem>Neutral</asp:ListItem>
                            <asp:ListItem>Agree</asp:ListItem>
                            <asp:ListItem>Strongly Agree</asp:ListItem>                                  
                            </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator37" runat="server" ControlToValidate="rdobtnlstQ35" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                 </li>
                 <li>
                     <asp:Label ID="lblQ36" runat="server">I feel comfortable with my responsibilities for record-keeping and data collection</asp:Label>
                       <asp:RadioButtonList ID="rdobtnlstQ36" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>Strongly Disagree</asp:ListItem>
                            <asp:ListItem>Disagree</asp:ListItem>
                            <asp:ListItem>Neutral</asp:ListItem>
                            <asp:ListItem>Agree</asp:ListItem>
                            <asp:ListItem>Strongly Agree</asp:ListItem>                                 
                            </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator38" runat="server" ControlToValidate="rdobtnlstQ36" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                 </li>
                 <li>
                     <asp:Label ID="lblQ37" runat="server">I am able to get technical assistance/support when I encounter challenges or problems.</asp:Label>
                      <asp:RadioButtonList ID="rdobtnlstQ37" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>Strongly Disagree</asp:ListItem>
                            <asp:ListItem>Disagree</asp:ListItem>
                            <asp:ListItem>Neutral</asp:ListItem>
                            <asp:ListItem>Agree</asp:ListItem>
                            <asp:ListItem>Strongly Agree</asp:ListItem>                                 
                            </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator39" runat="server" ControlToValidate="rdobtnlstQ37" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                 </li>
             </ol>
              <div class="btn">
                   <asp:ImageButton ID="imgbtnV8B" runat="server" Height="50px" ImageUrl="~/Button/media_seek_backward.png" OnClick="imgbtnV8B_Click" OnClientClick="window.onbeforeunload=null;"/> 
            </div>
          <div class="btn">
                <asp:ImageButton ID="imgbtnV8F" runat="server" Height="50px" ImageUrl="~/Button/media_seek_forward.png" OnClick="imgbtnV8F_Click" ValidationGroup="Val1"  OnClientClick="window.onbeforeunload=null;"    />
            </div>
             </asp:View>
         <asp:View ID="View9" runat="server">
            <table class="progressbar">
            <tr>
                <td class="progressbar_9"></td>                
                <td>progressing...</td>
            </tr>
        </table>
             <h3>REFLECTIVE SUPERVISION</h3>
             <ol start="38">
                 <li>
                     <asp:Label ID="lblQ38" runat="server">My supervisor made my supervision a priority regardless of what was going on within our program.</asp:Label>
                     <asp:RadioButtonList ID="rdobtnlstQ38" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>Strongly Disagree</asp:ListItem>
                            <asp:ListItem>Disagree</asp:ListItem>
                            <asp:ListItem>Neutral</asp:ListItem>
                            <asp:ListItem>Agree</asp:ListItem>
                            <asp:ListItem>Strongly Agree</asp:ListItem>                              
                            </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator40" runat="server" ControlToValidate="rdobtnlstQ38" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                 </li>
                 <li>
                     <asp:Label ID="lblQ39" runat="server">My supervisor and I maintain weekly individual supervision sessions.</asp:Label>
                     <asp:RadioButtonList ID="rdobtnlstQ39" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>Strongly Disagree</asp:ListItem>
                            <asp:ListItem>Disagree</asp:ListItem>
                            <asp:ListItem>Neutral</asp:ListItem>
                            <asp:ListItem>Agree</asp:ListItem>
                            <asp:ListItem>Strongly Agree</asp:ListItem>                                        
                            </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="rdobtnlstQ39" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                 </li>
                  <li>
                     <asp:Label ID="lblQ40" runat="server">Supervision sessions provided me with protected time to talk about my work amidst the busyness of our program.</asp:Label>
                     <asp:RadioButtonList ID="rdobtnlstQ40" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>Strongly Disagree</asp:ListItem>
                            <asp:ListItem>Disagree</asp:ListItem>
                            <asp:ListItem>Neutral</asp:ListItem>
                            <asp:ListItem>Agree</asp:ListItem>
                            <asp:ListItem>Strongly Agree</asp:ListItem>                                         
                            </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="rdobtnlstQ40" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                 </li>
                   <li>
                     <asp:Label ID="lblQ41" runat="server">My supervisor and I focused on my work with families free from other program distractions (phone calls, co-worker interruptions, program planning, etc.).</asp:Label>
                     <asp:RadioButtonList ID="rdobtnlstQ41" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>Strongly Disagree</asp:ListItem>
                            <asp:ListItem>Disagree</asp:ListItem>
                            <asp:ListItem>Neutral</asp:ListItem>
                            <asp:ListItem>Agree</asp:ListItem>
                            <asp:ListItem>Strongly Agree</asp:ListItem>                                     
                            </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="rdobtnlstQ41" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                 </li>
                 <li>
                     <asp:Label ID="lblQ42" runat="server">My supervisor shared valuable insight based on his/her background experience and knowledge.</asp:Label>
                     <asp:RadioButtonList ID="rdobtnlstQ42" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>Strongly Disagree</asp:ListItem>
                            <asp:ListItem>Disagree</asp:ListItem>
                            <asp:ListItem>Neutral</asp:ListItem>
                            <asp:ListItem>Agree</asp:ListItem>
                            <asp:ListItem>Strongly Agree</asp:ListItem>                                 
                            </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="rdobtnlstQ42" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                 </li>
                  <li>
                     <asp:Label ID="lblQ43" runat="server">My supervisor trusted my knowledge of a family and the situation or problem we were discussing.</asp:Label>
                     <asp:RadioButtonList ID="rdobtnlstQ43" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>Strongly Disagree</asp:ListItem>
                            <asp:ListItem>Disagree</asp:ListItem>
                            <asp:ListItem>Neutral</asp:ListItem>
                            <asp:ListItem>Agree</asp:ListItem>
                            <asp:ListItem>Strongly Agree</asp:ListItem>                  
                            </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="rdobtnlstQ43" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                 </li>
                  <li>
                     <asp:Label ID="lblQ44" runat="server">Supervision sessions included attention to administrative tasks, such as making sure required paperwork and/or child and family assessments are completed.</asp:Label>
                     <asp:RadioButtonList ID="rdobtnlstQ44" runat="server" RepeatDirection="Horizontal">
                               <asp:ListItem>Strongly Disagree</asp:ListItem>
                            <asp:ListItem>Disagree</asp:ListItem>
                            <asp:ListItem>Neutral</asp:ListItem>
                            <asp:ListItem>Agree</asp:ListItem>
                            <asp:ListItem>Strongly Agree</asp:ListItem>                               
                            </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="rdobtnlstQ44" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                 </li>
                  <li>
                     <asp:Label ID="lblQ45" runat="server">I had adequate time to “just talk” about the work I do with families without feeling rushed. </asp:Label>
                     <asp:RadioButtonList ID="rdobtnlstQ45" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>Strongly Disagree</asp:ListItem>
                            <asp:ListItem>Disagree</asp:ListItem>
                            <asp:ListItem>Neutral</asp:ListItem>
                            <asp:ListItem>Agree</asp:ListItem>
                            <asp:ListItem>Strongly Agree</asp:ListItem>                             
                            </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator41" runat="server" ControlToValidate="rdobtnlstQ45" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                 </li>
                   <li>
                     <asp:Label ID="lblQ46" runat="server">I was able to think about what I’ve learned from recent home visits.</asp:Label>
                     <asp:RadioButtonList ID="rdobtnlstQ46" runat="server" RepeatDirection="Horizontal">
                               <asp:ListItem>Strongly Disagree</asp:ListItem>
                            <asp:ListItem>Disagree</asp:ListItem>
                            <asp:ListItem>Neutral</asp:ListItem>
                            <asp:ListItem>Agree</asp:ListItem>
                            <asp:ListItem>Strongly Agree</asp:ListItem>                           
                            </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator42" runat="server" ControlToValidate="rdobtnlstQ46" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                 </li>
                   <li>
                     <asp:Label ID="lblQ47" runat="server">My supervisor offered good solutions and ideas even before I finished fully explaining or discussing a situation.</asp:Label>
                     <asp:RadioButtonList ID="rdobtnlstQ47" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>Strongly Disagree</asp:ListItem>
                            <asp:ListItem>Disagree</asp:ListItem>
                            <asp:ListItem>Neutral</asp:ListItem>
                            <asp:ListItem>Agree</asp:ListItem>
                            <asp:ListItem>Strongly Agree</asp:ListItem>                       
                            </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator43" runat="server" ControlToValidate="rdobtnlstQ47" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                 </li>
                 <li>
                     <asp:Label ID="lblQ48" runat="server">I did most of the talking during supervision sessions by responding to my supervisor’s questions and curiosities.</asp:Label>
                     <asp:RadioButtonList ID="rdobtnlstQ48" runat="server" RepeatDirection="Horizontal">
                               <asp:ListItem>Strongly Disagree</asp:ListItem>
                            <asp:ListItem>Disagree</asp:ListItem>
                            <asp:ListItem>Neutral</asp:ListItem>
                            <asp:ListItem>Agree</asp:ListItem>
                            <asp:ListItem>Strongly Agree</asp:ListItem> 
                            </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator44" runat="server" ControlToValidate="rdobtnlstQ48" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                 </li>
                  <li>
                     <asp:Label ID="lblQ49" runat="server">My supervisor helped me consider my feelings and families’ feelings about a situation or problem.</asp:Label>
                     <asp:RadioButtonList ID="rdobtnlstQ49" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>Strongly Disagree</asp:ListItem>
                            <asp:ListItem>Disagree</asp:ListItem>
                            <asp:ListItem>Neutral</asp:ListItem>
                            <asp:ListItem>Agree</asp:ListItem>
                            <asp:ListItem>Strongly Agree</asp:ListItem>                    
                            </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator45" runat="server" ControlToValidate="rdobtnlstQ49" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                 </li>
                   <li>
                     <asp:Label ID="lblQ50" runat="server">My supervisor partnered with me to talk about my work with families by asking about my opinion and experience.</asp:Label>
                     <asp:RadioButtonList ID="rdobtnlstQ50" runat="server" RepeatDirection="Horizontal">
                              <asp:ListItem>Strongly Disagree</asp:ListItem>
                            <asp:ListItem>Disagree</asp:ListItem>
                            <asp:ListItem>Neutral</asp:ListItem>
                            <asp:ListItem>Agree</asp:ListItem>
                            <asp:ListItem>Strongly Agree</asp:ListItem>                               
                            </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator46" runat="server" ControlToValidate="rdobtnlstQ50" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                 </li>
                 <li>
                     <asp:Label ID="lblQ51" runat="server">My supervisor told me how future visits with families should go.</asp:Label>
                     <asp:RadioButtonList ID="rdobtnlstQ51" runat="server" RepeatDirection="Horizontal">
                               <asp:ListItem>Strongly Disagree</asp:ListItem>
                            <asp:ListItem>Disagree</asp:ListItem>
                            <asp:ListItem>Neutral</asp:ListItem>
                            <asp:ListItem>Agree</asp:ListItem>
                            <asp:ListItem>Strongly Agree</asp:ListItem>                   
                            </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator47" runat="server" ControlToValidate="rdobtnlstQ51" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                 </li>
                 <li>
                     <asp:Label ID="lblQ52" runat="server">My supervisor helped me “process” the choices I make when interacting with families.</asp:Label>
                     <asp:RadioButtonList ID="rdobtnlstQ52" runat="server" RepeatDirection="Horizontal">
                               <asp:ListItem>Strongly Disagree</asp:ListItem>
                            <asp:ListItem>Disagree</asp:ListItem>
                            <asp:ListItem>Neutral</asp:ListItem>
                            <asp:ListItem>Agree</asp:ListItem>
                            <asp:ListItem>Strongly Agree</asp:ListItem>                          
                            </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator48" runat="server" ControlToValidate="rdobtnlstQ52" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                 </li>
                  <li>
                     <asp:Label ID="lblQ53" runat="server">My supervisor helped me consider how I will respond to specific challenges in my work with families.</asp:Label>
                     <asp:RadioButtonList ID="rdobtnlstQ53" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>Strongly Disagree</asp:ListItem>
                            <asp:ListItem>Disagree</asp:ListItem>
                            <asp:ListItem>Neutral</asp:ListItem>
                            <asp:ListItem>Agree</asp:ListItem>
                            <asp:ListItem>Strongly Agree</asp:ListItem>                
                            </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator49" runat="server" ControlToValidate="rdobtnlstQ53" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                 </li>
                   <li>
                     <asp:Label ID="lblQ54" runat="server">I came away from supervision feeling prepared for my upcoming home visits.</asp:Label>
                     <asp:RadioButtonList ID="rdobtnlstQ54" runat="server" RepeatDirection="Horizontal">
                               <asp:ListItem>Strongly Disagree</asp:ListItem>
                            <asp:ListItem>Disagree</asp:ListItem>
                            <asp:ListItem>Neutral</asp:ListItem>
                            <asp:ListItem>Agree</asp:ListItem>
                            <asp:ListItem>Strongly Agree</asp:ListItem>                         
                            </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator50" runat="server" ControlToValidate="rdobtnlstQ54" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                 </li>
                 <li>
                     <asp:Label ID="lblQ55" runat="server">My supervisor had strong ideas of what I should do in my work with families.</asp:Label>
                     <asp:RadioButtonList ID="rdobtnlstQ55" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>Strongly Disagree</asp:ListItem>
                            <asp:ListItem>Disagree</asp:ListItem>
                            <asp:ListItem>Neutral</asp:ListItem>
                            <asp:ListItem>Agree</asp:ListItem>
                            <asp:ListItem>Strongly Agree</asp:ListItem>                                
                            </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator51" runat="server" ControlToValidate="rdobtnlstQ55" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                 </li>
                  <li>
                     <asp:Label ID="lblQ56" runat="server">My supervisor followed up with me on solutions we agreed I should try.</asp:Label>
                     <asp:RadioButtonList ID="rdobtnlstQ56" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>Strongly Disagree</asp:ListItem>
                            <asp:ListItem>Disagree</asp:ListItem>
                            <asp:ListItem>Neutral</asp:ListItem>
                            <asp:ListItem>Agree</asp:ListItem>
                            <asp:ListItem>Strongly Agree</asp:ListItem>                             
                            </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator52" runat="server" ControlToValidate="rdobtnlstQ56" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                 </li>
                  <li>
                     <asp:Label ID="lblQ57" runat="server">I had professional developmental opportunities based on needs identified during supervision.</asp:Label>
                     <asp:RadioButtonList ID="rdobtnlstQ57" runat="server" RepeatDirection="Horizontal">
                               <asp:ListItem>Strongly Disagree</asp:ListItem>
                            <asp:ListItem>Disagree</asp:ListItem>
                            <asp:ListItem>Neutral</asp:ListItem>
                            <asp:ListItem>Agree</asp:ListItem>
                            <asp:ListItem>Strongly Agree</asp:ListItem>                         
                            </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator53" runat="server" ControlToValidate="rdobtnlstQ57" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                 </li>
             </ol>
               <div class="btn">
                  <asp:ImageButton ID="imgbtnV9B" runat="server" Height="50px" ImageUrl="~/Button/media_seek_backward.png" OnClick="imgbtnV9B_Click" OnClientClick="window.onbeforeunload=null;" /> 
            </div>
          <div class="btn">
                <asp:ImageButton ID="imgbtnV9F" runat="server" Height="50px" ImageUrl="~/Button/media_seek_forward.png" OnClick="imgbtnV9F_Click" ValidationGroup="Val1" OnClientClick="window.onbeforeunload=null;"     />
            </div>
             </asp:View>
         <asp:View ID="View10" runat="server">
              <table class="progressbar">
            <tr>
                <td class="progressbar_10"></td>                
                <td>progressing...</td>
            </tr>
        </table>
             <h3>SUPERVISON CONTENT.</h3><h5>How much of the supervision you receive is focused on your work in these areas? </h5>
             <ol start="58">
                 <li>
                     <asp:Label ID="lblQ58" runat="server">Promoting child development (e.g. cognitive, social emotional, language, physical-motor)</asp:Label>
                      <asp:RadioButtonList ID="rdobtnlstQ58" runat="server">
                            <asp:ListItem>Not at All</asp:ListItem>
                            <asp:ListItem>Sometimes</asp:ListItem>
                            <asp:ListItem>Regularly (at least half my supervision sessions)</asp:ListItem>
                            <asp:ListItem>All the time (a focus of most of my supervision sessions)</asp:ListItem>                            
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator54" runat="server" ControlToValidate="rdobtnlstQ58" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                 </li>
                  <li>
                     <asp:Label ID="lblQ59" runat="server">Addressing issues in health and safety (e.g. home safety, child nutrition, car seats, maternal depression, establishment of medical home)</asp:Label>
                      <asp:RadioButtonList ID="rdobtnlstQ59" runat="server">
                            <asp:ListItem>Not at All</asp:ListItem>
                            <asp:ListItem>Sometimes</asp:ListItem>
                            <asp:ListItem>Regularly (at least half my supervision sessions)</asp:ListItem>
                            <asp:ListItem>All the time (a focus of most of my supervision sessions)</asp:ListItem>                            
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator55" runat="server" ControlToValidate="rdobtnlstQ59" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                 </li>
                 <li>
                     <asp:Label ID="lblQ60" runat="server">Promoting positive parent-child interactions</asp:Label>
                      <asp:RadioButtonList ID="rdobtnlstQ60" runat="server">
                            <asp:ListItem>Not at All</asp:ListItem>
                            <asp:ListItem>Sometimes</asp:ListItem>
                            <asp:ListItem>Regularly (at least half my supervision sessions)</asp:ListItem>
                            <asp:ListItem>All the time (a focus of most of my supervision sessions)</asp:ListItem>                            
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator56" runat="server" ControlToValidate="rdobtnlstQ60" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                 </li>                
             </ol>
             <h5>How often does your supervisor actually <span class="auto-style1">observe</span> you in practice and provide guidance in these areas?</h5>
             <ol start="61">
                  <li>
                     <asp:Label ID="lblQ61" runat="server">Promoting child development (e.g. cognitive, social emotional, language, physical-motor)</asp:Label>
                      <asp:RadioButtonList ID="rdobtnlstQ61" runat="server">
                            <asp:ListItem>Not at All</asp:ListItem>
                            <asp:ListItem>Sometimes</asp:ListItem>
                            <asp:ListItem>Regularly (at least half my supervision sessions)</asp:ListItem>
                            <asp:ListItem>All the time (a focus of most of my supervision sessions)</asp:ListItem>                            
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator57" runat="server" ControlToValidate="rdobtnlstQ61" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                 </li>
                 <li>
                     <asp:Label ID="lblQ62" runat="server">Addressing issues in health and safety (e.g. home safety, child nutrition, car seats, maternal depression, establishment of medical home)</asp:Label>
                      <asp:RadioButtonList ID="rdobtnlstQ62" runat="server">
                            <asp:ListItem>Not at All</asp:ListItem>
                            <asp:ListItem>Sometimes</asp:ListItem>
                            <asp:ListItem>Regularly (at least half my supervision sessions)</asp:ListItem>
                            <asp:ListItem>All the time (a focus of most of my supervision sessions)</asp:ListItem>                            
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator58" runat="server" ControlToValidate="rdobtnlstQ62" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                 </li>
                  <li>
                     <asp:Label ID="lblQ63" runat="server">Promoting positive parent-child interactions</asp:Label>
                      <asp:RadioButtonList ID="rdobtnlstQ63" runat="server">
                            <asp:ListItem>Not at All</asp:ListItem>
                            <asp:ListItem>Sometimes</asp:ListItem>
                            <asp:ListItem>Regularly (at least half my supervision sessions)</asp:ListItem>
                            <asp:ListItem>All the time (a focus of most of my supervision sessions)</asp:ListItem>                            
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator59" runat="server" ControlToValidate="rdobtnlstQ63" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                 </li>
             </ol>
              <div class="btn">
                   <asp:ImageButton ID="imgbtnV10B" runat="server" Height="50px" ImageUrl="~/Button/media_seek_backward.png" OnClick="imgbtnV10B_Click" OnClientClick="window.onbeforeunload=null;"/> 
            </div>
          <div class="btn">
               <asp:ImageButton ID="imgbtnV10F" runat="server" Height="50px" ImageUrl="~/Button/media_seek_forward.png" OnClick="imgbtnV10F_Click" ValidationGroup="Val1" OnClientClick="window.onbeforeunload=null;"     />
            </div>
             </asp:View>
          <asp:View ID="View11" runat="server">
              <table class="progressbar">
            <tr>
                <td class="progressbar_11"></td>                
                <td>progressing...</td>
            </tr>
        </table>
             <h3>FAMILY INVOLVEMENT</h3>
              <ol start="64">
                      <li>
                          <asp:Label ID="lblQ64" runat="server">On average, what percentage of the home visits that you have completed in the past six months would you estimate actively included additional family or household members beyond the immediate parent/caregiver? (By active involvement, we mean direct participation by additional family or household members in home visit activities. This would not include mere presence in the household during home visits, observation of home visits, or brief periods of interaction). Note: Enter number only. Do not use percentage sign.</asp:Label>
&nbsp;<asp:TextBox ID="txtQ64" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator60" runat="server" ControlToValidate="txtQ64" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                          <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtQ64" ErrorMessage="Not Valid - Should be number and value between 0-100" MaximumValue="100" MinimumValue="0" SetFocusOnError="True" ValidationGroup="Val1" Type="Integer"></asp:RangeValidator>
                      </li>
                  </ol>
                <div class="btn">
                   <asp:ImageButton ID="imgbtnV11B" runat="server" Height="50px" ImageUrl="~/Button/media_seek_backward.png" OnClick="imgbtnV11B_Click" OnClientClick="window.onbeforeunload=null;" /> 
            </div>
          <div class="btn">
               <asp:ImageButton ID="imgbtnV11F" runat="server" Height="50px" ImageUrl="~/Button/media_seek_forward.png" OnClick="imgbtnV11F_Click" ValidationGroup="Val1" OnClientClick="window.onbeforeunload=null;"      />
            </div>
              </asp:View>
         <asp:View ID="View12" runat="server">
              <table class="progressbar">
            <tr>
                <td class="progressbar_15"></td>                
                <td></td>
            </tr>
        </table>
             <h3>PROFESSIONAL DEVELOPMENT</h3>
              <ol start="65">
                  <li>
                      <asp:Label ID="lblQ65" runat="server">Please indicate the three professional development areas in which you feel you would most benefit from further training. Note: Please select three topics</asp:Label>
                      <asp:CheckBoxList ID="CbkbxQ65" runat="server" DataSourceID="SqlDataSource9" DataTextField="Answers" DataValueField="Value">
                                  </asp:CheckBoxList>
                                  <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [HomeVisitorSurveyAnswers] WHERE ([Question_ID] = @Question_ID)">
                                      <SelectParameters>
                                          <asp:Parameter DefaultValue="Q59" Name="Question_ID" Type="String" />
                                      </SelectParameters>
                                  </asp:SqlDataSource>
                                  <asp:TextBox ID="txt_q65" runat="server"></asp:TextBox>  
                                  <asp:Label ID="lblQ65Comment" runat="server" ForeColor="Red"></asp:Label>
                                  <asp:Label ID="lblQ65Comment1" runat="server" ForeColor="Red"></asp:Label>
                              </li>
                              <li>
                                  <asp:Label ID="lblQ66" runat="server">How prepared do you feel you are using your program's model or curriculum when conducting home/personal visits?</asp:Label>
                                  <asp:radioButtonList ID="rdobtnlstQ66" runat="server" DataSourceID="SqlDataSource10" DataTextField="Answers" DataValueField="Value">
                                  </asp:radioButtonList>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator61" runat="server" ControlToValidate="rdobtnlstQ66" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                  <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [HomeVisitorSurveyAnswers] WHERE ([Question_ID] = @Question_ID)">
                                      <SelectParameters>
                                          <asp:Parameter DefaultValue="Q60" Name="Question_ID" Type="String" />
                                      </SelectParameters>
                                  </asp:SqlDataSource>
                              </li>
                  <li>
                      <asp:Label ID="lblQ67" runat="server">How prepared do you feel you are using your program's program model or curriculum when conducting group services? (e.g., parent­child interaction groups or parental workshops or trainings)</asp:Label>
                      <asp:RadioButtonList ID="rdobtnlstQ67" runat="server" DataSourceID="SqlDataSource11" DataTextField="Answers" DataValueField="Value">
                                  </asp:RadioButtonList>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator62" runat="server" ControlToValidate="rdobtnlstQ67" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                  <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [HomeVisitorSurveyAnswers] WHERE ([Question_ID] = @Question_ID)">
                                      <SelectParameters>
                                          <asp:Parameter DefaultValue="Q61" Name="Question_ID" Type="String" />
                                      </SelectParameters>
                                  </asp:SqlDataSource>
                              </li>
                  <li>
                      <asp:Label ID="lblQ68" runat="server">How prepared do you feel you are working with families with children of the following ages?</asp:Label>
                      <ol class="d">
                          <li>
                              <asp:Label ID="lblQ68_A" runat="server">Pregnant mothers, not yet born </asp:Label>
                                <asp:RadioButtonList ID="rdobtnlstQ68_a" runat="server">
                                                    <asp:ListItem>Well prepared</asp:ListItem>
                                                    <asp:ListItem>Somewhat prepared</asp:ListItem>
                                                    <asp:ListItem>Not very prepared</asp:ListItem>
                                                    <asp:ListItem>Not at all prepared</asp:ListItem>                                                    
                                                </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator63" runat="server" ControlToValidate="rdobtnlstQ68_a" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                          </li>
                          <li>
                              <asp:Label ID="lblQ68_B" runat="server">0-­12 months</asp:Label>
                              <asp:RadioButtonList ID="rdobtnlstQ68_b" runat="server">
                                                     <asp:ListItem>Well prepared</asp:ListItem>
                                                    <asp:ListItem>Somewhat prepared</asp:ListItem>
                                                    <asp:ListItem>Not very prepared</asp:ListItem>
                                                    <asp:ListItem>Not at all prepared</asp:ListItem>                                                      
                                                    </asp:RadioButtonList>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator64" runat="server" ControlToValidate="rdobtnlstQ68_b" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                          </li>
                          <li>
                              <asp:Label ID="lblQ68_C" runat="server">13-­24 months</asp:Label>
                              <asp:RadioButtonList ID="rdobtnlstQ68_c" runat="server">
                                                        <asp:ListItem>Well prepared</asp:ListItem>
                                                    <asp:ListItem>Somewhat prepared</asp:ListItem>
                                                    <asp:ListItem>Not very prepared</asp:ListItem>
                                                    <asp:ListItem>Not at all prepared</asp:ListItem>                                                  
                                                    </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator65" runat="server" ControlToValidate="rdobtnlstQ68_c" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                          </li>
                           <li>                                               
                              <asp:Label ID="lblQ68_D" runat="server">25-­36 months</asp:Label>
                                <asp:RadioButtonList ID="rdobtnlstQ68_d" runat="server" >
                                                        <asp:ListItem>Well prepared</asp:ListItem>
                                                    <asp:ListItem>Somewhat prepared</asp:ListItem>
                                                    <asp:ListItem>Not very prepared</asp:ListItem>
                                                    <asp:ListItem>Not at all prepared</asp:ListItem>                                                               
                                                    </asp:RadioButtonList>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator66" runat="server" ControlToValidate="rdobtnlstQ68_d" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                         </li>
                            <li>
                                <asp:Label ID="lblQ68_E" runat="server">Older than 36 months</asp:Label>
                                <asp:RadioButtonList ID="rdobtnlstQ68_e" runat="server">
                                                    <asp:ListItem>Well prepared</asp:ListItem>
                                                    <asp:ListItem>Somewhat prepared</asp:ListItem>
                                                    <asp:ListItem>Not very prepared</asp:ListItem>
                                                    <asp:ListItem>Not at all prepared</asp:ListItem>                                                   
                                                    </asp:RadioButtonList>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator67" runat="server" ControlToValidate="rdobtnlstQ68_e" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </li>
                          </ol>
                      </li>
                  <li>
                        <asp:Label ID="lblQ69" runat="server">How prepared do you feel you are working with children and families with the following characteristics? </asp:Label>
                      <ol class="d">
                          <li>
                              <asp:Label ID="lblQ69_A" runat="server">Children with developmental delays</asp:Label>
                              <asp:RadioButtonList ID="rdobtnlstQ69_a" runat="server">
                                                     <asp:ListItem>Well prepared</asp:ListItem>
                                                    <asp:ListItem>Somewhat prepared</asp:ListItem>
                                                    <asp:ListItem>Not very prepared</asp:ListItem>
                                                    <asp:ListItem>Not at all prepared</asp:ListItem>                                                            
                                                    </asp:RadioButtonList>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator68" runat="server" ControlToValidate="rdobtnlstQ69_a" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                          </li>
                           <li>
                              <asp:Label ID="lblQ69_B" runat="server">Children with social, emotional or behavioral issues</asp:Label>
                              <asp:RadioButtonList ID="rdobtnlstQ69_b" runat="server">
                                                    <asp:ListItem>Well prepared</asp:ListItem>
                                                    <asp:ListItem>Somewhat prepared</asp:ListItem>
                                                    <asp:ListItem>Not very prepared</asp:ListItem>
                                                    <asp:ListItem>Not at all prepared</asp:ListItem>                                                 
                                                    </asp:RadioButtonList>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator69" runat="server" ControlToValidate="rdobtnlstQ69_b" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                          </li>
                           <li>
                              <asp:Label ID="lblQ69_C" runat="server">Parents who have a primary language other than English</asp:Label>
                              <asp:RadioButtonList ID="rdobtnlstQ69_c" runat="server">
                                                    <asp:ListItem>Well prepared</asp:ListItem>
                                                    <asp:ListItem>Somewhat prepared</asp:ListItem>
                                                    <asp:ListItem>Not very prepared</asp:ListItem>
                                                    <asp:ListItem>Not at all prepared</asp:ListItem>                                                        
                                                    </asp:RadioButtonList>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator70" runat="server" ControlToValidate="rdobtnlstQ69_c" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                          </li>
                           <li>
                              <asp:Label ID="lblQ69_D" runat="server">Teenage parents</asp:Label>
                              <asp:RadioButtonList ID="rdobtnlstQ69_d" runat="server">
                                                        <asp:ListItem>Well prepared</asp:ListItem>
                                                    <asp:ListItem>Somewhat prepared</asp:ListItem>
                                                    <asp:ListItem>Not very prepared</asp:ListItem>
                                                    <asp:ListItem>Not at all prepared</asp:ListItem>                                                      
                                                    </asp:RadioButtonList>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator71" runat="server" ControlToValidate="rdobtnlstQ69_d" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                          </li>
                           <li>
                              <asp:Label ID="lblQ69_E" runat="server">Parents with mental health issues and/or other special needs</asp:Label>
                              <asp:RadioButtonList ID="rdobtnlstQ69_e" runat="server">
                                                        <asp:ListItem>Well prepared</asp:ListItem>
                                                    <asp:ListItem>Somewhat prepared</asp:ListItem>
                                                    <asp:ListItem>Not very prepared</asp:ListItem>
                                                    <asp:ListItem>Not at all prepared</asp:ListItem>                                                        
                                                    </asp:RadioButtonList>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator72" runat="server" ControlToValidate="rdobtnlstQ69_e" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                          </li>
                          <li>
                              <asp:Label ID="lblQ69_F" runat="server">Parents with low literacy levels</asp:Label>
                              <asp:RadioButtonList ID="rdobtnlstQ69_f" runat="server">
                                                      <asp:ListItem>Well prepared</asp:ListItem>
                                                    <asp:ListItem>Somewhat prepared</asp:ListItem>
                                                    <asp:ListItem>Not very prepared</asp:ListItem>
                                                    <asp:ListItem>Not at all prepared</asp:ListItem>                                                      
                                                    </asp:RadioButtonList>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator73" runat="server" ControlToValidate="rdobtnlstQ69_f" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                          </li>
                          <li>
                              <asp:Label ID="lblQ69_G" runat="server">Parents with substance abuse issues</asp:Label>
                              <asp:RadioButtonList ID="rdobtnlstQ69_g" runat="server">
                                                       <asp:ListItem>Well prepared</asp:ListItem>
                                                    <asp:ListItem>Somewhat prepared</asp:ListItem>
                                                    <asp:ListItem>Not very prepared</asp:ListItem>
                                                    <asp:ListItem>Not at all prepared</asp:ListItem>                                                        
                                                    </asp:RadioButtonList>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator86" runat="server" ControlToValidate="rdobtnlstQ69_g" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                          </li>
                           <li>
                              <asp:Label ID="lblQ69_H" runat="server">Families with domestic violence</asp:Label>
                              <asp:RadioButtonList ID="rdobtnlstQ69_h" runat="server">
                                                     <asp:ListItem>Well prepared</asp:ListItem>
                                                    <asp:ListItem>Somewhat prepared</asp:ListItem>
                                                    <asp:ListItem>Not very prepared</asp:ListItem>
                                                    <asp:ListItem>Not at all prepared</asp:ListItem>                                                     
                                                    </asp:RadioButtonList>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator87" runat="server" ControlToValidate="rdobtnlstQ69_h" ErrorMessage="Required" ValidationGroup="Val1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                          </li>
                      </ol>
                  </li>
                  </ol>
                    <div class="btn">
                   <asp:ImageButton ID="imgbtnV12B" runat="server" Height="50px" ImageUrl="~/Button/media_seek_backward.png" OnClick="imgbtnV12B_Click" OnClientClick="window.onbeforeunload=null;"/> 
            </div>
          <div class="btn">
                <asp:Button ID="btnSubmit" runat="server" BackColor="#F3F3F3" BorderStyle="Solid" BorderWidth="5px" Font-Bold="True" Font-Italic="False" Font-Size="X-Large" Font-Strikeout="False" Font-Underline="False" ForeColor="Black" Height="50px" Text="Submit" Width="100px" OnClick="btnSubmit_Click" ValidationGroup="Val1" OnClientClick="window.onbeforeunload=null;"/>
            </div>
             </asp:View>
    </asp:MultiView>
</asp:Content>
