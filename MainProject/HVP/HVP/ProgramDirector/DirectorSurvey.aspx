<%@ Page Title="" Language="C#" MasterPageFile="~/ProgramDirector/DirectorSurvey.Master" AutoEventWireup="true" CodeBehind="DirectorSurvey.aspx.cs" Inherits="HVP.DirectorSurvey1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">        
        //function DetectBrowserExit() {
        //  alert('Please save your work before you leave or everything will be lost.');
        //}
        function closeevent() {
            window.onbeforeunload = function (e) {
                var e = e || window.event;
                if (e) e.returnValue = 'Please save your work before you leave or everything will be lost.';//for IE & Firefox
                return 'Please save your work before you leave or everything will be lost.';// for Safari and Chrome
            };
        }

        </script>    
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
              <table class="progressbar">
            <tr>
                <td class="progressbar_1"></td>                
                <td>progressing...</td>
            </tr>
        </table>
            <h3>DEMOGRAPHICS</h3>
    <h5>BASIC PROGRAM INFORMATION</h5>
Please note: This survey distinguishes between your agency as a whole and your Prevention Initiative (PI) programming. While some questions ask about your agency, most ask specifically about your PI services and the home visitors providing PI services. Additionally, if your agency has more than one site, please answer these questions about the site that is the focus of the site visit.
             <ol>
        <li>
            <asp:HiddenField ID="hfSIteID" runat="server" />
            <asp:HiddenField ID="hfStaffID" runat="server" />
            <asp:HiddenField ID="hfSchdID" runat="server" />
            <asp:Label ID="lblQ1" runat="server"></asp:Label><asp:TextBox ID="txtQ1" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtQ1" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                 </li>
        <li>
            <asp:Label ID="lblQ2" runat="server"></asp:Label><asp:RadioButtonList ID="rdobtnlstQ2" runat="server" RepeatDirection="Horizontal" DataSourceID="SqlDataSource1" DataTextField="Answer" DataValueField="AnswerValue">
            </asp:RadioButtonList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="rdobtnlstQ2" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT Question_ID, Answer, Answer_ID, AnswerValue FROM PROGRAM_DIRECTOR_SURVEY_ANSWERS WHERE (Question_ID = @Question_ID)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="Q2" Name="Question_ID" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
                 </li>
        <li>
            <asp:Label ID="lblQ3" runat="server"></asp:Label><asp:TextBox ID="txtQ3" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtQ3" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                 </li>
                 <li>
                     <asp:Label ID="lblQ4" runat="server"></asp:Label>
                     <asp:RadioButtonList ID="rdobtnlstQ4" runat="server" DataSourceID="SqlDataSource2" DataTextField="Answer" DataValueField="AnswerValue"></asp:RadioButtonList>                   
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="rdobtnlstQ4" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [PROGRAM_DIRECTOR_SURVEY_ANSWERS] WHERE ([Question_ID] = @Question_ID)">
                         <SelectParameters>
                             <asp:Parameter DefaultValue="Q4" Name="Question_ID" Type="String" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                     <asp:TextBox ID="txtQ4Explain" runat="server"></asp:TextBox>
                     <asp:Label ID="lblQ4Comment" runat="server" ForeColor="Red"></asp:Label>
                 </li>
                 </ol>
            
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
            <ol start="5">
                <li>
                    <asp:Label ID="lblQ5_Yes_or_No" runat="server"></asp:Label>
                    <asp:RadioButtonList ID="rdobtnlst_Yes_or_No" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="rdobtnlst_Yes_or_No_SelectedIndexChanged">
                        <asp:ListItem Value="1">Yes</asp:ListItem>
                        <asp:ListItem Value="0">No</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator125" runat="server" ControlToValidate="rdobtnlst_Yes_or_No" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
               <br />
                     <asp:Label ID="lblQ5" runat="server" Visible="False"></asp:Label>
                     <asp:CheckBoxList ID="chkbxlstQ5" runat="server" Visible="False" DataSourceID="SqlDataSource3" DataTextField="Answer" DataValueField="AnswerValue"></asp:CheckBoxList>

                     <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [PROGRAM_DIRECTOR_SURVEY_ANSWERS] WHERE ([Question_ID] = @Question_ID)">
                         <SelectParameters>
                             <asp:Parameter DefaultValue="Q5" Name="Question_ID" Type="String" />
                         </SelectParameters>
                    </asp:SqlDataSource>

                     <asp:TextBox ID="txtQ5Explain" runat="server" Visible="False"></asp:TextBox>

                     <asp:Label ID="lblQ5Comment" runat="server" ForeColor="Red"></asp:Label>

                 </li>
                </ol>
                </ContentTemplate>
                </asp:UpdatePanel>
                <ol start="6">
        <li>
            <asp:Label ID="lblQ6" runat="server"></asp:Label>
            <asp:RadioButtonList ID="rdobtnlstQ6" runat="server" DataSourceID="SqlDataSource4" DataTextField="Answer" DataValueField="AnswerValue">
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
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="rdobtnlstQ6" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT PROGRAM_DIRECTOR_SURVEY_ANSWERS.* FROM PROGRAM_DIRECTOR_SURVEY_ANSWERS WHERE (Question_ID = @Question_ID)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="Q6" Name="Question_ID" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:TextBox ID="txtQ6Explain" runat="server"></asp:TextBox>
            <asp:Label ID="lblQ6Comment" runat="server" ForeColor="Red"></asp:Label>
        </li>
                 </ol>
            <h5>FAMILY INFORMATION</h5>
            <ol start ="7">
                   
                 <li>
                     <asp:Label ID="lblQ7" runat="server"></asp:Label>
                     <asp:TextBox ID="txtQ7" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtQ7" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
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
                             <asp:TextBox ID="txtQ8_1" runat="server"  onkeyup="sumQ8();"></asp:TextBox>White, not of Hispanic origin
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator112" runat="server" ControlToValidate="txtQ8_1" ErrorMessage="Required, Please enter '0' if it's none" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                         </li>
                         <li>
                             <asp:TextBox ID="txtQ8_2" runat="server" onkeyup="sumQ8();"></asp:TextBox>Black, not of Hispanic origin
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator113" runat="server" ControlToValidate="txtQ8_2" ErrorMessage="Required, Please enter '0' if it's none" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                         </li>
                         <li>
                             <asp:TextBox ID="txtQ8_3" runat="server" onkeyup="sumQ8();"></asp:TextBox>Hispanic
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator114" runat="server" ControlToValidate="txtQ8_3" ErrorMessage="Required, Please enter '0' if it's none" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                         </li>
                         <li>
                             <asp:TextBox ID="txtQ8_4" runat="server" onkeyup="sumQ8();"></asp:TextBox>Asian or Pacific Islander
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator115" runat="server" ControlToValidate="txtQ8_4" ErrorMessage="Required, Please enter '0' if it's none" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                         </li>
                         <li>
                             <asp:TextBox ID="txtQ8_5" runat="server" onkeyup="sumQ8();"></asp:TextBox>American Indian or Alaskan Native
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator116" runat="server" ControlToValidate="txtQ8_5" ErrorMessage="Required, Please enter '0' if it's none" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                         </li>
                         <li>
                             <asp:TextBox ID="txtQ8_6" runat="server" onkeyup="sumQ8();"></asp:TextBox>Other/Multiracial
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator117" runat="server" ControlToValidate="txtQ8_6" ErrorMessage="Required, Please enter '0' if it's none" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                         </li>
                         <li>
                             <asp:TextBox ID="txtQ8_7" runat="server" onkeyup="sumQ8();"></asp:TextBox>UnKnown
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtQ8_7" ErrorMessage="Required, Please enter number stated in Question #7 if you have no familes" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                         </li>
                         <li>Total &nbsp; <asp:TextBox ID="txtQ8_Total" runat="server" Enabled="false"></asp:TextBox>
                             
                             <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtQ7" ControlToValidate="txtQ8_Total" ErrorMessage="Should be Equal to number stated in Question #7" ValidationGroup="Val1"></asp:CompareValidator>
                             
                         </li>
                     </ul>
                 </li>
                 <li>
                     <asp:Label ID="lblQ9" runat="server"></asp:Label>
                    <%-- <asp:CheckBoxList ID="chkbxlstQ9" runat="server"></asp:CheckBoxList>--%>
                     <ul>
                         <li>
                             <asp:TextBox ID="txtQ9_1" runat="server"  onkeyup="sumQ9();"></asp:TextBox>English only
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtQ9_1" ErrorMessage="Required, Please enter '0' if it's none" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                         </li>
                         <li>
                             <asp:TextBox ID="txtQ9_2" runat="server" onkeyup="sumQ9();"></asp:TextBox>Spanish only
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtQ9_2" ErrorMessage="Required, Please enter '0' if it's none" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                         </li>
                         <li>
                             <asp:TextBox ID="txtQ9_3" runat="server" onkeyup="sumQ9();"></asp:TextBox>English and Spanish
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtQ9_3" ErrorMessage="Required, Please enter '0' if it's none" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                         </li>
                         <li>
                             <asp:TextBox ID="txtQ9_4" runat="server" onkeyup="sumQ9();"></asp:TextBox>English and a language other than Spanish
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtQ9_4" ErrorMessage="Required, Please enter '0' if it's none" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                         </li>
                         <li>
                             <asp:TextBox ID="txtQ9_5" runat="server" onkeyup="sumQ9();"></asp:TextBox>Only a language other than Spanish or English
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtQ9_5" ErrorMessage="Required, Please enter '0' if it's none" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                         </li>                         
                         <li>
                             <asp:TextBox ID="txtQ9_6" runat="server" onkeyup="sumQ9();"></asp:TextBox>UnKnown
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator119" runat="server" ControlToValidate="txtQ9_6" ErrorMessage="Required, Please enter number stated in Question #7 if you have no familes" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                         </li>
                         <li>Total &nbsp; <asp:TextBox ID="txtQ9_Total" runat="server" Enabled="false"></asp:TextBox>
                             <asp:CompareValidator ID="CompareValidator2" runat="server"  ControlToCompare="txtQ7" ControlToValidate="txtQ9_Total" ErrorMessage="Should be Equal to number stated in Question #7" ValidationGroup="Val1"></asp:CompareValidator>
                         </li>
                     </ul>
                 </li>   
                <br />
                  <li>
                      <asp:Label ID="lblQ10" runat="server"></asp:Label>
                      <ul> 
                      <li><asp:TextBox ID="txtQ10_1" runat="server" onkeyup="sumQ10();"></asp:TextBox>Not yet born 
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator120" runat="server" ControlToValidate="txtQ10_1" ErrorMessage="Required, Please enter '0' if it's none" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                          </li>
                      <li><asp:TextBox ID="txtQ10_2" runat="server" onkeyup="sumQ10();"></asp:TextBox>0­-12 
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator121" runat="server" ControlToValidate="txtQ10_2" ErrorMessage="Required, Please enter '0' if it's none" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                          </li>
                      <li><asp:TextBox ID="txtQ10_3" runat="server" onkeyup="sumQ10();"></asp:TextBox>13-24<asp:RequiredFieldValidator ID="RequiredFieldValidator122" runat="server" ControlToValidate="txtQ10_3" ErrorMessage="Required, Please enter '0' if it's none" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                          </li>
                      <li><asp:TextBox ID="txtQ10_4" runat="server" onkeyup="sumQ10();"></asp:TextBox>25-36 Months<asp:RequiredFieldValidator ID="RequiredFieldValidator123" runat="server" ControlToValidate="txtQ10_4" ErrorMessage="Required, Please enter '0' if it's none" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                          </li>
                     <li> <asp:TextBox ID="txtQ10_5" runat="server" onkeyup="sumQ10();"></asp:TextBox>Older than 36 Months 
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator124" runat="server" ControlToValidate="txtQ10_5" ErrorMessage="Required, Please enter '0' if it's none" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                          </li> 
                          <li>Total &nbsp; <asp:TextBox ID="txtQ10_Total" runat="server" Enabled="false"></asp:TextBox></li> 
                     </ul>                         
               </li>     
    </ol>
            <h5>OTHER ACTIVITIES</h5>
            <ol start="11">
                <li>
                    <asp:Label ID="lblQ11" runat="server"></asp:Label>
                    <asp:CheckBoxList ID="chkbxlstQ11" runat="server" DataSourceID="SqlDataSource5" DataTextField="Answer" DataValueField="AnswerValue">
                    </asp:CheckBoxList>
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [PROGRAM_DIRECTOR_SURVEY_ANSWERS] WHERE ([Question_ID] = @Question_ID)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="Q11" Name="Question_ID" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:TextBox ID="txtQ11_Other" runat="server" AutoPostBack="True"></asp:TextBox>
                    <asp:Label ID="lblQ11Comment" runat="server" ForeColor="Red"></asp:Label>
                </li>
                
            </ol>            
        <table>
            <tr>
                <td>
                      
                <asp:ImageButton ID="imgbtnHome0" runat="server" Height="50px" ImageUrl="~/Button/home.png" OnClick="imgbtnHome0_Click" OnClientClick="closeevent();" />
                      
                </td>
               <td>
                   <asp:ImageButton ID="imgbtnForward0" runat="server" Height="50px" ImageUrl="~/Button/media_seek_forward.png" OnClick="imgbtnForward0_Click" ValidationGroup="Val1" OnClientClick="window.onbeforeunload=null;" />
               </td>
                <td>
                        <asp:Button ID="btnSave" runat="server" BackColor="#F3F3F3" BorderStyle="Solid" BorderWidth="5px" Font-Bold="True" Font-Italic="False" Font-Size="X-Large" Font-Strikeout="False" Font-Underline="False" ForeColor="Black" Height="50px" Text="Save" Width="100px" OnClick="btnSave_Click" OnClientClick="window.onbeforeunload=null;" ValidationGroup="Val1" />
                    </td>
                  </tr></table>          
            
        </asp:View>
         <asp:View ID="View2" runat="server">
               <table class="progressbar">
            <tr>
                <td class="progressbar_2"></td>                
                <td>progressing...</td>
            </tr>
        </table>
            <h3>EDUCATION AND EXPERIENCE</h3>
            <ol start="12">
                <li>
                    <p>
                        <asp:Label ID="lblQ12" runat="server" ></asp:Label></p>
                    <p>*Business function refers to staff who have business responsibilities only. Example: Accountant</p>
                    <p>
