<%@ Page Title="" Language="C#" MasterPageFile="~/PICCTool/NMPICC.master" AutoEventWireup="true" CodeBehind="PICCTool.aspx.cs" Inherits="HVP.PICCTool.PICCTool" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="NesterContent" runat="server">
    <div class="userlist">
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
                <div>
                    <div>
                        <asp:HiddenField ID="hfsiteid" runat="server" />
                        <asp:HiddenField ID="hfSchdId" runat="server" />
                        <h3 class="finaltoolTitle">1. Identification of the Prevention Initiative program framework. (HV, CB, FL)</h3>
                    </div>
                    <div>
                        <table class="HVSurvey">
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
                                    <strong>1.1</strong><br />
                                    <ul style="list-style-type: none">
                                        <li>
                                            <asp:CheckBox ID="chkPicc_Compliance_Q1_1_1" runat="server" /><asp:Label ID="lblPicc_Compliance_Q1_1_1" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chkPicc_Compliance_Q1_1_2" runat="server" /><asp:Label ID="lblPicc_Compliance_Q1_1_2" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chkPicc_Compliance_Q1_1_3" runat="server" /><asp:Label ID="lblPicc_Compliance_Q1_1_3" runat="server"></asp:Label>
                                        </li>
                                    </ul>
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
                                    <strong>1.2</strong><br />
                                    <ul style="list-style-type: none">
                                        <li>
                                            <asp:CheckBox ID="chkPicc_Compliance_Q1_2_1" runat="server" /><asp:Label ID="lblPicc_Compliance_Q1_2_1" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chkPicc_Compliance_Q1_2_2" runat="server" /><asp:Label ID="lblPicc_Compliance_Q1_2_2" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <ul style="list-style-position: inside">
                                                <li>
                                                    <asp:Label ID="lblPicc_Compliance_Q1_2_2_1" runat="server"></asp:Label>
                                                    <asp:TextBox ID="txtPicc_Compliance_Q1_2_2_1" runat="server"></asp:TextBox>
                                                </li>
                                                <li>
                                                    <asp:Label ID="lblPicc_Compliance_Q1_2_2_2" runat="server"></asp:Label>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
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
                        <asp:LinkButton ID="lnkPicc_Q1" runat="server" OnClick="lnkPicc_Q1_Click1">Next</asp:LinkButton>
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
                                    <strong>2.1</strong><br />
                                    <ul style="list-style-type: none">
                                        <li>
                                            <asp:RadioButtonList ID="RadioButtonList2" runat="server" DataSourceID="SqlDataSource1" DataTextField="Questions" DataValueField="DropDownNumbers"></asp:RadioButtonList>
                                            <%--<asp:DropDownList ID="ddlPicc_Compliance_Q2_1_1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Questions" DataValueField="DropDownNumbers" Width="100%"></asp:DropDownList>--%>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [Picc_Questions] WHERE ([Label_ID] = @Label_ID)">
                                                <SelectParameters>
                                                    <asp:Parameter DefaultValue="ddlPicc_Compliance_Q2_1_1" Name="Label_ID" Type="String" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </li>
                                        <li>
                                            <asp:TextBox ID="chkPicc_Compliance_Q2_Other" runat="server"></asp:TextBox>
                                            <%--<asp:CheckBox ID="chkPicc_Compliance_Q2_1_2" runat="server" /><asp:Label ID="lblPicc_Compliance_Q2_1_2" runat="server"></asp:Label>--%>
                                        </li>
                                    </ul>
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
                        <asp:LinkButton ID="lnkPicc_Q2" runat="server" OnClick="lnkPicc_Q2_Click2">Next</asp:LinkButton>
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
                                    <strong>3.1</strong><br />
                                    <ul style="list-style-type: none">
                                        <li>
                                            <asp:Label ID="lblPicc_Compliance_Q3_1" runat="server"></asp:Label>
                                            <asp:RadioButtonList ID="rdobtnPicc_Compliance_Q3_1" runat="server">
                                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                                <asp:ListItem Value="2">Yes</asp:ListItem>
                                            </asp:RadioButtonList>
                                            <%--<asp:CheckBox ID="chkPicc_Compliance_Q3_1" runat="server" />--%>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <ul style="list-style-type: none">

                                        <li>Describe the evidence that the program presented to illustrate compliance with the program model.
                                        </li>
                                        <li>
                                            <asp:RadioButtonList ID="rdoPicc_DocU_Q3_1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Questions" DataValueField="DropDownNumbers"></asp:RadioButtonList>
                                            <%--<asp:DropDownList ID="ddlPicc_Docu_Q3_1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Questions" DataValueField="DropDownNumbers" Width="100%"></asp:DropDownList>--%>
                                            <asp:TextBox ID="txtPicc_Doc_Q3_Other" runat="server"></asp:TextBox>
                                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [Picc_Questions] WHERE ([Label_ID] = @Label_ID)">
                                                <SelectParameters>
                                                    <asp:Parameter DefaultValue="ddlPicc_Docu_Q3_1" Name="Label_ID" Type="String" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q3" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <asp:LinkButton ID="lnkPicc_Q3" runat="server" OnClick="lnkPicc_Q3_Click3">Next</asp:LinkButton>
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
                        <table class="scoring">
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
                                    <strong>4.1</strong><br />
                                    <ul style="list-style-type: none">

                                        <li>
                                            <asp:Label ID="lblPicc_Compliance_Q4_1" runat="server"></asp:Label>
                                            <asp:RadioButtonList ID="rdobtnPicc_Compliance_Q4_1" runat="server">
                                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                                <asp:ListItem Value="2">Yes</asp:ListItem>
                                            </asp:RadioButtonList>
                                            <%--<asp:CheckBox ID="chkPicc_Compliance_Q4_1" runat="server" />--%>
                                            <ul style="list-style-type: none">
                                                <li>
                                                    <asp:CheckBox ID="chkPicc_Compliance_Q4_1_1" runat="server" /><asp:Label ID="lblPicc_Compliance_Q4_1_1" runat="server"></asp:Label>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <ul style="list-style-type: none">

                                        <li>
                                            <%--<asp:CheckBox ID="chkPicc_Docu_Q4" runat="server" />--%>
                                            <asp:Label ID="lblPicc_Docu_Q4" runat="server"></asp:Label>
                                            <asp:RadioButtonList ID="rdobtnPicc_Docu_Q4" runat="server">
                                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                                <asp:ListItem Value="2">Yes</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q4" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <asp:LinkButton ID="lnkPicc_Q4" runat="server" OnClick="lnkPicc_Q4_Click4">Next</asp:LinkButton>
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
                                    <strong>5.1</strong><br />
                                    <ul style="list-style-type: none">

                                        <li>
                                            <%--<asp:CheckBox ID="chkPicc_Compliance_Q5_1_1" runat="server" />--%>
                                            <asp:Label ID="lblPicc_Compliance_Q5_1_1" runat="server"></asp:Label>
                                            <asp:RadioButtonList ID="rdobtnPicc_Compliance_Q5_1_1" runat="server">
                                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                                <asp:ListItem Value="2">Yes</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <ul style="list-style-type: none">

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
                                    <strong>5.2</strong><br />
                                    <ul style="list-style-type: none">
                                        <li>
                                            <%--<asp:CheckBox ID="chkPicc_Compliance_Q5_2_1" runat="server" />--%>
                                            <asp:Label ID="lblPicc_Compliance_Q5_2_1" runat="server"></asp:Label>
                                            <asp:RadioButtonList ID="rdobtnPicc_Compliance_Q5_2_1" runat="server">
                                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                                <asp:ListItem Value="2">Yes</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <ul style="list-style-type: none">
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
                        <asp:LinkButton ID="lnkPicc_Q5" runat="server" OnClick="lnkPicc_Q5_Click5">Next</asp:LinkButton>
                    </div>
                </div>
            </asp:View>
            <asp:View ID="View6" runat="server">
                <div>
                    <br />
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
                                    <strong>6.1</strong><br />
                                    <ul style="list-style-type: none">

                                        <li>
                                            <asp:CheckBox ID="chkPicc_Compliance_Q6_1" runat="server" /><asp:Label ID="lblPicc_Compliance_Q6_1" runat="server"></asp:Label>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">

                                    <ul style="list-style-type: none">

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
                                        <%-- <li>
                                            <asp:TextBox ID="txt_Docu_Q6_1_7" runat="server"></asp:TextBox>
                                        </li>
                                        <li>
                                            <asp:TextBox ID="txt_Docu_Q6_1_8" runat="server"></asp:TextBox>
                                        </li>
                                        <li>
                                            <asp:TextBox ID="txt_Docu_Q6_1_9" runat="server"></asp:TextBox>
                                        </li>
                                        <li>
                                            <asp:TextBox ID="txt_Docu_Q6_1_10" runat="server"></asp:TextBox>
                                        </li>--%>
                                    </ul>
                                </td>
                                <td class="scoring">List staff, educational level, certifications and/or credentials:                                 
                                    <asp:TextBox ID="txtPicc_Notes_Q6" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
              <%--          </table>
                       <br />
                        <asp:LinkButton ID="lnkPicc_Q6" runat="server" OnClick="lnkPicc_Q6_Click6">Next</asp:LinkButton>
                    </div>
                  </div>
            </asp:View>

          <asp:View ID="View7" runat="server">
                <div>                 
                    <div>
                        <h3 class="finaltoolTitle">7. The program employs qualified staff in accordance with the program model being implemented. (HV, CB, FL) 
