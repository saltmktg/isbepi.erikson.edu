<%@ Page Title="" Language="C#" MasterPageFile="~/PICCTool/NMPICC.master" AutoEventWireup="true" CodeBehind="PiccFinal.aspx.cs" Inherits="HVP.PICCTool.PiccFinal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="NesterContent" runat="server">
    <div class="userlist">
         <asp:UpdatePanel ID="UpdatePanel1" runat="server">
             <ContentTemplate>
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
                <div>
                    <div>
                        <asp:HiddenField ID="hfsiteid" runat="server" />
                        <asp:HiddenField ID="hfSchdId" runat="server" />
                        <h3 class="finaltoolTitle">1. Identification of the Prevention Initiative program framework. (HV, CB, FL)</h3>
                    </div>
                    <div>
                        <table class="d">
                            <tr>
                                <td class="picc">Compliance 
                                </td>
                                <td class="picc">Documentation 
                                </td>
                                <td class="picc">Notes 
                                </td>
                            </tr>
                            <tr>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <strong>1.1</strong><br />
                                            <asp:RadioButton ID="chk_Comp_Q1_1_1" GroupName="q1" runat="server" />
                                            <%--<asp:CheckBox ID="chk_Comp_Q1_1_1" runat="server" />--%><asp:Label ID="lbl_Comp_Q1_1_1" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                             <asp:RadioButton ID="chk_Comp_Q1_1_2" GroupName="q1" runat="server" />
                                           <%-- <asp:CheckBox ID="chk_Comp_Q1_1_2" runat="server" />--%><asp:Label ID="lbl_Comp_Q1_1_2" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                             <asp:RadioButton ID="chk_Comp_Q1_1_3" GroupName="q1" runat="server" />
                                            <%--<asp:CheckBox ID="chk_Comp_Q1_1_3" runat="server" />--%><asp:Label ID="lbl_Comp_Q1_1_3" runat="server"></asp:Label>
                                        </li>
                                    </ul>        
                                    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>                            
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Docu_Q1_1_1" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q1_1_2" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="scoring">

                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <strong>1.2</strong>
                                            <br />
                                            <asp:RadioButton ID="chk_Comp_Q1_2_1" GroupName="Q1_2" runat="server" />
                                            <%--<asp:CheckBox ID="chk_Comp_Q1_2_1" runat="server" />--%><asp:Label ID="lbl_Comp_Q1_2_1" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:RadioButton ID="chk_Comp_Q1_2_2" GroupName="Q1_2" runat="server" />
                                            <%--<asp:CheckBox ID="chk_Comp_Q1_2_2" runat="server" />--%><asp:Label ID="lbl_Comp_Q1_2_2" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:Label ID="lbl_Comp_Q1_2_2_1" runat="server"></asp:Label>
                                                    <asp:TextBox ID="txtPicc_Comp_Q1_2_2_1" runat="server"></asp:TextBox>
                                                </li>
                                                <li>
                                                    <asp:Label ID="lbl_Comp_Q1_2_2_2" runat="server"></asp:Label>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>       
                                    <asp:PlaceHolder ID="PlaceHolder2" runat="server"></asp:PlaceHolder>                                                         
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Docu_Q1_2" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q1_2" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <asp:LinkButton ID="lnkPicc_Q1_Click" runat="server" OnClick="lnkPicc_Q1_Click_Click" ValidationGroup="val1">Next</asp:LinkButton>
                    </div>
                </div>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <div>
                    <div>
                        <h3 class="finaltoolTitle">2. Identification of the program model implemented for parent education. (HV, CB, FL) 
                            [23 Ill. Adm. Code 235.40(a)] and ISBE policy (new rules)
                        </h3>
                    </div>
                    <div>
                        <table class="d">
                            <tr>
                                <td class="picc">Compliance 
                                </td>
                                <td class="picc">Documentation 
                                </td>
                                <td class="picc">Notes 
                                </td>
                            </tr>
                            <tr>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <strong>2.1</strong>
                                            <asp:RadioButtonList ID="rdobtn_Comp_Q2_2_1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Questions" DataValueField="DropDownNumbers"></asp:RadioButtonList>                                            
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [PiccQuestions] WHERE ([Label_ID] = @Label_ID)">
                                                <SelectParameters>
                                                    <asp:Parameter DefaultValue="rdobtn_Comp_Q2_2_1" Name="Label_ID" Type="String" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </li>
                                        <li>
                                            <asp:TextBox ID="txt_Comp_Q2_Other" runat="server"></asp:TextBox>
                                        </li>
                                    </ul>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q2_2_1" ValidationGroup="val2"></asp:RequiredFieldValidator>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Docu_Q2_1" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q2" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <asp:LinkButton ID="lnkPicc_Q2" runat="server" OnClick="lnkPicc_Q2_Click2" ValidationGroup="val2">Next</asp:LinkButton>
                    </div>
                </div>
            </asp:View>
            <asp:View ID="View3" runat="server">
                <div>
                    <div>
                        <h3 class="finaltoolTitle">3. Identification of the program’s fidelity to the program model. (HV, CB, FL)</h3>
                    </div>
                    <div>
                        <table class="d">
                            <tr>
                                <td class="picc">Compliance 
                                </td>
                                <td class="picc">Documentation 
                                </td>
                                <td class="picc">Notes 
                                </td>
                            </tr>
                            <tr>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <strong>3.1</strong>
                                            <asp:Label ID="lbl_Comp_Q3_1" runat="server"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q3_1" runat="server" ValidationGroup="val3">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q3_1" ValidationGroup="val3"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>

                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <p>Describe the evidence that the program presented to illustrate compliance with the program model.</p>
                                    <ul style="list-style-type: none" class="checkbox-list">


                                        <li>Program Model Documentation:
                                        </li>
                                        <li>
                                            <asp:RadioButtonList ID="rdoPicc_Docu_Q3_1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Questions" DataValueField="DropDownNumbers"></asp:RadioButtonList>
                                            <asp:TextBox ID="txtPicc_Doc_Q3_Other" runat="server"></asp:TextBox>
                                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [PiccQuestions] WHERE ([Label_ID] = @Label_ID)">
                                                <SelectParameters>
                                                    <asp:Parameter DefaultValue="rdoPicc_Docu_Q3_1" Name="Label_ID" Type="String" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </li>
                                    </ul>
                                    <asp:PlaceHolder ID="PlaceHolder3" runat="server"></asp:PlaceHolder>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q3" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <asp:LinkButton ID="lnkPicc_Q3" runat="server" OnClick="lnkPicc_Q3_Click3" ValidationGroup="val3">Next</asp:LinkButton>
                    </div>
                </div>
            </asp:View>
            <asp:View ID="View4" runat="server">
                <div>
                    <div>
                        <h3 class="finaltoolTitle">4. Program has a mission statement based on shared beliefs developed cooperatively by parents/guardians, families, staff members, and community representatives. (HV, CB, FL) 
[23 Ill. Adm. Code 235.20(c)(2)(A)] and ISBE policy
                        </h3>
                    </div>
                    <div>
                        <table class="d">
                            <tr>
                                <td class="picc">Compliance 
                                </td>
                                <td class="picc">Documentation 
                                </td>
                                <td class="picc">Notes 
                                </td>
                            </tr>
                            <tr>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <strong>4.1</strong>
                                            <asp:Label ID="lbl_Comp_Q4_1" runat="server"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q4_1" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </li>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q4_1" ValidationGroup="Val4"></asp:RequiredFieldValidator>
                                            </ul>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:CheckBox ID="chk_Comp_Q4_1_1" runat="server" /><asp:Label ID="lbl_Comp_Q4_1_1" runat="server"></asp:Label>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">

                                        <li>
                                            <asp:CheckBox ID="chk__Docu_Q4" runat="server" />
                                            <asp:Label ID="lblPicc_Docu_Q4" runat="server"></asp:Label>

                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q4" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <asp:LinkButton ID="lnkPicc_Q4" runat="server" OnClick="lnkPicc_Q4_Click4" ValidationGroup="Val4">Next</asp:LinkButton>
                    </div>
                </div>
            </asp:View>
            <asp:View ID="View5" runat="server">
                <div>
                    <div>
                        <h3 class="finaltoolTitle">5. The program will not collect any fees from parents/guardians and their children who are enrolled. (HV, CB, FL) 
[23 Ill. Adm. Code 235.20(c)(16)] and ISBE policy

                        </h3>
                    </div>
                    <div>
                        <table class="d">
                            <tr>
                                <td class="picc">Compliance 
                                </td>
                                <td class="picc">Documentation 
                                </td>
                                <td class="picc">Notes 
                                </td>
                            </tr>
                            <tr>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <strong>5.1</strong>
                                            <asp:Label ID="lbl_Comp_Q5_1" runat="server"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q5_1_1" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </li>                                                
                                            </ul>
                                        </li>
                                    </ul>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q5_1_1" ValidationGroup="Val5"></asp:RequiredFieldValidator>
                                </td>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">

                                        <li>
                                            <asp:TextBox ID="txt_Docu_Q5_1" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q5_1" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <strong>5.2</strong>
                                            <asp:Label ID="lbl_Comp_Q5_2" runat="server"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q5_2_1" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q5_2_1" ValidationGroup="Val5"></asp:RequiredFieldValidator>
                                </td>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q5_2_1" runat="server" /><asp:Label ID="lbl_Docu_Q5_2_1" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q5_2_2" runat="server" /><asp:Label ID="lbl_Docu_Q5_2_2" runat="server"></asp:Label>
                                            <asp:TextBox ID="txt_Docu_Q5_2_2" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q5_2" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                         <br />
                        <asp:LinkButton ID="lnkPicc_Q5" runat="server" OnClick="lnkPicc_Q5_Click5" ValidationGroup="Val5">Next</asp:LinkButton>
                    </div>
                </div>
            </asp:View>
            <asp:View ID="View6" runat="server">
                <div>
                    <div>
                        <h3 class="finaltoolTitle">6. The program employs qualified staff in accordance with the program model being implemented. (HV, CB, FL) 