** Examples of early childhood related fields include: education, social work, psychology, child development, and nursing.</P>
                    <p>
***Mentorship means that the staff position was teamed with a seasoned professional with specific expertise in carrying out the job responsibilities. This definition implies an on­ going relationship over a period of time, where multiple opportunities for consultation and guidance are present to support individual growth and development. A two month job shadowing period where there is no on­going guidance once job responsibilities are assumed would not meet this definition.
</p>
                     <asp:GridView ID="grdQ12" runat="server" AutoGenerateColumns="False" EnableModelValidation="True" ShowFooter="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                         <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="Title">
                                <ItemTemplate>
                                    <asp:DropDownList ID="ddl_Q12_1" runat="server">
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Business function only *:">
                                <ItemTemplate>
                                    <asp:DropDownList ID="ddl_Q12_2" runat="server">
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Direct responsibility for program implementation and/or staff who work with families? * ">
                                <ItemTemplate>
                                    <asp:DropDownList ID="ddl_Q12_3" runat="server">
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Undergraduate degree?">
                                <ItemTemplate>
                                    <asp:DropDownList ID="ddl_Q13" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_Q13_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Is undergraduate degree in early childhood field?">
                                <ItemTemplate>
                                    <asp:DropDownList ID="ddl_Q14" runat="server">
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Graduate degree? **">
                                <ItemTemplate>
                                    <asp:DropDownList ID="ddl_Q15" runat="server">
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Is graduate degree in early childhood field? **">
                                <ItemTemplate>
                                    <asp:DropDownList ID="ddl_Q16" runat="server">
                                    </asp:DropDownList>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:Button ID="btnAddNewRow" runat="server" Text="Add" OnClick="btnAddNewRow_Click" OnClientClick="window.onbeforeunload=null;" />
                                </FooterTemplate>
                                </asp:TemplateField>
                            <asp:TemplateField HeaderText="Years experience in early childhood field:">
                                <ItemTemplate>
                                    <asp:DropDownList ID="ddl_Q17" runat="server">
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Years of direct management or mentorship experience ***:">
                                <ItemTemplate>
                                    <asp:DropDownList ID="ddl_Q18" runat="server">
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                         <EditRowStyle BackColor="#2461BF" />
                         <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                         <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                         <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                         <RowStyle BackColor="#EFF3FB" />
                         <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    </asp:GridView> 
                    <br />
                    <asp:GridView ID="grdQ12_V2" runat="server" AutoGenerateColumns="False" EnableModelValidation="True" OnRowCancelingEdit="grdQ12_V2_RowCancelingEdit" OnRowDataBound="grdQ12_V2_RowDataBound" OnRowEditing="grdQ12_V2_RowEditing" OnRowUpdating="grdQ12_V2_RowUpdating" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" OnRowDeleting="grdQ12_V2_RowDeleting">                        
                           <Columns>
                               <asp:TemplateField HeaderText="RowID" ItemStyle-CssClass="HiddenSiteID" HeaderStyle-CssClass ="HiddenSiteID">
                                   <ItemTemplate>
                                       <asp:Label ID="lblRowID" runat="server"></asp:Label>
                                   </ItemTemplate>
                                   <EditItemTemplate>
                                        <asp:Label ID="lblRowID" runat="server"></asp:Label>
                                   </EditItemTemplate>
                                   <ControlStyle Width="20px" />
                                   <HeaderStyle CssClass="HiddenSiteID" />
                                   <ItemStyle CssClass="HiddenSiteID" Width="200px" />
                               </asp:TemplateField>
                               <asp:TemplateField HeaderText="Title">
                                   <EditItemTemplate>
                                       <asp:Label ID="lbl_Q12_1" runat="server" Visible="false"></asp:Label>
                                       <asp:DropDownList ID="ddl_Q12_1_V2" runat="server">
                                       </asp:DropDownList>
                                   </EditItemTemplate>
                                   <ItemTemplate>
                                       <asp:Label ID="lbl_Q12_1" runat="server"></asp:Label>
                                   </ItemTemplate>
                                   <ControlStyle Width="100px" />
                                   <ItemStyle Width="200px" />
                               </asp:TemplateField>
                            <asp:TemplateField HeaderText="Business function only">
                                <EditItemTemplate>
                                    <asp:Label ID="lbl_Q12_2" runat="server" Visible="False"></asp:Label>
                                    <asp:DropDownList ID="ddl_Q12_2_V2" runat="server">
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_Q12_2" runat="server"></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="50px" />
                                <ItemStyle Width="200px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Direct responsibility for program implementation and/or staff who work with families? ">
                                <EditItemTemplate>
                                     <asp:Label ID="lbl_Q12_3" runat="server" Visible="False"></asp:Label>
                                    <asp:DropDownList ID="ddl_Q12_3_V2" runat="server">
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_Q12_3" runat="server" ></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="50px" />
                                <ItemStyle Width="200px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Undergraduate degree?">
                                <EditItemTemplate>
                                     <asp:Label ID="lbl_Q13" runat="server" Visible="False"></asp:Label>
                                    <asp:DropDownList ID="ddl_Q13_V2" runat="server">
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_Q13" runat="server"></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="50px" />
                                <ItemStyle Width="200px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Is undergraduate degree in early childhood field?">
                                <EditItemTemplate>
                                    <asp:Label ID="lbl_Q14" runat="server" Visible="False"></asp:Label>
                                    <asp:DropDownList ID="ddl_Q14_V2" runat="server">
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_Q14" runat="server"></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="50px" />
                                <ItemStyle Width="200px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Graduate degree? ">
                                <EditItemTemplate>
                                    <asp:Label ID="lbl_Q15" runat="server" Visible="False"></asp:Label>
                                    <asp:DropDownList ID="ddl_Q15_V2" runat="server">
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_Q15" runat="server"></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="50px" />
                                <ItemStyle Width="200px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Is graduate degree in early childhood field?">
                                <EditItemTemplate>
                                     <asp:Label ID="lbl_Q16" runat="server" Visible="False"></asp:Label>
                                    <asp:DropDownList ID="ddl_Q16_V2" runat="server">
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_Q16" runat="server"></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="50px" />
                                <ItemStyle Width="200px" />
                                </asp:TemplateField>
                               <asp:TemplateField HeaderText="Years experience in early childhood field: ">
                                   <EditItemTemplate>
                                       <asp:Label ID="lbl_Q17" runat="server" Visible="False"></asp:Label>
                                       <asp:DropDownList ID="ddl_Q17_V2" runat="server"> </asp:DropDownList>
                                   </EditItemTemplate>
                                   <ItemTemplate>
                                       <asp:Label ID="lbl_Q17" runat="server"></asp:Label>
                                   </ItemTemplate>
                                   <ControlStyle Width="100px" />
                                   <ItemStyle Width="200px" />
                               </asp:TemplateField>
                               <asp:TemplateField HeaderText="Years of direct management or mentorship experience ***:" ItemStyle-Width="200px">
                                   <EditItemTemplate>
                                       <asp:Label ID="lbl_Q18" runat="server" Visible="False"></asp:Label>
                                       <asp:DropDownList ID="ddl_Q18_V2" runat="server"> </asp:DropDownList>
                                   </EditItemTemplate>
                                   <ItemTemplate>
                                        <asp:Label ID="lbl_Q18" runat="server"></asp:Label>
                                   </ItemTemplate>
                                   <ControlStyle Width="100px" />
                                   <ItemStyle Width="200px" />
                               </asp:TemplateField>
                               <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" >                              
                               <ControlStyle Width="75px" />
                               <ItemStyle Width="100px" />
                               </asp:CommandField>
                        </Columns>                        
                           <FooterStyle BackColor="#2461BF" />
                           <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                           <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                           <RowStyle BackColor="White" />
                           <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>         
                    <asp:Label ID="lblGridComment" runat="server" ForeColor="Red"></asp:Label>
                </li>
            </ol>
            <table><tr><td>
                      
                <asp:ImageButton ID="imgbtnback1" runat="server" Height="50px" ImageUrl="~/Button/media_seek_backward.png" OnClick="imgbtnback1_Click" OnClientClick="window.onbeforeunload=null;"  />
                      
                </td>
                <td>
                    <asp:ImageButton ID="ImageButton1" runat="server" Height="50px" ImageUrl="~/Button/home.png" OnClick="imgbtnHome0_Click" OnClientClick="closeevent();"   />
                </td>
               <td>
                   <asp:ImageButton ID="imgbtnForward4" runat="server" Height="50px" ImageUrl="~/Button/media_seek_forward.png" OnClick="imgbtnForward4_Click" OnClientClick="window.onbeforeunload=null;" ValidationGroup="Val1" />
                   <%--<asp:ImageButton ID="imgbtnForward1" runat="server" Height="50px" ImageUrl="~/Button/media_seek_forward.png" OnClick="imgbtnForward1_Click1" OnClientClick="window.onbeforeunload=null;" ValidationGroup="Val1"  />--%>
               </td>
                  </tr></table>
        </asp:View>             
      
        <asp:View ID="View5" runat="server">
            <table class="progressbar">
            <tr>
                <td class="progressbar_6"></td>                
                <td>progressing...</td>
            </tr>
        </table>
            <h3>Training</h3>
            <h5>INITIAL TRAINING</h5>
            <asp:Label ID="lblQ19" runat="server"></asp:Label>
            <br />
            <br />
            <ol start="13"><li> <%--orginal number is 19--%>
                <asp:Label ID="lblQ19_A" runat="server"></asp:Label>
                </li></ol>
            <ol type="A">
                <li>
                    <asp:Label ID="lblQ19_1" runat="server"></asp:Label>
                    <table class="HVSurvey" >
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
                                <asp:RadioButtonList ID="rdobtnlstQ19_1_1" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                    <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                                 
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="rdobtnlstQ19_1_1" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>   
                        </tr>
                        <tr>
                            <td class="HVSurvey"><asp:Label ID="lblQ19_1_2" runat="server"></asp:Label></td>
                            <td class="HVSurvey" colspan="3">
                                <asp:RadioButtonList ID="rdobtnlstQ19_1_2" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                     <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                                  
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="rdobtnlstQ19_1_2" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>   
                        </tr>
                        <tr>
                            <td class="HVSurvey"><asp:Label ID="lblQ19_1_3" runat="server"></asp:Label></td>
                            <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ19_1_3" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                      <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                                             
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ControlToValidate="rdobtnlstQ19_1_3" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>  
                        </tr>
                        <tr>
                            <td class="HVSurvey"><asp:Label ID="lblQ19_1_4" runat="server"></asp:Label></td>
                            <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ19_1_4" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                       <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                                          
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ControlToValidate="rdobtnlstQ19_1_4" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>  
                        </tr>
                         <tr>
                            <td class="HVSurvey"><asp:Label ID="lblQ19_1_5" runat="server"></asp:Label></td>
                            <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ19_1_5" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                     <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                                 
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ControlToValidate="rdobtnlstQ19_1_5" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>  
                        </tr>
                         <tr>
                            <td class="HVSurvey"><asp:Label ID="lblQ19_1_6" runat="server"></asp:Label></td>
                            <td class="HVSurvey" >
                                <asp:RadioButtonList ID="rdobtnlstQ19_1_6" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                     <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                                 
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ControlToValidate="rdobtnlstQ19_1_6" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>  
                        </tr>
                        <tr>
                            <td class="HVSurvey"><asp:Label ID="lblQ19_1_7" runat="server"></asp:Label></td>
                            <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ19_1_7" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                    <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                                      
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" ControlToValidate="rdobtnlstQ19_1_7" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>  
                        </tr>
                        <tr>
                            <td class="HVSurvey"><asp:Label ID="lblQ19_1_8" runat="server"></asp:Label></td>
                            <td class="HVSurvey" >
                                <asp:RadioButtonList ID="rdobtnlstQ19_1_8" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                     <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                                  
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ControlToValidate="rdobtnlstQ19_1_8" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>  
                        </tr>
                         <tr>
                            <td class="HVSurvey"><asp:Label ID="lblQ19_1_9" runat="server"></asp:Label></td>
                           <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ19_1_9" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                   <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                                 
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" ControlToValidate="rdobtnlstQ19_1_9" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
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
                                <asp:RadioButtonList ID="rdobtnlstQ19_2_1" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                     <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                                       
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" ControlToValidate="rdobtnlstQ19_2_1" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>  
                        </tr>
                        <tr>
                            <td class="HVSurvey"><asp:Label ID="lblQ19_2_2" runat="server"></asp:Label></td>
                            <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ19_2_2" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                    <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                                   
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" ControlToValidate="rdobtnlstQ19_2_2" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>  
                        </tr>
                        <tr>
                            <td class="HVSurvey"><asp:Label ID="lblQ19_2_3" runat="server"></asp:Label></td>
                            <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ19_2_3" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                     <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                                      
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" ControlToValidate="rdobtnlstQ19_2_3" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>  
                        </tr>
                        <tr>
                            <td class="HVSurvey"><asp:Label ID="lblQ19_2_4" runat="server"></asp:Label></td>
                            <td class="HVSurvey" >
                                <asp:RadioButtonList ID="rdobtnlstQ19_2_4" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                     <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                                
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" ControlToValidate="rdobtnlstQ19_2_4" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>  
                        </tr>
                         <tr>
                            <td class="HVSurvey"><asp:Label ID="lblQ19_2_5" runat="server"></asp:Label></td>
                            <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ19_2_5" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                      <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                                
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" ControlToValidate="rdobtnlstQ19_2_5" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>  
                        </tr>
                         <tr>
                            <td class="HVSurvey"><asp:Label ID="lblQ19_2_6" runat="server"></asp:Label></td>
                            <td class="HVSurvey" >
                                <asp:RadioButtonList ID="rdobtnlstQ19_2_6" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                     <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                                      
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" ControlToValidate="rdobtnlstQ19_2_6" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>  
                        </tr>
                        <tr>
                            <td class="HVSurvey"><asp:Label ID="lblQ19_2_7" runat="server"></asp:Label></td>
                            <td class="HVSurvey" >
                                <asp:RadioButtonList ID="rdobtnlstQ19_2_7" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                     <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                                 
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator36" runat="server" ControlToValidate="rdobtnlstQ19_2_7" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>  
                        </tr>
                        <tr>
                            <td class="HVSurvey"><asp:Label ID="lblQ19_2_8" runat="server"></asp:Label></td>
                            <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ19_2_8" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                      <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                                   
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator37" runat="server" ControlToValidate="rdobtnlstQ19_2_8" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>  
                        </tr>
                         <tr>
                            <td class="HVSurvey"><asp:Label ID="lblQ19_2_9" runat="server"></asp:Label></td>
                            <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ19_2_9" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                      <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                                
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator38" runat="server" ControlToValidate="rdobtnlstQ19_2_9" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>  
                        </tr>
                         <tr>
                            <td class="HVSurvey"><asp:Label ID="lblQ19_2_10" runat="server"></asp:Label></td>
                            <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ19_2_10" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                     <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                            
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator39" runat="server" ControlToValidate="rdobtnlstQ19_2_10" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>  
                        </tr>
                        <tr>
                            <td class="HVSurvey"><asp:Label ID="lblQ19_2_11" runat="server"></asp:Label></td>
                            <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ19_2_11" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                      <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                                 
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator40" runat="server" ControlToValidate="rdobtnlstQ19_2_11" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>  
                        </tr>
                        <tr>
                            <td class="HVSurvey"><asp:Label ID="lblQ19_2_12" runat="server"></asp:Label></td>
                            <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ19_2_12" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                    <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                                        
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator41" runat="server" ControlToValidate="rdobtnlstQ19_2_12" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>  
                        </tr>
                        <tr>
                            <td class="HVSurvey"><asp:Label ID="lblQ19_2_13" runat="server"></asp:Label></td>
                            <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ19_2_13" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                      <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                                         
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator42" runat="server" ControlToValidate="rdobtnlstQ19_2_13" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>  
                        </tr>
                        <tr>
                            <td class="HVSurvey"><asp:Label ID="lblQ19_2_14" runat="server"></asp:Label></td>
                            <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ19_2_14" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                    <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                                            
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator43" runat="server" ControlToValidate="rdobtnlstQ19_2_14" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>  
                        </tr>
                        <tr>
                            <td class="HVSurvey"><asp:Label ID="lblQ19_2_15" runat="server"></asp:Label></td>
                            <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ19_2_15" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                      <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                                       
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator44" runat="server" ControlToValidate="rdobtnlstQ19_2_15" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
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
                            <td class="HVSurvey"><asp:Label ID="lblQ19_3_1" runat="server"></asp:Label></td>
                            <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ19_3_1" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                      <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                                      
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator45" runat="server" ControlToValidate="rdobtnlstQ19_3_1" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>  
                        </tr>
                        <tr>
                            <td class="HVSurvey"><asp:Label ID="lblQ19_3_2" runat="server"></asp:Label></td>
                            <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ19_3_2" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                     <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                                        
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator46" runat="server" ControlToValidate="rdobtnlstQ19_3_2" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>  
                        </tr>
                        <tr>
                            <td class="HVSurvey"><asp:Label ID="lblQ19_3_3" runat="server"></asp:Label></td>
                            <td class="HVSurvey" >
                                <asp:RadioButtonList ID="rdobtnlstQ19_3_3" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                     <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                                       
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator47" runat="server" ControlToValidate="rdobtnlstQ19_3_3" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>  
                        </tr>
                        <tr>
                            <td class="HVSurvey"><asp:Label ID="lblQ19_3_4" runat="server"></asp:Label></td>
                            <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ19_3_4" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                      <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                                 
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator48" runat="server" ControlToValidate="rdobtnlstQ19_3_4" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>  
                        </tr>
                         <tr>
                            <td class="HVSurvey"><asp:Label ID="lblQ19_3_5" runat="server"></asp:Label></td>
                            <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ19_3_5" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                      <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                                      
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator49" runat="server" ControlToValidate="rdobtnlstQ19_3_5" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>  
                        </tr>                                            
                    </table>
                </li>
            </ol>
            <table><tr><td>
                      <asp:ImageButton ID="imgbtnback3" runat="server" Height="50px" ImageUrl="~/Button/media_seek_backward.png" OnClick="imgbtnback3_Click" OnClientClick="window.onbeforeunload=null;"  />
                <%--<asp:ImageButton ID="imgbtnback5" runat="server" Height="50px" ImageUrl="~/Button/media_seek_backward.png" OnClick="imgbtnback5_Click" style="width: 50px" OnClientClick="window.onbeforeunload=null;"  />--%>
                      
                </td>
                <td>
                    <asp:ImageButton ID="ImageButton4" runat="server" Height="50px" ImageUrl="~/Button/home.png" OnClick="imgbtnHome0_Click" OnClientClick="closeevent();" />
                </td>
               <td>    
                   <asp:ImageButton ID="imgbtnForward5" runat="server" Height="50px" ImageUrl="~/Button/media_seek_forward.png" OnClick="imgbtnForward5_Click" OnClientClick="window.onbeforeunload=null;" ValidationGroup="Val1" />
               </td>
                 <td>
                        <asp:Button ID="btnSave3" runat="server" BackColor="#F3F3F3" BorderStyle="Solid" BorderWidth="5px" Font-Bold="True" Font-Italic="False" Font-Size="X-Large" Font-Strikeout="False" Font-Underline="False" ForeColor="Black" Height="50px" Text="Save" Width="100px"  OnClientClick="window.onbeforeunload=null;" OnClick="btnSave3_Click" ValidationGroup="Val1" />
                    </td>
                  </tr></table>
        </asp:View>
        <asp:View ID="View6" runat="server">
             <table class="progressbar">
            <tr>
                <td class="progressbar_7"></td>                
                <td>progressing...</td>
            </tr>
        </table>
             <h3>Training</h3>
            <h5>ONGOING TRAINING</h5>
            <ol start="14"><li><p> <%--orginal number is 20--%>
                <asp:Label ID="lblQ20" runat="server"></asp:Label>
                </p></li></ol>
            <ol type ="A">
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
                                <asp:RadioButtonList ID="rdobtnlstQ20_1_1" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                      <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                                           
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator50" runat="server" ControlToValidate="rdobtnlstQ20_1_1" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>  
                        </tr>
                        <tr>
                            <td class="HVSurvey"><asp:Label ID="lblQ20_1_2" runat="server"></asp:Label></td>
                            <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ20_1_2" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                      <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                                            
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator51" runat="server" ControlToValidate="rdobtnlstQ20_1_2" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>  
                        </tr>
                        <tr>
                            <td class="HVSurvey"><asp:Label ID="lblQ20_1_3" runat="server"></asp:Label></td>
                            <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ20_1_3" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                     <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                                   
                                </asp:RadioButtonList> 
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator52" runat="server" ControlToValidate="rdobtnlstQ20_1_3" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                                </td>
                        </tr>
                        <tr>
                            <td class="HVSurvey"><asp:Label ID="lblQ20_1_4" runat="server"></asp:Label></td>
                            <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ20_1_4" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                      <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                                           
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator53" runat="server" ControlToValidate="rdobtnlstQ20_1_4" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>  
                        </tr>
                         <tr>
                            <td class="HVSurvey"><asp:Label ID="lblQ20_1_5" runat="server"></asp:Label></td>
                            <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ20_1_5" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                      <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                                          
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator54" runat="server" ControlToValidate="rdobtnlstQ20_1_5" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>  
                        </tr>                        
                        <tr>
                             <td class="HVSurvey"><asp:Label ID="lblQ20_1_6" runat="server"></asp:Label></td>
                             <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ20_1_6" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                      <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                                  
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator55" runat="server" ControlToValidate="rdobtnlstQ20_1_6" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                             <td class="HVSurvey"><asp:Label ID="lblQ20_1_7" runat="server"></asp:Label></td>
                          <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ20_1_7" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                      <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                                     
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator56" runat="server" ControlToValidate="rdobtnlstQ20_1_7" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                         <tr>
                             <td class="HVSurvey"><asp:Label ID="lblQ20_1_8" runat="server"></asp:Label></td>
                            <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ20_1_8" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                      <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                                        
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator57" runat="server" ControlToValidate="rdobtnlstQ20_1_8" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                         <tr>
                             <td class="HVSurvey"><asp:Label ID="lblQ20_1_9" runat="server"></asp:Label></td>
                             <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ20_1_9" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                     <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                                           
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator58" runat="server" ControlToValidate="rdobtnlstQ20_1_9" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
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
                            <td class="HVSurvey"><asp:Label ID="lblQ20_2_1" runat="server"></asp:Label></td>
                             <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ20_2_1" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                     <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                           
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator59" runat="server" ControlToValidate="rdobtnlstQ20_2_1" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="HVSurvey"><asp:Label ID="lblQ20_2_2" runat="server"></asp:Label></td>
                             <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ20_2_2" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                    <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                                         
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator60" runat="server" ControlToValidate="rdobtnlstQ20_2_2" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                             <td class="HVSurvey"><asp:Label ID="lblQ20_2_3" runat="server"></asp:Label></td>
                             <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ20_2_3" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                     <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                                          
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator61" runat="server" ControlToValidate="rdobtnlstQ20_2_3" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                             <td class="HVSurvey"><asp:Label ID="lblQ20_2_4" runat="server"></asp:Label></td>
                             <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ20_2_4" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                      <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                                           
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator62" runat="server" ControlToValidate="rdobtnlstQ20_2_4" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                         <tr>
                            <td class="HVSurvey"><asp:Label ID="lblQ20_2_5" runat="server"></asp:Label></td>
                           <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ20_2_5" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                      <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                                           
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator63" runat="server" ControlToValidate="rdobtnlstQ20_2_5" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                         <tr>
                             <td class="HVSurvey"><asp:Label ID="lblQ20_2_6" runat="server"></asp:Label></td>
                             <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ20_2_6" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                     <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>               
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator64" runat="server" ControlToValidate="rdobtnlstQ20_2_6" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="HVSurvey"><asp:Label ID="lblQ20_2_7" runat="server"></asp:Label></td>
                          <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ20_2_7" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                     <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                                       
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator65" runat="server" ControlToValidate="rdobtnlstQ20_2_7" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                             <td class="HVSurvey"><asp:Label ID="lblQ20_2_8" runat="server"></asp:Label></td>
                             <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ20_2_8" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                     <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                               
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator66" runat="server" ControlToValidate="rdobtnlstQ20_2_8" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                         <tr>
                             <td class="HVSurvey"><asp:Label ID="lblQ20_2_9" runat="server"></asp:Label></td>
                             <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ20_2_9" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                     <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                                           
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator67" runat="server" ControlToValidate="rdobtnlstQ20_2_9" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                         <tr>
                             <td class="HVSurvey"><asp:Label ID="lblQ20_2_10" runat="server"></asp:Label></td>
                          <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ20_2_10" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                     <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                                          
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator68" runat="server" ControlToValidate="rdobtnlstQ20_2_10" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                             <td class="HVSurvey"><asp:Label ID="lblQ20_2_11" runat="server"></asp:Label></td>
                            <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ20_2_11" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                    <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                                        
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator69" runat="server" ControlToValidate="rdobtnlstQ20_2_11" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                             <td class="HVSurvey"><asp:Label ID="lblQ20_2_12" runat="server"></asp:Label></td>
                            <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ20_2_12" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                     <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                        
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator70" runat="server" ControlToValidate="rdobtnlstQ20_2_12" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="HVSurvey"><asp:Label ID="lblQ20_2_13" runat="server"></asp:Label></td>
                            <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ20_2_13" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                    <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                                       
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator71" runat="server" ControlToValidate="rdobtnlstQ20_2_13" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                             <td class="HVSurvey"><asp:Label ID="lblQ20_2_14" runat="server"></asp:Label></td>
                             <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ20_2_14" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                      <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                                        
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator72" runat="server" ControlToValidate="rdobtnlstQ20_2_14" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                             <td class="HVSurvey"><asp:Label ID="lblQ20_2_15" runat="server"></asp:Label></td>
                           <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ20_2_15" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                   <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>                                         
                                </asp:RadioButtonList>                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator73" runat="server" ControlToValidate="rdobtnlstQ20_2_15" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
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
                             <td class="HVSurvey"><asp:Label ID="lblQ20_3_1" runat="server"></asp:Label></td>
                             <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ20_3_1" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                    <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>        
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator74" runat="server" ControlToValidate="rdobtnlstQ20_3_1" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>                            
                        </tr>
                        <tr>
                            <td class="HVSurvey"><asp:Label ID="lblQ20_3_2" runat="server"></asp:Label></td>
                            <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ20_3_2" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                     <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>        
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator75" runat="server" ControlToValidate="rdobtnlstQ20_3_2" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>                            
                        </tr>
                        <tr>
                             <td class="HVSurvey"><asp:Label ID="lblQ20_3_3" runat="server"></asp:Label></td>
                            <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ20_3_3" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                     <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>        
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator76" runat="server" ControlToValidate="rdobtnlstQ20_3_3" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>                            
                        </tr>
                        <tr>
                             <td class="HVSurvey"><asp:Label ID="lblQ20_3_4" runat="server"></asp:Label></td>
                           <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ20_3_4" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                      <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>        
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator77" runat="server" ControlToValidate="rdobtnlstQ20_3_4" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>                            
                        </tr>
                         <tr>
                           <td class="HVSurvey"><asp:Label ID="lblQ20_3_5" runat="server"></asp:Label></td>
                           <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ20_3_5" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                     <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>        
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator78" runat="server" ControlToValidate="rdobtnlstQ20_3_5" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                             </td>                            
                        </tr>                                            
                    </table>
                </li>
            </ol>
            <table><tr><td>                      
                <asp:ImageButton ID="imgbtnback6" runat="server" Height="50px" ImageUrl="~/Button/media_seek_backward.png" OnClick="imgbtnback6_Click" style="width: 50px" OnClientClick="window.onbeforeunload=null;" />                      
                </td>
                <td>
                    <asp:ImageButton ID="ImageButton5" runat="server" Height="50px" ImageUrl="~/Button/home.png" OnClick="imgbtnHome0_Click" OnClientClick="closeevent();" />
                </td>
               <td>
                   <asp:ImageButton ID="imgbtnForward6" runat="server" Height="50px" ImageUrl="~/Button/media_seek_forward.png" OnClick="imgbtnForward6_Click" OnClientClick="window.onbeforeunload=null;" ValidationGroup="Val1"/>
               </td>
                <td>
                        <asp:Button ID="btnSave4" runat="server" BackColor="#F3F3F3" BorderStyle="Solid" BorderWidth="5px" Font-Bold="True" Font-Italic="False" Font-Size="X-Large" Font-Strikeout="False" Font-Underline="False" ForeColor="Black" Height="50px" Text="Save" Width="100px"  OnClientClick="window.onbeforeunload=null;" OnClick="btnSave4_Click" ValidationGroup="Val1" />
                    </td>
                  </tr></table>
        </asp:View>
        <asp:View ID="View7" runat="server">
             <table class="progressbar">
            <tr>
                <td class="progressbar_8"></td>                
                <td>progressing...</td>
            </tr>
        </table>
            <h3>Program Materials</h3>
            <h5>MATERIALS AND RESOURCES</h5>
            <ol start="15"><li> <%--orginal number is 21--%>
                <asp:Label ID="lblQ21" runat="server"></asp:Label>
                </li></ol>
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
                           <td class="HVSurvey"><asp:Label ID="lblQ21_1_1" runat="server"></asp:Label></td>
                         <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ21_1_1" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                      <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>        
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator79" runat="server" ControlToValidate="rdobtnlstQ21_1_1" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>                            
                        </tr>
                        <tr>
                             <td class="HVSurvey"><asp:Label ID="lblQ21_1_2" runat="server"></asp:Label></td>
                             <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ21_1_2" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                     <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>        
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator80" runat="server" ControlToValidate="rdobtnlstQ21_2_2" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>                            
                        </tr>
                        <tr>
                            <td class="HVSurvey"><asp:Label ID="lblQ21_1_3" runat="server"></asp:Label></td>
                           <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ21_1_3" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                     <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>        
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator81" runat="server" ControlToValidate="rdobtnlstQ21_1_3" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>                           
                        </tr>
                        <tr>
                             <td class="HVSurvey"><asp:Label ID="lblQ21_1_4" runat="server"></asp:Label></td>
                          <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ21_1_4" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                    <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>        
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator82" runat="server" ControlToValidate="rdobtnlstQ20_1_4" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>                            
                        </tr>
                         <tr>
                             <td class="HVSurvey"><asp:Label ID="lblQ21_1_5" runat="server"></asp:Label></td>
                            <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ21_1_5" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                      <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>        
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator83" runat="server" ControlToValidate="rdobtnlstQ21_1_5" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                             </td>                           
                        </tr>                        
                        <tr>
                             <td class="HVSurvey"><asp:Label ID="lblQ21_1_6" runat="server"></asp:Label></td>
                            <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ21_1_6" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                      <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>        
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator84" runat="server" ControlToValidate="rdobtnlstQ21_1_6" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>                            
                        </tr>
                        <tr>
                            <td class="HVSurvey"><asp:Label ID="lblQ21_1_7" runat="server"></asp:Label></td>
                          <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ21_1_7" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                     <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>        
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator85" runat="server" ControlToValidate="rdobtnlstQ21_1_7" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>                           
                        </tr>
                         <tr>
                             <td class="HVSurvey"><asp:Label ID="lblQ21_1_8" runat="server"></asp:Label></td>
                           <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ21_1_8" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                    <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>        
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator86" runat="server" ControlToValidate="rdobtnlstQ21_1_8" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                             </td>                            
                        </tr>
                         <tr>
                             <td class="HVSurvey"><asp:Label ID="lblQ21_1_9" runat="server"></asp:Label></td>
                           <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ21_1_9" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                     <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>        
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator87" runat="server" ControlToValidate="rdobtnlstQ21_1_9" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
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
                            <td class="HVSurvey"><asp:Label ID="lblQ21_2_1" runat="server"></asp:Label></td>
                           <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ21_2_1" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                     <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>        
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator88" runat="server" ControlToValidate="rdobtnlstQ20_2_1" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>                          
                        </tr>
                        <tr>
                            <td class="HVSurvey"><asp:Label ID="lblQ21_2_2" runat="server"></asp:Label></td>
                            <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ21_2_2" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                      <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>        
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator89" runat="server" ControlToValidate="rdobtnlstQ21_2_2" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>                           
                        </tr>
                        <tr>
                            <td class="HVSurvey"><asp:Label ID="lblQ21_2_3" runat="server"></asp:Label></td>
                            <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ21_2_3" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                      <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>        
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator90" runat="server" ControlToValidate="rdobtnlstQ21_2_3" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>                           
                        </tr>
                        <tr>
                            <td class="HVSurvey"><asp:Label ID="lblQ21_2_4" runat="server"></asp:Label></td>
                            <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ21_2_4" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                      <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>        
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator91" runat="server" ControlToValidate="rdobtnlstQ21_2_4" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>                            
                        </tr>
                         <tr>
                             <td class="HVSurvey"><asp:Label ID="lblQ21_2_5" runat="server"></asp:Label></td>
                         <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ21_2_5" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                      <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>        
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator92" runat="server" ControlToValidate="rdobtnlstQ21_2_5" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                             </td>                           
                        </tr>
                         <tr>
                            <td class="HVSurvey"><asp:Label ID="lblQ21_2_6" runat="server"></asp:Label></td>
                            <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ21_2_6" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                      <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>        
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator93" runat="server" ControlToValidate="rdobtnlstQ21_2_6" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                             </td>                            
                        </tr>
                        <tr>
                             <td class="HVSurvey"><asp:Label ID="lblQ21_2_7" runat="server"></asp:Label></td>
                             <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ21_2_7" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                      <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>        
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator94" runat="server" ControlToValidate="rdobtnlstQ21_2_7" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>                            
                        </tr>
                        <tr>
                           <td class="HVSurvey"><asp:Label ID="lblQ21_2_8" runat="server"></asp:Label></td>
                           <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ21_2_8" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                      <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>        
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator95" runat="server" ControlToValidate="rdobtnlstQ21_2_8" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>                            
                        </tr>
                         <tr>
                             <td class="HVSurvey"><asp:Label ID="lblQ21_2_9" runat="server"></asp:Label></td>
                            <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ21_2_9" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                    <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>        
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator96" runat="server" ControlToValidate="rdobtnlstQ21_2_9" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                             </td>                            
                        </tr>
                         <tr>
                             <td class="HVSurvey"><asp:Label ID="lblQ21_2_10" runat="server"></asp:Label></td>
                             <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ21_2_10" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                     <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>        
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator97" runat="server" ControlToValidate="rdobtnlstQ21_2_10" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                             </td>                            
                        </tr>
                        <tr>
                             <td class="HVSurvey"><asp:Label ID="lblQ21_2_11" runat="server"></asp:Label></td>
                             <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ21_2_11" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                      <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>        
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator98" runat="server" ControlToValidate="rdobtnlstQ21_2_11" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>                            
                        </tr>
                        <tr>
                            <td class="HVSurvey"><asp:Label ID="lblQ21_2_12" runat="server"></asp:Label></td>
                           <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ21_2_12" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                      <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>        
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator99" runat="server" ControlToValidate="rdobtnlstQ20_2_12" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>                           
                        </tr>
                        <tr>
                             <td class="HVSurvey"><asp:Label ID="lblQ21_2_13" runat="server"></asp:Label></td>
                           <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ21_2_13" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                     <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>        
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator100" runat="server" ControlToValidate="rdobtnlstQ21_2_13" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>                            
                        </tr>
                        <tr>
                             <td class="HVSurvey"><asp:Label ID="lblQ21_2_14" runat="server"></asp:Label></td>
                            <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ21_2_14" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                      <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>        
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator101" runat="server" ControlToValidate="rdobtnlstQ21_2_14" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>                            
                        </tr>
                        <tr>
                            <td class="HVSurvey"><asp:Label ID="lblQ21_2_15" runat="server"></asp:Label></td>
                             <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ21_2_15" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                      <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>        
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator102" runat="server" ControlToValidate="rdobtnlstQ21_2_15" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
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
                            <td class="HVSurvey"><asp:Label ID="lblQ21_3_1" runat="server"></asp:Label></td>
                          <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ21_3_1" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                      <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>        
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator103" runat="server" ControlToValidate="rdobtnlstQ21_3_1" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>                            
                        </tr>
                        <tr>
                             <td class="HVSurvey"><asp:Label ID="lblQ21_3_2" runat="server"></asp:Label></td>
                            <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ21_3_2" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                      <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>        
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator104" runat="server" ControlToValidate="rdobtnlstQ21_3_2" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>                           
                        </tr>
                        <tr>
                             <td class="HVSurvey"><asp:Label ID="lblQ21_3_3" runat="server"></asp:Label></td>
                           <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ21_3_3" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                      <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>        
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator105" runat="server" ControlToValidate="rdobtnlstQ20_3_3" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>
                            
                        </tr>
                        <tr>
                             <td class="HVSurvey"><asp:Label ID="lblQ21_3_4" runat="server"></asp:Label></td>
                           <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ21_3_4" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                     <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>        
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator106" runat="server" ControlToValidate="rdobtnlstQ21_3_4" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                            </td>                            
                        </tr>
                         <tr>
                            <td class="HVSurvey"><asp:Label ID="lblQ21_3_5" runat="server"></asp:Label></td>
                             <td class="HVSurvey">
                                <asp:RadioButtonList ID="rdobtnlstQ21_3_5" runat="server" RepeatDirection="Horizontal" CssClass="radioButtonList" CellPadding="5">
                                      <asp:ListItem Value="1">Formal</asp:ListItem>
                                    <asp:ListItem Value="2">Informal</asp:ListItem>
                                    <asp:ListItem Value="3">Not Offered</asp:ListItem>        
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator107" runat="server" ControlToValidate="rdobtnlstQ21_3_5" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                                </td>
                             
                        </tr>                                            
                    </table>
                </li>
            </ol>
            <table><tr><td>                      
                <asp:ImageButton ID="imgbtnback7" runat="server" Height="50px" ImageUrl="~/Button/media_seek_backward.png" OnClick="imgbtnback7_Click" style="width: 50px" OnClientClick="window.onbeforeunload=null;" />                      
                </td>
                <td>
                    <asp:ImageButton ID="ImageButton6" runat="server" Height="50px" ImageUrl="~/Button/home.png" OnClick="imgbtnHome0_Click" OnClientClick="closeevent();" />
                </td>
               <td>
                   <asp:ImageButton ID="imgbtnForward7" runat="server" Height="50px" ImageUrl="~/Button/media_seek_forward.png" OnClick="imgbtnForward7_Click" OnClientClick="window.onbeforeunload=null;" ValidationGroup="Val1"/>
               </td>
                 <td>
                        <asp:Button ID="btnSave5" runat="server" BackColor="#F3F3F3" BorderStyle="Solid" BorderWidth="5px" Font-Bold="True" Font-Italic="False" Font-Size="X-Large" Font-Strikeout="False" Font-Underline="False" ForeColor="Black" Height="50px" Text="Save" Width="100px"  OnClientClick="window.onbeforeunload=null;" OnClick="btnSave5_Click" ValidationGroup="Val1" />
                    </td>
                  </tr></table>
        </asp:View>
        <asp:View ID="View8" runat="server">
            <table class="progressbar">
            <tr>
                <td class="progressbar_9"></td>                
                <td>progressing...</td>
            </tr>
        </table>
            <h3>Written Policies and Procedures</h3>
            <h5>WRITTEN POLICIES AND PROCEDURES</h5>
            The next set of questions relates to your program&#39;s polices and procedures. Please answer these questions thinking about the policies that apply to the home visiting staff providing PI services.
           <asp:UpdatePanel ID="UpdatePanel2" runat="server">
               <ContentTemplate>             

             <ol start="16"><li>
                <asp:Label ID="lblQ22" runat="server"></asp:Label>
                <asp:RadioButtonList ID="rdobtnlstQ22" runat="server" RepeatDirection="Horizontal" DataSourceID="SqlDataSource14" DataTextField="Answer" DataValueField="AnswerValue" AutoPostBack="True" OnSelectedIndexChanged="rdobtnlstQ22_SelectedIndexChanged">
                    <asp:ListItem Value="0">Yes</asp:ListItem>
                    <asp:ListItem Value="1">No</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator108" runat="server" ControlToValidate="rdobtnlstQ22" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                <asp:SqlDataSource ID="SqlDataSource14" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [PROGRAM_DIRECTOR_SURVEY_ANSWERS] WHERE ([Question_ID] = @Question_ID)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="Q22" Name="Question_ID" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                </li>
                <li runat="server" id ="Q23"><asp:Label ID="lblQ23" runat="server"></asp:Label><!--Q17-->
                    <asp:CheckBoxList ID="chkbxlstQ23" runat="server" Height="29px" DataSourceID="SqlDataSource6" DataTextField="Answer" DataValueField="AnswerValue">
                    </asp:CheckBoxList>
                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [PROGRAM_DIRECTOR_SURVEY_ANSWERS] WHERE ([Question_ID] = @Question_ID)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="Q23" Name="Question_ID" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:Label ID="lblQ23Comment" runat="server" ForeColor="Red"></asp:Label>
                </li>
                <li runat="server" id ="Q24"><asp:Label ID="lblQ24" runat="server"></asp:Label>
                    <asp:RadioButtonList ID="rdobtnlstQ24" runat="server" DataSourceID="SqlDataSource16" DataTextField="Answer" DataValueField="AnswerValue">
                        <asp:ListItem Value="0">Annually </asp:ListItem>
                        <asp:ListItem Value="1">Every two years</asp:ListItem>
                        <asp:ListItem Value="2">Every three years</asp:ListItem>
                        <asp:ListItem Value="3">Only as needed</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:Label ID="lblQ24Comment" runat="server" ForeColor="Red"></asp:Label>
                    <asp:SqlDataSource ID="SqlDataSource16" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [PROGRAM_DIRECTOR_SURVEY_ANSWERS] WHERE ([Question_ID] = @Question_ID)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="Q24" Name="Question_ID" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </li>
                <li runat="server" id ="Q25"><asp:Label ID="lblQ25" runat="server"></asp:Label>
                    <asp:DropDownList ID="ddlMonth" runat="server">
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
                   <asp:DropDownList ID="ddlYear" runat="server">
                        <asp:ListItem>YEAR</asp:ListItem>                        
                    </asp:DropDownList>
                    <asp:Label ID="lblQ25Comment" runat="server" ForeColor="Red"></asp:Label>
                </li>
                 </ol>
                   </ContentTemplate>
           </asp:UpdatePanel>
                   <ol start ="20">
                <li><asp:Label ID="lblQ26" runat="server"></asp:Label>
                    <asp:RadioButtonList ID="rdobtnlstQ26" runat="server" RepeatDirection="Horizontal" DataSourceID="SqlDataSource17" DataTextField="Answer" DataValueField="AnswerValue">
                        <asp:ListItem Value="0">Yes</asp:ListItem>
                        <asp:ListItem Value="1">No</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator110" runat="server" ControlToValidate="rdobtnlstQ26" ErrorMessage="Required" ValidationGroup="Val1"></asp:RequiredFieldValidator>
                    <asp:SqlDataSource ID="SqlDataSource17" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [PROGRAM_DIRECTOR_SURVEY_ANSWERS] WHERE ([Question_ID] = @Question_ID)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="Q26" Name="Question_ID" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <table>
                        <tr>
                            <td>
                                If yes, Please describe:
                            </td>
                            <td> 
                                <asp:TextBox ID="txtQ26Explain" runat="server" Height="75px" TextMode="MultiLine" Width="300px"></asp:TextBox>
                                <asp:Label ID="lblQ26Comment" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                    </table>                    
                </li>
            </ol>
            <table>
                <tr>
                <td>
                    <asp:ImageButton ID="imgbtnback8" runat="server" Height="50px" ImageUrl="~/Button/media_seek_backward.png" OnClick="imgbtnback8_Click"  OnClientClick="window.onbeforeunload=null;"/> 
                </td> 
                    <td>
                        <asp:ImageButton ID="ImageButton7" runat="server" Height="50px" ImageUrl="~/Button/home.png" OnClick="imgbtnHome0_Click" OnClientClick="closeevent();"/>
                    </td>               
               <td>
                   <asp:ImageButton ID="imgbtnForward8" runat="server" Height="50px" ImageUrl="~/Button/media_seek_forward.png" OnClick="imgbtnForward8_Click" OnClientClick="window.onbeforeunload=null;" ValidationGroup="Val1"/>                   
               </td>
                    <td>
                        <asp:Button ID="btnsave6" runat="server" BackColor="#F3F3F3" BorderStyle="Solid" BorderWidth="5px" Font-Bold="True" Font-Italic="False" Font-Size="X-Large" Font-Strikeout="False" Font-Underline="False" ForeColor="Black" Height="50px" Text="Save" Width="100px"  OnClientClick="window.onbeforeunload=null;" OnClick="btnsave6_Click" ValidationGroup="Val1"/>
                    </td>
                  </tr></table>
        </asp:View>
        <asp:View ID="View9" runat="server">
                 <table class="progressbar">
            <tr>
                <td class="progressbar_15"></td>                
                <td></td>
            </tr>
        </table>
            <h3>Data Collection Process</h3>
            <p>The next set of questions lists specific types of data you may collect. For each section, indicate which types of data you are collecting on a regular and consistent basis from your families.</p>
           <ol start="21">
               <li><p>
                   <asp:Label ID="lblQ27" runat="server"></asp:Label></p>                   
                   <asp:CheckBoxList ID="chkbxlstQ27" runat="server" DataSourceID="SqlDataSource7" DataTextField="Answer" DataValueField="AnswerValue"></asp:CheckBoxList>
                   <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [PROGRAM_DIRECTOR_SURVEY_ANSWERS] WHERE ([Question_ID] = @Question_ID)">
                       <SelectParameters>
                           <asp:Parameter DefaultValue="Q27" Name="Question_ID" Type="String" />
                       </SelectParameters>
                   </asp:SqlDataSource>
                   <asp:TextBox ID="txtQ27Explain" runat="server"></asp:TextBox>
                   <asp:Label ID="lblQ27Comment" runat="server" ForeColor="Red"></asp:Label>
               </li>
               <li><p><asp:Label ID="lblQ28" runat="server"></asp:Label></p> 
                   <asp:CheckBoxList ID="chkbxlstQ28" runat="server" DataSourceID="SqlDataSource8" DataTextField="Answer" DataValueField="AnswerValue" style="margin-right: 0px">
                   </asp:CheckBoxList>
                   <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [PROGRAM_DIRECTOR_SURVEY_ANSWERS] WHERE ([Question_ID] = @Question_ID)">
                       <SelectParameters>
                           <asp:Parameter DefaultValue="Q28" Name="Question_ID" Type="String" />
                       </SelectParameters>
                   </asp:SqlDataSource>
                   <asp:Label ID="lblQ28Comment" runat="server" ForeColor="Red"></asp:Label>
               </li>
               <li><p><asp:Label ID="lblQ29" runat="server"></asp:Label></p>
                   <asp:CheckBoxList ID="chkbxlstQ29" runat="server" DataSourceID="SqlDataSource9" DataTextField="Answer" DataValueField="AnswerValue">
                   </asp:CheckBoxList>
                   <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [PROGRAM_DIRECTOR_SURVEY_ANSWERS] WHERE ([Question_ID] = @Question_ID)">
                       <SelectParameters>
                           <asp:Parameter DefaultValue="Q29" Name="Question_ID" Type="String" />
                       </SelectParameters>
                   </asp:SqlDataSource>
                   <asp:Label ID="lblQ29Comment" runat="server" ForeColor="Red"></asp:Label>
               </li>
               <li><p><asp:Label ID="lblQ30" runat="server"></asp:Label></p>
                   <asp:CheckBoxList ID="chkbxlstQ30" runat="server" DataSourceID="SqlDataSource10" DataTextField="Answer" DataValueField="AnswerValue">
                   </asp:CheckBoxList>
                   <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [PROGRAM_DIRECTOR_SURVEY_ANSWERS] WHERE ([Question_ID] = @Question_ID)">
                       <SelectParameters>
                           <asp:Parameter DefaultValue="Q30" Name="Question_ID" Type="String" />
                       </SelectParameters>
                   </asp:SqlDataSource>
                   <asp:Label ID="lblQ30Comment" runat="server" ForeColor="Red"></asp:Label>
               </li>
               <li><p><asp:Label ID="lblQ31" runat="server"></asp:Label></p>
                    <asp:CheckBoxList ID="chkbxlstQ31" runat="server" DataSourceID="SqlDataSource11" DataTextField="Answer" DataValueField="AnswerValue">
                   </asp:CheckBoxList>
                   <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [PROGRAM_DIRECTOR_SURVEY_ANSWERS] WHERE ([Question_ID] = @Question_ID)">
                       <SelectParameters>
                           <asp:Parameter DefaultValue="Q31" Name="Question_ID" Type="String" />
                       </SelectParameters>
                   </asp:SqlDataSource>
                   <asp:Label ID="lblQ31Comment" runat="server" ForeColor="Red"></asp:Label>
               </li>               
               <li><p><asp:Label ID="lblQ32" runat="server"></asp:Label></p>
                   <asp:CheckBoxList ID="chkbxlstQ32" runat="server" DataSourceID="SqlDataSource12" DataTextField="Answer" DataValueField="AnswerValue">
                   </asp:CheckBoxList>
                   <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [PROGRAM_DIRECTOR_SURVEY_ANSWERS] WHERE ([Question_ID] = @Question_ID)">
                       <SelectParameters>
                           <asp:Parameter DefaultValue="Q32" Name="Question_ID" Type="String" />
                       </SelectParameters>
                   </asp:SqlDataSource>
                   <asp:Label ID="lblQ32Comment" runat="server" ForeColor="Red"></asp:Label>
               </li>
               <li><p><asp:Label ID="lblQ33" runat="server"></asp:Label></p>
                   <asp:CheckBoxList ID="chkbxlstQ33" runat="server" DataSourceID="SqlDataSource13" DataTextField="Answer" DataValueField="AnswerValue">
                   </asp:CheckBoxList>
                   <asp:SqlDataSource ID="SqlDataSource13" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [PROGRAM_DIRECTOR_SURVEY_ANSWERS] WHERE ([Question_ID] = @Question_ID)">
                       <SelectParameters>
                           <asp:Parameter DefaultValue="Q33" Name="Question_ID" Type="String" />
                       </SelectParameters>
                   </asp:SqlDataSource>
                   <asp:Label ID="lblQ33Comment" runat="server" ForeColor="Red"></asp:Label>
               </li>
               <li><p><asp:Label ID="lblQ34" runat="server"></asp:Label></p>
                   <asp:CheckBoxList ID="chkbxlstQ34" runat="server" DataSourceID="SqlDataSource15" DataTextField="Answer" DataValueField="AnswerValue">
                   </asp:CheckBoxList>
                   <asp:SqlDataSource ID="SqlDataSource15" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [PROGRAM_DIRECTOR_SURVEY_ANSWERS] WHERE ([Question_ID] = @Question_ID)">
                       <SelectParameters>
                           <asp:Parameter DefaultValue="Q34" Name="Question_ID" Type="String" />
                       </SelectParameters>
                   </asp:SqlDataSource>
                   <asp:Label ID="lblQ34Comment" runat="server" ForeColor="Red"></asp:Label>
               </li>
               <li><p><asp:Label ID="lblQ35" runat="server"></asp:Label></p>
                   <asp:CheckBoxList ID="chkbxlstQ35" runat="server" DataSourceID="SqlDataSource18" DataTextField="Answer" DataValueField="AnswerValue">
                   </asp:CheckBoxList>
                   <asp:SqlDataSource ID="SqlDataSource18" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [PROGRAM_DIRECTOR_SURVEY_ANSWERS] WHERE ([Question_ID] = @Question_ID)">
                       <SelectParameters>
                           <asp:Parameter DefaultValue="Q35" Name="Question_ID" Type="String" />
                       </SelectParameters>
                   </asp:SqlDataSource>
                   <asp:Label ID="lblQ35Comment" runat="server" ForeColor="Red"></asp:Label>
               </li>
           </ol>
            <table>
                <tr>
                <td>
                    <asp:ImageButton ID="imgbtnback9" runat="server" Height="50px" ImageUrl="~/Button/media_seek_backward.png" OnClick="imgbtnback9_Click"  /> 
                </td>                
               <td>                   
                   <asp:Button ID="btnSubmit" runat="server" BackColor="#F3F3F3" BorderStyle="Solid" BorderWidth="5px" Font-Bold="True" Font-Italic="False" Font-Size="X-Large" Font-Strikeout="False" Font-Underline="False" ForeColor="Black" Height="50px" Text="Submit" Width="100px" OnClick="btnSubmit_Click" ValidationGroup="Val1" />
               </td>
                  </tr></table>
        </asp:View>
       
    </asp:MultiView>
</asp:Content>