[23 Ill. Adm. Code 235.20(9)] and ISBE policy
                        </h3>
                    </div>
                    <div>
                        <table class="d">--%>
                           <%-- <tr>
                                <td class="picc">Compliance 
                                </td>
                                <td class="picc">Documentation 
                                </td>
                                <td class="picc">Notes 
                                </td>
                            </tr>--%>
                            <tr>
                                <td class="scoring">
                                    <strong>7.1</strong><br />
                                    <ul style="list-style-type: none">

                                        <li>
                                            <asp:CheckBox ID="chkPicc_Compliance_Q7_1_1" runat="server" /><asp:Label ID="lblPicc_Compliance_Q7_1_1" runat="server"></asp:Label>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">

                                    <ul style="list-style-type: none">

                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q7_1_1" runat="server" /><asp:Label ID="lbl_Docu_Q7_1_1" runat="server" Text="Label"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q7_1_2" runat="server" /><asp:Label ID="lbl_Docu_Q7_1_2" runat="server" Text="Label"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q7_1_3" runat="server" /><asp:Label ID="lbl_Docu_Q7_1_3" runat="server" Text="Label"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q7_1_4" runat="server" /><asp:Label ID="lbl_Docu_Q7_1_4" runat="server" Text="Label"></asp:Label><br />
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
                                    <strong>7.2</strong><br />
                                    <ul style="list-style-type: none">

                                        <li>
                                            <asp:CheckBox ID="chkPicc_Compliance_Q7_2_1" runat="server" /><asp:Label ID="lblPicc_Compliance_Q7_2_1" runat="server"></asp:Label>

                                            <br />
                                            The manual provides guidance on the following topics:

                          <ul style="list-style-type: none">
                              <li>
                                  <asp:CheckBox ID="chkPicc_Compliance_Q7_2_2" runat="server" /><asp:Label ID="lblPicc_Compliance_Q7_2_2" runat="server"></asp:Label>
                              </li>
                              <li>
                                  <asp:CheckBox ID="chkPicc_Compliance_Q7_2_3" runat="server" /><asp:Label ID="lblPicc_Compliance_Q7_2_3" runat="server"></asp:Label>
                              </li>
                              <li>
                                  <asp:CheckBox ID="chkPicc_Compliance_Q7_2_4" runat="server" /><asp:Label ID="lblPicc_Compliance_Q7_2_4" runat="server"></asp:Label>
                              </li>
                              <li>
                                  <asp:CheckBox ID="chkPicc_Compliance_Q7_2_5" runat="server" /><asp:Label ID="lblPicc_Compliance_Q7_2_5" runat="server"></asp:Label>
                              </li>
                              <li>
                                  <asp:CheckBox ID="chkPicc_Compliance_Q7_2_6" runat="server" /><asp:Label ID="lblPicc_Compliance_Q7_2_6" runat="server"></asp:Label>
                              </li>
                              <li>
                                  <asp:CheckBox ID="chkPicc_Compliance_Q7_2_7" runat="server" /><asp:Label ID="lblPicc_Compliance_Q7_2_7" runat="server"></asp:Label>
                              </li>
                              <li>
                                  <asp:CheckBox ID="chkPicc_Compliance_Q7_2_8" runat="server" /><asp:Label ID="lblPicc_Compliance_Q7_2_8" runat="server"></asp:Label>
                              </li>
                              <li>
                                  <asp:CheckBox ID="chkPicc_Compliance_Q7_2_9" runat="server" /><asp:Label ID="lblPicc_Compliance_Q7_2_9" runat="server"></asp:Label>
                              </li>
                              <li>
                                  <asp:CheckBox ID="chkPicc_Compliance_Q7_2_10" runat="server" /><asp:Label ID="lblPicc_Compliance_Q7_2_10" runat="server"></asp:Label>
                              </li>
                          </ul>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">

                                    <ul style="list-style-type: none">

                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q7_2_1" runat="server" /><asp:Label ID="lbl_Docu_Q7_2_1" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q7_2_2" runat="server" /><asp:Label ID="lbl_Docu_Q7_2_2" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q7_2_3" runat="server" /><asp:Label ID="lbl_Docu_Q7_2_3" runat="server"></asp:Label>
                                            <br />
                                            <asp:TextBox ID="txt_Docu_Q7_2_3" runat="server"></asp:TextBox>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q7_2" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="scoring">
                                    <strong>7.3</strong><br />
                                    <ul style="list-style-type: none">

                                        <li>
                                            <asp:CheckBox ID="chkPicc_Compliance_Q7_3_1" runat="server" /><asp:Label ID="lblPicc_Compliance_Q7_3_1" runat="server"></asp:Label>
                                            <br />
                                            This plan touches upon the following topics:
                          <ul style="list-style-type: none">
                              <li>
                                  <asp:CheckBox ID="chkPicc_Compliance_Q7_3_2" runat="server" /><asp:Label ID="lblPicc_Compliance_Q7_3_2" runat="server"></asp:Label>
                              </li>
                              <li>
                                  <asp:CheckBox ID="chkPicc_Compliance_Q7_3_3" runat="server" /><asp:Label ID="lblPicc_Compliance_Q7_3_3" runat="server"></asp:Label>
                              </li>
                              <li>
                                  <asp:CheckBox ID="chkPicc_Compliance_Q7_3_4" runat="server" /><asp:Label ID="lblPicc_Compliance_Q7_3_4" runat="server"></asp:Label>
                              </li>
                              <li>
                                  <asp:CheckBox ID="chkPicc_Compliance_Q7_3_5" runat="server" /><asp:Label ID="lblPicc_Compliance_Q7_3_5" runat="server"></asp:Label>
                              </li>
                              <li>
                                  <asp:CheckBox ID="chkPicc_Compliance_Q7_3_6" runat="server" /><asp:Label ID="lblPicc_Compliance_Q7_3_6" runat="server"></asp:Label>
                              </li>
                              <li>
                                  <asp:CheckBox ID="chkPicc_Compliance_Q7_3_7" runat="server" /><asp:Label ID="lblPicc_Compliance_Q7_3_7" runat="server"></asp:Label>
                              </li>
                          </ul>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">

                                    <ul style="list-style-type: none">

                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q7_3_1" runat="server" /><asp:Label ID="lbl_Docu_Q7_3_1" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q7_3_2" runat="server" /><asp:Label ID="lbl_Docu_Q7_3_2" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q7_3_3" runat="server" /><asp:Label ID="lbl_Docu_Q7_3_3" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q7_3_4" runat="server" /><asp:Label ID="lbl_Docu_Q7_3_4" runat="server"></asp:Label>
                                            <br />
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
                        <asp:LinkButton ID="lnkPicc_Q7" runat="server" OnClick="lnkPicc_Q7_Click7">Next</asp:LinkButton>
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
                                <td class="picc">Compliance 
                                </td>
                                <td class="picc">Documentation 
                                </td>
                                <td class="picc">Notes 
                                </td>
                            </tr>
                            <tr>
                                <td class="scoring">
                                    <strong>8.1</strong><br />
                                    <ul style="list-style-type: none">

                                        <li>
                                            <asp:CheckBox ID="chkPicc_Compliance_Q8_1" runat="server" /><asp:Label ID="lblPicc_Compliance_Q8_1" runat="server"></asp:Label>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">

                                    <ul style="list-style-type: none">

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
                                    <ul style="list-style-type: none">
                                        <li>
                                            <strong>8.2</strong><br />
                                            <asp:CheckBox ID="chkPicc_Compliance_Q8_2" runat="server" /><asp:Label ID="lblPicc_Compliance_Q8_2" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <strong>8.3</strong><br />
                                            <asp:CheckBox ID="chkPicc_Compliance_Q8_3" runat="server" /><asp:Label ID="lblPicc_Compliance_Q8_3" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <strong>8.4</strong><br />
                                            <asp:CheckBox ID="chkPicc_Compliance_Q8_4" runat="server" /><asp:Label ID="lblPicc_Compliance_Q8_4" runat="server"></asp:Label>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">

                                    <ul style="list-style-type: none">
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
                                    <ul style="list-style-type: none">
                                        <li>
                                            <strong>8.5</strong><br />
                                            <asp:CheckBox ID="chkPicc_Compliance_Q8_5" runat="server" /><asp:Label ID="lblPicc_Compliance_Q8_5" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <strong>8.6</strong><br />
                                            Families having the most points on the weighted eligibility criteria measure are prioritized on a waiting list.
                                  <br />
                                            <asp:CheckBox ID="chkPicc_Compliance_Q8_6_1" runat="server" /><asp:Label ID="lblPicc_Compliance_Q8_6_1" runat="server"></asp:Label>
                                            <br />
                                            <asp:CheckBox ID="chkPicc_Compliance_Q8_6_2" runat="server" /><asp:Label ID="lblPicc_Compliance_Q8_6_2" runat="server"></asp:Label>
                                            <br />
                                            <asp:CheckBox ID="chkPicc_Compliance_Q8_6_3" runat="server" /><asp:Label ID="lblPicc_Compliance_Q8_6_3" runat="server"></asp:Label>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">

                                    <ul style="list-style-type: none">

                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q8_3_1" runat="server" /><asp:Label ID="lbl_Docu_Q8_3_1" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q8_3_2" runat="server" /><asp:Label ID="lbl_Docu_Q8_3_2" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q8_3_3" runat="server" /><asp:Label ID="lbl_Docu_Q8_3_3" runat="server"></asp:Label>
                                            <br />
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
                                    <strong>8.7</strong><br />
                                    <ul style="list-style-type: none">
                                        <li>
                                            <asp:CheckBox ID="chkPicc_Compliance_Q8_7" runat="server" /><asp:Label ID="lblPicc_Compliance_Q8_7" runat="server"></asp:Label>
                                        </li>
                                        <li>Evidence the parent interview includes questions regarding:
                                     <br />
                                            <strong>8.7.1</strong><br />
                                            <asp:CheckBox ID="chkPicc_Compliance_Q8_7_1" runat="server" /><asp:Label ID="lblPicc_Compliance_Q8_7_1" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <strong>8.7.2</strong><br />
                                            <asp:CheckBox ID="chkPicc_Compliance_Q8_7_2" runat="server" /><asp:Label ID="lblPicc_Compliance_Q8_7_2" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <strong>8.7.3</strong><br />
                                            <asp:CheckBox ID="chkPicc_Compliance_Q8_7_3" runat="server" /><asp:Label ID="lblPicc_Compliance_Q8_7_3" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <strong>8.7.4</strong><br />
                                            <asp:CheckBox ID="chkPicc_Compliance_Q8_7_4" runat="server" /><asp:Label ID="lblPicc_Compliance_Q8_7_4" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <strong>8.7.5</strong><br />
                                            <asp:CheckBox ID="chkPicc_Compliance_Q8_7_5" runat="server" /><asp:Label ID="lblPicc_Compliance_Q8_7_5" runat="server" Text="Label"></asp:Label>
                                        </li>
                                        <li>
                                            <strong>8.7.6</strong><br />
                                            <asp:CheckBox ID="chkPicc_Compliance_Q8_7_6" runat="server" /><asp:Label ID="lblPicc_Compliance_Q8_7_6" runat="server" Text="Label"></asp:Label>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">

                                    <ul style="list-style-type: none">
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
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q8_7" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="scoring">
                                    <strong>8.8</strong><br />
                                    Evidence in each child’s/family’s file, as applicable, of the child’s developmental screening results and/or Early Intervention Individual Family Service Plan. 
                          <ul style="list-style-type: none">
                              <li>
                                  <asp:CheckBox ID="chkPicc_Compliance_Q8_8_1" runat="server" /><asp:Label ID="lblPicc_Compliance_Q8_8_1" runat="server"></asp:Label>
                                  <br />
                                  <asp:CheckBox ID="chkPicc_Compliance_Q8_8_2" runat="server" /><asp:Label ID="lblPicc_Compliance_Q8_8_2" runat="server"></asp:Label>
                                  <br />
                                  <asp:CheckBox ID="chkPicc_Compliance_Q8_8_3" runat="server" /><asp:Label ID="lblPicc_Compliance_Q8_8_3" runat="server"></asp:Label>
                              </li>
                          </ul>
                                </td>
                                <td class="scoring">
                                    <ul style="list-style-type: none">
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q8_8_1" runat="server" /><asp:Label ID="lbl_Docu_Q8_8_1" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q8_8_2" runat="server" /><asp:Label ID="lbl_Docu_Q8_8_2" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q8_8_3" runat="server" /><asp:Label ID="lbl_Docu_Q8_8_3" runat="server"></asp:Label>
                                            <br />
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
                                    <strong>8.9</strong><br />
                                    Evidence in each child’s/family’s file that the screening results are shared with parent/guardian (child’s developmental screening as applicable and/or did not qualify for the PI program, enrolled in the PI program, or on PI program waiting list).
                          <ul style="list-style-type: none">
                              <li>
                                  <asp:CheckBox ID="chkPicc_Compliance_Q8_9_1" runat="server" /><asp:Label ID="lblPicc_Compliance_Q8_9_1" runat="server"></asp:Label>
                                  <br />
                                  <asp:CheckBox ID="chkPicc_Compliance_Q8_9_2" runat="server" /><asp:Label ID="lblPicc_Compliance_Q8_9_2" runat="server"></asp:Label>
                              </li>
                          </ul>
                                </td>
                                <td class="scoring">

                                    <ul style="list-style-type: none">

                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q8_9_1" runat="server" /><asp:Label ID="lbl_Docu_Q8_9_1" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q8_9_2" runat="server" /><asp:Label ID="lbl_Docu_Q8_9_2" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q8_9_3" runat="server" /><asp:Label ID="lbl_Docu_Q8_9_3" runat="server"></asp:Label>
                                            <br />
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
                                    <strong>8.10</strong><br />
                                    Evidence appropriate staff members are involved in the screening process and/or have access to the screening results as applicable.
                          <ul style="list-style-type: none">
                              <li>
                                  <asp:CheckBox ID="chkPicc_Compliance_Q8_10_1" runat="server" /><asp:Label ID="lblPicc_Compliance_Q8_10_1" runat="server"></asp:Label>
                                  <br />
                                  <asp:CheckBox ID="chkPicc_Compliance_Q8_10_2" runat="server" /><asp:Label ID="lblPicc_Compliance_Q8_10_2" runat="server"></asp:Label>
                              </li>
                          </ul>
                                </td>
                                <td class="scoring">

                                    <ul style="list-style-type: none">

                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q8_10_1" runat="server" /><asp:Label ID="lbl_Docu_Q8_10_1" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q8_10_2" runat="server" /><asp:Label ID="lbl_Docu_Q8_10_2" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q8_10_3" runat="server" /><asp:Label ID="lbl_Docu_Q8_10_3" runat="server"></asp:Label>
                                            <br />
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
                        <asp:LinkButton ID="lnkPicc_Q8" runat="server" OnClick="lnkPicc_Q8_Click8">Next</asp:LinkButton>
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
                                    <strong>9.1</strong><br />
                                    <ul style="list-style-type: none">

                                        <li>
                                            <asp:CheckBox ID="chkPicc_Compliance_Q9_1" runat="server" /><asp:Label ID="lblPicc_Compliance_Q9_1" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <br />
                                            <strong>9.1.1</strong><br />
                                            <asp:Label ID="lblPicc_Compliance_Q9_1_1" runat="server"></asp:Label><br />
                                            <asp:TextBox ID="txtPicc_Compliance_Q9_1_1" runat="server"></asp:TextBox>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">

                                    <ul style="list-style-type: none">

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
                                    <strong>9.2</strong><br />
                                    <ul style="list-style-type: none">

                                        <li>
                                            <asp:CheckBox ID="chkPicc_Compliance_Q9_2" runat="server" /><asp:Label ID="lblPicc_Compliance_Q9_2" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <br />
                                            <strong>9.2.1</strong><br />
                                            <asp:Label ID="lblPicc_Compliance_Q9_2_1" runat="server"></asp:Label><br />
                                            <asp:TextBox ID="txtPicc_Compliance_Q9_2_1" runat="server"></asp:TextBox>
                                        </li>
                                        <li>
                                            <br />
                                            <strong>9.2.2</strong><br />
                                            <asp:Label ID="lblPicc_Compliance_Q9_2_2" runat="server"></asp:Label><br />
                                            <asp:TextBox ID="txtPicc_Compliance_Q9_2_2" runat="server"></asp:TextBox>
                                        </li>
                                        <li>
                                            <br />
                                            <strong>9.2.3</strong><br />
                                            <asp:Label ID="lblPicc_Compliance_Q9_2_3" runat="server"></asp:Label><br />
                                            <asp:TextBox ID="txtPicc_Compliance_Q9_2_3" runat="server"></asp:TextBox>
                                        </li>
                                        <li>
                                            <br />
                                            <strong>9.2.4</strong><br />
                                            <asp:Label ID="lblPicc_Compliance_Q9_2_4" runat="server"></asp:Label><br />
                                            <asp:TextBox ID="txtPicc_Compliance_Q9_2_4" runat="server"></asp:TextBox>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">

                                    <ul style="list-style-type: none">

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
                                    <strong>9.3</strong><br />
                                    <ul style="list-style-type: none">

                                        <li>
                                            <asp:CheckBox ID="chkPicc_Compliance_Q9_3" runat="server" /><asp:Label ID="lblPicc_Compliance_Q9_3" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <br />
                                            <strong>9.3.1</strong><br />
                                            <asp:Label ID="lblPicc_Compliance_Q9_3_1" runat="server"></asp:Label><br />
                                            <asp:TextBox ID="txtPicc_Compliance_Q9_3_1" runat="server"></asp:TextBox><br />
                                            <asp:TextBox ID="txtPicc_Compliance_Q9_3_2" runat="server"></asp:TextBox><br />
                                            <asp:TextBox ID="txtPicc_Compliance_Q9_3_3" runat="server"></asp:TextBox><br />
                                        </li>

                                    </ul>
                                </td>
                                <td class="scoring">

                                    <ul style="list-style-type: none">

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
                        <asp:LinkButton ID="lnkPicc_Q9" runat="server" OnClick="lnkPicc_Q9_Click9">Next</asp:LinkButton>
                    </div>
                </div>
            </asp:View>
            <asp:View ID="View10" runat="server">
                <div>
                    <br />
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
                                    <strong>10.1</strong><br />
                                    <ul style="list-style-type: none">

                                        <li>
                                            <asp:CheckBox ID="chkPicc_Compliance_Q10_1_1" runat="server" /><asp:Label ID="lblPicc_Compliance_Q10_1_1" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <strong>10.1.1</strong><br />
                                            <asp:CheckBox ID="chkPicc_Compliance_Q10_1_2" runat="server" /><asp:Label ID="lblPicc_Compliance_Q10_1_2" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <strong>10.1.2</strong><br />
                                            <asp:CheckBox ID="chkPicc_Compliance_Q10_1_3" runat="server" /><asp:Label ID="lblPicc_Compliance_Q10_1_3" runat="server"></asp:Label>
                                        </li>
                                    </ul>
                                    Note:  More than one tool may be needed to ensure a comprehensive evidence-based screening has occurred.       
                                </td>
                                <td class="scoring">Broad-based Screening Instrument:
                         <ul style="list-style-type: none">

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
                             <li>Social and Emotional Screening Instrument:<br />
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
                                    <strong>10.2</strong><br />
                                    <ul style="list-style-type: none">

                                        <li>
                                            <asp:CheckBox ID="chkPicc_Compliance_Q10_2_1" runat="server" /><asp:Label ID="lblPicc_Compliance_Q10_2_1" runat="server"></asp:Label>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">

                                    <ul style="list-style-type: none">

                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q10__2_1" runat="server" /><asp:Label ID="lbl_Docu_Q10__2_1" runat="server"></asp:Label>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q10_2" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <asp:LinkButton ID="lnkPicc_Q10" runat="server" OnClick="lnkPicc_Q10_Click10">Next</asp:LinkButton>
                    </div>
                </div>
            </asp:View>
            <asp:View ID="View11" runat="server">
                <div>
                    <br />
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
                                    <strong>11.1</strong><br />
                                    <ul style="list-style-type: none">

                                        <li>
                                            <asp:CheckBox ID="chkPicc_Compliance_Q11_1_1" runat="server" /><asp:Label ID="lblPicc_Compliance_Q11_1_1" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <strong>11.2</strong><br />
                                            <asp:CheckBox ID="chkPicc_Compliance_Q11_2_1" runat="server" /><asp:Label ID="lblPicc_Compliance_Q11_2_1" runat="server"></asp:Label><br />
                                            <asp:TextBox ID="txtPicc_Compliance_Q11_2_1" runat="server" TextMode="MultiLine" BorderStyle="Solid"></asp:TextBox>
                                        </li>
                                        <li>
                                            <strong>11.3</strong><br />
                                            <asp:CheckBox ID="chkPicc_Compliance_Q11_3_1" runat="server" /><asp:Label ID="lblPicc_Compliance_Q11_3_1" runat="server"></asp:Label><br />
                                            <asp:TextBox ID="txtPicc_Compliance_Q11_3_1" runat="server" TextMode="MultiLine" BorderStyle="Solid"></asp:TextBox>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <ul style="list-style-type: none">

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
                                    <asp:TextBox ID="txtPicc_Notes_Q11" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <asp:LinkButton ID="lnkPicc_Q11" runat="server" OnClick="lnkPicc_Q11_Click11">Next</asp:LinkButton>
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
                                    <strong>12.1</strong><br />
                                    <ul style="list-style-type: none">

                                        <li>
                                            <asp:CheckBox ID="chkPicc_Compliance_Q12_1" runat="server" /><asp:Label ID="lblPicc_Compliance_Q12_1" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <strong>12.1.1</strong><br />
                                            <asp:CheckBox ID="chkPicc_Compliance_Q12_1_1" runat="server" /><asp:Label ID="lblPicc_Compliance_Q12_1_1" runat="server"></asp:Label><br />
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <ul style="list-style-type: none">
                                        <li>
                                            <asp:DropDownList ID="ddl_Docu_Q12_1" runat="server" DataSourceID="SqlDataSource3" DataTextField="Questions" DataValueField="DropDownNumbers" Width="100%"></asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [Picc_Questions] WHERE ([Label_ID] = @Label_ID)">
                                                <SelectParameters>
                                                    <asp:Parameter DefaultValue="ddl_Docu_Q12_1" Name="Label_ID" Type="String" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q12_1" runat="server" /><asp:Label ID="lbl_Docu_Q12_1" runat="server"></asp:Label><br />
                                            <asp:TextBox ID="txt_Docu_Q12_1" runat="server"></asp:TextBox>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q12_1" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="scoring">
                                    <strong>12.2</strong><br />
                                    <ul style="list-style-type: none">

                                        <li>Evidence in each child’s/family’s file that an Individual Family Service Plan is developed in partnership with each family
                                            <br />
                                            <asp:CheckBox ID="chkPicc_Compliance_Q12_2_1" runat="server" /><asp:Label ID="lblPicc_Compliance_Q12_2_1" runat="server"></asp:Label><br />
                                            <asp:CheckBox ID="chkPicc_Compliance_Q12_2_2" runat="server" /><asp:Label ID="lblPicc_Compliance_Q12_2_2" runat="server"></asp:Label><br />
                                            <asp:CheckBox ID="chkPicc_Compliance_Q12_2_3" runat="server" /><asp:Label ID="lblPicc_Compliance_Q12_2_3" runat="server"></asp:Label>
                                        </li>
                                        <li>
                                            <strong>12.2.1</strong><br />
                                            Evidence in each child’s/family’s file that the Individual Family Service/Support Plan is updated at least every six months 
                                            <br />
                                            <asp:CheckBox ID="chkPicc_Compliance_Q12_2_1_1" runat="server" /><asp:Label ID="lblPicc_Compliance_Q12_2_1_1" runat="server"></asp:Label><br />
                                            <asp:CheckBox ID="chkPicc_Compliance_Q12_2_1_2" runat="server" /><asp:Label ID="lblPicc_Compliance_Q12_2_1_2" runat="server"></asp:Label><br />
                                            <asp:CheckBox ID="chkPicc_Compliance_Q12_2_1_3" runat="server" /><asp:Label ID="lblPicc_Compliance_Q12_2_1_3" runat="server"></asp:Label>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <ul style="list-style-type: none">
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q12_2" runat="server" /><asp:Label ID="lbl_Docu_Q12_2" runat="server"></asp:Label><br />
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q12_2" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <asp:LinkButton ID="lnkPicc_Q12" runat="server" OnClick="lnkPicc_Q12_Click12">Next</asp:LinkButton>
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
                                    <strong>13.1</strong><br />
                                    <ul style="list-style-type: none">
                                        <li>
                                            <asp:DropDownList ID="ddlPicc_Compliance_Q13_1" runat="server" DataSourceID="SqlDataSource4" DataTextField="Questions" DataValueField="DropDownNumbers" Width="100%"></asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [Picc_Questions] WHERE ([Label_ID] = @Label_ID)">
                                                <SelectParameters>
                                                    <asp:Parameter DefaultValue="ddlPicc_Compliance_Q13_1" Name="Label_ID" Type="String" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chkPicc_Compliance_Q13_1" runat="server" /><asp:Label ID="lblPicc_Compliance_Q13_1" runat="server"></asp:Label>
                                            <asp:TextBox ID="txtPicc_Compliance_Q13_1" runat="server"></asp:TextBox>
                                        </li>
                                        <li>
                                            <strong>13.2</strong><br />
                                            <asp:CheckBox ID="chkPicc_Compliance_Q13_2" runat="server" /><asp:Label ID="lblPicc_Compliance_Q13_2" runat="server"></asp:Label><br />
                                            <br />
                                        </li>
                                        <li>Plus references to the IELG (standards and/or indicators/keywords or phrases) are evident in the following:<br />
                                            <asp:CheckBox ID="chkPicc_Compliance_Q13_2_1" runat="server" /><asp:Label ID="lblPicc_Compliance_Q13_2_1" runat="server"></asp:Label><br />
                                            <asp:CheckBox ID="chkPicc_Compliance_Q13_2_2" runat="server" /><asp:Label ID="lblPicc_Compliance_Q13_2_2" runat="server"></asp:Label><br />
                                            <asp:CheckBox ID="chkPicc_Compliance_Q13_2_3" runat="server" /><asp:Label ID="lblPicc_Compliance_Q13_2_3" runat="server"></asp:Label>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <ul style="list-style-type: none">
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q13_1" runat="server" /><asp:Label ID="lbl_Docu_Q13_1" runat="server" Text="Label"></asp:Label><br />
                                            <br />
                                        </li>
                                        <li>Plus references to the IELG (standards and/or indicators/keywords or phrases) are evident in the following:
                                            <br />
                                            <asp:CheckBox ID="chk_Docu_Q13_2" runat="server" /><asp:Label ID="lbl_Docu_Q13_2" runat="server"></asp:Label><br />
                                            <asp:CheckBox ID="chk_Docu_Q13_3" runat="server" /><asp:Label ID="lbl_Docu_Q13_3" runat="server"></asp:Label><br />
                                            <asp:CheckBox ID="chk_Docu_Q13_4" runat="server" /><asp:Label ID="lbl_Docu_Q13_4" runat="server"></asp:Label><br />
                                            <asp:CheckBox ID="chk_Docu_Q13_5" runat="server" /><asp:Label ID="lbl_Docu_Q13_5" runat="server"></asp:Label><br />
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
                        <asp:LinkButton ID="lnkPicc_Q13" runat="server" OnClick="lnkPicc_Q13_Click13">Next</asp:LinkButton>
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
                                <td class="scoring">Evidence of instruction regarding the eight designated areas of instruction:                  
                   <ul style="list-style-type: none">

                       <li>
                           <strong>14.1</strong><br />
                           <asp:CheckBox ID="chkPicc_Compliance_Q14_1" runat="server" /><asp:Label ID="lblPicc_Compliance_Q14_1" runat="server"></asp:Label>
                       </li>
                       <li>
                           <strong>14.2</strong><br />
                           <asp:CheckBox ID="chkPicc_Compliance_Q14_2" runat="server" /><asp:Label ID="lblPicc_Compliance_Q14_2" runat="server"></asp:Label><br />
                           <br />
                       </li>
                       <li>
                           <strong>14.3</strong><br />
                           <asp:CheckBox ID="chkPicc_Compliance_Q14_3" runat="server" /><asp:Label ID="lblPicc_Compliance_Q14_3" runat="server"></asp:Label><br />
                           <br />
                       </li>
                       <li>
                           <strong>14.4</strong><br />
                           <asp:CheckBox ID="chkPicc_Compliance_Q14_4" runat="server" /><asp:Label ID="lblPicc_Compliance_Q14_4" runat="server"></asp:Label><br />
                           <br />
                       </li>
                       <li>
                           <strong>14.5</strong><br />
                           <asp:CheckBox ID="chkPicc_Compliance_Q14_5" runat="server" /><asp:Label ID="lblPicc_Compliance_Q14_5" runat="server"></asp:Label><br />
                           <br />
                       </li>
                       <li>
                           <strong>14.6</strong><br />
                           <asp:CheckBox ID="chkPicc_Compliance_Q14_6" runat="server" /><asp:Label ID="lblPicc_Compliance_Q14_6" runat="server"></asp:Label><br />
                           <br />
                       </li>
                       <li>
                           <strong>14.7</strong><br />
                           <asp:CheckBox ID="chkPicc_Compliance_Q14_7" runat="server" /><asp:Label ID="lblPicc_Compliance_Q14_7" runat="server"></asp:Label><br />
                           <br />
                       </li>
                       <li>
                           <strong>14.8</strong><br />
                           <asp:CheckBox ID="chkPicc_Compliance_Q14_8" runat="server" /><asp:Label ID="lblPicc_Compliance_Q14_8" runat="server"></asp:Label><br />
                           <br />
                       </li>
                   </ul>
                                </td>
                                <td class="scoring">
                                    <ul style="list-style-type: none">
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q14_1" runat="server" /><asp:Label ID="lbl_Docu_Q14_1" runat="server"></asp:Label><br />
                                            <asp:CheckBox ID="chk_Docu_Q14_2" runat="server" /><asp:Label ID="lbl_Docu_Q14_2" runat="server"></asp:Label><br />
                                            <asp:CheckBox ID="chk_Docu_Q14_3" runat="server" /><asp:Label ID="lbl_Docu_Q14_3" runat="server"></asp:Label><br />
                                            <asp:CheckBox ID="chk_Docu_Q14_4" runat="server" /><asp:Label ID="lbl_Docu_Q14_4" runat="server"></asp:Label><br />
                                            <asp:CheckBox ID="chk_Docu_Q14_5" runat="server" /><asp:Label ID="lbl_Docu_Q14_5" runat="server"></asp:Label><br />
                                            <asp:CheckBox ID="chk_Docu_Q14_6" runat="server" /><asp:Label ID="lbl_Docu_Q14_6" runat="server"></asp:Label><br />
                                            <asp:CheckBox ID="chk_Docu_Q14_7" runat="server" /><asp:Label ID="lbl_Docu_Q14_7" runat="server"></asp:Label><br />
                                            <asp:CheckBox ID="chk_Docu_Q14_8" runat="server" /><asp:Label ID="lbl_Docu_Q14_8" runat="server"></asp:Label><br />
                                            <asp:TextBox ID="txt_Docu_Q14_8" runat="server"></asp:TextBox>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q14" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <asp:LinkButton ID="lnkPicc_Q14" runat="server" OnClick="lnkPicc_Q14_Click14">Next</asp:LinkButton>
                    </div>
                </div>
            </asp:View>

            <asp:View ID="View15" runat="server">
                <div>
                    <br />
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
                                    <ul style="list-style-type: none">

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
                                        <li>
                                            <strong>15.5</strong><br />
                                            <asp:CheckBox ID="chkPicc_Compliance_Q15_5" runat="server" /><asp:Label ID="lblPicc_Compliance_Q15_5" runat="server"></asp:Label><br />
                                            <br />
                                        </li>
                                        <li>Plus references to the IELG (standards and/or indicators/keywords or phrases) are evident in the following:<br />
                                            <asp:CheckBox ID="chkPicc_Compliance_Q15_5_1" runat="server" /><asp:Label ID="lblPicc_Compliance_Q15_5_1" runat="server"></asp:Label><br />
                                            <br />
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chkPicc_Compliance_Q15_5_2" runat="server" /><asp:Label ID="lblPicc_Compliance_Q15_5_2" runat="server"></asp:Label><br />
                                            <br />
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="chkPicc_Compliance_Q15_5_3" runat="server" /><asp:Label ID="lblPicc_Compliance_Q15_5_3" runat="server"></asp:Label><br />
                                            <br />
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <ul style="list-style-type: none">
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q15_1" runat="server" /><asp:Label ID="lbl_Docu_Q15_1" runat="server"></asp:Label><br />
                                            Plus references to the IELG (standards and/or indicators/keywords or phrases) are evident in the following:
                                            <br />
                                            <asp:CheckBox ID="chk_Docu_Q15_2" runat="server" /><asp:Label ID="lbl_Docu_Q15_2" runat="server"></asp:Label><br />
                                            <asp:CheckBox ID="chk_Docu_Q15_3" runat="server" /><asp:Label ID="lbl_Docu_Q15_3" runat="server"></asp:Label><br />
                                            <asp:CheckBox ID="chk_Docu_Q15_4" runat="server" /><asp:Label ID="lbl_Docu_Q15_4" runat="server"></asp:Label><br />
                                            <asp:CheckBox ID="chk_Docu_Q15_5" runat="server" /><asp:Label ID="lbl_Docu_Q15_5" runat="server"></asp:Label><br />
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
                        <asp:LinkButton ID="lnkPicc_Q15" runat="server" OnClick="lnkPicc_Q15_Click15">Next</asp:LinkButton>
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
                                    <strong>16.1</strong>
                                    <ul style="list-style-type: none">

                                        <li>
                                            <asp:CheckBox ID="chkPicc_Compliance_Q16_1" runat="server" /><asp:Label ID="lblPicc_Compliance_Q16_1" runat="server"></asp:Label><br />
                                            <br />
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <ul style="list-style-type: none">
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q16_1" runat="server" /><asp:Label ID="lbl_Docu_Q16_1" runat="server"></asp:Label><br />
                                            <asp:CheckBox ID="chk_Docu_Q16_2" runat="server" /><asp:Label ID="lbl_Docu_Q16_2" runat="server"></asp:Label><br />
                                            <asp:CheckBox ID="chk_Docu_Q16_3" runat="server" /><asp:Label ID="lbl_Docu_Q16_3" runat="server"></asp:Label><br />
                                            <asp:CheckBox ID="chk_Docu_Q16_4" runat="server" /><asp:Label ID="lbl_Docu_Q16_4" runat="server"></asp:Label><br />
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
                                    <strong>16.2</strong><br />
                                    Evidence in each child’s/family’s file, as applicable, that the program develops written individualized Transition Plans to ensure children and families experience a seamless transition of services                 
                   <ul style="list-style-type: none">

                       <li>
                           <asp:CheckBox ID="chkPicc_Compliance_Q16_2_1" runat="server" /><asp:Label ID="lblPicc_Compliance_Q16_2_1" runat="server"></asp:Label><br />
                           <br />
                       </li>
                       <li>
                           <asp:CheckBox ID="chkPicc_Compliance_Q16_2_2" runat="server" /><asp:Label ID="lblPicc_Compliance_Q16_2_2" runat="server"></asp:Label><br />
                           <br />
                       </li>
                       <li>
                           <asp:CheckBox ID="chkPicc_Compliance_Q16_2_3" runat="server" /><asp:Label ID="lblPicc_Compliance_Q16_2_3" runat="server"></asp:Label><br />
                           <br />
                       </li>
                   </ul>
                                </td>
                                <td class="scoring">
                                    <ul style="list-style-type: none">
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q16_2_1" runat="server" /><asp:Label ID="lbl_Docu_Q16_2_1" runat="server"></asp:Label><br />
                                            <asp:CheckBox ID="chk_Docu_Q16_2_2" runat="server" /><asp:Label ID="lbl_Docu_Q16_2_2" runat="server"></asp:Label><br />
                                            <asp:CheckBox ID="chk_Docu_Q16_2_3" runat="server" /><asp:Label ID="lbl_Docu_Q16_2_3" runat="server"></asp:Label><br />
                                            <asp:CheckBox ID="chk_Docu_Q16_2_4" runat="server" /><asp:Label ID="lbl_Docu_Q16_2_4" runat="server"></asp:Label><br />
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
                                    <strong>16.2.1</strong><br />
                                    Evidence in each child’s/family’s file, as applicable, that program develops transition plans with families beginning at 2 years, 6 months/30 months 
                   <ul style="list-style-type: none">

                       <li>
                           <asp:CheckBox ID="chkPicc_Compliance_Q16_2_1_1" runat="server" /><asp:Label ID="lblPicc_Compliance_Q16_2_1_1" runat="server" Text="Label"></asp:Label><br />
                           <br />
                       </li>
                       <li>
                           <asp:CheckBox ID="chkPicc_Compliance_Q16_2_1_2" runat="server" /><asp:Label ID="lblPicc_Compliance_Q16_2_1_2" runat="server" Text="Label"></asp:Label><br />
                           <br />
                       </li>
                       <li>
                           <asp:CheckBox ID="chkPicc_Compliance_Q16_2_1_3" runat="server" /><asp:Label ID="lblPicc_Compliance_Q16_2_1_3" runat="server" Text="Label"></asp:Label><br />
                           <br />
                       </li>
                   </ul>
                                </td>
                                <td class="scoring">
                                    <ul style="list-style-type: none">
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q16_2_1_1" runat="server" /><asp:Label ID="lbl_Docu_Q16_2_1_1" runat="server"></asp:Label><br />
                                            <asp:CheckBox ID="chk_Docu_Q16_2_1_2" runat="server" /><asp:Label ID="lbl_Docu_Q16_2_1_2" runat="server"></asp:Label><br />
                                            <asp:CheckBox ID="chk_Docu_Q16_2_1_3" runat="server" /><asp:Label ID="lbl_Docu_Q16_2_1_3" runat="server"></asp:Label><br />
                                            <asp:CheckBox ID="chk_Docu_Q16_2_1_4" runat="server" /><asp:Label ID="lbl_Docu_Q16_2_1_4" runat="server"></asp:Label><br />
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
                                    <strong>16.3</strong><br />
                                    Evidence that referral system is utilized when necessary/applicable.
                   <ul style="list-style-type: none">

                       <li>
                           <asp:CheckBox ID="chkPicc_Compliance_Q16_3_1" runat="server" /><asp:Label ID="lblPicc_Compliance_Q16_3_1" runat="server"></asp:Label><br />
                           <br />
                       </li>
                       <li>
                           <asp:CheckBox ID="chkPicc_Compliance_Q16_3_2" runat="server" /><asp:Label ID="lblPicc_Compliance_Q16_3_2" runat="server"></asp:Label><br />
                           <br />
                       </li>
                       <li>
                           <asp:CheckBox ID="chkPicc_Compliance_Q16_3_3" runat="server" /><asp:Label ID="lblPicc_Compliance_Q16_3_3" runat="server"></asp:Label><br />
                           <br />
                       </li>
                       <li>Areas to check: 
                           <ul style="list-style-position: inside">
                               <li>
                                   <asp:Label ID="lblPicc_Compliance_Q16_3_4" runat="server"></asp:Label>
                               </li>
                               <li>
                                   <asp:Label ID="lblPicc_Compliance_Q16_3_5" runat="server"></asp:Label>
                               </li>
                               <li>
                                   <asp:Label ID="lblPicc_Compliance_Q16_3_6" runat="server"></asp:Label>
                               </li>
                               <li>
                                   <asp:Label ID="lblPicc_Compliance_Q16_3_7" runat="server"></asp:Label>
                               </li>
                           </ul>
                       </li>
                   </ul>
                                </td>
                                <td class="scoring">
                                    <ul style="list-style-type: none">
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q16_3_1" runat="server" /><asp:Label ID="lbl_Docu_Q16_3_1" runat="server"></asp:Label><br />
                                            <asp:CheckBox ID="chk_Docu_Q16_3_2" runat="server" /><asp:Label ID="lbl_Docu_Q16_3_2" runat="server"></asp:Label><br />
                                            <asp:CheckBox ID="chk_Docu_Q16_3_3" runat="server" /><asp:Label ID="lbl_Docu_Q16_3_3" runat="server"></asp:Label><br />
                                            <asp:CheckBox ID="chk_Docu_Q16_3_4" runat="server" /><asp:Label ID="lbl_Docu_Q16_3_4" runat="server"></asp:Label><br />
                                            <asp:CheckBox ID="chk_Docu_Q16_3_5" runat="server" /><asp:Label ID="lbl_Docu_Q16_3_5" runat="server"></asp:Label><br />
                                            <asp:TextBox ID="txt_Docu_Q16_3_5" runat="server"></asp:TextBox>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q16_3" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="scoring">
                                    <strong>16.4</strong><br />
                                    Evidence that referred children receive follow-up to confirm access to new services.
                   <ul style="list-style-type: none">

                       <li>
                           <asp:CheckBox ID="chkPicc_Compliance_Q16_4_1" runat="server" /><asp:Label ID="lblPicc_Compliance_Q16_4_1" runat="server"></asp:Label><br />
                           <br />
                       </li>
                       <li>
                           <asp:CheckBox ID="chkPicc_Compliance_Q16_4_2" runat="server" /><asp:Label ID="lblPicc_Compliance_Q16_4_2" runat="server"></asp:Label><br />
                           <br />
                       </li>
                       <li>
                           <asp:CheckBox ID="chkPicc_Compliance_Q16_4_3" runat="server" /><asp:Label ID="lblPicc_Compliance_Q16_4_3" runat="server"></asp:Label><br />
                           <br />
                       </li>
                       <li>Areas to check: 
                          <ul style="list-style-position: inside">
                              <li>
                                  <asp:Label ID="lblPicc_Compliance_Q16_4_4" runat="server" Text="Label"></asp:Label>
                              </li>
                              <li>
                                  <asp:Label ID="lblPicc_Compliance_Q16_4_5" runat="server" Text="Label"></asp:Label>
                              </li>
                              <li>
                                  <asp:Label ID="lblPicc_Compliance_Q16_4_6" runat="server" Text="Label"></asp:Label>
                              </li>
                              <li>
                                  <asp:Label ID="lblPicc_Compliance_Q16_4_7" runat="server" Text="Label"></asp:Label>
                              </li>
                          </ul>
                       </li>
                   </ul>
                                </td>
                                <td class="scoring">
                                    <ul style="list-style-type: none">
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q16_4_1" runat="server" /><asp:Label ID="lbl_Docu_Q16_4_1" runat="server"></asp:Label><br />
                                            <asp:CheckBox ID="chk_Docu_Q16_4_2" runat="server" /><asp:Label ID="lbl_Docu_Q16_4_2" runat="server"></asp:Label><br />
                                            <asp:CheckBox ID="chk_Docu_Q16_4_3" runat="server" /><asp:Label ID="lbl_Docu_Q16_4_3" runat="server"></asp:Label><br />
                                            <asp:CheckBox ID="chk_Docu_Q16_4_4" runat="server" /><asp:Label ID="lbl_Docu_Q16_4_4" runat="server"></asp:Label><br />
                                            <asp:CheckBox ID="chk_Docu_Q16_4_5" runat="server" /><asp:Label ID="lbl_Docu_Q16_4_5" runat="server"></asp:Label><br />
                                            <asp:TextBox ID="txt_Docu_Q16_4_5" runat="server"></asp:TextBox>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q16_4" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <asp:LinkButton ID="lnkPicc_Q16" runat="server" OnClick="lnkPicc_Q16_Click16">Next</asp:LinkButton>
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
                                    <strong>17.1</strong>
                                    <ul style="list-style-type: none">

                                        <li>
                                            <asp:CheckBox ID="chkPicc_Compliance_Q17_1" runat="server" /><asp:Label ID="lblPicc_Compliance_Q17_1" runat="server"></asp:Label>
                                            <ul style="list-style-type: none">
                                                <li>
                                                    <asp:CheckBox ID="chkPicc_Compliance_Q17_2" runat="server" /><asp:Label ID="lblPicc_Compliance_Q17_2" runat="server"></asp:Label>
                                                </li>
                                                <li>
                                                    <asp:CheckBox ID="chkPicc_Compliance_Q17_3" runat="server" /><asp:Label ID="lblPicc_Compliance_Q17_3" runat="server"></asp:Label>
                                                </li>
                                                <li>
                                                    <asp:CheckBox ID="chkPicc_Compliance_Q17_4" runat="server" /><asp:Label ID="lblPicc_Compliance_Q17_4" runat="server"></asp:Label>
                                                </li>
                                                <li>
                                                    <asp:CheckBox ID="chkPicc_Compliance_Q17_5" runat="server" /><asp:Label ID="lblPicc_Compliance_Q17_5" runat="server"></asp:Label>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <ul style="list-style-type: none">
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q17_1" runat="server" /><asp:Label ID="lbl_Docu_Q17_1" runat="server"></asp:Label><br />
                                            <asp:CheckBox ID="chk_Docu_Q17_2" runat="server" /><asp:Label ID="lbl_Docu_Q17_2" runat="server"></asp:Label><br />
                                            <asp:CheckBox ID="chk_Docu_Q17_3" runat="server" /><asp:Label ID="lbl_Docu_Q17_3" runat="server"></asp:Label><br />
                                            <asp:CheckBox ID="chk_Docu_Q17_4" runat="server" /><asp:Label ID="lbl_Docu_Q17_4" runat="server"></asp:Label><br />
                                            <asp:TextBox ID="txt_Docu_Q17_4" runat="server"></asp:TextBox>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <asp:TextBox ID="txtPicc_Notes_Q17" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <asp:LinkButton ID="lnkPicc_Q17" runat="server" OnClick="lnkPicc_Q17_Click17">Next</asp:LinkButton>
                    </div>
                </div>
            </asp:View>
            <asp:View ID="View18" runat="server">
                <div>
                    <br />
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
                                    <strong>18.1</strong>
                                    <ul style="list-style-type: none">

                                        <li>
                                            <asp:CheckBox ID="chkPicc_Compliance_Q18_1" runat="server" /><asp:Label ID="lblPicc_Compliance_Q18_1" runat="server"></asp:Label>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <ul style="list-style-type: none">
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q18_1_1" runat="server" /><asp:Label ID="lbl_Docu_Q18_1_1" runat="server"></asp:Label><br />
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
                                    <strong>18.2</strong>
                                    <ul style="list-style-type: none">

                                        <li>
                                            <asp:CheckBox ID="chkPicc_Compliance_Q18_2_1" runat="server" /><asp:Label ID="lblPicc_Compliance_Q18_2_1" runat="server"></asp:Label><br />
                                            The CQIP addresses the following:
                          <ul style="list-style-type: none">
                              <li>
                                  <asp:CheckBox ID="chkPicc_Compliance_Q18_2_2" runat="server" /><asp:Label ID="lblPicc_Compliance_Q18_2_2" runat="server"></asp:Label><br />
                              </li>
                              <li>
                                  <asp:CheckBox ID="chkPicc_Compliance_Q18_2_3" runat="server" /><asp:Label ID="lblPicc_Compliance_Q18_2_3" runat="server"></asp:Label><br />
                              </li>
                              <li>
                                  <asp:CheckBox ID="chkPicc_Compliance_Q18_2_4" runat="server" /><asp:Label ID="lblPicc_Compliance_Q18_2_4" runat="server"></asp:Label><br />
                              </li>
                          </ul>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <ul style="list-style-type: none">
                                        <li>
                                            <asp:CheckBox ID="chk_Docu_Q18_2_1" runat="server" /><asp:Label ID="lbl_Docu_Q18_2_1" runat="server"></asp:Label><br />
                                            <asp:CheckBox ID="chk_Docu_Q18_2_2" runat="server" /><asp:Label ID="lbl_Docu_Q18_2_2" runat="server"></asp:Label><br />
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
                        <asp:LinkButton ID="lnkPicc_Q18" runat="server" OnClick="lnkPicc_Q18_Click18">Next</asp:LinkButton>
                    </div>
                </div>
            </asp:View>
            <asp:View ID="View19" runat="server">
                <div>
                    <br />
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
                                    <strong>19.1</strong>
                                    <ul style="list-style-type: none">

                                        <li>
                                            <asp:CheckBox ID="chkPicc_Compliance_Q19" runat="server" /><asp:Label ID="lblPicc_Compliance_Q19" runat="server"></asp:Label>
                                        </li>
                                    </ul>
                                </td>
                                <td class="scoring">
                                    <ul style="list-style-type: none">
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
                        <asp:LinkButton ID="lnkPicc_Q19" runat="server" OnClick="lnkPicc_Q19_Click19">Next</asp:LinkButton>
                    </div>
                </div>
            </asp:View>
        </asp:MultiView>

        <div>
            <asp:MultiView ID="MultiView2" runat="server">
                <asp:View ID="View20" runat="server">
                    <h2 id="toptitle">FRAMEWORK-BASED SUPPLEMENTAL ITEMS<br />
                        CENTER-BASED & FAMILY LITERACY ONLY</h2>
                    <asp:MultiView ID="MultiView3" runat="server">
                        <asp:View ID="View21" runat="server">
                            <div>
                                <br />
                                <div>
                                    <h3 class="finaltoolTitle_1">20.  Identification of licensure and standards as applicable. (CB, FL) (Not applicable for Home Visiting programs) 
            [23 Ill. Adm. Code 235.10(b), 235.40(a), 235.70(h)(2)] and ISBE policy (old and new rules)</h3>
                                </div>
                                <div>
                                    <table class="d">
                                        <tr>
                                            <td class="picc_1">Compliance 
                                            </td>
                                            <td class="picc_1">Documentation 
                                            </td>
                                            <td class="picc_1">Notes 
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="scoring">Center-Based<br />
                                                <ul style="list-style-type: none">

                                                    <li>
                                                        <strong>20.1</strong>
                                                        <asp:CheckBox ID="chkPicc_Compliance_Q20_1" runat="server" /><asp:Label ID="lblPicc_Compliance_Q20_1" runat="server"></asp:Label>
                                                    </li>
                                                    <li>
                                                        <strong>20.2</strong>
                                                        <asp:CheckBox ID="chkPicc_Compliance_Q20_2" runat="server" /><asp:Label ID="lblPicc_Compliance_Q20_2" runat="server"></asp:Label>
                                                    </li>
                                                </ul>
                                            </td>
                                            <td class="scoring">
                                                <ul style="list-style-type: none">
                                                    <li>
                                                        <asp:CheckBox ID="chk_Docu_Q20_1" runat="server" /><asp:Label ID="lbl_Docu_Q20_1" runat="server" Text="Label"></asp:Label><br />
                                                        <asp:TextBox ID="txt_Docu_Q20_1" runat="server"></asp:TextBox><br />

                                                        Expiration Date:<br />
                                                        <asp:TextBox ID="txt_Docu_Q20_2" runat="server"></asp:TextBox><br />

                                                        <asp:CheckBox ID="chk_Docu_Q20_2" runat="server" /><asp:Label ID="lbl_Docu_Q20_2" runat="server" Text="Label"></asp:Label><br />
                                                    </li>
                                                </ul>
                                            </td>
                                            <td class="scoring">
                                                <asp:TextBox ID="txtPicc_Notes_Q20" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="scoring">Evidence the program is aligned with the Standards of a nationally recognized accrediting organization, such as:<br />
                                                <ul style="list-style-type: none">

                                                    <li>
                                                        <strong>20.3</strong>
                                                        <asp:CheckBox ID="chkPicc_Compliance_Q20_3" runat="server" /><asp:Label ID="lblPicc_Compliance_Q20_3" runat="server"></asp:Label>
                                                    </li>
                                                    <li>
                                                        <strong>20.4</strong>
                                                        <asp:CheckBox ID="chkPicc_Compliance_Q20_4" runat="server" /><asp:Label ID="lblPicc_Compliance_Q20_4" runat="server"></asp:Label>
                                                    </li>
                                                    <li>
                                                        <strong>20.5</strong>
                                                        <asp:CheckBox ID="chkPicc_Compliance_Q20_5" runat="server" /><asp:Label ID="lblPicc_Compliance_Q20_5" runat="server"></asp:Label>
                                                    </li>
                                                    <li>
                                                        <strong>20.6</strong>
                                                        <asp:CheckBox ID="chkPicc_Compliance_Q20_6" runat="server" /><asp:Label ID="lblPicc_Compliance_Q20_6" runat="server"></asp:Label>
                                                        <asp:TextBox ID="txtPicc_Compliance_Q20_6" runat="server"></asp:TextBox>
                                                    </li>
                                                </ul>
                                            </td>
                                            <td class="scoring">
                                                <ul style="list-style-type: none">
                                                    <li>
                                                        <asp:CheckBox ID="chk_Docu_Q20_6" runat="server" /><asp:Label ID="lbl_Docu_Q20_6" runat="server"></asp:Label><br />
                                                        <asp:TextBox ID="txt_Docu_Q20_6" runat="server" TextMode="MultiLine" Height="80px" BorderStyle="Solid"></asp:TextBox><br />
                                                    </li>
                                                </ul>
                                            </td>
                                            <td class="scoring">
                                                <asp:TextBox ID="txtPicc_Notes_Q20_2" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                    <asp:LinkButton ID="lnkPicc_Q20" runat="server" OnClick="lnkPicc_Q20_Click20">Next</asp:LinkButton>
                                </div>
                            </div>
                        </asp:View>
                        <asp:View ID="View22" runat="server">
                            <div>
                                <br />
                                <div>
                                    <h3 class="finaltoolTitle_1">21.  The program is implementing a research-based child-centered curriculum that is aligned with the Illinois Early Learning Guidelines.  The program is implementing the Illinois Early Learning Guidelines. (CB, FL) 
            [23 Ill. Adm. Code 235.20(c)(3)(A), 235.40(a)] and ISBE policy (new rules) </h3>
                                </div>
                                <div>
                                    <table class="d">
                                        <tr>
                                            <td class="picc_1">Compliance 
                                            </td>
                                            <td class="picc_1">Documentation 
                                            </td>
                                            <td class="picc_1">Notes 
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="scoring">
                                                <ul style="list-style-type: none">

                                                    <li>
                                                        <strong>21.1</strong>
                                                        <ul style="list-style-type: none">
                                                            <li>
                                                                <asp:CheckBox ID="chkPicc_Compliance_Q21_1_1" runat="server" /><asp:Label ID="lblPicc_Compliance_Q21_1_1" runat="server"></asp:Label>
                                                            </li>
                                                            <li>
                                                                <asp:CheckBox ID="chkPicc_Compliance_Q21_1_2" runat="server" /><asp:Label ID="lblPicc_Compliance_Q21_1_2" runat="server"></asp:Label>
                                                            </li>
                                                            <li>
                                                                <asp:CheckBox ID="chkPicc_Compliance_Q21_1_3" runat="server" /><asp:Label ID="lblPicc_Compliance_Q21_1_3" runat="server"></asp:Label>
                                                                <asp:TextBox ID="txtPicc_Compliance_Q21_1_3" runat="server"></asp:TextBox>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <strong>21.2</strong>
                                                        <ul style="list-style-type: none">
                                                            <li>
                                                                <asp:CheckBox ID="chkPicc_Compliance_Q21_2_1" runat="server" /><asp:Label ID="lbl_Compliance_Q21_2_1" runat="server"></asp:Label>
                                                            </li>
                                                            <li>Plus references to the IELG (standards and/or indicators/keywords or phrases) are evident in the following:
                                    <br />
                                                                <asp:CheckBox ID="chkPicc_Compliance_Q21_2_2" runat="server" /><asp:Label ID="lbl_Compliance_Q21_2_2" runat="server"></asp:Label>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                            </td>
                                            <td class="scoring">
                                                <ul style="list-style-type: none">
                                                    <li>
                                                        <asp:CheckBox ID="chk_Docu_Q21_1" runat="server" /><asp:Label ID="lbl_Docu_Q21_1" runat="server"></asp:Label><br />
                                                    </li>
                                                    <li>Plus references to the IELG (standards and/or indicators/keywords or phrases) are evident in the following: 
                              <ul style="list-style-type: none">
                                  <li>
                                      <asp:CheckBox ID="chk_Docu_Q21_2" runat="server" /><asp:Label ID="lbl_Docu_Q21_2" runat="server"></asp:Label><br />
                                  </li>
                                  <li>
                                      <asp:CheckBox ID="chk_Docu_Q21_3" runat="server" /><asp:Label ID="lbl_Docu_Q21_3" runat="server"></asp:Label><br />
                                  </li>
                                  <li>
                                      <asp:CheckBox ID="chk_Docu_Q21_4" runat="server" /><asp:Label ID="lbl_Docu_Q21_4" runat="server"></asp:Label><br />
                                      <asp:TextBox ID="txt_Docu_Q21_4" runat="server"></asp:TextBox>
                                  </li>
                              </ul>
                                                    </li>
                                                </ul>
                                            </td>
                                            <td class="scoring">
                                                <asp:TextBox ID="txtPicc_Notes_Q21" runat="server" TextMode="MultiLine" Width="250px" Height="80px"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                    <asp:LinkButton ID="lnkPicc_Q21" runat="server" OnClick="lnkPicc_Q21_Click21">Next</asp:LinkButton>
                                </div>
                            </div>
                        </asp:View>
                        <asp:View ID="View23" runat="server">
                            <div>
                                <br />
                                CENTER-BASED ONLY
       <div>
           <h3 class="finaltoolTitle_1">22. The program adheres to the program model-recommended frequency and intensity of services. 
            [23 Ill. Adm. Code 235.40(e)] and ISBE policy</h3>
       </div>
                                <div>
                                    <table class="d">
                                        <tr>
                                            <td class="picc_1">Compliance 
                                            </td>
                                            <td class="picc_1">Documentation 
                                            </td>
                                            <td class="picc_1">Notes 
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="scoring">
                                                <ul style="list-style-type: none">

                                                    <li>
                                                        <strong>22.1</strong>
                                                        <ul style="list-style-type: none">
                                                            <li>
                                                                <asp:CheckBox ID="chkPicc_Compliance_Q22_1_1" runat="server" /><asp:Label ID="lblPicc_Compliance_Q22_1_1" runat="server"></asp:Label>
                                                                <ul style="list-style-position: inside">
                                                                    <li>
                                                                        <asp:Label ID="lblPicc_Compliance_Q22_1_2" runat="server"></asp:Label><asp:TextBox ID="txtPicc_Compliance_Q22_1_2" runat="server"></asp:TextBox>
                                                                        <ul style="list-style-position: inside">
                                                                            <li>
                                                                                <asp:Label ID="lblPicc_Compliance_Q22_1_3" runat="server"></asp:Label><asp:TextBox ID="txtPicc_Compliance_Q22_1_3" runat="server"></asp:TextBox>
                                                                            </li>
                                                                            <li>
                                                                                <asp:Label ID="lblPicc_Compliance_Q22_1_4" runat="server"></asp:Label><asp:TextBox ID="txtPicc_Compliance_Q22_1_4" runat="server"></asp:TextBox>
                                                                            </li>
                                                                            <li>
                                                                                <asp:Label ID="lblPicc_Compliance_Q22_1_5" runat="server"></asp:Label><asp:TextBox ID="txtPicc_Compliance_Q22_1_5" runat="server"></asp:TextBox>
                                                                            </li>
                                                                        </ul>
                                                                    </li>
                                                                    <li>
                                                                        <asp:Label ID="lblPicc_Compliance_Q22_2_1" runat="server"></asp:Label><asp:TextBox ID="txtPicc_Compliance_Q22_2_1" runat="server"></asp:TextBox>
                                                                        <ul style="list-style-position: inside">
                                                                            <li>
                                                                                <asp:Label ID="lblPicc_Compliance_Q22_2_2" runat="server"></asp:Label><asp:TextBox ID="txtPicc_Compliance_Q22_2_2" runat="server"></asp:TextBox>
                                                                            </li>
                                                                            <li>
                                                                                <asp:Label ID="lblPicc_Compliance_Q22_2_3" runat="server"></asp:Label><asp:TextBox ID="txtPicc_Compliance_Q22_2_3" runat="server"></asp:TextBox>
                                                                            </li>
                                                                            <li>
                                                                                <asp:Label ID="lblPicc_Compliance_Q22_2_4" runat="server"></asp:Label><asp:TextBox ID="txtPicc_Compliance_Q22_2_4" runat="server"></asp:TextBox>
                                                                            </li>
                                                                        </ul>
                                                                    </li>
                                                                    <li>
                                                                        <asp:Label ID="lblPicc_Compliance_Q22_3_1" runat="server"></asp:Label><asp:TextBox ID="txtPicc_Compliance_Q22_3_1" runat="server"></asp:TextBox>
                                                                        <ul style="list-style-position: inside">
                                                                            <li>
                                                                                <asp:Label ID="lblPicc_Compliance_Q22_3_2" runat="server" Text="Label"></asp:Label><asp:TextBox ID="txtPicc_Compliance_Q22_3_2" runat="server"></asp:TextBox>
                                                                            </li>
                                                                            <li>
                                                                                <asp:Label ID="lblPicc_Compliance_Q22_3_3" runat="server" Text="Label"></asp:Label><asp:TextBox ID="txtPicc_Compliance_Q22_3_3" runat="server"></asp:TextBox>
                                                                            </li>
                                                                            <li>
                                                                                <asp:Label ID="lblPicc_Compliance_Q22_3_4" runat="server" Text="Label"></asp:Label><asp:TextBox ID="txtPicc_Compliance_Q22_3_4" runat="server"></asp:TextBox>
                                                                            </li>
                                                                        </ul>
                                                                    </li>
                                                                    <li>
                                                                        <asp:Label ID="lblPicc_Compliance_Q22_4_1" runat="server"></asp:Label><asp:TextBox ID="txtPicc_Compliance_Q22_4_1" runat="server"></asp:TextBox>
                                                                        <ul style="list-style-position: inside">
                                                                            <li>
                                                                                <asp:Label ID="lblPicc_Compliance_Q22_4_2" runat="server"></asp:Label><asp:TextBox ID="txtPicc_Compliance_Q22_4_2" runat="server"></asp:TextBox>
                                                                            </li>
                                                                            <li>
                                                                                <asp:Label ID="lblPicc_Compliance_Q22_4_3" runat="server"></asp:Label><asp:TextBox ID="txtPicc_Compliance_Q22_4_3" runat="server"></asp:TextBox>
                                                                            </li>
                                                                            <li>
                                                                                <asp:Label ID="lblPicc_Compliance_Q22_4_4" runat="server"></asp:Label><asp:TextBox ID="txtPicc_Compliance_Q22_4_4" runat="server"></asp:TextBox>
                                                                            </li>
                                                                        </ul>
                                                                    </li>
                                                                </ul>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                            </td>
                                            <td class="scoring">
                                                <ul style="list-style-type: none">
                                                    <li>
                                                        <asp:CheckBox ID="chk_Docu_Q22_1" runat="server" /><asp:Label ID="lbl_Docu_Q22_1" runat="server"></asp:Label><br />
                                                    </li>
                                                    <li>
                                                        <ul style="list-style-type: none">
                                                            <li>
                                                                <asp:CheckBox ID="chk_Docu_Q22_2" runat="server" /><asp:Label ID="lbl_Docu_Q22_2" runat="server"></asp:Label><br />
                                                            </li>
                                                            <li>
                                                                <asp:CheckBox ID="chk_Docu_Q22_3" runat="server" /><asp:Label ID="lbl_Docu_Q22_3" runat="server"></asp:Label><br />
                                                            </li>
                                                            <li>
                                                                <asp:CheckBox ID="chk_Docu_Q22_4" runat="server" /><asp:Label ID="lbl_Docu_Q22_4" runat="server"></asp:Label><br />
                                                                <asp:TextBox ID="txt_Docu_Q22_3" runat="server"></asp:TextBox>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                            </td>
                                            <td class="scoring">
                                                <asp:TextBox ID="txtPicc_Notes_Q22" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                    <asp:LinkButton ID="lnkPicc_Q22" runat="server" OnClick="lnkPicc_Q22_Click22">Next</asp:LinkButton>
                                </div>
                            </div>
                        </asp:View>
                        <asp:View ID="View24" runat="server">
                            <div>
                                <br />
                                <div>
                                    <h3 class="finaltoolTitle_1">23. The program adheres to the program model-recommended frequency and intensity of services. 
            [23 Ill. Adm. Code 235.40(e)] and ISBE policy</h3>
                                </div>
                                <div>
                                    <table class="d">
                                        <tr>
                                            <td class="picc_1">Compliance 
                                            </td>
                                            <td class="picc_1">Documentation 
                                            </td>
                                            <td class="picc_1">Notes 
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="scoring">
                                                <ul style="list-style-type: none">

                                                    <li>
                                                        <strong>23.1</strong>
                                                        <ul style="list-style-type: none">
                                                            <li>
                                                                <asp:CheckBox ID="chkPicc_Compliance_Q23" runat="server" /><asp:Label ID="lblPicc_Compliance_Q23" runat="server"></asp:Label>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                            </td>
                                            <td class="scoring">
                                                <ul style="list-style-type: none">
                                                    <li>
                                                        <asp:CheckBox ID="chk_Docu_Q23_1" runat="server" /><asp:Label ID="lbl_Docu_Q23_1" runat="server" Text="Label"></asp:Label><br />
                                                    </li>
                                                    <li>
                                                        <asp:CheckBox ID="chk_Docu_Q23_2" runat="server" /><asp:Label ID="lbl_Docu_Q23_2" runat="server" Text="Label"></asp:Label><br />
                                                    </li>
                                                    <li>
                                                        <asp:CheckBox ID="chk_Docu_Q23_3" runat="server" /><asp:Label ID="lbl_Docu_Q23_3" runat="server" Text="Label"></asp:Label><br />
                                                    </li>
                                                </ul>
                                            </td>
                                            <td class="scoring">
                                                <asp:TextBox ID="txtPicc_Notes_Q23" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                    <asp:LinkButton ID="lnkPicc_Q23" runat="server" OnClick="lnkPicc_Q23_Click23">Next</asp:LinkButton>
                                </div>
                            </div>
                        </asp:View>
                        <asp:View ID="View25" runat="server">
                            <div>
                                <br />
                                FAMILY LITERACY ONLY   
       <div>
           <h3 class="finaltoolTitle_1">24. Family Literacy: Identification of the adult education offered. (FL - Only applies to Family Literacy Programs) </h3>
       </div>
                                <div>
                                    <table class="d">
                                        <tr>
                                            <td class="picc_1">Compliance 
                                            </td>
                                            <td class="picc_1">Documentation 
                                            </td>
                                            <td class="picc_1">Notes 
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="scoring">
                                                <ul style="list-style-type: none">

                                                    <li>
                                                        <strong>24.1</strong>
                                                        <ul style="list-style-type: none">
                                                            <li>
                                                                <asp:CheckBox ID="chkPicc_Compliance_Q24_1" runat="server" /><asp:Label ID="lblPicc_Compliance_Q24_1" runat="server"></asp:Label>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <strong>24.2</strong>
                                                        <ul style="list-style-type: none">
                                                            <li>
                                                                <asp:CheckBox ID="chkPicc_Compliance_Q24_2" runat="server" /><asp:Label ID="lblPicc_Compliance_Q24_2" runat="server"></asp:Label>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <strong>24.3</strong>
                                                        <ul style="list-style-type: none">
                                                            <li>
                                                                <asp:CheckBox ID="chkPicc_Compliance_Q24_3" runat="server" /><asp:Label ID="lblPicc_Compliance_Q24_3" runat="server"></asp:Label>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <strong>24.4</strong>
                                                        <ul style="list-style-type: none">
                                                            <li>
                                                                <asp:CheckBox ID="chkPicc_Compliance_Q24_4" runat="server" /><asp:Label ID="lblPicc_Compliance_Q24_4" runat="server"></asp:Label>
                                                                <asp:TextBox ID="txtPicc_Compliance_Q24_5" runat="server"></asp:TextBox>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                            </td>
                                            <td class="scoring">
                                                <ul style="list-style-type: none">
                                                    <li>
                                                        <asp:TextBox ID="txt_Docu_Q24" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                                    </li>
                                                </ul>
                                            </td>
                                            <td class="scoring">
                                                <asp:TextBox ID="txtPicc_Notes_Q24" runat="server" TextMode="MultiLine" Width="250px" Height="80px" BorderStyle="Solid"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                    <asp:LinkButton ID="lnkPicc_Q24" runat="server" OnClick="lnkPicc_Q24_Click24">Next</asp:LinkButton>
                                </div>
                            </div>
                        </asp:View>
                    </asp:MultiView>
                </asp:View>
            </asp:MultiView>
        </div>
        <div>
            <asp:MultiView ID="MultiView4" runat="server">
                <asp:View ID="View26" runat="server">
                    <div class="Purpose">
                        <h4>Results Summary - Areas of Non-Compliance</h4>
                    </div>                   
                    <div>
                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource5">
                            <HeaderTemplate>
                                <table class="PD">
                                    <tr>
                                        <td class="d">PICC ID</td>
                                        <td class="d">Description</td>
                                        <td class="d">Notes</td>
                                    </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td class="d">
                                        <asp:Label ID="lblPiccID" runat="server" Text='<%# Eval("PICC_ID") %>'></asp:Label>
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
                                    <td class="d">
                                        <asp:LinkButton ID="lnkbtnAddComments" runat="server" OnClick="lnkbtnAddComments_Click">Add Comments</asp:LinkButton></td>
                                </tr>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                        <%-- <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource5" EnableModelValidation="True" Style="margin-top: 0px" Width="100%" ShowFooter="True">
                            <Columns>
                                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />                               
                            </Columns>                        

                        </asp:GridView>--%>
                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ISBEPI_DEV %>" SelectCommand="SELECT * FROM [Picc_Summary]"></asp:SqlDataSource>
                    </div>
                    <br />
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="lnkPicc_Q25_Click25">Next</asp:LinkButton>
                </asp:View>
                <asp:View ID="View27" runat="server">
                    <div id="ConfirmHome"></div>
                    <div>
                        <h2>Thank you for completing Prevention Initiative Compliance Checklist!</h2>
                        <h6 style="text-align: center;">Your submission has been received.</h6>
                    </div>
                </asp:View>               
            </asp:MultiView>
        </div>
    </div>
</asp:Content>