[23 Ill. Adm. Code 235.20(9)] and ISBE policy


                        </h3>
                    </div>
                    <div>
                        <table class="d">
                            <tr>
                                <td class="picc">Compliance 
                                </td>
                                <td class="picc">Documentation 
                                </td>
                                <td class="picc">Notes 
                                </td>
                            </tr>
                            <tr>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">

                                        <li>
                                            <strong>6.1</strong>
                                            <asp:Label ID="lbl_Comp_Q6_1" runat="server"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q6_1" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q6_1" ValidationGroup="Val6"></asp:RequiredFieldValidator>
                                </td>
                                <td class="scoring">

                                    <ul style="list-style-type: none" class="checkbox-list">

                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q6_1_1" runat="server" /><asp:Label ID="lbl_Docu_Q6_1_1" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q6_1_2" runat="server" /><asp:Label ID="lbl_Docu_Q6_1_2" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q6_1_3" runat="server" /><asp:Label ID="lbl_Docu_Q6_1_3" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q6_1_4" runat="server" /><asp:Label ID="lbl_Docu_Q6_1_4" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q6_1_5" runat="server" /><asp:Label ID="lbl_Docu_Q6_1_5" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:TextBox ID="txt_Docu_Q6_1_1" runat="server"></asp:TextBox>
                                        </li>
                                        <li>
                                            <asp:TextBox ID="txt_Docu_Q6_1_2" runat="server"></asp:TextBox>
                                        </li>
                                        <li>
                                            <asp:TextBox ID="txt_Docu_Q6_1_3" runat="server"></asp:TextBox>
                                        </li>
                                        <li>
                                            <asp:TextBox ID="txt_Docu_Q6_1_4" runat="server"></asp:TextBox>
                                        </li>
                                        <li>
                                            <asp:TextBox ID="txt_Docu_Q6_1_5" runat="server"></asp:TextBox>
                                        </li>
                                        <li>
                                            <asp:TextBox ID="txt_Docu_Q6_1_6" runat="server"></asp:TextBox>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">List staff, educational level, certifications and/or credentials:                                 
                                    <asp:TextBox ID="txtPicc_Notes_Q6" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <strong>6.2</strong>
                                            <asp:Label ID="lbl_Comp_Q6_2" runat="server"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q6_2" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q6_2" ValidationGroup="Val6"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <strong>6.3</strong>
                                            <asp:Label ID="lbl_Comp_Q6_3" runat="server"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q6_3" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q6_3" ValidationGroup="Val6"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <strong>6.4</strong>
                                            <asp:Label ID="lbl_Comp_Q6_4" runat="server"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q6_4" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q6_4" ValidationGroup="Val6"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:CheckBox ID="chkbx_Comp_Q6_4_1" runat="server" /><asp:Label ID="lbl_Comp_Q6_4_1" runat="server"></asp:Label>
                                                </li>
                                                <li>
                                                    <asp:CheckBox ID="chkbx_Comp_Q6_4_2" runat="server" /><asp:Label ID="lbl_Comp_Q6_4_2" runat="server"></asp:Label>
                                                </li>
                                                <li>
                                                    <asp:CheckBox ID="chkbx_Comp_Q6_4_3" runat="server" /><asp:Label ID="lbl_Comp_Q6_4_3" runat="server"></asp:Label>
                                                    <p>If Contracted or Other, please specify:</p>
                                                    <asp:TextBox ID="txt_Comp_Q6_4_3" runat="server"></asp:TextBox>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q6_2_1" runat="server"></asp:CheckBox>
                                            <asp:Label ID="lbl_Docu_Q6_2_1" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q6_2_2" runat="server"></asp:CheckBox>
                                            <asp:Label ID="lbl_Docu_Q6_2_2" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q6_2_3" runat="server"></asp:CheckBox>
                                            <asp:Label ID="lbl_Docu_Q6_2_3" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q6_2_4" runat="server"></asp:CheckBox>
                                            <asp:Label ID="lbl_Docu_Q6_2_4" runat="server"></asp:Label>
                                            <asp:TextBox ID="txt_Docu_Q6_2_4" runat="server" TextMode="MultiLine" Width="250px" Height="80px"></asp:TextBox>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q6_2_5" runat="server"></asp:CheckBox>
                                            <asp:Label ID="lbl_Docu_Q6_2_5" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q6_2_6" runat="server"></asp:CheckBox>
                                            <asp:Label ID="lbl_Docu_Q6_2_6" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q6_2_7" runat="server"></asp:CheckBox>
                                            <asp:Label ID="lbl_Docu_Q6_2_7" runat="server"></asp:Label>
                                            <asp:TextBox ID="txt_Docu_Q6_2_7" runat="server" TextMode="MultiLine" Width="250px" Height="80px"></asp:TextBox>
                                        </li>
                                    </ul>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtPicc_Notes_Q6_2" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                         <br />
                        <asp:LinkButton ID="lnkPicc_Q6" runat="server" OnClick="lnkPicc_Q6_Click6" ValidationGroup="Val6">Next</asp:LinkButton>
                    </div>
                </div>
            </asp:View>
            <asp:View ID="View7" runat="server">
                <div>
                    <div>
                        <h3 class="finaltoolTitle">7. The program has developed policies and procedures. (HV, CB, FL) 
                        [23 Ill. Adm. Code 235.Appendix B and ISBE policy</h3>
                    </div>
                    <div>
                        <table class="d">
                            <tr>
                                <td class="picc">Compliance 
                                </td>
                                <td class="picc">Documentation 
                                </td>
                                <td class="picc">Notes 
                                </td>
                            </tr>
                            <tr>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <strong>7.1</strong>
                                            <asp:Label ID="lbl_Comp_Q7_1" runat="server"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q7_1" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q7_1" ValidationGroup="Val7"></asp:RequiredFieldValidator>
                                </td>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q7_1_1" runat="server"></asp:CheckBox>
                                            <asp:Label ID="lbl_Docu_Q7_1_1" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q7_1_2" runat="server"></asp:CheckBox>
                                            <asp:Label ID="lbl_Docu_Q7_1_2" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q7_1_3" runat="server"></asp:CheckBox>
                                            <asp:Label ID="lbl_Docu_Q7_1_3" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q7_1_4" runat="server"></asp:CheckBox>
                                            <asp:Label ID="lbl_Docu_Q7_1_4" runat="server"></asp:Label>
                                            <asp:TextBox ID="txt_Docu_Q7_1_4" runat="server"></asp:TextBox>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q7_1" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <strong>7.2</strong>
                                            <asp:Label ID="lbl_Comp_Q7_2" runat="server"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q7_2" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q7_2" ValidationGroup="Val7"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                            <p>The manual provides guidance on the following topics:</p>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:CheckBox ID="chk_Comp_Q7_2_1" runat="server" />
                                                    <asp:Label ID="lbl_Comp_Q7_2_1" runat="server"></asp:Label>
                                                </li>
                                                <li>
                                                    <asp:CheckBox ID="chk_Comp_Q7_2_2" runat="server" />
                                                    <asp:Label ID="lbl_Comp_Q7_2_2" runat="server"></asp:Label>
                                                </li>
                                                <li>
                                                    <asp:CheckBox ID="chk_Comp_Q7_2_3" runat="server" />
                                                    <asp:Label ID="lbl_Comp_Q7_2_3" runat="server"></asp:Label>
                                                </li>
                                                <li>
                                                    <asp:CheckBox ID="chk_Comp_Q7_2_4" runat="server" />
                                                    <asp:Label ID="lbl_Comp_Q7_2_4" runat="server"></asp:Label>
                                                    <ul style="list-style-type: none" class="checkbox-list">
                                                        <li>
                                                            <asp:CheckBox ID="chk_Comp_Q7_2_4_1" runat="server" />
                                                            <asp:Label ID="lbl_Comp_Q7_2_4_1" runat="server"></asp:Label>
                                                        </li>
                                                        <li>
                                                            <asp:CheckBox ID="chk_Comp_Q7_2_4_2" runat="server" />
                                                            <asp:Label ID="lbl_Comp_Q7_2_4_2" runat="server"></asp:Label>
                                                        </li>
                                                        <li>
                                                            <asp:CheckBox ID="chk_Comp_Q7_2_4_3" runat="server" />
                                                            <asp:Label ID="lbl_Comp_Q7_2_4_3" runat="server"></asp:Label>
                                                        </li>
                                                        <li>
                                                            <asp:CheckBox ID="chk_Comp_Q7_2_4_4" runat="server" />
                                                            <asp:Label ID="lbl_Comp_Q7_2_4_4" runat="server"></asp:Label>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li>
                                                    <asp:CheckBox ID="chk_Comp_Q7_2_5" runat="server" />
                                                    <asp:Label ID="lbl_Comp_Q7_2_5" runat="server"></asp:Label>
                                                    <ul style="list-style-type: none" class="checkbox-list">
                                                        <li>
                                                            <asp:CheckBox ID="chk_Comp_Q7_2_5_1" runat="server" />
                                                            <asp:Label ID="lbl_Comp_Q7_2_5_1" runat="server"></asp:Label>
                                                        </li>
                                                        <li>
                                                            <asp:CheckBox ID="chk_Comp_Q7_2_5_2" runat="server" />
                                                            <asp:Label ID="lbl_Comp_Q7_2_5_2" runat="server"></asp:Label>
                                                        </li>
                                                        <li>
                                                            <asp:CheckBox ID="chk_Comp_Q7_2_5_3" runat="server" />
                                                            <asp:Label ID="lbl_Comp_Q7_2_5_3" runat="server"></asp:Label>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li>
                                                    <asp:CheckBox ID="chk_Comp_Q7_2_6" runat="server" />
                                                    <asp:Label ID="lbl_Comp_Q7_2_6" runat="server"></asp:Label>
                                                </li>
                                                <li>
                                                    <asp:CheckBox ID="chk_Comp_Q7_2_7" runat="server" />
                                                    <asp:Label ID="lbl_Comp_Q7_2_7" runat="server"></asp:Label>
                                                </li>
                                                <li>
                                                    <asp:CheckBox ID="chk_Comp_Q7_2_8" runat="server" />
                                                    <asp:Label ID="lbl_Comp_Q7_2_8" runat="server"></asp:Label>
                                                </li>
                                                <li>
                                                    <asp:CheckBox ID="chk_Comp_Q7_2_9" runat="server" />
                                                    <asp:Label ID="lbl_Comp_Q7_2_9" runat="server"></asp:Label>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q7_2_1" runat="server"></asp:CheckBox>
                                            <asp:Label ID="lbl_Docu_Q7_2_1" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q7_2_2" runat="server"></asp:CheckBox>
                                            <asp:Label ID="lbl_Docu_Q7_2_2" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q7_2_3" runat="server"></asp:CheckBox>
                                            <asp:Label ID="lbl_Docu_Q7_2_3" runat="server"></asp:Label>
                                            <asp:TextBox ID="txt_Docu_Q7_2_1" runat="server"></asp:TextBox>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q7_2" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <strong>7.3</strong>
                                            <asp:Label ID="lbl_Comp_Q7_3" runat="server"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q7_3" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q7_3" ValidationGroup="Val7"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                            <p>This plan touches upon the following topics:</p>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:CheckBox ID="chk_Comp_Q7_3_1" runat="server"></asp:CheckBox>
                                                    <asp:Label ID="lbl_Comp_Q7_3_1" runat="server"></asp:Label>
                                                </li>
                                                <li>
                                                    <asp:CheckBox ID="chk_Comp_Q7_3_2" runat="server"></asp:CheckBox>
                                                    <asp:Label ID="lbl_Comp_Q7_3_2" runat="server"></asp:Label>
                                                </li>
                                                <li>
                                                    <asp:CheckBox ID="chk_Comp_Q7_3_3" runat="server"></asp:CheckBox>
                                                    <asp:Label ID="lbl_Comp_Q7_3_3" runat="server"></asp:Label>
                                                </li>
                                                <li>
                                                    <asp:CheckBox ID="chk_Comp_Q7_3_4" runat="server"></asp:CheckBox>
                                                    <asp:Label ID="lbl_Comp_Q7_3_4" runat="server"></asp:Label>
                                                </li>
                                                <li>
                                                    <asp:CheckBox ID="chk_Comp_Q7_3_5" runat="server"></asp:CheckBox>
                                                    <asp:Label ID="lbl_Comp_Q7_3_5" runat="server"></asp:Label>
                                                </li>
                                                <li>
                                                    <asp:CheckBox ID="chk_Comp_Q7_3_6" runat="server"></asp:CheckBox>
                                                    <asp:Label ID="lbl_Comp_Q7_3_6" runat="server"></asp:Label>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q7_3_1" runat="server"></asp:CheckBox>
                                            <asp:Label ID="lbl_Docu_Q7_3_1" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q7_3_2" runat="server"></asp:CheckBox>
                                            <asp:Label ID="lbl_Docu_Q7_3_2" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="Chchk_Docu_Q7_3_3" runat="server"></asp:CheckBox>
                                            <asp:Label ID="lbl_Docu_Q7_3_3" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q7_3_4" runat="server"></asp:CheckBox>
                                            <asp:Label ID="lbl_Docu_Q7_3_4" runat="server"></asp:Label>
                                            <asp:TextBox ID="txt_Docu_Q7_3_4" runat="server"></asp:TextBox>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q7_3" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                         <br />
                        <asp:LinkButton ID="lnkPicc_Q7" runat="server" OnClick="lnkPicc_Q7_Click7" ValidationGroup="Val7">Next</asp:LinkButton>
                    </div>
                </div>
            </asp:View>
            <asp:View ID="View8" runat="server">
                <div>
                    <div>
                        <h3 class="finaltoolTitle">8. Eligibility screening procedures include all required documentation and are found in each child’s file as applicable. (HV, CB, FL) 
[23 Ill. Adm. Code 235.20(c)(6)(A-F), 235.40(b)(c), 235.50(a)(1)(A-C)] and ISBE policy 
                        </h3>
                    </div>
                    <div>
                        <table class="d">
                            <tr>
                                <td class="picc">Compliance</td>
                                <td class="picc">Documentation</td>
                                <td class="picc">Notes</td>
                            </tr>
                            <tr>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <strong>8.1</strong>
                                            <asp:Label ID="lbl_Comp_Q8_1" runat="server"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q8_1" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q8_1" ValidationGroup="Val8"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">

                                    <ul style="list-style-type: none" class="checkbox-list">

                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q8_1" runat="server" /><asp:Label ID="lbl_Docu_Q8_1" runat="server"></asp:Label>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q8_1" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <strong>8.2</strong>
                                            <asp:Label ID="lbl_Comp_Q8_2" runat="server"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q8_2" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q8_2" ValidationGroup="Val8"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <strong>8.3</strong>
                                            <asp:Label ID="lbl_Comp_Q8_3" runat="server"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q8_3" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q8_3" ValidationGroup="Val8"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <strong>8.4</strong>
                                            <asp:Label ID="lbl_Comp_Q8_4" runat="server"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q8_4" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q8_4" ValidationGroup="Val8"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">

                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q8_2" runat="server" /><asp:Label ID="lbl_Docu_Q8_2" runat="server"></asp:Label>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q8_2" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <strong>8.5</strong>
                                            <asp:Label ID="lbl_Comp_Q8_5" runat="server"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q8_5" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q8_5" ValidationGroup="Val8"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>

                                            <p><strong>8.6</strong>&nbsp;<asp:Label ID="lbl_Comp_Q8_6" runat="server" Text="Label"></asp:Label></p>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q8_6" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                        <asp:ListItem Value="2">No Waiting List/Not Applicable</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q8_6" ValidationGroup="Val8"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">

                                    <ul style="list-style-type: none" class="checkbox-list">

                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q8_3_1" runat="server" /><asp:Label ID="lbl_Docu_Q8_3_1" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q8_3_2" runat="server" /><asp:Label ID="lbl_Docu_Q8_3_2" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q8_3_3" runat="server" /><asp:Label ID="lbl_Docu_Q8_3_3" runat="server"></asp:Label>

                                            <asp:TextBox ID="txt_Docu_Q8_3_3" runat="server"></asp:TextBox>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q8_3" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <strong>8.7</strong>
                                            <asp:Label ID="lbl_Comp_Q8_7" runat="server"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q8_7" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                        <asp:ListItem Value="2">No Waiting List/Not Applicable</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q8_7" ValidationGroup="Val8"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                            <ul style="list-style-type: none" class="checkbox-list">

                                                <li>
                                                    <p>Evidence the parent interview includes questions regarding:</p>
                                                    <strong>8.7.1</strong><br />
                                                    <asp:CheckBox ID="chk_Comp_Q8_7_1" runat="server" /><asp:Label ID="lbl_Comp_Q8_7_1" runat="server"></asp:Label>
                                                </li>
                                                <li>
                                                    <strong>8.7.2</strong><br />
                                                    <asp:CheckBox ID="chk_Comp_Q8_7_2" runat="server" /><asp:Label ID="lbl_Comp_Q8_7_2" runat="server"></asp:Label>
                                                </li>
                                                <li>
                                                    <strong>8.7.3</strong><br />
                                                    <asp:CheckBox ID="chk_Comp_Q8_7_3" runat="server" /><asp:Label ID="lbl_Comp_Q8_7_3" runat="server"></asp:Label>
                                                </li>
                                                <li>
                                                    <strong>8.7.4</strong><br />
                                                    <asp:CheckBox ID="chk_Comp_Q8_7_4" runat="server" /><asp:Label ID="lbl_Comp_Q8_7_4" runat="server"></asp:Label>
                                                </li>
                                                <li>
                                                    <strong>8.7.5</strong><br />
                                                    <asp:CheckBox ID="chk_Comp_Q8_7_5" runat="server" /><asp:Label ID="lbl_Comp_Q8_7_5" runat="server" Text="Label"></asp:Label>
                                                </li>
                                                <li>
                                                    <strong>8.7.6</strong><br />
                                                    <asp:CheckBox ID="chk_Comp_Q8_7_6" runat="server" /><asp:Label ID="lbl_Comp_Q8_7_6" runat="server" Text="Label"></asp:Label>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">

                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q8_7_1" runat="server" /><asp:Label ID="lbl_Docu_Q8_7_1" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q8_7_2" runat="server" /><asp:Label ID="lbl_Docu_Q8_7_2" runat="server"></asp:Label></li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q8_7_3" runat="server" /><asp:Label ID="lbl_Docu_Q8_7_3" runat="server"></asp:Label></li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q8_7_4" runat="server" /><asp:Label ID="lbl_Docu_Q8_7_4" runat="server"></asp:Label></li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q8_7_5" runat="server" /><asp:Label ID="lbl_Docu_Q8_7_5" runat="server"></asp:Label></li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q8_7_6" runat="server" /><asp:Label ID="lbl_Docu_Q8_7_6" runat="server"></asp:Label></li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q8_7_7" runat="server" /><asp:Label ID="lbl_Docu_Q8_7_7" runat="server"></asp:Label></li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q8_7_8" runat="server" /><asp:Label ID="lbl_Docu_Q8_7_8" runat="server"></asp:Label></li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q8_7" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <strong>8.8</strong>
                                            Evidence in each child’s/family’s file, as applicable, of the child’s developmental screening results and/or Early Intervention Individual Family Service Plan. 
                                              <ul style="list-style-type: none" class="checkbox-list">
                                                  <li>
                                                      <asp:RadioButtonList ID="rdobtn_Comp_Q8_8" runat="server">
                                                          <asp:ListItem Value="1">Yes</asp:ListItem>
                                                          <asp:ListItem Value="0">No</asp:ListItem>
                                                          <asp:ListItem Value="2">No Waiting List/Not Applicable</asp:ListItem>
                                                      </asp:RadioButtonList>
                                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q8_8" ValidationGroup="Val8"></asp:RequiredFieldValidator>
                                                  </li>
                                              </ul>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q8_8_1" runat="server" /><asp:Label ID="lbl_Docu_Q8_8_1" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q8_8_2" runat="server" /><asp:Label ID="lbl_Docu_Q8_8_2" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q8_8_3" runat="server" /><asp:Label ID="lbl_Docu_Q8_8_3" runat="server"></asp:Label>
                                            <asp:TextBox ID="txt_Docu_Q8_8_3" runat="server"></asp:TextBox>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q8_8" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <strong>8.9</strong>
                                            Evidence in each child’s/family’s file that the screening results are shared with parent/guardian (child’s developmental screening as applicable and/or did not qualify for the PI program, enrolled in the PI program, or on PI program waiting list).
                                              <ul style="list-style-type: none" class="checkbox-list">
                                                  <li>
                                                      <asp:RadioButtonList ID="rdobtn_Comp_Q8_9" runat="server">
                                                          <asp:ListItem Value="1">Yes</asp:ListItem>
                                                          <asp:ListItem Value="0">No</asp:ListItem>
                                                          <asp:ListItem Value="2">No Waiting List/Not Applicable</asp:ListItem>
                                                      </asp:RadioButtonList>
                                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q8_9" ValidationGroup="Val8"></asp:RequiredFieldValidator>
                                                  </li>
                                              </ul>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q8_9_1" runat="server" /><asp:Label ID="lbl_Docu_Q8_9_1" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q8_9_2" runat="server" /><asp:Label ID="lbl_Docu_Q8_9_2" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q8_9_3" runat="server" /><asp:Label ID="lbl_Docu_Q8_9_3" runat="server"></asp:Label>
                                            <asp:TextBox ID="txt_Docu_Q8_9_1" runat="server"></asp:TextBox>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q8_9" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <strong>8.10</strong>
                                            Evidence appropriate staff members are involved in the screening process and/or have access to the screening results as applicable.
                                              <ul style="list-style-type: none" class="checkbox-list">
                                                  <li>
                                                      <asp:RadioButtonList ID="rdobtn_Comp_Q8_10" runat="server">
                                                          <asp:ListItem Value="1">Yes</asp:ListItem>
                                                          <asp:ListItem Value="0">No</asp:ListItem>
                                                          <asp:ListItem Value="2">No Waiting List/Not Applicable</asp:ListItem>
                                                      </asp:RadioButtonList>
                                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q8_10" ValidationGroup="Val8"></asp:RequiredFieldValidator>
                                                  </li>
                                              </ul>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">

                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q8_10_1" runat="server" /><asp:Label ID="lbl_Docu_Q8_10_1" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q8_10_2" runat="server" /><asp:Label ID="lbl_Docu_Q8_10_2" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q8_10_3" runat="server" /><asp:Label ID="lbl_Docu_Q8_10_3" runat="server"></asp:Label>
                                            <asp:TextBox ID="txt_Docu_Q8_10_3" runat="server"></asp:TextBox>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q8_10" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                         <br />
                        <asp:LinkButton ID="lnkPicc_Q8" runat="server" OnClick="lnkPicc_Q8_Click8" ValidationGroup="Val8">Next</asp:LinkButton>
                    </div>
                </div>
            </asp:View>
            <asp:View ID="View9" runat="server">
                <div>
                    <br />
                    <div>
                        <h3 class="finaltoolTitle">9. The program adheres to the program model-recommended frequency and intensity of services. 
[23 Ill. Adm. Code 235.40(e)] and ISBE policy (CB,HV,FL)</h3>
                    </div>
                    <div>
                        <table class="d">
                            <tr>
                                <td class="picc">Compliance 
                                </td>
                                <td class="picc">Documentation 
                                </td>
                                <td class="picc">Notes 
                                </td>
                            </tr>
                            <tr>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">

                                        <li>
                                            <strong>9.1</strong>
                                            <asp:Label ID="lbl_Comp_Q9_1" runat="server"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q9_1" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                        <asp:ListItem Value="2">No Waiting List/Not Applicable</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q9_1" ValidationGroup="Val9"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <strong>9.1.1</strong>
                                                    <asp:Label ID="lbl_Comp_Q9_1_1" runat="server"></asp:Label><br />
                                                    <asp:TextBox ID="txtPicc_Compliance_Q9_1_1" runat="server"></asp:TextBox>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q9_1_1" runat="server" /><asp:Label ID="lbl_Docu_Q9_1_1" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q9_1_2" runat="server" /><asp:Label ID="lbl_Docu_Q9_1_2" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q9_1_3" runat="server" /><asp:Label ID="lbl_Docu_Q9_1_3" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:TextBox ID="txt_Docu_Q9_1_1" runat="server"></asp:TextBox>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q9_1" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <strong>9.2</strong>
                                            <asp:Label ID="lbl_Comp_Q9_2" runat="server"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q9_2" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                        <asp:ListItem Value="2">No Waiting List/Not Applicable</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q9_2" ValidationGroup="Val9"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <strong>9.2.1</strong>
                                                    <asp:Label ID="lbl_Comp_Q9_2_1" runat="server"></asp:Label><br />
                                                    <asp:TextBox ID="txtPicc_Compliance_Q9_2_1" runat="server"></asp:TextBox>
                                                </li>
                                                <li>
                                                    <strong>9.2.2</strong>
                                                    <asp:Label ID="lbl_Comp_Q9_2_2" runat="server"></asp:Label><br />
                                                    <asp:TextBox ID="txtPicc_Compliance_Q9_2_2" runat="server"></asp:TextBox>
                                                </li>
                                                <li>
                                                    <strong>9.2.3</strong>
                                                    <asp:Label ID="lbl_Comp_Q9_2_3" runat="server"></asp:Label><br />
                                                    <asp:TextBox ID="txtPicc_Compliance_Q9_2_3" runat="server"></asp:TextBox>
                                                </li>
                                                <li>
                                                    <strong>9.2.4</strong>
                                                    <asp:Label ID="lbl_Comp_Q9_2_4" runat="server"></asp:Label><br />
                                                    <asp:TextBox ID="txtPicc_Compliance_Q9_2_4" runat="server"></asp:TextBox>
                                                </li>
                                                <li>
                                                    <strong>9.2.5</strong>
                                                    <asp:Label ID="lbl_Comp_Q9_2_5" runat="server"></asp:Label><br />
                                                    <asp:TextBox ID="txtPicc_Compliance_Q9_2_5" runat="server"></asp:TextBox>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">

                                    <ul style="list-style-type: none" class="checkbox-list">

                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q9_2_1" runat="server" /><asp:Label ID="lbl_Docu_Q9_2_1" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q9_2_2" runat="server" /><asp:Label ID="lbl_Docu_Q9_2_2" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q9_2_3" runat="server" /><asp:Label ID="lbl_Docu_Q9_2_3" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:TextBox ID="txt_Docu_Q9_2_3" runat="server"></asp:TextBox>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q9_2" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <strong>9.3</strong>
                                            <asp:Label ID="lbl_Comp_Q9_3" runat="server"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q9_3" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                        <asp:ListItem Value="2">No Waiting List/Not Applicable</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q9_3" ValidationGroup="Val9"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <strong>9.3.1</strong>
                                                    <asp:Label ID="lbl_Comp_Q9_3_1" runat="server"></asp:Label><br />
                                                    <asp:TextBox ID="txtPicc_Compliance_Q9_3_1" runat="server"></asp:TextBox><br />
                                                    <asp:TextBox ID="txtPicc_Compliance_Q9_3_2" runat="server"></asp:TextBox><br />
                                                    <asp:TextBox ID="txtPicc_Compliance_Q9_3_3" runat="server"></asp:TextBox><br />
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q9_3_1" runat="server" /><asp:Label ID="lbl_Docu_Q9_3_1" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q9_3_2" runat="server" /><asp:Label ID="lbl_Docu_Q9_3_2" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q9_3_3" runat="server" /><asp:Label ID="lbl_Docu_Q9_3_3" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q9_3_4" runat="server" /><asp:Label ID="lbl_Docu_Q9_3_4" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q9_3_5" runat="server" /><asp:Label ID="lbl_Docu_Q9_3_5" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:TextBox ID="txt_Docu_Q9_3_5" runat="server"></asp:TextBox>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q9_3" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <asp:LinkButton ID="lnkPicc_Q9" runat="server" OnClick="lnkPicc_Q9_Click9" ValidationGroup="Val9">Next</asp:LinkButton>
                    </div>
                </div>
            </asp:View>
            <asp:View ID="View10" runat="server">
                <div>
                    <div>
                        <h3 class="finaltoolTitle">10. Developmental screening procedures include all required documentation. The program uses a research-based developmental screening instrument and activities that measure all aspects of the child’s development. (HV, CB, FL) 
[23 Ill. Adm. Code 235.20(c)(6)(B)(i)(ii), 235.40(b)] and ISBE policy</h3>
                    </div>
                    <div>
                        <table class="d">
                            <tr>
                                <td class="picc">Compliance 
                                </td>
                                <td class="picc">Documentation 
                                </td>
                                <td class="picc">Notes 
                                </td>
                            </tr>
                            <tr>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <strong>10.1</strong>
                                            <asp:Label ID="lbl_Comp_Q10_1" runat="server"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q10_1" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                        <asp:ListItem Value="2">No Waiting List/Not Applicable</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q10_1" ValidationGroup="Val10"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <strong>10.1.1</strong><br />
                                                    <asp:CheckBox ID="chk_Comp_Q10_1_1" runat="server" /><asp:Label ID="lbl_Comp_Q10_1_1" runat="server"></asp:Label>
                                                </li>
                                                <li>
                                                    <strong>10.1.2</strong><br />
                                                    <asp:CheckBox ID="chk_Comp_Q10_1_2" runat="server" /><asp:Label ID="lbl_Comp_Q10_1_2" runat="server"></asp:Label>
                                                </li>
                                                <li>
                                                    <strong>10.1.3</strong><br />
                                                    <asp:CheckBox ID="chk_Comp_Q10_1_3" runat="server" /><asp:Label ID="lbl_Comp_Q10_1_3" runat="server"></asp:Label>
                                                </li>
                                                <li>
                                                    <strong>10.1.4</strong><br />
                                                    <asp:CheckBox ID="chk_Comp_Q10_1_4" runat="server" /><asp:Label ID="lbl_Comp_Q10_1_4" runat="server"></asp:Label>
                                                </li>
                                                <li>
                                                    <strong>10.1.5</strong><br />
                                                    <asp:CheckBox ID="chk_Comp_Q10_1_5" runat="server" /><asp:Label ID="lbl_Comp_Q10_1_5" runat="server"></asp:Label>
                                                </li>
                                                <li>
                                                    <strong>10.1.6</strong><br />
                                                    <asp:CheckBox ID="chk_Comp_Q10_1_6" runat="server" /><asp:Label ID="lbl_Comp_Q10_1_6" runat="server"></asp:Label>
                                                </li>
                                                <li>
                                                    <strong>10.1.7</strong><br />
                                                    <asp:CheckBox ID="chk_Comp_Q10_1_7" runat="server" /><asp:Label ID="lbl_Comp_Q10_1_7" runat="server"></asp:Label>
                                                </li>
                                            </ul>
                                        </li>

                                    </ul>
                                    Note:  More than one tool may be needed to ensure a comprehensive evidence-based screening has occurred.       
                                </td>
                                <td class="scoring">
                                    <p>Broad-based Screening Instrument:</p>
                                    <ul style="list-style-type: none" class="checkbox-list">

                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q10_1_1" runat="server" /><asp:Label ID="lbl_Docu_Q10_1_1" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q10_1_2" runat="server" /><asp:Label ID="lbl_Docu_Q10_1_2" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q10_1_3" runat="server" /><asp:Label ID="lbl_Docu_Q10_1_3" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q10_1_4" runat="server" /><asp:Label ID="lbl_Docu_Q10_1_4" runat="server"></asp:Label><br />
                                            <asp:TextBox ID="txt_Docu_Q10_1_4" runat="server"></asp:TextBox>
                                        </li>
                                    </ul>
                                    <p>Social and Emotional Screening Instrument:</p>
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q10_1_5" runat="server" /><asp:Label ID="lbl_Docu_Q10_1_5" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q10_1_6" runat="server" /><asp:Label ID="lbl_Docu_Q10_1_6" runat="server"></asp:Label><br />
                                            <asp:TextBox ID="txt_Docu_Q10_1_6" runat="server"></asp:TextBox>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q10_1_7" runat="server" /><asp:Label ID="lbl_Docu_Q10_1_7" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q10_1_8" runat="server" /><asp:Label ID="lbl_Docu_Q10_1_8" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q10_1_9" runat="server" /><asp:Label ID="lbl_Docu_Q10_1_9" runat="server"></asp:Label><br />
                                            <asp:TextBox ID="txt_Docu_Q10_1_9" runat="server"></asp:TextBox>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q10_1" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <strong>10.2</strong>
                                            <asp:Label ID="lbl_Comp_Q10_2" runat="server"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q10_2" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                        <asp:ListItem Value="2">No Waiting List/Not Applicable</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q10_2" ValidationGroup="Val10"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <strong>10.3</strong>
                                            <asp:Label ID="lbl_Comp_Q10_3" runat="server"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q10_3" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                        <asp:ListItem Value="2">No Waiting List/Not Applicable</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q10_3" ValidationGroup="Val10"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                    <p>Note:  More than one tool may be needed to ensure a comprehensive evidence-based screening has occurred.</p>
                                </td>
                                <td class="scoring"></td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q10_2" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <strong>10.4</strong>
                                            <asp:Label ID="lbl_Comp_Q10_4" runat="server"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q10_4" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                        <asp:ListItem Value="2">No Waiting List/Not Applicable</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q10_4" ValidationGroup="Val10"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q10__2_1" runat="server" /><asp:Label ID="lbl_Docu_Q10__2_1" runat="server"></asp:Label>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q10_3" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                         <br />
                        <asp:LinkButton ID="lnkPicc_Q10" runat="server" OnClick="lnkPicc_Q10_Click10" ValidationGroup="Val10">Next</asp:LinkButton>
                    </div>
                </div>
            </asp:View>
            <asp:View ID="View11" runat="server">
                <div>
                    <div>
                        <h3 class="finaltoolTitle">11. Developmental monitoring procedures include immunization and well child visit updates and hearing and vision screenings. The program implements developmental monitoring using a research-based screening instrument and activities that measure all aspects of the child’s development. Evidence appears in each child’s/family’s file. (HV, CB, FL) </h3>
                    </div>
                    <div>
                        <table class="d">
                            <tr>
                                <td class="picc">Compliance 
                                </td>
                                <td class="picc">Documentation 
                                </td>
                                <td class="picc">Notes 
                                </td>
                            </tr>
                            <tr>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <strong>11.1</strong>
                                            <asp:Label ID="lbl_Comp_Q11_1" runat="server"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q11_1" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                        <asp:ListItem Value="2">No Waiting List/Not Applicable</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q11_1" ValidationGroup="Val11"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <strong>11.1.1</strong><br />
                                                    <asp:CheckBox ID="chk_Comp_Q11_1_1" runat="server" /><asp:Label ID="lbl_Comp_Q11_1_1" runat="server"></asp:Label>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <strong>11.2</strong>
                                            <asp:Label ID="lbl_Comp_Q11_2" runat="server"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q11_2" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                        <asp:ListItem Value="2">No Waiting List/Not Applicable</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q11_2" ValidationGroup="Val11"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <strong>11.2.1</strong><br />
                                                    <asp:CheckBox ID="chk_Comp_Q11_2_1" runat="server" /><asp:Label ID="lbl_Comp_Q11_2_1" runat="server"></asp:Label><br />
                                                    Describe screening: 
                                                    <asp:TextBox ID="txtPicc_Compliance_Q11_2_1" runat="server" TextMode="MultiLine" BorderStyle="Solid"></asp:TextBox>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <strong>11.3</strong>
                                            <asp:Label ID="lbl_Comp_Q11_3" runat="server"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q11_3" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                        <asp:ListItem Value="2">No Waiting List/Not Applicable</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q11_3" ValidationGroup="Val11"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <strong>11.3.1</strong><br />
                                                    <asp:CheckBox ID="chk_Comp_Q11_3_1" runat="server" /><asp:Label ID="lbl_Comp_Q11_3_1" runat="server"></asp:Label><br />
                                                    Describe screening: 
                                                     <asp:TextBox ID="txtPicc_Compliance_Q11_3_1" runat="server" TextMode="MultiLine" BorderStyle="Solid"></asp:TextBox>
                                                </li>
                                            </ul>

                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">

                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q11_1" runat="server" /><asp:Label ID="lbl_Docu_Q11_1" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q11_2" runat="server" /><asp:Label ID="lbl_Docu_Q11_2" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q11_3" runat="server" /><asp:Label ID="lbl_Docu_Q11_3" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q11_4" runat="server" /><asp:Label ID="lbl_Docu_Q11_4" runat="server"></asp:Label><br />
                                            <asp:TextBox ID="txt_Docu_Q11_4" runat="server"></asp:TextBox>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q11_1" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <strong>11.4</strong>
                                            <asp:Label ID="lbl_Comp_Q11_4" runat="server"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q11_4" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                        <asp:ListItem Value="2">No Waiting List/Not Applicable</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q11_4" ValidationGroup="Val11"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                            <p>Evidence can be found in:</p>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:CheckBox ID="chk_Comp_Q11_4_1" runat="server" /><asp:Label ID="lbl_Comp_Q11_4_1" runat="server"></asp:Label>
                                                </li>
                                                <li>
                                                    <asp:CheckBox ID="chk_Comp_Q11_4_2" runat="server" /><asp:Label ID="lbl_Comp_Q11_4_2" runat="server"></asp:Label>
                                                </li>
                                                <li>
                                                    <asp:CheckBox ID="chk_Comp_Q11_4_3" runat="server" /><asp:Label ID="lbl_Comp_Q11_4_3" runat="server"></asp:Label>
                                                </li>
                                                <li>
                                                    <asp:CheckBox ID="chk_Comp_Q11_4_4" runat="server" /><asp:Label ID="lbl_Comp_Q11_4_4" runat="server"></asp:Label>
                                                </li>
                                                <li>
                                                    <asp:CheckBox ID="chk_Comp_Q11_4_5" runat="server" /><asp:Label ID="lbl_Comp_Q11_4_5" runat="server"></asp:Label>
                                                </li>
                                                <li>
                                                    <asp:CheckBox ID="chk_Comp_Q11_4_6" runat="server" /><asp:Label ID="lbl_Comp_Q11_4_6" runat="server"></asp:Label>
                                                </li>
                                                <li>
                                                    <asp:CheckBox ID="chk_Comp_Q11_4_7" runat="server" /><asp:Label ID="lbl_Comp_Q11_4_7" runat="server"></asp:Label>
                                                </li>
                                                <li>
                                                    <asp:CheckBox ID="chk_Comp_Q11_4_8" runat="server" /><asp:Label ID="lbl_Comp_Q11_4_8" runat="server"></asp:Label>
                                                    <br />
                                                    <i>(Please specify):</i>
                                                    <asp:TextBox ID="txt_Comp_Q11_4_7" runat="server"></asp:TextBox>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <asp:CheckBox ID="chk_Docc_Q11_4" runat="server" />Other
                                    <br />
                                    <i>Please specify: </i>
                                    <asp:TextBox ID="txt_Docc_Q11_4" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtPicc_Notes_Q11_2" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <strong>11.5</strong>
                                            <asp:Label ID="lbl_Comp_Q11_5" runat="server"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q11_5" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                        <asp:ListItem Value="2">No Waiting List/Not Applicable</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q11_5" ValidationGroup="Val11"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                            <p>Evidence can be found in:</p>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:CheckBox ID="chk_Comp_Q11_5_1" runat="server"></asp:CheckBox>
                                                    <asp:Label ID="lbl_Comp_Q11_5_1" runat="server" Text="Label"></asp:Label>
                                                </li>
                                                <li>
                                                    <asp:CheckBox ID="chk_Comp_Q11_5_2" runat="server"></asp:CheckBox>
                                                    <asp:Label ID="lbl_Comp_Q11_5_2" runat="server" Text="Label"></asp:Label>
                                                </li>
                                                <li>
                                                    <asp:CheckBox ID="chk_Comp_Q11_5_3" runat="server"></asp:CheckBox>
                                                    <asp:Label ID="lbl_Comp_Q11_5_3" runat="server" Text="Label"></asp:Label>
                                                </li>
                                                <li>
                                                    <asp:CheckBox ID="chk_Comp_Q11_5_4" runat="server"></asp:CheckBox>
                                                    <asp:Label ID="lbl_Comp_Q11_5_4" runat="server" Text="Label"></asp:Label>
                                                </li>
                                                <li>
                                                    <asp:CheckBox ID="chk_Comp_Q11_5_6" runat="server"></asp:CheckBox>
                                                    <asp:Label ID="lbl_Comp_Q11_5_5" runat="server" Text="Label"></asp:Label><br />
                                                    <i>(Please specify):</i>
                                                    <asp:TextBox ID="txt_Comp_Q11_5_6" runat="server"></asp:TextBox>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <asp:CheckBox ID="chk_Docc_Q11_5" runat="server" />Other
                                    <br />
                                    <i>Please specify: </i>
                                    <asp:TextBox ID="txt_Docc_Q11_5" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtPicc_Notes_Q11_4" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <asp:LinkButton ID="lnkPicc_Q11" runat="server" OnClick="lnkPicc_Q11_Click11" ValidationGroup="Val11">Next</asp:LinkButton>
                    </div>
                </div>
            </asp:View>
            <asp:View ID="View12" runat="server">
                <div>
                    <br />
                    <div>
                        <h3 class="finaltoolTitle">12. The program partners with families to complete a research-based Family Centered Assessment and an Individual Family Service Plan that will guide programming. (HV, CB, FL) 
[23 Ill. Adm. Code 235.40(c)(d)] and ISBE policy</h3>
                    </div>
                    <div>
                        <table class="d">
                            <tr>
                                <td class="picc">Compliance 
                                </td>
                                <td class="picc">Documentation 
                                </td>
                                <td class="picc">Notes 
                                </td>
                            </tr>
                            <tr>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <strong>12.1</strong>
                                            <asp:Label ID="lbl_Comp_Q12_1" runat="server"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q12_1" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                        <asp:ListItem Value="2">No Waiting List/Not Applicable</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q12_1" ValidationGroup="Val12"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <strong>12.1.1</strong><br />
                                                    <asp:CheckBox ID="chk_Comp_Q12_1_1" runat="server" /><asp:Label ID="lbl_Comp_Q12_1_1" runat="server"></asp:Label>
                                                </li>
                                                <li>
                                                    <strong>12.1.2</strong><br />
                                                    <asp:CheckBox ID="chk_Comp_Q12_1_2" runat="server" /><asp:Label ID="lbl_Comp_Q12_1_2" runat="server"></asp:Label>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <asp:RadioButtonList ID="rdobtnlst_Docu_Q12_1" runat="server" DataSourceID="SqlDataSource3" DataTextField="Questions" DataValueField="DropDownNumbers">
                                            </asp:RadioButtonList>
                                            <asp:TextBox ID="txt_Docu_Q12_1" runat="server"></asp:TextBox>
                                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [PiccQuestions] WHERE ([Label_ID] = @Label_ID)">
                                                <SelectParameters>
                                                    <asp:Parameter DefaultValue="rdobtnlst_Docu_Q12_1" Name="Label_ID" Type="String" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q12_1" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">

                                        <li>
                                            <p><strong>12.2</strong>&nbsp;Evidence in each <b>child’s/family’s file</b> that an Individual Family Service Plan is developed in partnership with each family</p>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q12_2" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                        <asp:ListItem Value="2">No Waiting List/Not Applicable</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator36" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q12_2" ValidationGroup="Val12"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <p><strong>12.2.1</strong>&nbsp;Evidence in each <b>child’s/family’s file</b> that the Individual Family Service/Support Plan is <u>updated at least every six months</u></p>
                                                    <ul style="list-style-type: none" class="checkbox-list">
                                                        <li>
                                                            <asp:RadioButtonList ID="rdobtn_Comp_Q12_2_1" runat="server">
                                                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                                                <asp:ListItem Value="0">No</asp:ListItem>
                                                                <asp:ListItem Value="2">No Waiting List/Not Applicable</asp:ListItem>
                                                            </asp:RadioButtonList>
                                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator37" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q12_2_1" ValidationGroup="Val12"></asp:RequiredFieldValidator>
                                                        </li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q12_2" runat="server" /><asp:Label ID="lbl_Docu_Q12_2" runat="server"></asp:Label>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q12_2" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <asp:LinkButton ID="lnkPicc_Q12" runat="server" OnClick="lnkPicc_Q12_Click12" ValidationGroup="Val12">Next</asp:LinkButton>
                    </div>
                </div>
            </asp:View>
            <asp:View ID="View13" runat="server">
                <div>
                    <br />
                    <div>
                        <h3 class="finaltoolTitle">13. The program is implementing a research-based curriculum for parent education that is aligned with the Illinois Early Learning Guidelines.  The program is implementing the Illinois Early Learning Guidelines. (HV, CB, FL) 
[23 Ill. Adm. Code 235.20(c)(3)(A), 235.40(a),] and ISBE policy (new rules)</h3>
                    </div>
                    <div>
                        <table class="d">
                            <tr>
                                <td class="picc">Compliance 
                                </td>
                                <td class="picc">Documentation 
                                </td>
                                <td class="picc">Notes 
                                </td>
                            </tr>
                            <tr>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <strong>13.1</strong>
                                            <asp:RadioButtonList ID="rdobtn_Comp_Q13_1" runat="server" DataSourceID="SqlDataSource4" DataTextField="Questions" DataValueField="DropDownNumbers">
                                            </asp:RadioButtonList>
                                            <asp:TextBox ID="txtPicc_Compliance_Q13_1" runat="server"></asp:TextBox>
                                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [PiccQuestions] WHERE ([Label_ID] = @Label_ID)">
                                                <SelectParameters>
                                                    <asp:Parameter DefaultValue="rdobtn_Comp_Q13_1" Name="Label_ID" Type="String" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator38" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q13_1" ValidationGroup="Val13"></asp:RequiredFieldValidator>
                                        </li>
                                        <li>
                                            <p>References to the IELG (standards and/or indicators/keywords or phrases) are evident in the following:</p>
                                            <strong>13.2</strong>
                                            <asp:Label ID="lbl_Comp_Q13_2" runat="server"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q13_2" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                        <asp:ListItem Value="2">No Waiting List/Not Applicable</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator39" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q13_2" ValidationGroup="Val13"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <strong>13.3</strong>
                                            <asp:Label ID="lbl_Comp_Q13_3" runat="server"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q13_3" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                        <asp:ListItem Value="2">No Waiting List/Not Applicable</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator40" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q13_3" ValidationGroup="Val13"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q13_1" runat="server" /><asp:Label ID="lbl_Docu_Q13_1" runat="server"></asp:Label>
                                            <asp:TextBox ID="txt_Docu_Q13_5" runat="server"></asp:TextBox>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q13" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <asp:LinkButton ID="lnkPicc_Q13" runat="server" OnClick="lnkPicc_Q13_Click13" ValidationGroup="Val13">Next</asp:LinkButton>
                    </div>
                </div>
            </asp:View>
            <asp:View ID="View14" runat="server">
                <div>
                    <br />
                    <div>
                        <h3 class="finaltoolTitle">14. The program offers appropriate parent education and involvement services that address specific areas of instruction. (HV, CB, FL)</h3>
                    </div>
                    <div>
                        <table class="d">
                            <tr>
                                <td class="picc">Compliance 
                                </td>
                                <td class="picc">Documentation 
                                </td>
                                <td class="picc">Notes 
                                </td>
                            </tr>
                            <tr>
                                <td class="scoring">
                                    <p>Evidence of instruction regarding the eight designated areas of instruction:</p>
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <strong>14.1</strong>
                                            <asp:Label ID="lbl_Comp_Q14_1" runat="server"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q14_1" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                        <asp:ListItem Value="2">No Waiting List/Not Applicable</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator41" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q14_1" ValidationGroup="Val14"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <strong>14.2</strong>
                                            <asp:Label ID="lbl_Comp_Q14_2" runat="server"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q14_2" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                        <asp:ListItem Value="2">No Waiting List/Not Applicable</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator42" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q14_2" ValidationGroup="Val14"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <strong>14.3</strong>
                                            <asp:Label ID="lbl_Comp_Q14_3" runat="server"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q14_3" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                        <asp:ListItem Value="2">No Waiting List/Not Applicable</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator43" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q14_3" ValidationGroup="Val14"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <strong>14.4</strong>
                                            <asp:Label ID="lbl_Comp_Q14_4" runat="server"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q14_4" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                        <asp:ListItem Value="2">No Waiting List/Not Applicable</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator44" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q14_4" ValidationGroup="Val14"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <strong>14.5</strong>
                                            <asp:Label ID="lbl_Comp_Q14_5" runat="server"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q14_5" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                        <asp:ListItem Value="2">No Waiting List/Not Applicable</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator45" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q14_5" ValidationGroup="Val14"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <strong>14.6</strong>
                                            <asp:Label ID="lbl_Comp_Q14_6" runat="server"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q14_6" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                        <asp:ListItem Value="2">No Waiting List/Not Applicable</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator46" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q14_6" ValidationGroup="Val14"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <strong>14.7</strong>
                                            <asp:Label ID="lbl_Comp_Q14_7" runat="server"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q14_7" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                        <asp:ListItem Value="2">No Waiting List/Not Applicable</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator47" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q14_7" ValidationGroup="Val14"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <strong>14.8</strong>
                                            <asp:Label ID="lbl_Comp_Q14_8" runat="server"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q14_8" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                        <asp:ListItem Value="2">No Waiting List/Not Applicable</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator48" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q14_8" ValidationGroup="Val14"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q14_1" runat="server" /><asp:Label ID="lbl_Docu_Q14_1" runat="server"></asp:Label></li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q14_2" runat="server" /><asp:Label ID="lbl_Docu_Q14_2" runat="server"></asp:Label></li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q14_3" runat="server" /><asp:Label ID="lbl_Docu_Q14_3" runat="server"></asp:Label></li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q14_4" runat="server" /><asp:Label ID="lbl_Docu_Q14_4" runat="server"></asp:Label></li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q14_5" runat="server" /><asp:Label ID="lbl_Docu_Q14_5" runat="server"></asp:Label></li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q14_6" runat="server" /><asp:Label ID="lbl_Docu_Q14_6" runat="server"></asp:Label></li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q14_7" runat="server" /><asp:Label ID="lbl_Docu_Q14_7" runat="server"></asp:Label></li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q14_8" runat="server" /><asp:Label ID="lbl_Docu_Q14_8" runat="server"></asp:Label>
                                            <asp:TextBox ID="txt_Docu_Q14_8" runat="server"></asp:TextBox>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q14" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <strong>14.9</strong>
                                            <asp:Label ID="lbl_Comp_Q14_9" runat="server" Text="Label"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q14_9" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                        <asp:ListItem Value="2">No Waiting List/Not Applicable</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator49" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q14_9" ValidationGroup="Val14"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:Label ID="lbl_Comp_Q14_9_1" runat="server"></asp:Label>
                                                    <ul style="list-style-type: none" class="checkbox-list">
                                                        <li>
                                                            <asp:RadioButtonList ID="rdobtn_Comp_Q14_9_1" runat="server">
                                                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                                                <asp:ListItem Value="0">No</asp:ListItem>
                                                                <asp:ListItem Value="2">No Waiting List/Not Applicable</asp:ListItem>
                                                            </asp:RadioButtonList>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator50" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q14_9_1" ValidationGroup="Val14"></asp:RequiredFieldValidator>
                                                        </li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <strong>14.10</strong>
                                            <asp:Label ID="lbl_Comp_Q14_10" runat="server" Text="Label"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q14_10" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                        <asp:ListItem Value="2">No Waiting List/Not Applicable</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator51" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q14_10" ValidationGroup="Val14"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <strong>14.11</strong>
                                            <asp:Label ID="lbl_Comp_Q14_11" runat="server" Text="Label"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q14_11" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                        <asp:ListItem Value="2">No Waiting List/Not Applicable</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator52" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q14_11" ValidationGroup="Val14"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <strong>14.12</strong>
                                            <asp:Label ID="lbl_Comp_Q14_12" runat="server" Text="Label"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q14_12" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                        <asp:ListItem Value="2">No Waiting List/Not Applicable</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator53" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q14_12" ValidationGroup="Val14"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q14_9_1" runat="server" />
                                            <asp:Label ID="lbl_Docu_Q14_9_1" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q14_9_2" runat="server" />
                                            <asp:Label ID="lbl_Docu_Q14_9_2" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                             <asp:CheckBox ID="chk_Docu_Q14_9_3" runat="server" />
                                            <asp:Label ID="lbl_Docu_Q14_9_3" runat="server"></asp:Label><br />
                                            <asp:TextBox ID="txt_Docu_Q14_9_3" runat="server"></asp:TextBox>
                                        </li>
                                    </ul>
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                             <asp:CheckBox ID="chk_Docu_Q14_9_4" runat="server" />
                                            <asp:Label ID="lbl_Docu_Q14_9_4" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q14_9_5" runat="server" />
                                            <asp:Label ID="lbl_Docu_Q14_9_5" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                             <asp:CheckBox ID="chk_Docu_Q14_9_6" runat="server" />
                                            <asp:Label ID="lbl_Docu_Q14_9_6" runat="server"></asp:Label>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q14_1" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <strong>14.13</strong>
                                            <asp:Label ID="lbl_Comp_Q14_13" runat="server" Text="Label"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q14_13" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                        <asp:ListItem Value="2">No Waiting List/Not Applicable</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator54" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q14_13" ValidationGroup="Val14"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <p>The program integrates technology into programming in alignment with the joint position statement issued by the National Association for the Education of Young Children and the Fred Rogers Center for Early Learning and Children's Media at Saint Vincent College, Technology and Interactive Media as Tools in Early Childhood Programs Serving Children from Birth through Age 8 (http://www.naeyc.org/content/technology-and-young-children).</p>
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                             <asp:CheckBox ID="chk_Docu_Q14_13_1" runat="server" />
                                            <asp:Label ID="lbl_Docu_Q14_13_1" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q14_13_2" runat="server" />
                                            <asp:Label ID="lbl_Docu_Q14_13_2" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q14_13_3" runat="server" />
                                            <asp:Label ID="lbl_Docu_Q14_13_3" runat="server"></asp:Label><br />
                                            <asp:TextBox ID="txt_Docu_Q14_13_3" runat="server"></asp:TextBox>
                                        </li>
                                    </ul>

                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q14_2" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <asp:LinkButton ID="lnkPicc_Q14" runat="server" OnClick="lnkPicc_Q14_Click14" ValidationGroup="Val14">Next</asp:LinkButton>
                    </div>
                </div>
            </asp:View>
            <asp:View ID="View15" runat="server">
                <div>
                    <div>
                        <h3 class="finaltoolTitle">15. Identification of research-based supplemental curricula and services being implemented. Are these curricula aligned with the Illinois Early Learning Guidelines? (HV, CB, FL) (May not apply to all programs)
                        [23 Ill. Adm. Code 235.20(c)(3)(A), 235.40(a)] and ISBE policy (new rules)</h3>
                    </div>
                    <div>
                        <table class="d">
                            <tr>
                                <td class="picc">Compliance 
                                </td>
                                <td class="picc">Documentation 
                                </td>
                                <td class="picc">Notes 
                                </td>
                            </tr>
                            <tr>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">

                                        <li>
                                            <strong>15.1</strong><br />
                                            <asp:TextBox ID="txtPicc_Compliance_Q15_1" runat="server"></asp:TextBox>
                                        </li>
                                        <li>
                                            <strong>15.2</strong><br />
                                            <asp:TextBox ID="txtPicc_Compliance_Q15_2" runat="server"></asp:TextBox>
                                        </li>
                                        <li>
                                            <strong>15.3</strong><br />
                                            <asp:TextBox ID="txtPicc_Compliance_Q15_3" runat="server"></asp:TextBox>
                                        </li>
                                        <li>
                                            <strong>15.4</strong><br />
                                            <asp:TextBox ID="txtPicc_Compliance_Q15_4" runat="server"></asp:TextBox>
                                        </li>
                                    </ul>
                                    <p>References to the IELG (standards and/or indicators/keywords or phrases) are evident in the following:</p>
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <strong>15.5</strong><br />

                                            <asp:CheckBox ID="chk_Comp_Q15_5_1" runat="server" /><asp:Label ID="lbl_Comp_Q15_5_1" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <strong>15.6</strong><br />
                                            <asp:CheckBox ID="chk_Comp_Q15_5_2" runat="server" /><asp:Label ID="lbl_Comp_Q15_5_2" runat="server"></asp:Label>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q15_1" runat="server" /><asp:Label ID="lbl_Docu_Q15_1" runat="server"></asp:Label>
                                            <asp:TextBox ID="txt_Docu_Q15_1" runat="server"></asp:TextBox>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q15" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <asp:LinkButton ID="lnkPicc_Q15" runat="server" OnClick="lnkPicc_Q15_Click15" Height="22px">Next</asp:LinkButton>
                    </div>
                </div>
            </asp:View>
            <asp:View ID="View16" runat="server">
                <div>
                    <br />
                    <div>
                        <h3 class="finaltoolTitle">16. The program has developed a comprehensive, utilized referral system to ensure families are referred to community resources and services as applicable. (HV, CB, FL) 
[23 Ill. Adm. Code 235.40(c)(g)] and ISBE policy (old and new rules)</h3>
                    </div>
                    <div>
                        <table class="d">
                            <tr>
                                <td class="picc">Compliance 
                                </td>
                                <td class="picc">Documentation 
                                </td>
                                <td class="picc">Notes 
                                </td>
                            </tr>
                            <tr>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">

                                        <li>
                                            <strong>16.1</strong>
                                            <asp:Label ID="lbl_Comp_Q16_1" runat="server"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q16_1" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                        <asp:ListItem Value="2">No Waiting List/Not Applicable</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator55" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q16_1" ValidationGroup="Val16"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q16_1" runat="server" /><asp:Label ID="lbl_Docu_Q16_1" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q16_2" runat="server" /><asp:Label ID="lbl_Docu_Q16_2" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q16_3" runat="server" /><asp:Label ID="lbl_Docu_Q16_3" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q16_4" runat="server" /><asp:Label ID="lbl_Docu_Q16_4" runat="server"></asp:Label>
                                            <asp:TextBox ID="txt_Docu_Q16_5" runat="server"></asp:TextBox>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q16_1" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">

                                        <li>
                                            <strong>16.2</strong>
                                            Evidence in each child’s/family’s file, as applicable, that the program develops written individualized Transition Plans to ensure children and families experience a seamless transition of services                                         
                                             <ul style="list-style-type: none" class="checkbox-list">
                                                 <li>
                                                     <asp:RadioButtonList ID="rdobtn_Comp_Q16_2" runat="server">
                                                         <asp:ListItem Value="1">Yes</asp:ListItem>
                                                         <asp:ListItem Value="0">No</asp:ListItem>
                                                         <asp:ListItem Value="2">No Waiting List/Not Applicable</asp:ListItem>
                                                     </asp:RadioButtonList>
                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator56" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q16_2" ValidationGroup="Val16"></asp:RequiredFieldValidator>
                                                 </li>
                                             </ul>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q16_2_1" runat="server" /><asp:Label ID="lbl_Docu_Q16_2_1" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q16_2_2" runat="server" /><asp:Label ID="lbl_Docu_Q16_2_2" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q16_2_3" runat="server" /><asp:Label ID="lbl_Docu_Q16_2_3" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q16_2_4" runat="server" /><asp:Label ID="lbl_Docu_Q16_2_4" runat="server"></asp:Label>
                                            <asp:TextBox ID="txt_Docu_Q16_2_4" runat="server"></asp:TextBox>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q16_2" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">

                                        <li>
                                            <strong>16.2.1</strong>
                                            Evidence in each child’s/family’s file, as applicable, that program develops transition plans with families beginning at 2 years, 6 months/30 months (or six months prior to any scheduled transition). 
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q16_2_1" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                        <asp:ListItem Value="2">No Waiting List/Not Applicable</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator57" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q16_2_1" ValidationGroup="Val16"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q16_2_1_1" runat="server" /><asp:Label ID="lbl_Docu_Q16_2_1_1" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q16_2_1_2" runat="server" /><asp:Label ID="lbl_Docu_Q16_2_1_2" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q16_2_1_3" runat="server" /><asp:Label ID="lbl_Docu_Q16_2_1_3" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q16_2_1_4" runat="server" /><asp:Label ID="lbl_Docu_Q16_2_1_4" runat="server"></asp:Label>
                                            <asp:TextBox ID="txt_Docu_Q16_2_1_4" runat="server"></asp:TextBox>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q16_2_1" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">

                                        <li>
                                            <strong>16.3</strong>
                                            Evidence in each child’s/family’s file, as applicable, that the program develops written individualized Transition Plans to ensure children and families experience a seamless transition of services                                         
                                              <ul style="list-style-type: none" class="checkbox-list">
                                                  <li>
                                                      <asp:RadioButtonList ID="rdobtn_Comp_Q16_3" runat="server">
                                                          <asp:ListItem Value="1">Yes</asp:ListItem>
                                                          <asp:ListItem Value="0">No</asp:ListItem>
                                                          <asp:ListItem Value="2">No Waiting List/Not Applicable</asp:ListItem>
                                                      </asp:RadioButtonList>
                                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator58" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q16_3" ValidationGroup="Val16"></asp:RequiredFieldValidator>
                                                  </li>
                                              </ul>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q16_3_1" runat="server" /><asp:Label ID="lbl_Docu_Q16_3_1" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q16_3_2" runat="server" /><asp:Label ID="lbl_Docu_Q16_3_2" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q16_3_3" runat="server" /><asp:Label ID="lbl_Docu_Q16_3_3" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q16_3_4" runat="server" /><asp:Label ID="lbl_Docu_Q16_3_4" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q16_3_5" runat="server" /><asp:Label ID="lbl_Docu_Q16_3_5" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q16_3_6" runat="server" /><asp:Label ID="lbl_Docu_Q16_3_6" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q16_3_7" runat="server" /><asp:Label ID="lbl_Docu_Q16_3_7" runat="server"></asp:Label>
                                            <asp:TextBox ID="txt_Docu_Q16_3_7" runat="server"></asp:TextBox>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q16_3" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">

                                        <li>
                                            <strong>16.4</strong>
                                            Evidence in each child’s/family’s file, as applicable, that the program develops written individualized Transition Plans to ensure children and families experience a seamless transition of services                                         
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q16_4" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                        <asp:ListItem Value="2">No Waiting List/Not Applicable</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator59" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q16_4" ValidationGroup="Val16"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q16_4_1" runat="server" /><asp:Label ID="lbl_Docu_Q16_4_1" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q16_4_2" runat="server" /><asp:Label ID="lbl_Docu_Q16_4_2" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q16_4_3" runat="server" /><asp:Label ID="lbl_Docu_Q16_4_3" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q16_4_4" runat="server" /><asp:Label ID="lbl_Docu_Q16_4_4" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q16_4_5" runat="server" /><asp:Label ID="lbl_Docu_Q16_4_5" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q16_4_6" runat="server" /><asp:Label ID="lbl_Docu_Q16_4_6" runat="server"></asp:Label></li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q16_4_7" runat="server" /><asp:Label ID="lbl_Docu_Q16_4_7" runat="server"></asp:Label>
                                            <asp:TextBox ID="txt_Docu_Q16_4_7" runat="server"></asp:TextBox>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q16_4" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <asp:LinkButton ID="lnkPicc_Q16" runat="server" OnClick="lnkPicc_Q16_Click16" ValidationGroup="Val16">Next</asp:LinkButton>
                    </div>
                </div>
            </asp:View>
            <asp:View ID="View17" runat="server">
                <div>
                    <div>
                        <h3 class="finaltoolTitle">17. The program has developed a comprehensive, utilized referral system to ensure families are referred to community resources and services as applicable. (HV, CB, FL) 
[23 Ill. Adm. Code 235.40(c)(g)] and ISBE policy (old and new rules)</h3>
                    </div>
                    <div>
                        <table class="d">
                            <tr>
                                <td class="picc">Compliance 
                                </td>
                                <td class="picc">Documentation 
                                </td>
                                <td class="picc">Notes 
                                </td>
                            </tr>
                            <tr>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <strong>17.1</strong>
                                            <asp:Label ID="lbl_Comp_Q17_1" runat="server"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q17_1" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                        <asp:ListItem Value="2">No Waiting List/Not Applicable</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator60" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q17_1" ValidationGroup="Val17"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:CheckBox ID="chk_Comp_Q17_1_1" runat="server" /><asp:Label ID="lbl_Comp_Q17_1_1" runat="server"></asp:Label>
                                                </li>
                                                <li>
                                                    <asp:CheckBox ID="chk_Comp_Q17_1_2" runat="server" /><asp:Label ID="lbl_Comp_Q17_1_2" runat="server"></asp:Label>
                                                </li>
                                                <li>
                                                    <asp:CheckBox ID="chk_Comp_Q17_1_3" runat="server" /><asp:Label ID="lbl_Comp_Q17_1_3" runat="server"></asp:Label>
                                                </li>
                                                <li>
                                                    <asp:CheckBox ID="chk_Comp_Q17_1_4" runat="server" /><asp:Label ID="lbl_Comp_Q17_1_4" runat="server"></asp:Label>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q17_1" runat="server" /><asp:Label ID="lbl_Docu_Q17_1" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q17_2" runat="server" /><asp:Label ID="lbl_Docu_Q17_2" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q17_3" runat="server" /><asp:Label ID="lbl_Docu_Q17_3" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q17_4" runat="server" /><asp:Label ID="lbl_Docu_Q17_4" runat="server"></asp:Label>
                                            <asp:TextBox ID="txt_Docu_Q17_4" runat="server"></asp:TextBox>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q17" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="scoring">
                                    <p>Evidence the program has developed formal agreements with other service providers, through one or a combination of multiple MOUs, to: </p>
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <strong>17.2</strong>
                                            <asp:Label ID="lbl_Comp_Q17_2" runat="server" Text="Label"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q17_2" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                        <asp:ListItem Value="2">No Waiting List/Not Applicable</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator61" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q17_2" ValidationGroup="Val17"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <strong>17.3</strong>
                                            <asp:Label ID="lbl_Comp_Q17_3" runat="server" Text="Label"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q17_3" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                        <asp:ListItem Value="2">No Waiting List/Not Applicable</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator62" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q17_3" ValidationGroup="Val17"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <strong>17.4</strong>
                                            <asp:Label ID="lbl_Comp_Q17_4" runat="server" Text="Label"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q17_4" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                        <asp:ListItem Value="2">No Waiting List/Not Applicable</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator63" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q17_4" ValidationGroup="Val17"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q17_5" runat="server" /><asp:Label ID="lbl_Docu_Q17_5" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q17_6" runat="server" /><asp:Label ID="lbl_Docu_Q17_6" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q17_7" runat="server" /><asp:Label ID="lbl_Docu_Q17_7" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q17_8" runat="server" /><asp:Label ID="lbl_Docu_Q17_8" runat="server"></asp:Label>
                                            <asp:TextBox ID="txt_Docu_Q17_8" runat="server"></asp:TextBox>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q17_1" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <asp:LinkButton ID="lnkPicc_Q17" runat="server" OnClick="lnkPicc_Q17_Click17" ValidationGroup="Val17">Next</asp:LinkButton>
                    </div>
                </div>
            </asp:View>
            <asp:View ID="View18" runat="server">
                <div>
                    <div>
                        <h3 class="finaltoolTitle">18.  The program has a written annual program evaluation and continuous quality improvement plan. (HV, CB, FL)</h3>
                    </div>
                    <div>
                        <table class="d">
                            <tr>
                                <td class="picc">Compliance 
                                </td>
                                <td class="picc">Documentation 
                                </td>
                                <td class="picc">Notes 
                                </td>
                            </tr>
                            <tr>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <strong>18.1</strong>
                                            <asp:Label ID="lbl_Comp_Q18_1" runat="server"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Q18_1" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator64" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Q18_1" ValidationGroup="Val18"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q18_1_1" runat="server" /><asp:Label ID="lbl_Docu_Q18_1_1" runat="server"></asp:Label></li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q18_1_2" runat="server" /><asp:Label ID="lbl_Docu_Q18_1_2" runat="server"></asp:Label><br />
                                            <asp:TextBox ID="txt_Docu_Q18_1_2" runat="server"></asp:TextBox>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q18_1" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <strong>18.2</strong>
                                            <asp:Label ID="lbl_Comp_Q18_2" runat="server"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Q18_2" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator65" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Q18_2" ValidationGroup="Val18"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                            <p>The CQIP addresses the following:</p>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:CheckBox ID="chk_Comp_Q18_2_2" runat="server" /><asp:Label ID="lbl_Comp_Q18_2_1" runat="server"></asp:Label>
                                                </li>
                                                <li>
                                                    <asp:CheckBox ID="chk_Comp_Q18_2_3" runat="server" /><asp:Label ID="lbl_Comp_Q18_2_2" runat="server"></asp:Label>
                                                </li>
                                                <li>
                                                    <asp:CheckBox ID="chk_Comp_Q18_2_4" runat="server" /><asp:Label ID="lbl_Comp_Q18_2_3" runat="server"></asp:Label>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q18_2_1" runat="server" /><asp:Label ID="lbl_Docu_Q18_2_1" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q18_2_2" runat="server" /><asp:Label ID="lbl_Docu_Q18_2_2" runat="server"></asp:Label>
                                            <asp:TextBox ID="txt_Docu_Q18_2_2" runat="server"></asp:TextBox>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q18_2" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <asp:LinkButton ID="lnkPicc_Q18" runat="server" OnClick="lnkPicc_Q18_Click18" ValidationGroup="Val18">Next</asp:LinkButton>
                    </div>
                </div>
            </asp:View>
            <asp:View ID="View19" runat="server">
                <div>
                    <div>
                        <h3 class="finaltoolTitle">19.  The program has a written annual program evaluation and continuous quality improvement plan. (HV, CB, FL)</h3>
                    </div>
                    <div>
                        <table class="d">
                            <tr>
                                <td class="picc">Compliance 
                                </td>
                                <td class="picc">Documentation 
                                </td>
                                <td class="picc">Notes 
                                </td>
                            </tr>
                            <tr>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <strong>19.1</strong>
                                            <asp:Label ID="lbl_Comp_Q19" runat="server"></asp:Label>
                                            <ul style="list-style-type: none" class="checkbox-list">
                                                <li>
                                                    <asp:RadioButtonList ID="rdobtn_Comp_Q19" runat="server">
                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                        <asp:ListItem Value="0">No</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator66" runat="server" ErrorMessage="Required" ControlToValidate="rdobtn_Comp_Q19" ValidationGroup="Val19"></asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <ul style="list-style-type: none" class="checkbox-list">
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q19_1" runat="server" /><asp:Label ID="lbl_Docu_Q19_1" runat="server"></asp:Label><br />
                                            <asp:CheckBox ID="chk_Docu_Q19_2" runat="server" /><asp:Label ID="lbl_Docu_Q19_2" runat="server"></asp:Label><br />
                                            <asp:CheckBox ID="chk_Docu_Q19_3" runat="server" /><asp:Label ID="lbl_Docu_Q19_3" runat="server"></asp:Label><br />
                                            <asp:CheckBox ID="chk_Docu_Q19_4" runat="server" /><asp:Label ID="lbl_Docu_Q19_4" runat="server"></asp:Label><br />
                                            <asp:TextBox ID="txt_Docu_Q19_4" runat="server"></asp:TextBox>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q19" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <asp:LinkButton ID="lnkPicc_Q19" runat="server" OnClick="lnkPicc_Q19_Click19" ValidationGroup="Val19">Next</asp:LinkButton>
                    </div>
                </div>
            </asp:View>
            <asp:View ID="View26" runat="server">
                <div class="Purpose">
                    <h4>Results Summary - Areas of Non-Compliance</h4>
                </div>
                <div>
                    <asp:Repeater ID="Repeater1" runat="server">
                        <HeaderTemplate>
                            <table class="PD">
                                <tr>
                                    <td class="d">PICC #</td>
                                    <td class="d">Description</td>
                                    <td class="d">Notes</td>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td class="d">
                                    <asp:Label ID="lblPiccID" runat="server" Text='<%# Eval("PICC_ID") %>'></asp:Label>
                                    <asp:HiddenField ID="hfPiccColName" Value='<%# Eval("ColTxtName") %>' runat="server" />
                                </td>
                                <td class="d">
                                    <asp:Label ID="lblSummary" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                                </td>
                                <td class="d">
                                    <asp:TextBox ID="txtNotes" runat="server" TextMode="MultiLine" Width="250px" Height="80px"></asp:TextBox>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            <tr>
                                <td class="d" colspan="3" style="text-align:center">
                                    <asp:LinkButton ID="lnkbtnAddComments" runat="server" OnClick="lnkbtnAddComments_Click">Add Comments</asp:LinkButton></td>
                            </tr>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [Picc_Summary]"></asp:SqlDataSource>
                </div>
                <br />
                <asp:LinkButton ID="lnkSubmit" runat="server" OnClick="lnkSubmit_Click">Submit</asp:LinkButton>
            </asp:View>
            <asp:View ID="View27" runat="server">
                <div id="ConfirmHome"></div>
                <div>
                    <h2>Thank you for completing Prevention Initiative Compliance Checklist!</h2>
                    <h6 style="text-align: center;">Your submission has been received.</h6>
                </div>
            </asp:View>
        </asp:MultiView>
                 </ContentTemplate>
       </asp:UpdatePanel>
        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID ="UpdatePanel1">
            <ProgressTemplate>
                <div class="overlay">
                <asp:Image ID="Image1"  runat="server" ImageUrl="~/Images/loader4.gif" />
                    </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
    </div>
</asp:Content>
