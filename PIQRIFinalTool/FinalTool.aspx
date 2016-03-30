<%@ Page Title="" Language="C#" MasterPageFile="~/PIQRIFinalTool/NestedMasterPIQRI.master" AutoEventWireup="true" CodeBehind="FinalTool.aspx.cs" Inherits="HVP.PIQRIFinalTool.FinalTool" %>

<%--<%@ Page Title="" Language="C#" MasterPageFile="~/PIQRIFinalTool/NestedMasterPIQRI.master" AutoEventWireup="true" CodeBehind="FinalTool.aspx.cs" Inherits="HVP.PIQRIFinalTool.FinalTool" %>--%>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">--%>
<%--</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HiddenField ID="hfsiteid" runat="server" />
    <asp:HiddenField ID="hfSchdId" runat="server" />

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
        function BtnClicked(input, input1) {
            var e = document.getElementById(input);
            var e1 = document.getElementById(input1);
            e.style.display = 'block';
            e1.style.display = 'block';
            document.getElementById(input).focus();
            document.getElementById(input1).focus();
        }

    </script>

    <script>
    function demoFromHTML() {
        var pdf = new jsPDF('p', 'pt', 'letter');
        // source can be HTML-formatted string, or a reference
        // to an actual DOM element from which the text will be scraped.
        source = $('#main')[0];

        // we support special element handlers. Register them with jQuery-style 
        // ID selector for either ID or node name. ("#iAmID", "div", "span" etc.)
        // There is no support for any other type of selectors 
        // (class, of compound) at this time.
        specialElementHandlers = {
            // element with id of "bypass" - jQuery style selector
            '#bypassme': function (element, renderer) {
                // true = "handled elsewhere, bypass text extraction"
                return true
            }
        };
        margins = {
            top: 80,
            bottom: 60,
            left: 40,
            width: 522
        };
        // all coords and widths are in jsPDF instance's declared units
        // 'inches' in this case
        pdf.fromHTML(
        source, // HTML string or DOM elem ref.
        margins.left, // x coord
        margins.top, { // y coord
            'width': margins.width, // max width of content on PDF
            'elementHandlers': specialElementHandlers
        },

        function (dispose) {
            // dispose: object with X, Y of the last line add to the PDF 
            //          this allow the insertion of new lines after html
            pdf.save('Test.pdf');
        }, margins);
    }
</script>
    <asp:SqlDataSource ID="SqlDataSource23" runat="server" ConnectionString='<%$ ConnectionStrings:ISBEPI_DEV %>' SelectCommand="spPIQRI_Scoring" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="hfSchdId" PropertyName="Value" Name="Sch_ID" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
    <div id="mainPiqri">
        <div style="cursor: pointer;" onclick="javascript:DivClicked('HVSQ');">
            <h3 class="finaltoolTitle">
                <img src="../Images/edit_add.png" height="40" style="width: 40px" />A.  Home Visitor Staff Qualities
                        <br />
                Subscales A1 – A4</h3>
        </div>
        <div id="HVSQ" style="display: none;">
            <div class="Purpose">PURPOSE</div>
            <br />
            <div class="Purpose_topic">
                Scale A is focused on the home visitor—their educational/professional background and their ability to work with families across multiple areas of child development and well-being. It differs from Scale C (Program Characteristics) in that Scale C is focused on program content and structure that supports the home visitor in their work. While Scale C is focused largely on what is expected of home visitors, Scale A focuses on what home visitors do, given these expectations.
            </div>
            <br />
            <div class="note">
                NOTE: For smaller programs (less than 4 home visitors), adjustments must be made for percentages noted in the indicator rows:<br />
                With only 3 HOME VISITORS, use 66% (at least two home visitors) instead of 75% where indicated<br />
                With only 2 HOME VISITORS, use 100% where 75% is indicated<br />
                (In case where this makes two indicator identical (2.5 and 2.7,  score 2.7)<br />
                With only 1 HOME VISITOR, ignore percentages and score based on that home visitor’s background
                        <br />
            </div>
            <!----------------------------------------------------------------------------------------->
            <div style="cursor: pointer;" onclick="javascript:DivClicked('EAPE');">
                <h3 class="scoringTitle">
                    <img src="../Images/edit_add.png" height="40" style="width: 40px" />Subscale: A1. Education and Professional Experience</h3>
            </div>
            <!---------------------------------------------------------------->
            <div id="EAPE" style="display: none;">
                <table class="d">
                    <tr>
                        <td colspan="4">
                            <h3>Subscale:  A1.  Education and Professional Experience</h3>
                        </td>
                    </tr>
                    <tr>
                        <td class="d">1<br />
                            Low Quality
                        </td>
                        <td class="d">3<br />
                            Average Quality
                        </td>
                        <td class="d">5<br />
                            Above Average Quality
                        </td>
                        <td class="d">7<br />
                            High Quality
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 1: Education</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_A1_1_1" runat="server" Enabled="False" /><asp:Label ID="lbl_ed_1_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_A1_1_2" runat="server" Enabled="False" /><asp:Label ID="lbl_ed_1_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_A1_1_3" runat="server" Enabled="False" /><asp:Label ID="lbl_ed_1_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_A1_1_4" runat="server" Enabled="False" /><asp:Label ID="lbl_ed_1_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 2: Professional Experience</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_A1_2_1" runat="server" Enabled="False" /><asp:Label ID="lbl_ed_2_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_A1_2_2" runat="server" Enabled="False" /><asp:Label ID="lbl_ed_2_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_A1_2_3" runat="server" Enabled="False" /><asp:Label ID="lbl_ed_2_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_A1_2_4" runat="server" Enabled="False" /><asp:Label ID="lbl_ed_2_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <div class="piqriscore">
                                <h5 class="piqriscore">Circle Subscale Score</h5>
                                <table class="d">
                                    <tr>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_A1_1" runat="server" Enabled="False" /><br />
                                            1<br />
                                            All indicator rows scored 1 and none scored 3, 5, or 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_A1_2" runat="server" Enabled="False" /><br />
                                            2<br />
                                            At least 1 indicator row scored 1, and others scored 3, 5, or 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_A1_3" runat="server" Enabled="False" /><br />
                                            3<br />
                                            All indicators rows scored 3 and none scored 5 or 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_A1_4" runat="server" Enabled="False" /><br />
                                            4<br />
                                            At least one indicator row scored 3, and others scored 5 or 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_A1_5" runat="server" Enabled="False" /><br />
                                            5<br />
                                            All indicator rows scored 5 and none scored 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_A1_6" runat="server" Enabled="False" /><br />
                                            6<br />
                                            At least one indicator row scored 5 and others scored 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_A1_7" runat="server" Enabled="False" /><br />
                                            7<br />
                                            All indicator rows scored 7.
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
                Comments:<div>
                    <asp:TextBox ID="txtComment_A1" runat="server" TextMode="MultiLine" Width="500px" Height="85px"></asp:TextBox>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:LinkButton ID="lnlSubmitA1" runat="server" OnClick="lnlSubmitA1_Click" ValidationGroup="Val1">Submit</asp:LinkButton>
                            <asp:PlaceHolder ID="plcError_A1" runat="server"></asp:PlaceHolder>


                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage='"Please enter maximum 500 charachters."' ControlToValidate="txtComment_A1" ValidationExpression="^[\S\s]{1,500}$" ValidationGroup="Val1"></asp:RegularExpressionValidator>
                            <!--FORMVIEW-->
                            <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" EnableModelValidation="True" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" GridLines="Both">

                                <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White"></EditRowStyle>

                                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510"></FooterStyle>

                                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White"></HeaderStyle>
                                <ItemTemplate>
                                    <p>

                                        <sub>
                                            <asp:Label Text='<%# Bind("ErikosnDate_A1") %>' runat="server" ID="ErikosnDate_A1Label" /></sub><br />
                                        Erikson Comments:
                        <asp:Label Text='<%# Bind("EriksonComments_A1") %>' runat="server" ID="EriksonComments_A1Label" /><br />
                                        <br />
                                        <sub>

                                            <asp:Label Text='<%# Bind("ISBEDate_A1") %>' runat="server" ID="ISBEDate_A1Label" /></sub><br />
                                        ISBE Comments:
                        <asp:Label Text='<%# Bind("ISBEComments_A1") %>' runat="server" ID="ISBEComments_A1Label" /><br />
                                        <br />
                                        <sub>
                                            <asp:Label Text='<%# Bind("SiteDate_A1") %>' runat="server" ID="SiteDate_A1Label" /></sub><br />
                                        Site Comments:
                        <asp:Label Text='<%# Bind("SiteComments_A1") %>' runat="server" ID="SiteComments_A1Label" /><br />
                                    </p>
                                </ItemTemplate>
                                <PagerStyle HorizontalAlign="Center" ForeColor="#8C4510"></PagerStyle>

                                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510"></RowStyle>
                            </asp:FormView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ISBEPI_DEV %>' SelectCommand="SELECT [ErikosnDate_A1], [EriksonComments_A1], [ISBEDate_A1], [ISBEComments_A1], [SiteDate_A1], [SiteComments_A1] FROM [PIQRI_Comments] WHERE ([Schd_ID] = @Schd_ID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hfSchdId" PropertyName="Value" Name="Schd_ID" Type="Int32"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>

            <!----------------------------------------------------------------------------------------->
            <div style="cursor: pointer;" onclick="javascript:DivClicked('POCDAWB');">
                <h3 class="scoringTitle">
                    <img src="../Images/edit_add.png" height="40" style="width: 40px" />Subscale:  A2.  Promotion of child development and well-being</h3>
            </div>
            <!---------------------------------------------------------------->
            <div id="POCDAWB" style="display: none;">
                <table class="d">
                    <tr>
                        <td colspan="4">
                            <h3>Subscale:  A2.  Promotion of child development and well-being</h3>
                        </td>
                    </tr>
                    <tr>
                        <td class="d">1<br />
                            Low Quality
                        </td>
                        <td class="d">3<br />
                            Average Quality
                        </td>
                        <td class="d">5<br />
                            Above Average Quality
                        </td>
                        <td class="d">7<br />
                            High Quality
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 1: Child Development</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_A2_1_1" runat="server" Enabled="False" /><asp:Label ID="lbl_cd_1_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_A2_1_2" runat="server" Enabled="False" /><asp:Label ID="lbl_cd_1_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_A2_1_3" runat="server" Enabled="False" /><asp:Label ID="lbl_cd_1_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_A2_1_4" runat="server" Enabled="False" /><asp:Label ID="lbl_cd_1_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 2: Child Health and Well-Being</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_A2_2_1" runat="server" Enabled="False" /><asp:Label ID="lbl_cd_2_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_A2_2_2" runat="server" Enabled="False" /><asp:Label ID="lbl_cd_2_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_A2_2_3" runat="server" Enabled="False" /><asp:Label ID="lbl_cd_2_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_A2_2_4" runat="server" Enabled="False" /><asp:Label ID="lbl_cd_2_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 3: Parent-Child Relationship</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_A2_3_1" runat="server" Enabled="False" /><asp:Label ID="lbl_cd_3_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_A2_3_2" runat="server" Enabled="False" /><asp:Label ID="lbl_cd_3_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_A2_3_3" runat="server" Enabled="False" /><asp:Label ID="lbl_cd_3_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_A2_3_4" runat="server" Enabled="False" /><asp:Label ID="lbl_cd_3_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <div class="piqriscore">
                                <h5 class="piqriscore">Circle Subscale Score</h5>
                                <table class="d">
                                    <tr>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_A2_1" runat="server" Enabled="False" /><br />
                                            1<br />
                                            All indicator rows scored 1 and none scored 3, 5, or 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_A2_2" runat="server" Enabled="False" /><br />
                                            2<br />
                                            At least 1 indicator row scored 1, and others scored 3, 5, or 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_A2_3" runat="server" Enabled="False" /><br />
                                            3<br />
                                            All indicators rows scored 3 and none scored 5 or 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_A2_4" runat="server" Enabled="False" /><br />
                                            4<br />
                                            At least one indicator row scored 3, and others scored 5 or 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_A2_5" runat="server" Enabled="False" /><br />
                                            5<br />
                                            All indicator rows scored 5 and none scored 7 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_A2_6" runat="server" Enabled="False" /><br />
                                            6<br />
                                            At least one indicator row scored 5 and others scored 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_A2_7" runat="server" Enabled="False" /><br />
                                            7<br />
                                            All indicator rows scored 7.
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
                Comments:<div>
                    <asp:TextBox ID="txtComment_A2" runat="server" TextMode="MultiLine" Width="500px" Height="85px"></asp:TextBox>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <asp:LinkButton ID="lnkSubmitA2" runat="server" OnClick="lnkSubmitA2_Click" ValidationGroup="Val1">Submit</asp:LinkButton>
                            <asp:PlaceHolder ID="plcError_A2" runat="server"></asp:PlaceHolder>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage='"Please enter maximum 500 charachters."' SetFocusOnError="True" ControlToValidate="txtComment_A2" ValidationExpression="^[\S\s]{1,500}$" ValidationGroup="Val1"></asp:RegularExpressionValidator>
                            <!--FORMVIEW-->
                            <asp:FormView ID="FormView2" runat="server" DataSourceID="SqlDataSource2" EnableModelValidation="True" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" GridLines="Both">

                                <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White"></EditRowStyle>

                                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510"></FooterStyle>

                                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White"></HeaderStyle>
                                <ItemTemplate>
                                    <p>

                                        <sub>
                                            <asp:Label Text='<%# Bind("ErikosnDate_A2") %>' runat="server" ID="ErikosnDate_A2Label" /></sub><br />
                                        Erikson Comments:
                        <asp:Label Text='<%# Bind("EriksonComments_A2") %>' runat="server" ID="EriksonComments_A2Label" /><br />
                                        <br />
                                        <sub>

                                            <asp:Label Text='<%# Bind("ISBEDate_A2") %>' runat="server" ID="ISBEDate_A2Label" /></sub><br />
                                        ISBE Comments:
                        <asp:Label Text='<%# Bind("ISBEComments_A2") %>' runat="server" ID="ISBEComments_A2Label" /><br />
                                        <br />
                                        <sub>
                                            <asp:Label Text='<%# Bind("SiteDate_A2") %>' runat="server" ID="SiteDate_A2Label" /></sub><br />
                                        Site Comments:
                        <asp:Label Text='<%# Bind("SiteComments_A2") %>' runat="server" ID="SiteComments_A2Label" /><br />
                                    </p>
                                </ItemTemplate>
                                <PagerStyle HorizontalAlign="Center" ForeColor="#8C4510"></PagerStyle>

                                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510"></RowStyle>
                            </asp:FormView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:ISBEPI_DEV %>' SelectCommand="SELECT [ErikosnDate_A2], [EriksonComments_A2], [ISBEDate_A2], [ISBEComments_A2], [SiteDate_A2], [SiteComments_A2] FROM [PIQRI_Comments] WHERE ([Schd_ID] = @Schd_ID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hfSchdId" PropertyName="Value" Name="Schd_ID" Type="Int32"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            <!---------------------------------------------------------------->
            <div style="cursor: pointer;" onclick="javascript:DivClicked('wwf');">
                <h3 class="scoringTitle">
                    <img src="../Images/edit_add.png" height="40" style="width: 40px" />Subscale:  A3.  Working with Families</h3>
            </div>
            <!---------------------------------------------------------------->
            <div id="wwf" style="display: none;">
                <table class="d">
                    <tr>
                        <td colspan="4">
                            <h3>Subscale:  A3.  Working with Families</h3>
                        </td>
                    </tr>
                    <tr>
                        <td class="d">1<br />
                            Low Quality
                        </td>
                        <td class="d">3<br />
                            Average Quality
                        </td>
                        <td class="d">5<br />
                            Above Average Quality
                        </td>
                        <td class="d">7<br />
                            High Quality
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 1: Helping Relationship Development</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_A3_1_1" runat="server" Enabled="False" /><asp:Label ID="lbl_wwf_1_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_A3_1_2" runat="server" Enabled="False" /><asp:Label ID="lbl_wwf_1_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_A3_1_3" runat="server" Enabled="False" /><asp:Label ID="lbl_wwf_1_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_A3_1_4" runat="server" Enabled="False" /><asp:Label ID="lbl_wwf_1_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 2: Individualizing Approach</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_A3_2_1" runat="server" Enabled="False" /><asp:Label ID="lbl_wwf_2_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_A3_2_2" runat="server" Enabled="False" /><asp:Label ID="lbl_wwf_2_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_A3_2_3" runat="server" Enabled="False" /><asp:Label ID="lbl_wwf_2_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_A3_2_4" runat="server" Enabled="False" /><asp:Label ID="lbl_wwf_2_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 3: Recognizes Cultural Considerations</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_A3_3_1" runat="server" Enabled="False" /><asp:Label ID="lbl_wwf_3_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_A3_3_2" runat="server" Enabled="False" /><asp:Label ID="lbl_wwf_3_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_A3_3_3" runat="server" Enabled="False" /><asp:Label ID="lbl_wwf_3_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_A3_3_4" runat="server" Enabled="False" /><asp:Label ID="lbl_wwf_3_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <div class="piqriscore">
                                <h5 class="piqriscore">Circle Subscale Score</h5>
                                <table class="d">
                                    <tr>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_A3_1" runat="server" Enabled="False" /><br />
                                            1<br />
                                            All indicator rows scored 1 and none scored 3, 5, or 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_A3_2" runat="server" Enabled="False" /><br />
                                            2<br />
                                            At least 1 indicator row scored 1, and others scored 3, 5, or 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_A3_3" runat="server" Enabled="False" /><br />
                                            3<br />
                                            All indicators rows scored 3 and none scored 5 or 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_A3_4" runat="server" Enabled="False" /><br />
                                            4<br />
                                            At least one indicator row scored 3, and others scored 5 or 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_A3_5" runat="server" Enabled="False" /><br />
                                            5<br />
                                            All indicator rows scored 5 and none scored 7 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_A3_6" runat="server" Enabled="False" /><br />
                                            6<br />
                                            At least one indicator row scored 5 and others scored 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_A3_7" runat="server" Enabled="False" /><br />
                                            7<br />
                                            All indicator rows scored 7.
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
                Comments:<div>
                    <asp:TextBox ID="txtComment_A3" runat="server" TextMode="MultiLine" Width="500px" Height="85px"></asp:TextBox>
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <asp:LinkButton ID="lnkSubmitA3" runat="server" OnClick="lnkSubmitA3_Click" ValidationGroup="Val1">Submit</asp:LinkButton>
                            <asp:PlaceHolder ID="plcError_A3" runat="server"></asp:PlaceHolder>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage='"Please enter maximum 500 charachters."' SetFocusOnError="True" ControlToValidate="txtComment_A3" ValidationExpression="^[\S\s]{1,500}$" ValidationGroup="Val1"></asp:RegularExpressionValidator>
                            <!--FORMVIEW-->
                            <asp:FormView ID="FormView3" runat="server" DataSourceID="SqlDataSource3" EnableModelValidation="True" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" GridLines="Both">

                                <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White"></EditRowStyle>

                                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510"></FooterStyle>

                                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White"></HeaderStyle>
                                <ItemTemplate>
                                    <p>

                                        <sub>
                                            <asp:Label Text='<%# Bind("ErikosnDate_A3") %>' runat="server" ID="ErikosnDate_A3Label" /></sub><br />
                                        Erikson Comments:
                        <asp:Label Text='<%# Bind("EriksonComments_A3") %>' runat="server" ID="EriksonComments_A3Label" /><br />
                                        <br />
                                        <sub>

                                            <asp:Label Text='<%# Bind("ISBEDate_A3") %>' runat="server" ID="ISBEDate_A3Label" /></sub><br />
                                        ISBE Comments:
                        <asp:Label Text='<%# Bind("ISBEComments_A3") %>' runat="server" ID="ISBEComments_A3Label" /><br />
                                        <br />
                                        <sub>
                                            <asp:Label Text='<%# Bind("SiteDate_A3") %>' runat="server" ID="SiteDate_A3Label" /></sub><br />
                                        Site Comments:
                        <asp:Label Text='<%# Bind("SiteComments_A3") %>' runat="server" ID="SiteComments_A3Label" /><br />
                                    </p>
                                </ItemTemplate>
                                <PagerStyle HorizontalAlign="Center" ForeColor="#8C4510"></PagerStyle>

                                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510"></RowStyle>
                            </asp:FormView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:ISBEPI_DEV %>' SelectCommand="SELECT [ErikosnDate_A3], [EriksonComments_A3], [ISBEDate_A3], [ISBEComments_A3], [SiteDate_A3], [SiteComments_A3] FROM [PIQRI_Comments] WHERE ([Schd_ID] = @Schd_ID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hfSchdId" PropertyName="Value" Name="Schd_ID" Type="Int32"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            <!----------------------------------------------------------------------------------------->
            <div style="cursor: pointer;" onclick="javascript:DivClicked('RAFU');">
                <h3 class="scoringTitle">
                    <img src="../Images/edit_add.png" height="40" style="width: 40px" />Subscale:  A4.  Referrals and Follow-Up</h3>
            </div>
            <!---------------------------------------------------------------->
            <div id="RAFU" style="display: none;">
                <table class="d">
                    <tr>
                        <td colspan="4">
                            <h3>Subscale:  A4.  Referrals and Follow-Up</h3>
                        </td>
                    </tr>
                    <tr>
                        <td class="d">1<br />
                            Low Quality
                        </td>
                        <td class="d">3<br />
                            Average Quality
                        </td>
                        <td class="d">5<br />
                            Above Average Quality
                        </td>
                        <td class="d">7<br />
                            High Quality
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 1: Referrals</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_A4_1_1" runat="server" Enabled="False" /><asp:Label ID="lbl_RAFU_1_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_A4_1_2" runat="server" Enabled="False" /><asp:Label ID="lbl_RAFU_1_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_A4_1_3" runat="server" Enabled="False" /><asp:Label ID="lbl_RAFU_1_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_A4_1_4" runat="server" Enabled="False" /><asp:Label ID="lbl_RAFU_1_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 2: Awareness of Community Resources</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_A4_2_1" runat="server" Enabled="False" /><asp:Label ID="lbl_RAFU_2_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_A4_2_2" runat="server" Enabled="False" /><asp:Label ID="lbl_RAFU_2_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_A4_2_3" runat="server" Enabled="False" /><asp:Label ID="lbl_RAFU_2_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_A4_2_4" runat="server" Enabled="False" /><asp:Label ID="lbl_RAFU_2_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <div class="piqriscore">
                                <h5 class="piqriscore">Circle Subscale Score</h5>
                                <table class="d">
                                    <tr>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_A4_1" runat="server" Enabled="False" /><br />
                                            1<br />
                                            All indicator rows scored 1 and none scored 3, 5, or 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_A4_2" runat="server" Enabled="False" /><br />
                                            2<br />
                                            At least 1 indicator row scored 1, and others scored 3, 5, or 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_A4_3" runat="server" Enabled="False" /><br />
                                            3<br />
                                            All indicators rows scored 3 and none scored 5 or 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_A4_4" runat="server" Enabled="False" /><br />
                                            4<br />
                                            At least one indicator row scored 3, and others scored 5 or 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_A4_5" runat="server" Enabled="False" /><br />
                                            5<br />
                                            All indicator rows scored 5 and none scored 7 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_A4_6" runat="server" Enabled="False" /><br />
                                            6<br />
                                            At least one indicator row scored 5 and others scored 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_A4_7" runat="server" Enabled="False" /><br />
                                            7<br />
                                            All indicator rows scored 7.
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
                Comments:<div>
                    <asp:TextBox ID="txtComment_A4" runat="server" TextMode="MultiLine" Width="500px" Height="85px"></asp:TextBox>
                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                        <ContentTemplate>
                            <asp:LinkButton ID="lnksubmitA4" runat="server" OnClick="lnksubmitA4_Click" ValidationGroup="Val1">Submit</asp:LinkButton>
                            <asp:PlaceHolder ID="plcError_A4" runat="server"></asp:PlaceHolder>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage='"Please enter maximum 500 charachters."' SetFocusOnError="True" ControlToValidate="txtComment_A4" ValidationExpression="^^[\S\s]{1,500}$" ValidationGroup="Val1"></asp:RegularExpressionValidator>
                            <!--FORMVIEW-->
                            <asp:FormView ID="FormView4" runat="server" DataSourceID="SqlDataSource4" EnableModelValidation="True" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" GridLines="Both">

                                <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White"></EditRowStyle>

                                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510"></FooterStyle>

                                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White"></HeaderStyle>
                                <ItemTemplate>
                                    <p>

                                        <sub>
                                            <asp:Label Text='<%# Bind("ErikosnDate_A4") %>' runat="server" ID="ErikosnDate_A4Label" /></sub><br />
                                        Erikson Comments:
                        <asp:Label Text='<%# Bind("EriksonComments_A4") %>' runat="server" ID="EriksonComments_A4Label" /><br />
                                        <br />
                                        <sub>

                                            <asp:Label Text='<%# Bind("ISBEDate_A4") %>' runat="server" ID="ISBEDate_A4Label" /></sub><br />
                                        ISBE Comments:
                        <asp:Label Text='<%# Bind("ISBEComments_A4") %>' runat="server" ID="ISBEComments_A4Label" /><br />
                                        <br />
                                        <sub>
                                            <asp:Label Text='<%# Bind("SiteDate_A4") %>' runat="server" ID="SiteDate_A4Label" /></sub><br />
                                        Site Comments:
                        <asp:Label Text='<%# Bind("SiteComments_A4") %>' runat="server" ID="SiteComments_A4Label" /><br />
                                    </p>
                                </ItemTemplate>
                                <PagerStyle HorizontalAlign="Center" ForeColor="#8C4510"></PagerStyle>

                                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510"></RowStyle>
                            </asp:FormView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:ISBEPI_DEV %>' SelectCommand="SELECT [ErikosnDate_A4], [EriksonComments_A4], [ISBEDate_A4], [ISBEComments_A4], [SiteDate_A4], [SiteComments_A4] FROM [PIQRI_Comments] WHERE ([Schd_ID] = @Schd_ID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hfSchdId" PropertyName="Value" Name="Schd_ID" Type="Int32"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
        <!------------------------------------------------------------------------------------------------------------------->
        <div style="cursor: pointer;" onclick="javascript:DivClicked('PSD');">
            <h3 class="finaltoolTitle">
                <img src="../Images/edit_add.png" height="40" style="width: 40px" />B.  Program Service Delivery
                        <br />
                Subscales B1 - B5</h3>
        </div>
        <div id="PSD" style="display: none;">
            <div class="Purpose">PURPOSE</div>
            <br />
            <div class="Purpose_topic">
                The purpose of this subscale is to assess structural aspects of service quality that relate to who receives home visit and the intensity of delivered services.  Programs are required to provide information that families are appropriately enrolled, begin to receive services in a timely manner and remain in the program and receive home visits at an adequate intensity. It also assesses transition planning as well and supplemental family services
            </div>

            <!----------------------------------------------------------------------------------------->
            <div style="cursor: pointer;" onclick="javascript:DivClicked('PRAE');">
                <h3 class="scoringTitle">
                    <img src="../Images/edit_add.png" height="40" style="width: 40px" />Subscale:  B1.  Program Recruitment and Enrollment</h3>
            </div>
            <!---------------------------------------------------------------->
            <div id="PRAE" style="display: none;">
                <table class="d">
                    <tr>
                        <td colspan="4">
                            <h3>Subscale:  B1.  Program Recruitment and Enrollment</h3>
                        </td>
                    </tr>
                    <tr>
                        <td class="d">1<br />
                            Low Quality
                        </td>
                        <td class="d">3<br />
                            Average Quality
                        </td>
                        <td class="d">5<br />
                            Above Average Quality
                        </td>
                        <td class="d">7<br />
                            High Quality
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 1: Guidelines for Target Service Population</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B1_1_1" runat="server" Enabled="False" /><asp:Label ID="lbl_PRAE_1_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B1_1_2" runat="server" Enabled="False" /><asp:Label ID="lbl_PRAE_1_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B1_1_3" runat="server" Enabled="False" /><asp:Label ID="lbl_PRAE_1_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B1_1_4" runat="server" Enabled="False" /><asp:Label ID="lbl_PRAE_1_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 2: Guidelines for Service Initiation</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B1_2_1" runat="server" Enabled="False" /><asp:Label ID="lbl_PRAE_2_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B1_2_2" runat="server" Enabled="False" /><asp:Label ID="lbl_PRAE_2_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B1_2_3" runat="server" Enabled="False" /><asp:Label ID="lbl_PRAE_2_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B1_2_4" runat="server" Enabled="False" /><asp:Label ID="lbl_PRAE_2_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 3: Service Initiation</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B1_3_1" runat="server" Enabled="False" /><asp:Label ID="lbl_PRAE_3_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B1_3_2" runat="server" Enabled="False" /><asp:Label ID="lbl_PRAE_3_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B1_3_3" runat="server" Enabled="False" /><asp:Label ID="lbl_PRAE_3_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B1_3_4" runat="server" Enabled="False" /><asp:Label ID="lbl_PRAE_3_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <div class="piqriscore">
                                <h5 class="piqriscore">Circle Subscale Score</h5>
                                <table class="d">
                                    <tr>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_B1_1" runat="server" Enabled="False" /><br />
                                            1<br />
                                            All indicator rows scored 1 and none scored 3, 5, or 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_B1_2" runat="server" Enabled="False" /><br />
                                            2<br />
                                            At least 1 indicator row scored 1, and others scored 3, 5, or 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_B1_3" runat="server" Enabled="False" /><br />
                                            3<br />
                                            All indicators rows scored 3 and none scored 5 or 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_B1_4" runat="server" Enabled="False" /><br />
                                            4<br />
                                            At least one indicator row scored 3, and others scored 5 or 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_B1_5" runat="server" Enabled="False" /><br />
                                            5<br />
                                            All indicator rows scored 5 and none scored 7 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_B1_6" runat="server" Enabled="False" /><br />
                                            6<br />
                                            At least one indicator row scored 5 and others scored 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_B1_7" runat="server" Enabled="False" /><br />
                                            7<br />
                                            All indicator rows scored 7.
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
                Comments:<div>
                    <asp:TextBox ID="txtComment_B1" runat="server" TextMode="MultiLine" Width="500px" Height="85px"></asp:TextBox>
                    <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                        <ContentTemplate>
                            <asp:LinkButton ID="lnksubmitB1" runat="server" OnClick="lnksubmitB1_Click" ValidationGroup="Val1">Submit</asp:LinkButton>
                            <asp:PlaceHolder ID="plcError_B1" runat="server"></asp:PlaceHolder>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage='"Please enter maximum 500 charachters."' SetFocusOnError="True" ControlToValidate="txtComment_B1" ValidationExpression="^[\S\s]{1,500}$" ValidationGroup="Val1"></asp:RegularExpressionValidator>
                            <!--FORMVIEW-->
                            <asp:FormView ID="FormView5" runat="server" DataSourceID="SqlDataSource5" EnableModelValidation="True" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" GridLines="Both">

                                <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White"></EditRowStyle>

                                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510"></FooterStyle>

                                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White"></HeaderStyle>
                                <ItemTemplate>
                                    <p>

                                        <sub>
                                            <asp:Label Text='<%# Bind("ErikosnDate_B1") %>' runat="server" ID="ErikosnDate_B1Label" /></sub><br />
                                        Erikson Comments:
                        <asp:Label Text='<%# Bind("EriksonComments_B1") %>' runat="server" ID="EriksonComments_B1Label" /><br />
                                        <br />
                                        <sub>

                                            <asp:Label Text='<%# Bind("ISBEDate_B1") %>' runat="server" ID="ISBEDate_B1Label" /></sub><br />
                                        ISBE Comments:
                        <asp:Label Text='<%# Bind("ISBEComments_B1") %>' runat="server" ID="ISBEComments_B1Label" /><br />
                                        <br />
                                        <sub>
                                            <asp:Label Text='<%# Bind("SiteDate_B1") %>' runat="server" ID="SiteDate_B1Label" /></sub><br />
                                        Site Comments:
                        <asp:Label Text='<%# Bind("SiteComments_B1") %>' runat="server" ID="SiteComments_B1Label" /><br />
                                    </p>
                                </ItemTemplate>
                                <PagerStyle HorizontalAlign="Center" ForeColor="#8C4510"></PagerStyle>

                                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510"></RowStyle>
                            </asp:FormView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource5" ConnectionString='<%$ ConnectionStrings:ISBEPI_DEV %>' SelectCommand="SELECT [ErikosnDate_B1], [EriksonComments_B1], [ISBEDate_B1], [ISBEComments_B1], [SiteDate_B1], [SiteComments_B1] FROM [PIQRI_Comments] WHERE ([Schd_ID] = @Schd_ID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hfSchdId" PropertyName="Value" Name="Schd_ID" Type="Int32"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            <!----------------------------------------------------------------------------------------->
            <div style="cursor: pointer;" onclick="javascript:DivClicked('PE');">
                <h3 class="scoringTitle">
                    <img src="../Images/edit_add.png" height="40" style="width: 40px" />Subscale:  B2.  Prenatal Enrollment</h3>
            </div>
            <!---------------------------------------------------------------->
            <div id="PE" style="display: none;">
                <table class="d">
                    <tr>
                        <td colspan="4">
                            <h3>Subscale:  B2.  Prenatal Enrollment</h3>
                        </td>
                    </tr>
                    <tr>
                        <td class="d">1<br />
                            Low Quality
                        </td>
                        <td class="d">3<br />
                            Average Quality
                        </td>
                        <td class="d">5<br />
                            Above Average Quality
                        </td>
                        <td class="d">7<br />
                            High Quality
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 1: Prenatal Services</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B2_1_1" runat="server" Enabled="False" /><asp:Label ID="lbl_PE_1_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B2_1_2" runat="server" Enabled="False" /><asp:Label ID="lbl_PE_1_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B2_1_3" runat="server" Enabled="False" /><asp:Label ID="lbl_PE_1_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B2_1_4" runat="server" Enabled="False" /><asp:Label ID="lbl_PE_1_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 2: Percentage of Families Enrolling Prenatally</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B2_2_1" runat="server" Enabled="False" /><asp:Label ID="lbl_PE_2_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B2_2_2" runat="server" Enabled="False" /><asp:Label ID="lbl_PE_2_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B2_2_3" runat="server" Enabled="False" /><asp:Label ID="lbl_PE_2_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B2_2_4" runat="server" Enabled="False" /><asp:Label ID="lbl_PE_2_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <div class="piqriscore">
                                <h5 class="piqriscore">Circle Subscale Score</h5>
                                <table class="d">
                                    <tr>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_B2_1" runat="server" Enabled="False" /><br />
                                            1<br />
                                            All indicator rows scored 1 and none scored 3, 5, or 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_B2_2" runat="server" Enabled="False" /><br />
                                            2<br />
                                            At least 1 indicator row scored 1, and others scored 3, 5, or 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_B2_3" runat="server" Enabled="False" /><br />
                                            3<br />
                                            All indicators rows scored 3 and none scored 5 or 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_B2_4" runat="server" Enabled="False" /><br />
                                            4<br />
                                            At least one indicator row scored 3, and others scored 5 or 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_B2_5" runat="server" Enabled="False" /><br />
                                            5<br />
                                            All indicator rows scored 5 and none scored 7 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_B2_6" runat="server" Enabled="False" /><br />
                                            6<br />
                                            At least one indicator row scored 5 and others scored 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_B2_7" runat="server" Enabled="False" /><br />
                                            7<br />
                                            All indicator rows scored 7.
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
                Comments:<div>
                    <asp:TextBox ID="txtComment_B2" runat="server" TextMode="MultiLine" Width="500px" Height="85px"></asp:TextBox>
                    <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                        <ContentTemplate>
                            <asp:LinkButton ID="lnkSubmitB2" runat="server" OnClick="lnkSubmitB2_Click" ValidationGroup="Val1">Submit</asp:LinkButton>
                            <asp:PlaceHolder ID="plcError_B2" runat="server"></asp:PlaceHolder>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage='"Please enter maximum 500 charachters."' SetFocusOnError="True" ControlToValidate="txtComment_B2" ValidationExpression="^[\S\s]{1,500}$" ValidationGroup="Val1"></asp:RegularExpressionValidator>
                            <!--FORMVIEW-->
                            <asp:FormView ID="FormView6" runat="server" DataSourceID="SqlDataSource6" EnableModelValidation="True" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" GridLines="Both">

                                <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White"></EditRowStyle>

                                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510"></FooterStyle>

                                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White"></HeaderStyle>
                                <ItemTemplate>
                                    <p>

                                        <sub>
                                            <asp:Label Text='<%# Bind("ErikosnDate_B2") %>' runat="server" ID="ErikosnDate_B2Label" /></sub><br />
                                        Erikson Comments:
                        <asp:Label Text='<%# Bind("EriksonComments_B2") %>' runat="server" ID="EriksonComments_B2Label" /><br />
                                        <br />
                                        <sub>

                                            <asp:Label Text='<%# Bind("ISBEDate_B2") %>' runat="server" ID="ISBEDate_B2Label" /></sub><br />
                                        ISBE Comments:
                        <asp:Label Text='<%# Bind("ISBEComments_B2") %>' runat="server" ID="ISBEComments_B2Label" /><br />
                                        <br />
                                        <sub>
                                            <asp:Label Text='<%# Bind("SiteDate_B2") %>' runat="server" ID="SiteDate_B2Label" /></sub><br />
                                        Site Comments:
                        <asp:Label Text='<%# Bind("SiteComments_B2") %>' runat="server" ID="SiteComments_B2Label" /><br />
                                    </p>
                                </ItemTemplate>
                                <PagerStyle HorizontalAlign="Center" ForeColor="#8C4510"></PagerStyle>

                                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510"></RowStyle>
                            </asp:FormView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource6" ConnectionString='<%$ ConnectionStrings:ISBEPI_DEV %>' SelectCommand="SELECT [ErikosnDate_B2], [EriksonComments_B2], [ISBEDate_B2], [ISBEComments_B2], [SiteDate_B2], [SiteComments_B2] FROM [PIQRI_Comments] WHERE ([Schd_ID] = @Schd_ID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hfSchdId" PropertyName="Value" Name="Schd_ID" Type="Int32"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            <!---------------------------------------------------------------->
            <div style="cursor: pointer;" onclick="javascript:DivClicked('FALOS');">
                <h3 class="scoringTitle">
                    <img src="../Images/edit_add.png" height="40" style="width: 40px" />Subscale:  B3.  Frequency and Length of Services</h3>
            </div>
            <!---------------------------------------------------------------->
            <div id="FALOS" style="display: none;">
                <table class="d">
                    <tr>
                        <td colspan="4">
                            <h3>Subscale:  B3.  Frequency and Length of Services</h3>
                        </td>
                    </tr>
                    <tr>
                        <td class="d">1<br />
                            Low Quality
                        </td>
                        <td class="d">3<br />
                            Average Quality
                        </td>
                        <td class="d">5<br />
                            Above Average Quality
                        </td>
                        <td class="d">7<br />
                            High Quality
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 1: Frequency of Home Visits</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B3_1_1" runat="server" Enabled="False" /><asp:Label ID="lbl_FALOS_1_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B3_1_2" runat="server" Enabled="False" /><asp:Label ID="lbl_FALOS_1_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B3_1_3" runat="server" Enabled="False" /><asp:Label ID="lbl_FALOS_1_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B3_1_4" runat="server" Enabled="False" /><asp:Label ID="lbl_FALOS_1_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 2: Percentage of Intended Home Visits Completed</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B3_2_1" runat="server" Enabled="False" /><asp:Label ID="lbl_FALOS_2_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B3_2_2" runat="server" Enabled="False" /><asp:Label ID="lbl_FALOS_2_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B3_2_3" runat="server" Enabled="False" /><asp:Label ID="lbl_FALOS_2_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B3_2_4" runat="server" Enabled="False" /><asp:Label ID="lbl_FALOS_2_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 3: Length of Enrollment</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B3_3_1" runat="server" Enabled="False" /><asp:Label ID="lbl_FALOS_3_1" runat="server"></asp:Label><br />
                            <br />
                            Note:  For shorter term program models (less than 24 months), less than 50% of families are enrolled for      at least half of specified program enrollment.
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B3_3_2" runat="server" Enabled="False" /><asp:Label ID="lbl_FALOS_3_2" runat="server"></asp:Label><br />
                            <br />
                            Note:  For shorter term program models (less than 24 months), at least 50% of families are enrolled for at least half of specified program enrollment.
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B3_3_3" runat="server" Enabled="False" /><asp:Label ID="lbl_FALOS_3_3" runat="server"></asp:Label><br />
                            <br />
                            Note:  For shorter term program models (less than 24 months), at least 75% of families are enrolled for at least 75% of specified program enrollment.
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B3_3_4" runat="server" Enabled="False" /><asp:Label ID="lbl_FALOS_3_4" runat="server"></asp:Label><br />
                            <br />
                            Note:  For shorter term program models (less than 24 months), at least 75% of families are enrolled for specified program enrollment.
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <div class="piqriscore">
                                <h5 class="piqriscore">Circle Subscale Score</h5>
                                <table class="d">
                                    <tr>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_B3_1" runat="server" Enabled="False" /><br />
                                            1<br />
                                            All indicator rows scored 1 and none scored 3, 5, or 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_B3_2" runat="server" Enabled="False" /><br />
                                            2<br />
                                            At least 1 indicator row scored 1, and others scored 3, 5, or 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_B3_3" runat="server" Enabled="False" /><br />
                                            3<br />
                                            All indicators rows scored 3 and none scored 5 or 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_B3_4" runat="server" Enabled="False" /><br />
                                            4<br />
                                            At least one indicator row scored 3, and others scored 5 or 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_B3_5" runat="server" Enabled="False" /><br />
                                            5<br />
                                            All indicator rows scored 5 and none scored 7 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_B3_6" runat="server" Enabled="False" /><br />
                                            6<br />
                                            At least one indicator row scored 5 and others scored 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_B3_7" runat="server" Enabled="False" /><br />
                                            7<br />
                                            All indicator rows scored 7.
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
                Comments:<div>
                    <asp:TextBox ID="txtComment_B3" runat="server" TextMode="MultiLine" Width="500px" Height="85px"></asp:TextBox>
                    <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                        <ContentTemplate>
                            <asp:LinkButton ID="lnkSubmitB3" runat="server" OnClick="lnkSubmitB3_Click" ValidationGroup="Val1">Submit</asp:LinkButton>
                            <asp:PlaceHolder ID="plcError_B3" runat="server"></asp:PlaceHolder>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage='"Please enter maximum 500 charachters."' SetFocusOnError="True" ControlToValidate="txtComment_B3" ValidationExpression="^[\S\s]{1,500}$" ValidationGroup="Val1"></asp:RegularExpressionValidator>
                            <!--FORMVIEW-->
                            <asp:FormView ID="FormView7" runat="server" DataSourceID="SqlDataSource7" EnableModelValidation="True" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" GridLines="Both">

                                <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White"></EditRowStyle>

                                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510"></FooterStyle>

                                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White"></HeaderStyle>
                                <ItemTemplate>
                                    <p>

                                        <sub>
                                            <asp:Label Text='<%# Bind("ErikosnDate_B3") %>' runat="server" ID="ErikosnDate_B3Label" /></sub><br />
                                        Erikson Comments:
                        <asp:Label Text='<%# Bind("EriksonComments_B3") %>' runat="server" ID="EriksonComments_B3Label" /><br />
                                        <br />
                                        <sub>

                                            <asp:Label Text='<%# Bind("ISBEDate_B3") %>' runat="server" ID="ISBEDate_B3Label" /></sub><br />
                                        ISBE Comments:
                        <asp:Label Text='<%# Bind("ISBEComments_B3") %>' runat="server" ID="ISBEComments_B3Label" /><br />
                                        <br />
                                        <sub>
                                            <asp:Label Text='<%# Bind("SiteDate_B3") %>' runat="server" ID="SiteDate_B3Label" /></sub><br />
                                        Site Comments:
                        <asp:Label Text='<%# Bind("SiteComments_B3") %>' runat="server" ID="SiteComments_B3Label" /><br />
                                    </p>
                                </ItemTemplate>
                                <PagerStyle HorizontalAlign="Center" ForeColor="#8C4510"></PagerStyle>

                                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510"></RowStyle>
                            </asp:FormView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource7" ConnectionString='<%$ ConnectionStrings:ISBEPI_DEV %>' SelectCommand="SELECT [ErikosnDate_B3], [EriksonComments_B3], [ISBEDate_B3], [ISBEComments_B3], [SiteDate_B3], [SiteComments_B3] FROM [PIQRI_Comments] WHERE ([Schd_ID] = @Schd_ID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hfSchdId" PropertyName="Value" Name="Schd_ID" Type="Int32"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            <!----------------------------------------------------------------------------------------->
            <div style="cursor: pointer;" onclick="javascript:DivClicked('FOI');">
                <h3 class="scoringTitle">
                    <img src="../Images/edit_add.png" height="40" style="width: 40px" />Subscale:  B4.  Family Outreach / Involvement</h3>
            </div>
            <!---------------------------------------------------------------->
            <div id="FOI" style="display: none;">
                <table class="d">
                    <tr>
                        <td colspan="4">
                            <h3>Subscale:  B4.  Family Outreach / Involvement</h3>
                        </td>
                    </tr>
                    <tr>
                        <td class="d">1<br />
                            Low Quality
                        </td>
                        <td class="d">3<br />
                            Average Quality
                        </td>
                        <td class="d">5<br />
                            Above Average Quality
                        </td>
                        <td class="d">7<br />
                            High Quality
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 1: Involvement of Other Family Members in Home Visits</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B4_1_1" runat="server" Enabled="False" /><asp:Label ID="lbl_FOI_1_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B4_1_2" runat="server" Enabled="False" /><asp:Label ID="lbl_FOI_1_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B4_1_3" runat="server" Enabled="False" /><asp:Label ID="lbl_FOI_1_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B4_1_4" runat="server" Enabled="False" /><asp:Label ID="lbl_FOI_1_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 2: Family Events Beyond Home Visits</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B4_2_1" runat="server" Enabled="False" /><asp:Label ID="lbl_FOI_2_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B4_2_2" runat="server" Enabled="False" /><asp:Label ID="lbl_FOI_2_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B4_2_3" runat="server" Enabled="False" /><asp:Label ID="lbl_FOI_2_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B4_2_4" runat="server" Enabled="False" /><asp:Label ID="lbl_FOI_2_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 3: Family Involvement Beyond Home Visits & Scheduled Family Events</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B4_3_1" runat="server" Enabled="False" /><asp:Label ID="lbl_FOI_3_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B4_3_2" runat="server" Enabled="False" /><asp:Label ID="lbl_FOI_3_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B4_3_3" runat="server" Enabled="False" /><asp:Label ID="lbl_FOI_3_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B4_3_4" runat="server" Enabled="False" /><asp:Label ID="lbl_FOI_3_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <div class="piqriscore">
                                <h5 class="piqriscore">Circle Subscale Score</h5>
                                <table class="d">
                                    <tr>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_B4_1" runat="server" Enabled="False" /><br />
                                            1<br />
                                            All indicator rows scored 1 and none scored 3, 5, or 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_B4_2" runat="server" Enabled="False" /><br />
                                            2<br />
                                            At least 1 indicator row scored 1, and others scored 3, 5, or 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_B4_3" runat="server" Enabled="False" /><br />
                                            3<br />
                                            All indicators rows scored 3 and none scored 5 or 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_B4_4" runat="server" Enabled="False" /><br />
                                            4<br />
                                            At least one indicator row scored 3, and others scored 5 or 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_B4_5" runat="server" Enabled="False" /><br />
                                            5<br />
                                            All indicator rows scored 5 and none scored 7 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_B4_6" runat="server" Enabled="False" /><br />
                                            6<br />
                                            At least one indicator row scored 5 and others scored 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_B4_7" runat="server" Enabled="False" /><br />
                                            7<br />
                                            All indicator rows scored 7.
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
                Comments:<div>
                    <asp:TextBox ID="txtComment_B4" runat="server" TextMode="MultiLine" Width="500px" Height="85px"></asp:TextBox>
                    <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                        <ContentTemplate>
                            <asp:LinkButton ID="lnkSubmitB4" runat="server" OnClick="lnkSubmitB4_Click" ValidationGroup="Val1">Submit</asp:LinkButton>
                            <asp:PlaceHolder ID="plcError_B4" runat="server"></asp:PlaceHolder>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ErrorMessage='"Please enter maximum 500 charachters."' SetFocusOnError="True" ControlToValidate="txtComment_B4" ValidationExpression="^[\S\s]{1,500}$" ValidationGroup="Val1"></asp:RegularExpressionValidator>
                            <!--FORMVIEW-->
                            <asp:FormView ID="FormView8" runat="server" DataSourceID="SqlDataSource8" EnableModelValidation="True" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" GridLines="Both">

                                <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White"></EditRowStyle>

                                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510"></FooterStyle>

                                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White"></HeaderStyle>
                                <ItemTemplate>
                                    <p>

                                        <sub>
                                            <asp:Label Text='<%# Bind("ErikosnDate_B4") %>' runat="server" ID="ErikosnDate_B4Label" /></sub><br />
                                        Erikson Comments:
                        <asp:Label Text='<%# Bind("EriksonComments_B4") %>' runat="server" ID="EriksonComments_B4Label" /><br />
                                        <br />
                                        <sub>

                                            <asp:Label Text='<%# Bind("ISBEDate_B4") %>' runat="server" ID="ISBEDate_B4Label" /></sub><br />
                                        ISBE Comments:
                        <asp:Label Text='<%# Bind("ISBEComments_B4") %>' runat="server" ID="ISBEComments_B4Label" /><br />
                                        <br />
                                        <sub>
                                            <asp:Label Text='<%# Bind("SiteDate_B4") %>' runat="server" ID="SiteDate_B4Label" /></sub><br />
                                        Site Comments:
                        <asp:Label Text='<%# Bind("SiteComments_B4") %>' runat="server" ID="SiteComments_B4Label" /><br />
                                    </p>
                                </ItemTemplate>
                                <PagerStyle HorizontalAlign="Center" ForeColor="#8C4510"></PagerStyle>

                                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510"></RowStyle>
                            </asp:FormView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource8" ConnectionString='<%$ ConnectionStrings:ISBEPI_DEV %>' SelectCommand="SELECT [ErikosnDate_B4], [EriksonComments_B4], [ISBEDate_B4], [ISBEComments_B4], [SiteDate_B4], [SiteComments_B4] FROM [PIQRI_Comments] WHERE ([Schd_ID] = @Schd_ID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hfSchdId" PropertyName="Value" Name="Schd_ID" Type="Int32"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            <!----------------------------------------------------------------------------------------->
            <div style="cursor: pointer;" onclick="javascript:DivClicked('TP');">
                <h3 class="scoringTitle">
                    <img src="../Images/edit_add.png" height="40" style="width: 40px" />Subscale:  B5.  Transition Plans</h3>
            </div>
            <!---------------------------------------------------------------->
            <div id="TP" style="display: none;">
                <table class="d">
                    <tr>
                        <td colspan="4">
                            <h3>Subscale:  B5.  Transition Plans</h3>
                        </td>
                    </tr>
                    <tr>
                        <td class="d">1<br />
                            Low Quality
                        </td>
                        <td class="d">3<br />
                            Average Quality
                        </td>
                        <td class="d">5<br />
                            Above Average Quality
                        </td>
                        <td class="d">7<br />
                            High Quality
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 1: Guidelines and Policies for Transition Plans</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B5_1_1" runat="server" Enabled="False" /><asp:Label ID="lbl_TP_1_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B5_1_2" runat="server" Enabled="False" /><asp:Label ID="lbl_TP_1_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B5_1_3" runat="server" Enabled="False" /><asp:Label ID="lbl_TP_1_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B5_1_4" runat="server" Enabled="False" /><asp:Label ID="lbl_TP_1_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 2: Nature of Transition Plans</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B5_2_1" runat="server" Enabled="False" /><asp:Label ID="lbl_TP_2_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B5_2_2" runat="server" Enabled="False" /><asp:Label ID="lbl_TP_2_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B5_2_3" runat="server" Enabled="False" /><asp:Label ID="lbl_TP_2_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_B5_2_4" runat="server" Enabled="False" /><asp:Label ID="lbl_TP_2_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->

                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <div class="piqriscore">
                                <h5 class="piqriscore">Circle Subscale Score</h5>
                                <table class="d">
                                    <tr>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_B5_1" runat="server" Enabled="False" /><br />
                                            1<br />
                                            All indicator rows scored 1 and none scored 3, 5, or 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_B5_2" runat="server" Enabled="False" /><br />
                                            2<br />
                                            At least 1 indicator row scored 1, and others scored 3, 5, or 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_B5_3" runat="server" Enabled="False" /><br />
                                            3<br />
                                            All indicators rows scored 3 and none scored 5 or 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_B5_4" runat="server" Enabled="False" /><br />
                                            4<br />
                                            At least one indicator row scored 3, and others scored 5 or 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_B5_5" runat="server" Enabled="False" /><br />
                                            5<br />
                                            All indicator rows scored 5 and none scored 7
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_B5_6" runat="server" Enabled="False" /><br />
                                            6<br />
                                            At least one indicator row scored 5 and others scored 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_B5_7" runat="server" Enabled="False" /><br />
                                            7<br />
                                            All indicator rows scored 7.
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
                Comments:<div>
                    <asp:TextBox ID="txtComment_B5" runat="server" TextMode="MultiLine" Width="500px" Height="85px"></asp:TextBox>
                    <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                        <ContentTemplate>
                            <asp:LinkButton ID="lnkSubmitB5" runat="server" OnClick="lnkSubmitB5_Click" ValidationGroup="Val1">Submit</asp:LinkButton>
                            <asp:PlaceHolder ID="plcError_B5" runat="server"></asp:PlaceHolder>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ErrorMessage='"Please enter maximum 500 charachters."' SetFocusOnError="True" ControlToValidate="txtComment_B5" ValidationExpression="^[\S\s]{1,500}$" ValidationGroup="Val1"></asp:RegularExpressionValidator>
                            <!--FORMVIEW-->
                            <asp:FormView ID="FormView9" runat="server" DataSourceID="SqlDataSource9" EnableModelValidation="True" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" GridLines="Both">

                                <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White"></EditRowStyle>

                                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510"></FooterStyle>

                                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White"></HeaderStyle>
                                <ItemTemplate>
                                    <p>

                                        <sub>
                                            <asp:Label Text='<%# Bind("ErikosnDate_B5") %>' runat="server" ID="ErikosnDate_B5Label" /></sub><br />
                                        Erikson Comments:
                        <asp:Label Text='<%# Bind("EriksonComments_B5") %>' runat="server" ID="EriksonComments_B5Label" /><br />
                                        <br />
                                        <sub>

                                            <asp:Label Text='<%# Bind("ISBEDate_B5") %>' runat="server" ID="ISBEDate_B5Label" /></sub><br />
                                        ISBE Comments:
                        <asp:Label Text='<%# Bind("ISBEComments_B5") %>' runat="server" ID="ISBEComments_B5Label" /><br />
                                        <br />
                                        <sub>
                                            <asp:Label Text='<%# Bind("SiteDate_B5") %>' runat="server" ID="SiteDate_B5Label" /></sub><br />
                                        Site Comments:
                        <asp:Label Text='<%# Bind("SiteComments_B5") %>' runat="server" ID="SiteComments_B5Label" /><br />
                                    </p>
                                </ItemTemplate>
                                <PagerStyle HorizontalAlign="Center" ForeColor="#8C4510"></PagerStyle>

                                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510"></RowStyle>
                            </asp:FormView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource9" ConnectionString='<%$ ConnectionStrings:ISBEPI_DEV %>' SelectCommand="SELECT [ErikosnDate_B5], [EriksonComments_B5], [ISBEDate_B5], [ISBEComments_B5], [SiteDate_B5], [SiteComments_B5] FROM [PIQRI_Comments] WHERE ([Schd_ID] = @Schd_ID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hfSchdId" PropertyName="Value" Name="Schd_ID" Type="Int32"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>

        <!-------------------------------------------------------------------------------------------------------------------------->
        <div style="cursor: pointer;" onclick="javascript:DivClicked('PC');">
            <h3 class="finaltoolTitle">
                <img src="../Images/edit_add.png" height="40" style="width: 40px" />C.  Program Characteristics
                        <br />
                Subscales C1 – C4</h3>
        </div>
        <div id="PC" style="display: none;">
            <div class="Purpose">PURPOSE</div>
            <br />
            <div class="Purpose_topic">
                Scale C is focused on the overall program model—its characteristics and its content, as well as the supports that are given to home visitors in order to successfully accomplish their work during home visits.

                        <br />
                <br />
                It differs from Scale D (Program Management and Development) in that Scale D is focused not on the content or structure of services provided to families, rather the administration and management of the daily operations of the program.

                        <br />
                <br />
                Scale C differs from Scale A (Home Visitor Staff Qualities) in that Scale A is focused on how individual home visitors deliver services, while Scale C is focused on the larger program content and structure that supports the home visitor as they deliver the services.

            </div>
            <!----------------------------------------------------------------------------------------->
            <div style="cursor: pointer;" onclick="javascript:DivClicked('PM');">
                <h3 class="scoringTitle">
                    <img src="../Images/edit_add.png" height="40" style="width: 40px" />Subscale:  C1.  Program Model</h3>
            </div>
            <!---------------------------------------------------------------->
            <div id="PM" style="display: none;">
                <table class="d">
                    <tr>
                        <td colspan="4">
                            <h3>Subscale:  C1.  Program Model</h3>
                        </td>
                    </tr>
                    <tr>
                        <td class="d">1<br />
                            Low Quality
                        </td>
                        <td class="d">3<br />
                            Average Quality
                        </td>
                        <td class="d">5<br />
                            Above Average Quality
                        </td>
                        <td class="d">7<br />
                            High Quality
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 1: Evidence-Based Program Model</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_C1_1_1" runat="server" Enabled="False" /><asp:Label ID="lbl_PM_1_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_C1_1_2" runat="server" Enabled="False" /><asp:Label ID="lbl_PM_1_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_C1_1_3" runat="server" Enabled="False" /><asp:Label ID="lbl_PM_1_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_C1_1_4" runat="server" Enabled="False" /><asp:Label ID="lbl_PM_1_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 2: Fidelity to Program Model</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_C1_2_1" runat="server" Enabled="False" /><asp:Label ID="lbl_PM_2_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_C1_2_2" runat="server" Enabled="False" /><asp:Label ID="lbl_PM_2_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_C1_2_3" runat="server" Enabled="False" /><asp:Label ID="lbl_PM_2_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_C1_2_4" runat="server" Enabled="False" /><asp:Label ID="lbl_PM_2_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 3: Home Visitor Understanding of Program Model</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_C1_3_1" runat="server" Enabled="False" /><asp:Label ID="lbl_PM_3_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_C1_3_2" runat="server" Enabled="False" /><asp:Label ID="lbl_PM_3_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_C1_3_3" runat="server" Enabled="False" /><asp:Label ID="lbl_PM_3_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_C1_3_4" runat="server" Enabled="False" /><asp:Label ID="lbl_PM_3_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <div class="piqriscore">
                                <h5 class="piqriscore">Circle Subscale Score</h5>
                                <table class="d">
                                    <tr>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_C1_1" runat="server" Enabled="False" /><br />
                                            1<br />
                                            All indicator rows scored 1 and none scored 3, 5, or 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_C1_2" runat="server" Enabled="False" /><br />
                                            2<br />
                                            At least 1 indicator row scored 1, and others scored 3, 5, or 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_C1_3" runat="server" Enabled="False" /><br />
                                            3<br />
                                            All indicators rows scored 3 and none scored 5 or 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_C1_4" runat="server" Enabled="False" /><br />
                                            4<br />
                                            At least one indicator row scored 3, and others scored 5 or 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_C1_5" runat="server" Enabled="False" /><br />
                                            5<br />
                                            All indicator rows scored 5 and none scored 7 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_C1_6" runat="server" Enabled="False" /><br />
                                            6<br />
                                            At least one indicator row scored 5 and others scored 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_C1_7" runat="server" Enabled="False" /><br />
                                            7<br />
                                            All indicator rows scored 7.
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
                Comments:<div>
                    <asp:TextBox ID="txtComment_C1" runat="server" TextMode="MultiLine" Width="500px" Height="85px"></asp:TextBox>
                    <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                        <ContentTemplate>
                            <asp:LinkButton ID="lnkSubmitC1" runat="server" OnClick="lnkSubmitC1_Click" ValidationGroup="Val1">Submit</asp:LinkButton>
                            <asp:PlaceHolder ID="plcError_C1" runat="server"></asp:PlaceHolder>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server" ErrorMessage='"Please enter maximum 500 charachters."' SetFocusOnError="True" ControlToValidate="txtComment_C1" ValidationExpression="^[\S\s]{1,500}$" ValidationGroup="Val1"></asp:RegularExpressionValidator>
                            <!--FORMVIEW-->
                            <asp:FormView ID="FormView10" runat="server" DataSourceID="SqlDataSource10" EnableModelValidation="True" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" GridLines="Both">

                                <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White"></EditRowStyle>

                                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510"></FooterStyle>

                                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White"></HeaderStyle>
                                <ItemTemplate>
                                    <p>

                                        <sub>
                                            <asp:Label Text='<%# Bind("ErikosnDate_C1") %>' runat="server" ID="ErikosnDate_C1Label" /></sub><br />
                                        Erikson Comments:
                        <asp:Label Text='<%# Bind("EriksonComments_C1") %>' runat="server" ID="EriksonComments_C1Label" /><br />
                                        <br />
                                        <sub>

                                            <asp:Label Text='<%# Bind("ISBEDate_C1") %>' runat="server" ID="ISBEDate_C1Label" /></sub><br />
                                        ISBE Comments:
                        <asp:Label Text='<%# Bind("ISBEComments_C1") %>' runat="server" ID="ISBEComments_C1Label" /><br />
                                        <br />
                                        <sub>
                                            <asp:Label Text='<%# Bind("SiteDate_C1") %>' runat="server" ID="SiteDate_C1Label" /></sub><br />
                                        Site Comments:
                        <asp:Label Text='<%# Bind("SiteComments_C1") %>' runat="server" ID="SiteComments_C1Label" /><br />
                                    </p>
                                </ItemTemplate>
                                <PagerStyle HorizontalAlign="Center" ForeColor="#8C4510"></PagerStyle>

                                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510"></RowStyle>
                            </asp:FormView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource10" ConnectionString='<%$ ConnectionStrings:ISBEPI_DEV %>' SelectCommand="SELECT [ErikosnDate_C1], [EriksonComments_C1], [ISBEDate_C1], [ISBEComments_C1], [SiteDate_C1], [SiteComments_C1] FROM [PIQRI_Comments] WHERE ([Schd_ID] = @Schd_ID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hfSchdId" PropertyName="Value" Name="Schd_ID" Type="Int32"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            <!----------------------------------------------------------------------------------------->
            <div style="cursor: pointer;" onclick="javascript:DivClicked('PCECDAWB');">
                <h3 class="scoringTitle">
                    <img src="../Images/edit_add.png" height="40" style="width: 40px" />Subscale:  C2.  Program Content Emphasizes Child Development and Well-being</h3>
            </div>
            <!---------------------------------------------------------------->
            <div id="PCECDAWB" style="display: none;">
                <table class="d">
                    <tr>
                        <td colspan="4">
                            <h3>Subscale:  C2.  Program Content Emphasizes Child Development and Well-being</h3>
                        </td>
                    </tr>
                    <tr>
                        <td class="d">1<br />
                            Low Quality
                        </td>
                        <td class="d">3<br />
                            Average Quality
                        </td>
                        <td class="d">5<br />
                            Above Average Quality
                        </td>
                        <td class="d">7<br />
                            High Quality
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 1: Training</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_C2_1_1" runat="server" Enabled="False" /><asp:Label ID="lbl_PCECDAWB_1_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_C2_1_2" runat="server" Enabled="False" /><asp:Label ID="lbl_PCECDAWB_1_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_C2_1_3" runat="server" Enabled="False" /><asp:Label ID="lbl_PCECDAWB_1_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_C2_1_4" runat="server" Enabled="False" /><asp:Label ID="lbl_PCECDAWB_1_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 2: Materials</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_C2_2_1" runat="server" Enabled="False" /><asp:Label ID="lbl_PCECDAWB_2_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_C2_2_2" runat="server" Enabled="False" /><asp:Label ID="lbl_PCECDAWB_2_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_C2_2_3" runat="server" Enabled="False" /><asp:Label ID="lbl_PCECDAWB_2_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_C2_2_4" runat="server" Enabled="False" /><asp:Label ID="lbl_PCECDAWB_2_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 3: Supervision</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_C2_3_1" runat="server" Enabled="False" /><asp:Label ID="lbl_PCECDAWB_3_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_C2_3_2" runat="server" Enabled="False" /><asp:Label ID="lbl_PCECDAWB_3_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_C2_3_3" runat="server" Enabled="False" /><asp:Label ID="lbl_PCECDAWB_3_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_C2_3_4" runat="server" Enabled="False" /><asp:Label ID="lbl_PCECDAWB_3_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <div class="piqriscore">
                                <h5 class="piqriscore">Circle Subscale Score</h5>
                                <table class="d">
                                    <tr>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_C2_1" runat="server" Enabled="False" /><br />
                                            1<br />
                                            All indicator rows scored 1 and none scored 3, 5, or 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_C2_2" runat="server" Enabled="False" /><br />
                                            2<br />
                                            At least 1 indicator row scored 1, and others scored 3, 5, or 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_C2_3" runat="server" Enabled="False" /><br />
                                            3<br />
                                            All indicators rows scored 3 and none scored 5 or 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_C2_4" runat="server" Enabled="False" /><br />
                                            4<br />
                                            At least one indicator row scored 3, and others scored 5 or 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_C2_5" runat="server" Enabled="False" /><br />
                                            5<br />
                                            All indicator rows scored 5 and none scored 7 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_C2_6" runat="server" Enabled="False" /><br />
                                            6<br />
                                            At least one indicator row scored 5 and others scored 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_C2_7" runat="server" Enabled="False" /><br />
                                            7<br />
                                            All indicator rows scored 7.
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
                Comments:<div>
                    <asp:TextBox ID="txtComment_C2" runat="server" TextMode="MultiLine" Width="500px" Height="85px"></asp:TextBox>
                    <asp:UpdatePanel ID="UpdatePanel11" runat="server">
                        <ContentTemplate>
                            <asp:LinkButton ID="lnkSubmitC2" runat="server" OnClick="lnkSubmitC2_Click" ValidationGroup="Val1">Submit</asp:LinkButton>
                            <asp:PlaceHolder ID="plcError_C2" runat="server"></asp:PlaceHolder>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator11" runat="server" ErrorMessage='"Please enter maximum 500 charachters."' SetFocusOnError="True" ControlToValidate="txtComment_C2" ValidationExpression="^[\S\s]{1,500}$" ValidationGroup="Val1"></asp:RegularExpressionValidator>
                            <!--FORMVIEW-->
                            <asp:FormView ID="FormView11" runat="server" DataSourceID="SqlDataSource11" EnableModelValidation="True" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" GridLines="Both">

                                <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White"></EditRowStyle>

                                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510"></FooterStyle>

                                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White"></HeaderStyle>
                                <ItemTemplate>
                                    <p>

                                        <sub>
                                            <asp:Label Text='<%# Bind("ErikosnDate_C2") %>' runat="server" ID="ErikosnDate_C2Label" /></sub><br />
                                        Erikson Comments:
                        <asp:Label Text='<%# Bind("EriksonComments_C2") %>' runat="server" ID="EriksonComments_C2Label" /><br />
                                        <br />
                                        <sub>

                                            <asp:Label Text='<%# Bind("ISBEDate_C2") %>' runat="server" ID="ISBEDate_C2Label" /></sub><br />
                                        ISBE Comments:
                        <asp:Label Text='<%# Bind("ISBEComments_C2") %>' runat="server" ID="ISBEComments_C2Label" /><br />
                                        <br />
                                        <sub>
                                            <asp:Label Text='<%# Bind("SiteDate_C2") %>' runat="server" ID="SiteDate_C2Label" /></sub><br />
                                        Site Comments:
                        <asp:Label Text='<%# Bind("SiteComments_C2") %>' runat="server" ID="SiteComments_C2Label" /><br />
                                    </p>
                                </ItemTemplate>
                                <PagerStyle HorizontalAlign="Center" ForeColor="#8C4510"></PagerStyle>

                                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510"></RowStyle>
                            </asp:FormView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource11" ConnectionString='<%$ ConnectionStrings:ISBEPI_DEV %>' SelectCommand="SELECT [ErikosnDate_C2], [EriksonComments_C2], [ISBEDate_C2], [ISBEComments_C2], [SiteDate_C2], [SiteComments_C2] FROM [PIQRI_Comments] WHERE ([Schd_ID] = @Schd_ID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hfSchdId" PropertyName="Value" Name="Schd_ID" Type="Int32"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            <!---------------------------------------------------------------->
            <div style="cursor: pointer;" onclick="javascript:DivClicked('PESWRWF');">
                <h3 class="scoringTitle">
                    <img src="../Images/edit_add.png" height="40" style="width: 40px" />Subscale:  C3.  Program Emphasizes Strong Working Relationships with Families</h3>
            </div>
            <!---------------------------------------------------------------->
            <div id="PESWRWF" style="display: none;">
                <table class="d">
                    <tr>
                        <td colspan="4">
                            <h3>Subscale:  C3.  Program Emphasizes Strong Working Relationships with Families</h3>
                        </td>
                    </tr>
                    <tr>
                        <td class="d">1<br />
                            Low Quality
                        </td>
                        <td class="d">3<br />
                            Average Quality
                        </td>
                        <td class="d">5<br />
                            Above Average Quality
                        </td>
                        <td class="d">7<br />
                            High Quality
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 1: Program Materials</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_C3_1_1" runat="server" Enabled="False" /><asp:Label ID="lbl_PESWRWF_1_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_C3_1_2" runat="server" Enabled="False" /><asp:Label ID="lbl_PESWRWF_1_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_C3_1_3" runat="server" Enabled="False" /><asp:Label ID="lbl_PESWRWF_1_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_C3_1_4" runat="server" Enabled="False" /><asp:Label ID="lbl_PESWRWF_1_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 2: Caseloads</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_C3_2_1" runat="server" Enabled="False" /><asp:Label ID="lbl_PESWRWF_2_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_C3_2_2" runat="server" Enabled="False" /><asp:Label ID="lbl_PESWRWF_2_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_C3_2_3" runat="server" Enabled="False" /><asp:Label ID="lbl_PESWRWF_2_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_C3_2_4" runat="server" Enabled="False" /><asp:Label ID="lbl_PESWRWF_2_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 3: Monitoring of Helping Relationship</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_C3_3_1" runat="server" Enabled="False" /><asp:Label ID="lbl_PESWRWF_3_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_C3_3_2" runat="server" Enabled="False" /><asp:Label ID="lbl_PESWRWF_3_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_C3_3_3" runat="server" Enabled="False" /><asp:Label ID="lbl_PESWRWF_3_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_C3_3_4" runat="server" Enabled="False" /><asp:Label ID="lbl_PESWRWF_3_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <div class="piqriscore">
                                <h5 class="piqriscore">Circle Subscale Score</h5>
                                <table class="d">
                                    <tr>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_C3_1" runat="server" Enabled="False" /><br />
                                            1<br />
                                            All indicator rows scored 1 and none scored 3, 5, or 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_C3_2" runat="server" Enabled="False" /><br />
                                            2<br />
                                            At least 1 indicator row scored 1, and others scored 3, 5, or 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_C3_3" runat="server" Enabled="False" /><br />
                                            3<br />
                                            All indicators rows scored 3 and none scored 5 or 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_C3_4" runat="server" Enabled="False" /><br />
                                            4<br />
                                            At least one indicator row scored 3, and others scored 5 or 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_C3_5" runat="server" Enabled="False" /><br />
                                            5<br />
                                            All indicator rows scored 5 and none scored 7 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_C3_6" runat="server" Enabled="False" /><br />
                                            6<br />
                                            At least one indicator row scored 5 and others scored 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_C3_7" runat="server" Enabled="False" /><br />
                                            7<br />
                                            All indicator rows scored 7.
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
                Comments:<div>
                    <asp:TextBox ID="txtComment_C3" runat="server" TextMode="MultiLine" Width="500px" Height="85px"></asp:TextBox>
                    <asp:UpdatePanel ID="UpdatePanel12" runat="server">
                        <ContentTemplate>
                            <asp:LinkButton ID="lnkSubmitC3" runat="server" OnClick="lnkSubmitC3_Click" ValidationGroup="Val1">Submit</asp:LinkButton>
                            <asp:PlaceHolder ID="plcError_C3" runat="server"></asp:PlaceHolder>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator12" runat="server" ErrorMessage='"Please enter maximum 500 charachters."' SetFocusOnError="True" ControlToValidate="txtComment_A1" ValidationExpression="^[a-zA-Z.]{0,500}$" ValidationGroup="Val1"></asp:RegularExpressionValidator>
                            <!--FORMVIEW-->
                            <asp:FormView ID="FormView12" runat="server" DataSourceID="SqlDataSource12" EnableModelValidation="True" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" GridLines="Both">

                                <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White"></EditRowStyle>

                                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510"></FooterStyle>

                                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White"></HeaderStyle>
                                <ItemTemplate>
                                    <p>

                                        <sub>
                                            <asp:Label Text='<%# Bind("ErikosnDate_C3") %>' runat="server" ID="ErikosnDate_C3Label" /></sub><br />
                                        Erikson Comments:
                        <asp:Label Text='<%# Bind("EriksonComments_C3") %>' runat="server" ID="EriksonComments_C3Label" /><br />
                                        <br />
                                        <sub>

                                            <asp:Label Text='<%# Bind("ISBEDate_C3") %>' runat="server" ID="ISBEDate_C3Label" /></sub><br />
                                        ISBE Comments:
                        <asp:Label Text='<%# Bind("ISBEComments_C3") %>' runat="server" ID="ISBEComments_C3Label" /><br />
                                        <br />
                                        <sub>
                                            <asp:Label Text='<%# Bind("SiteDate_C3") %>' runat="server" ID="SiteDate_C3Label" /></sub><br />
                                        Site Comments:
                        <asp:Label Text='<%# Bind("SiteComments_C3") %>' runat="server" ID="SiteComments_C3Label" /><br />
                                    </p>
                                </ItemTemplate>
                                <PagerStyle HorizontalAlign="Center" ForeColor="#8C4510"></PagerStyle>

                                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510"></RowStyle>
                            </asp:FormView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource12" ConnectionString='<%$ ConnectionStrings:ISBEPI_DEV %>' SelectCommand="SELECT [ErikosnDate_C3], [EriksonComments_C3], [ISBEDate_C3], [ISBEComments_C3], [SiteDate_C3], [SiteComments_C3] FROM [PIQRI_Comments] WHERE ([Schd_ID] = @Schd_ID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hfSchdId" PropertyName="Value" Name="Schd_ID" Type="Int32"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>

            <!---------------------------------------------------------------->
            <div style="cursor: pointer;" onclick="javascript:DivClicked('STTFSAN');">
                <h3 class="scoringTitle">
                    <img src="../Images/edit_add.png" height="40" style="width: 40px" />Subscale:  C4.  Services Tailored to Family Strength and Needs</h3>
            </div>
            <!---------------------------------------------------------------->
            <div id="STTFSAN" style="display: none;">
                <table class="d">
                    <tr>
                        <td colspan="4">
                            <h3>Subscale:  C4.  Program Emphasizes Strong Working Relationships with Families</h3>
                        </td>
                    </tr>
                    <tr>
                        <td class="d">1<br />
                            Low Quality
                        </td>
                        <td class="d">3<br />
                            Average Quality
                        </td>
                        <td class="d">5<br />
                            Above Average Quality
                        </td>
                        <td class="d">7<br />
                            High Quality
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 1: Assessing Individual Family Needs and Strengths</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_C4_1_1" runat="server" Enabled="False" /><asp:Label ID="lbl_STTFSAN_1_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_C4_1_2" runat="server" Enabled="False" /><asp:Label ID="lbl_STTFSAN_1_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_C4_1_3" runat="server" Enabled="False" /><asp:Label ID="lbl_STTFSAN_1_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_C4_1_4" runat="server" Enabled="False" /><asp:Label ID="lbl_STTFSAN_1_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 2: Adaptation of Program Materials to Diverse Family Needs and Strengths</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_C4_2_1" runat="server" Enabled="False" /><asp:Label ID="lbl_STTFSAN_2_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_C4_2_2" runat="server" Enabled="False" /><asp:Label ID="lbl_STTFSAN_2_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_C4_2_3" runat="server" Enabled="False" /><asp:Label ID="lbl_STTFSAN_2_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_C4_2_4" runat="server" Enabled="False" /><asp:Label ID="lbl_STTFSAN_2_4" runat="server"></asp:Label>
                        </td>
                    </tr>

                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <div class="piqriscore">
                                <h5 class="piqriscore">Circle Subscale Score</h5>
                                <table class="d">
                                    <tr>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_C4_1" runat="server" Enabled="False" /><br />
                                            1<br />
                                            All indicator rows scored 1 and none scored 3, 5, or 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_C4_2" runat="server" Enabled="False" /><br />
                                            2<br />
                                            At least 1 indicator row scored 1, and others scored 3, 5, or 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_C4_3" runat="server" Enabled="False" /><br />
                                            3<br />
                                            All indicators rows scored 3 and none scored 5 or 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_C4_4" runat="server" Enabled="False" /><br />
                                            4<br />
                                            At least one indicator row scored 3, and others scored 5 or 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_C4_5" runat="server" Enabled="False" /><br />
                                            5<br />
                                            All indicator rows scored 5 and none scored 7 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_C4_6" runat="server" Enabled="False" /><br />
                                            6<br />
                                            At least one indicator row scored 5 and others scored 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_C4_7" runat="server" Enabled="False" /><br />
                                            7<br />
                                            All indicator rows scored 7.
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
                Comments:<div>
                    <asp:TextBox ID="txtComment_C4" runat="server" TextMode="MultiLine" Width="500px" Height="85px"></asp:TextBox>
                    <asp:UpdatePanel ID="UpdatePanel13" runat="server">
                        <ContentTemplate>
                            <asp:LinkButton ID="lnkSubmitC4" runat="server" OnClick="lnkSubmitC4_Click" ValidationGroup="Val1">Submit</asp:LinkButton>
                            <asp:PlaceHolder ID="plcError_C4" runat="server"></asp:PlaceHolder>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator13" runat="server" ErrorMessage='"Please enter maximum 500 charachters."' SetFocusOnError="True" ControlToValidate="txtComment_C4" ValidationExpression="^[\S\s]{1,500}$" ValidationGroup="Val1"></asp:RegularExpressionValidator>
                            <!--FORMVIEW-->
                            <asp:FormView ID="FormView13" runat="server" DataSourceID="SqlDataSource13" EnableModelValidation="True" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" GridLines="Both">

                                <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White"></EditRowStyle>

                                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510"></FooterStyle>

                                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White"></HeaderStyle>
                                <ItemTemplate>
                                    <p>

                                        <sub>
                                            <asp:Label Text='<%# Bind("ErikosnDate_C4") %>' runat="server" ID="ErikosnDate_C4Label" /></sub><br />
                                        Erikson Comments:
                        <asp:Label Text='<%# Bind("EriksonComments_C4") %>' runat="server" ID="EriksonComments_C4Label" /><br />
                                        <br />
                                        <sub>

                                            <asp:Label Text='<%# Bind("ISBEDate_C4") %>' runat="server" ID="ISBEDate_C4Label" /></sub><br />
                                        ISBE Comments:
                        <asp:Label Text='<%# Bind("ISBEComments_C4") %>' runat="server" ID="ISBEComments_C4Label" /><br />
                                        <br />
                                        <sub>
                                            <asp:Label Text='<%# Bind("SiteDate_C4") %>' runat="server" ID="SiteDate_C4Label" /></sub><br />
                                        Site Comments:
                        <asp:Label Text='<%# Bind("SiteComments_C4") %>' runat="server" ID="SiteComments_C4Label" /><br />
                                    </p>
                                </ItemTemplate>
                                <PagerStyle HorizontalAlign="Center" ForeColor="#8C4510"></PagerStyle>

                                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510"></RowStyle>
                            </asp:FormView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource13" ConnectionString='<%$ ConnectionStrings:ISBEPI_DEV %>' SelectCommand="SELECT [ErikosnDate_C4], [EriksonComments_C4], [ISBEDate_C4], [ISBEComments_C4], [SiteDate_C4], [SiteComments_C4] FROM [PIQRI_Comments] WHERE ([Schd_ID] = @Schd_ID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hfSchdId" PropertyName="Value" Name="Schd_ID" Type="Int32"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            <!---------------------------------------------------------------->
        </div>

        <!------------------------------------------------------------------------------------------------------------------->
        <div style="cursor: pointer;" onclick="javascript:DivClicked('PMAD');">
            <h3 class="finaltoolTitle">
                <img src="../Images/edit_add.png" height="40" style="width: 40px" />Program Management and Development<br />
                Subscales D1 – D6 </h3>
        </div>
        <div id="PMAD" style="display: none;">
            <div class="Purpose">PURPOSE</div>
            <br />
            <div class="Purpose_topic">
                Scale D is focused on the administration and management of the daily operations of the program.  It specifically looks at management skills of the program leadership staff.   Competent leadership includes aspects of managing day to day operations as well as ability to integrate the home visiting program into the communities where they provide services.   It also incorporates management staff education, experience and the actions taken to provide leadership to the overall program.
            </div>

            <!----------------------------------------------------------------------------------------->
            <div style="cursor: pointer;" onclick="javascript:DivClicked('LQMASS');">
                <h3 class="scoringTitle">
                    <img src="../Images/edit_add.png" height="40" style="width: 40px" />Subscale:  D1.  Leadership Qualifications - Management and Staff Supervisors</h3>
            </div>
            <!---------------------------------------------------------------->
            <div id="LQMASS" style="display: none;">
                <table class="d">
                    <tr>
                        <td colspan="4">
                            <h3>Subscale:  D1.  Leadership Qualifications - Management and Staff Supervisors</h3>
                        </td>
                    </tr>
                    <tr>
                        <td class="d">1<br />
                            Low Quality
                        </td>
                        <td class="d">3<br />
                            Average Quality
                        </td>
                        <td class="d">5<br />
                            Above Average Quality
                        </td>
                        <td class="d">7<br />
                            High Quality
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 1: Education</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D1_1_1" runat="server" Enabled="False" /><asp:Label ID="lbl_LQMASS_1_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D1_1_2" runat="server" Enabled="False" /><asp:Label ID="lbl_LQMASS_1_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D1_1_3" runat="server" Enabled="False" /><asp:Label ID="lbl_LQMASS_1_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D1_1_4" runat="server" Enabled="False" /><asp:Label ID="lbl_LQMASS_1_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 2: Early Childhood Experience</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D1_2_1" runat="server" Enabled="False" /><asp:Label ID="lbl_LQMASS_2_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D1_2_2" runat="server" Enabled="False" /><asp:Label ID="lbl_LQMASS_2_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D1_2_3" runat="server" Enabled="False" /><asp:Label ID="lbl_LQMASS_2_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D1_2_4" runat="server" Enabled="False" /><asp:Label ID="lbl_LQMASS_2_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 3: Management Experience</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D1_3_1" runat="server" Enabled="False" /><asp:Label ID="lbl_LQMASS_3_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D1_3_2" runat="server" Enabled="False" /><asp:Label ID="lbl_LQMASS_3_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D1_3_3" runat="server" Enabled="False" /><asp:Label ID="lbl_LQMASS_3_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D1_3_4" runat="server" Enabled="False" /><asp:Label ID="lbl_LQMASS_3_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <div class="piqriscore">
                                <h5 class="piqriscore">Circle Subscale Score</h5>
                                <table class="d">
                                    <tr>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_D1_1" runat="server" Enabled="False" /><br />
                                            1<br />
                                            All indicator rows scored 1 and none scored 3, 5, or 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_D1_2" runat="server" Enabled="False" /><br />
                                            2<br />
                                            At least 1 indicator row scored 1, and others scored 3, 5, or 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_D1_3" runat="server" Enabled="False" /><br />
                                            3<br />
                                            All indicators rows scored 3 and none scored 5 or 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_D1_4" runat="server" Enabled="False" /><br />
                                            4<br />
                                            At least one indicator row scored 3, and others scored 5 or 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_D1_5" runat="server" Enabled="False" /><br />
                                            5<br />
                                            All indicator rows scored 5 and none scored 7 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_D1_6" runat="server" Enabled="False" /><br />
                                            6<br />
                                            At least one indicator row scored 5 and others scored 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_D1_7" runat="server" Enabled="False" /><br />
                                            7<br />
                                            All indicator rows scored 7.
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
                Comments:<div>
                    <asp:TextBox ID="txtComment_D1" runat="server" TextMode="MultiLine" Width="500px" Height="85px"></asp:TextBox>
                    <asp:UpdatePanel ID="UpdatePanel14" runat="server">
                        <ContentTemplate>
                            <asp:LinkButton ID="lnkSubmitD1" runat="server" OnClick="lnkSubmitD1_Click" ValidationGroup="Val1">Submit</asp:LinkButton>
                            <asp:PlaceHolder ID="plcError_D1" runat="server"></asp:PlaceHolder>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator14" runat="server" ErrorMessage='"Please enter maximum 500 charachters."' SetFocusOnError="True" ControlToValidate="txtComment_D1" ValidationExpression="^[\S\s]{1,500}$" ValidationGroup="Val1"></asp:RegularExpressionValidator>
                            <!--FORMVIEW-->
                            <asp:FormView ID="FormView14" runat="server" DataSourceID="SqlDataSource14" EnableModelValidation="True" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" GridLines="Both">

                                <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White"></EditRowStyle>

                                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510"></FooterStyle>

                                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White"></HeaderStyle>
                                <ItemTemplate>
                                    <p>

                                        <sub>
                                            <asp:Label Text='<%# Bind("ErikosnDate_D1") %>' runat="server" ID="ErikosnDate_D1Label" /></sub><br />
                                        Erikson Comments:
                        <asp:Label Text='<%# Bind("EriksonComments_D1") %>' runat="server" ID="EriksonComments_D1Label" /><br />
                                        <br />
                                        <sub>

                                            <asp:Label Text='<%# Bind("ISBEDate_D1") %>' runat="server" ID="ISBEDate_D1Label" /></sub><br />
                                        ISBE Comments:
                        <asp:Label Text='<%# Bind("ISBEComments_D1") %>' runat="server" ID="ISBEComments_D1Label" /><br />
                                        <br />
                                        <sub>
                                            <asp:Label Text='<%# Bind("SiteDate_D1") %>' runat="server" ID="SiteDate_D1Label" /></sub><br />
                                        Site Comments:
                        <asp:Label Text='<%# Bind("SiteComments_D1") %>' runat="server" ID="SiteComments_D1Label" /><br />
                                    </p>
                                </ItemTemplate>
                                <PagerStyle HorizontalAlign="Center" ForeColor="#8C4510"></PagerStyle>

                                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510"></RowStyle>
                            </asp:FormView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource14" ConnectionString='<%$ ConnectionStrings:ISBEPI_DEV %>' SelectCommand="SELECT [ErikosnDate_D1], [EriksonComments_D1], [ISBEDate_D1], [ISBEComments_D1], [SiteDate_D1], [SiteComments_D1] FROM [PIQRI_Comments] WHERE ([Schd_ID] = @Schd_ID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hfSchdId" PropertyName="Value" Name="Schd_ID" Type="Int32"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            <!----------------------------------------------------------------------------------------->
            <div style="cursor: pointer;" onclick="javascript:DivClicked('LP');">
                <h3 class="scoringTitle">
                    <img src="../Images/edit_add.png" height="40" style="width: 40px" />Subscale:  D2.  Leadership Practice</h3>
            </div>
            <!---------------------------------------------------------------->
            <div id="LP" style="display: none;">
                <table class="d">
                    <tr>
                        <td colspan="4">
                            <h3>Subscale:  D2.  Leadership Practice</h3>
                        </td>
                    </tr>
                    <tr>
                        <td class="d">1<br />
                            Low Quality
                        </td>
                        <td class="d">3<br />
                            Average Quality
                        </td>
                        <td class="d">5<br />
                            Above Average Quality
                        </td>
                        <td class="d">7<br />
                            High Quality
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 1: Program Planning and Implementation</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D2_1_1" runat="server" Enabled="False" /><asp:Label ID="lbl_LP_1_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D2_1_2" runat="server" Enabled="False" /><asp:Label ID="lbl_LP_1_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D2_1_3" runat="server" Enabled="False" /><asp:Label ID="lbl_LP_1_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D2_1_4" runat="server" Enabled="False" /><asp:Label ID="lbl_LP_1_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 2: Fiscal Resource Management</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D2_2_1" runat="server" Enabled="False" /><asp:Label ID="lbl_LP_2_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D2_2_2" runat="server" Enabled="False" /><asp:Label ID="lbl_LP_2_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D2_2_3" runat="server" Enabled="False" /><asp:Label ID="lbl_LP_2_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D2_2_4" runat="server" Enabled="False" /><asp:Label ID="lbl_LP_2_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 3: Communication/Decision Making</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D2_3_1" runat="server" Enabled="False" /><asp:Label ID="lbl_LP_3_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D2_3_2" runat="server" Enabled="False" /><asp:Label ID="lbl_LP_3_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D2_3_3" runat="server" Enabled="False" /><asp:Label ID="lbl_LP_3_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D2_3_4" runat="server" Enabled="False" /><asp:Label ID="lbl_LP_3_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <div class="piqriscore">
                                <h5 class="piqriscore">Circle Subscale Score</h5>
                                <table class="d">
                                    <tr>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_D2_1" runat="server" Enabled="False" /><br />
                                            1<br />
                                            All indicator rows scored 1 and none scored 3, 5, or 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_D2_2" runat="server" Enabled="False" /><br />
                                            2<br />
                                            At least 1 indicator row scored 1, and others scored 3, 5, or 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_D2_3" runat="server" Enabled="False" /><br />
                                            3<br />
                                            All indicators rows scored 3 and none scored 5 or 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_D2_4" runat="server" Enabled="False" /><br />
                                            4<br />
                                            At least one indicator row scored 3, and others scored 5 or 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_D2_5" runat="server" Enabled="False" /><br />
                                            5<br />
                                            All indicator rows scored 5 and none scored 7 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_D2_6" runat="server" Enabled="False" /><br />
                                            6<br />
                                            At least one indicator row scored 5 and others scored 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_D2_7" runat="server" Enabled="False" /><br />
                                            7<br />
                                            All indicator rows scored 7.
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
                Comments:<div>
                    <asp:TextBox ID="txtComment_D2" runat="server" TextMode="MultiLine" Width="500px" Height="85px"></asp:TextBox>
                    <asp:UpdatePanel ID="UpdatePanel15" runat="server">
                        <ContentTemplate>
                            <asp:LinkButton ID="lnkSubmitD2" runat="server" OnClick="lnkSubmitD2_Click" ValidationGroup="Val1">Submit</asp:LinkButton>
                            <asp:PlaceHolder ID="plcError_D2" runat="server"></asp:PlaceHolder>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator15" runat="server" ErrorMessage='"Please enter maximum 500 charachters."' SetFocusOnError="True" ControlToValidate="txtComment_D2" ValidationExpression="^[\S\s]{1,500}$" ValidationGroup="Val1"></asp:RegularExpressionValidator>
                            <!--FORMVIEW-->
                            <asp:FormView ID="FormView15" runat="server" DataSourceID="SqlDataSource15" EnableModelValidation="True" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" GridLines="Both">

                                <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White"></EditRowStyle>

                                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510"></FooterStyle>

                                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White"></HeaderStyle>
                                <ItemTemplate>
                                    <p>

                                        <sub>
                                            <asp:Label Text='<%# Bind("ErikosnDate_D2") %>' runat="server" ID="ErikosnDate_D2Label" /></sub><br />
                                        Erikson Comments:
                        <asp:Label Text='<%# Bind("EriksonComments_D2") %>' runat="server" ID="EriksonComments_D2Label" /><br />
                                        <br />
                                        <sub>

                                            <asp:Label Text='<%# Bind("ISBEDate_D2") %>' runat="server" ID="ISBEDate_D2Label" /></sub><br />
                                        ISBE Comments:
                        <asp:Label Text='<%# Bind("ISBEComments_D2") %>' runat="server" ID="ISBEComments_D2Label" /><br />
                                        <br />
                                        <sub>
                                            <asp:Label Text='<%# Bind("SiteDate_D2") %>' runat="server" ID="SiteDate_D2Label" /></sub><br />
                                        Site Comments:
                        <asp:Label Text='<%# Bind("SiteComments_D2") %>' runat="server" ID="SiteComments_D2Label" /><br />
                                    </p>
                                </ItemTemplate>
                                <PagerStyle HorizontalAlign="Center" ForeColor="#8C4510"></PagerStyle>

                                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510"></RowStyle>
                            </asp:FormView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource15" ConnectionString='<%$ ConnectionStrings:ISBEPI_DEV %>' SelectCommand="SELECT [ErikosnDate_D2], [EriksonComments_D2], [ISBEDate_D2], [ISBEComments_D2], [SiteDate_D2], [SiteComments_D2] FROM [PIQRI_Comments] WHERE ([Schd_ID] = @Schd_ID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hfSchdId" PropertyName="Value" Name="Schd_ID" Type="Int32"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            <!---------------------------------------------------------------->
            <div style="cursor: pointer;" onclick="javascript:DivClicked('WE');">
                <h3 class="scoringTitle">
                    <img src="../Images/edit_add.png" height="40" style="width: 40px" />Subscale:  D3.  Work Environment</h3>
            </div>
            <!---------------------------------------------------------------->
            <div id="WE" style="display: none;">
                <table class="d">
                    <tr>
                        <td colspan="4">
                            <h3>Subscale:  D3.  Work Environment</h3>
                        </td>
                    </tr>
                    <tr>
                        <td class="d">1<br />
                            Low Quality
                        </td>
                        <td class="d">3<br />
                            Average Quality
                        </td>
                        <td class="d">5<br />
                            Above Average Quality
                        </td>
                        <td class="d">7<br />
                            High Quality
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 1: Wages and Benefits</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D3_1_1" runat="server" Enabled="False" /><asp:Label ID="lbl_WE_1_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D3_1_2" runat="server" Enabled="False" /><asp:Label ID="lbl_WE_1_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D3_1_3" runat="server" Enabled="False" /><asp:Label ID="lbl_WE_1_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D3_1_4" runat="server" Enabled="False" /><asp:Label ID="lbl_WE_1_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 2: Staff Morale</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D3_2_1" runat="server" Enabled="False" /><asp:Label ID="lbl_WE_2_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D3_2_2" runat="server" Enabled="False" /><asp:Label ID="lbl_WE_2_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D3_2_3" runat="server" Enabled="False" /><asp:Label ID="lbl_WE_2_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D3_2_4" runat="server" Enabled="False" /><asp:Label ID="lbl_WE_2_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 3: Materials and Physical Environment</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D3_3_1" runat="server" Enabled="False" /><asp:Label ID="lbl_WE_3_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D3_3_2" runat="server" Enabled="False" /><asp:Label ID="lbl_WE_3_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D3_3_3" runat="server" Enabled="False" /><asp:Label ID="lbl_WE_3_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D3_3_4" runat="server" Enabled="False" /><asp:Label ID="lbl_WE_3_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 4: Technical Support</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D3_4_1" runat="server" Enabled="False" /><asp:Label ID="lbl_WE_4_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D3_4_2" runat="server" Enabled="False" /><asp:Label ID="lbl_WE_4_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D3_4_3" runat="server" Enabled="False" /><asp:Label ID="lbl_WE_4_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D3_4_4" runat="server" Enabled="False" /><asp:Label ID="lbl_WE_4_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <div class="piqriscore">
                                <h5 class="piqriscore">Circle Subscale Score</h5>
                                <table class="d">
                                    <tr>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_D3_1" runat="server" Enabled="False" /><br />
                                            1<br />
                                            All indicator rows scored 1 and none scored 3, 5, or 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_D3_2" runat="server" Enabled="False" /><br />
                                            2<br />
                                            At least 1 indicator row scored 1, and others scored 3, 5, or 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_D3_3" runat="server" Enabled="False" /><br />
                                            3<br />
                                            All indicators rows scored 3 and none scored 5 or 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_D3_4" runat="server" Enabled="False" /><br />
                                            4<br />
                                            At least one indicator row scored 3, and others scored 5 or 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_D3_5" runat="server" Enabled="False" /><br />
                                            5<br />
                                            All indicator rows scored 5 and none scored 7 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_D3_6" runat="server" Enabled="False" /><br />
                                            6<br />
                                            At least one indicator row scored 5 and others scored 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_D3_7" runat="server" Enabled="False" /><br />
                                            7<br />
                                            All indicator rows scored 7.
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
                Comments:<div>
                    <asp:TextBox ID="txtComment_D3" runat="server" TextMode="MultiLine" Width="500px" Height="85px"></asp:TextBox>
                    <asp:UpdatePanel ID="UpdatePanel16" runat="server">
                        <ContentTemplate>
                            <asp:LinkButton ID="lnkSubmitD3" runat="server" OnClick="lnkSubmitD3_Click" ValidationGroup="Val1">Submit</asp:LinkButton>
                            <asp:PlaceHolder ID="plcError_D3" runat="server"></asp:PlaceHolder>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator16" runat="server" ErrorMessage='"Please enter maximum 500 charachters."' SetFocusOnError="True" ControlToValidate="txtComment_D3" ValidationExpression="^[\S\s]{1,500}$" ValidationGroup="Val1"></asp:RegularExpressionValidator>
                            <!--FORMVIEW-->
                            <asp:FormView ID="FormView16" runat="server" DataSourceID="SqlDataSource16" EnableModelValidation="True" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" GridLines="Both">

                                <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White"></EditRowStyle>

                                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510"></FooterStyle>

                                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White"></HeaderStyle>
                                <ItemTemplate>
                                    <p>

                                        <sub>
                                            <asp:Label Text='<%# Bind("ErikosnDate_D3") %>' runat="server" ID="ErikosnDate_D3Label" /></sub><br />
                                        Erikson Comments:
                        <asp:Label Text='<%# Bind("EriksonComments_D3") %>' runat="server" ID="EriksonComments_D3Label" /><br />
                                        <br />
                                        <sub>

                                            <asp:Label Text='<%# Bind("ISBEDate_D3") %>' runat="server" ID="ISBEDate_D3Label" /></sub><br />
                                        ISBE Comments:
                        <asp:Label Text='<%# Bind("ISBEComments_D3") %>' runat="server" ID="ISBEComments_D3Label" /><br />
                                        <br />
                                        <sub>
                                            <asp:Label Text='<%# Bind("SiteDate_D3") %>' runat="server" ID="SiteDate_D3Label" /></sub><br />
                                        Site Comments:
                        <asp:Label Text='<%# Bind("SiteComments_D3") %>' runat="server" ID="SiteComments_D3Label" /><br />
                                    </p>
                                </ItemTemplate>
                                <PagerStyle HorizontalAlign="Center" ForeColor="#8C4510"></PagerStyle>

                                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510"></RowStyle>
                            </asp:FormView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource16" ConnectionString='<%$ ConnectionStrings:ISBEPI_DEV %>' SelectCommand="SELECT [ErikosnDate_D3], [EriksonComments_D3], [ISBEDate_D3], [ISBEComments_D3], [SiteDate_D3], [SiteComments_D3] FROM [PIQRI_Comments] WHERE ([Schd_ID] = @Schd_ID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hfSchdId" PropertyName="Value" Name="Schd_ID" Type="Int32"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            <!----------------------------------------------------------------------------------------->
            <div style="cursor: pointer;" onclick="javascript:DivClicked('WPAGFPA');">
                <h3 class="scoringTitle">
                    <img src="../Images/edit_add.png" height="40" style="width: 40px" />Subscale:  D4.  Written policies and guidelines for program administration</h3>
            </div>
            <!---------------------------------------------------------------->
            <div id="WPAGFPA" style="display: none;">
                <table class="d">
                    <tr>
                        <td colspan="4">
                            <h3>Subscale:  D4.  Written policies and guidelines for program administration</h3>
                        </td>
                    </tr>
                    <tr>
                        <td class="d">1<br />
                            Low Quality
                        </td>
                        <td class="d">3<br />
                            Average Quality
                        </td>
                        <td class="d">5<br />
                            Above Average Quality
                        </td>
                        <td class="d">7<br />
                            High Quality
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 1: Written Policies and Procedures</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D4_1_1" runat="server" Enabled="False" /><asp:Label ID="lbl_WPAGFPA_1_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D4_1_2" runat="server" Enabled="False" /><asp:Label ID="lbl_WPAGFPA_1_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D4_1_3" runat="server" Enabled="False" /><asp:Label ID="lbl_WPAGFPA_1_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D4_1_4" runat="server" Enabled="False" /><asp:Label ID="lbl_WPAGFPA_1_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 2: Staff Awareness/Involvement</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D4_2_1" runat="server" Enabled="False" /><asp:Label ID="lbl_WPAGFPA_2_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D4_2_2" runat="server" Enabled="False" /><asp:Label ID="lbl_WPAGFPA_2_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D4_2_3" runat="server" Enabled="False" /><asp:Label ID="lbl_WPAGFPA_2_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D4_2_4" runat="server" Enabled="False" /><asp:Label ID="lbl_WPAGFPA_2_4" runat="server"></asp:Label>
                        </td>
                    </tr>

                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <div class="piqriscore">
                                <h5 class="piqriscore">Circle Subscale Score</h5>
                                <table class="d">
                                    <tr>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_D4_1" runat="server" Enabled="False" /><br />
                                            1<br />
                                            All indicator rows scored 1 and none scored 3, 5, or 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_D4_2" runat="server" Enabled="False" /><br />
                                            2<br />
                                            At least 1 indicator row scored 1, and others scored 3, 5, or 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_D4_3" runat="server" Enabled="False" /><br />
                                            3<br />
                                            All indicators rows scored 3 and none scored 5 or 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_D4_4" runat="server" Enabled="False" /><br />
                                            4<br />
                                            At least one indicator row scored 3, and others scored 5 or 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_D4_5" runat="server" Enabled="False" /><br />
                                            5<br />
                                            All indicator rows scored 5 and none scored 7 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_D4_6" runat="server" Enabled="False" /><br />
                                            6<br />
                                            At least one indicator row scored 5 and others scored 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_D4_7" runat="server" Enabled="False" /><br />
                                            7<br />
                                            All indicator rows scored 7.
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
                Comments:<div>
                    <asp:TextBox ID="txtComment_D4" runat="server" TextMode="MultiLine" Width="500px" Height="85px"></asp:TextBox>
                    <asp:UpdatePanel ID="UpdatePanel17" runat="server">
                        <ContentTemplate>
                            <asp:LinkButton ID="lnkSubmitD4" runat="server" OnClick="lnkSubmitD4_Click" ValidationGroup="Val1">Submit</asp:LinkButton>
                            <asp:PlaceHolder ID="plcError_D4" runat="server"></asp:PlaceHolder>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator17" runat="server" ErrorMessage='"Please enter maximum 500 charachters."' SetFocusOnError="True" ControlToValidate="txtComment_D4" ValidationExpression="^[\S\s]{1,500}$" ValidationGroup="Val1"></asp:RegularExpressionValidator>
                            <!--FORMVIEW-->
                            <asp:FormView ID="FormView17" runat="server" DataSourceID="SqlDataSource17" EnableModelValidation="True" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" GridLines="Both">

                                <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White"></EditRowStyle>

                                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510"></FooterStyle>

                                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White"></HeaderStyle>
                                <ItemTemplate>
                                    <p>

                                        <sub>
                                            <asp:Label Text='<%# Bind("ErikosnDate_D4") %>' runat="server" ID="ErikosnDate_D4Label" /></sub><br />
                                        Erikson Comments:
                        <asp:Label Text='<%# Bind("EriksonComments_D4") %>' runat="server" ID="EriksonComments_D4Label" /><br />
                                        <br />
                                        <sub>

                                            <asp:Label Text='<%# Bind("ISBEDate_D4") %>' runat="server" ID="ISBEDate_D4Label" /></sub><br />
                                        ISBE Comments:
                        <asp:Label Text='<%# Bind("ISBEComments_D4") %>' runat="server" ID="ISBEComments_D4Label" /><br />
                                        <br />
                                        <sub>
                                            <asp:Label Text='<%# Bind("SiteDate_D4") %>' runat="server" ID="SiteDate_D4Label" /></sub><br />
                                        Site Comments:
                        <asp:Label Text='<%# Bind("SiteComments_D4") %>' runat="server" ID="SiteComments_D4Label" /><br />
                                    </p>
                                </ItemTemplate>
                                <PagerStyle HorizontalAlign="Center" ForeColor="#8C4510"></PagerStyle>

                                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510"></RowStyle>
                            </asp:FormView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource17" ConnectionString='<%$ ConnectionStrings:ISBEPI_DEV %>' SelectCommand="SELECT [ErikosnDate_D4], [EriksonComments_D4], [ISBEDate_D4], [ISBEComments_D4], [SiteDate_D4], [SiteComments_D4] FROM [PIQRI_Comments] WHERE ([Schd_ID] = @Schd_ID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hfSchdId" PropertyName="Value" Name="Schd_ID" Type="Int32"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            <!----------------------------------------------------------------------------------------->
            <div style="cursor: pointer;" onclick="javascript:DivClicked('Supervision');">
                <h3 class="scoringTitle">
                    <img src="../Images/edit_add.png" height="40" style="width: 40px" />Subscale:  D5.  Supervision</h3>
            </div>
            <!---------------------------------------------------------------->
            <div id="Supervision" style="display: none;">
                <table class="d">
                    <tr>
                        <td colspan="4">
                            <h3>Subscale:  D5.  Supervision</h3>
                        </td>
                    </tr>
                    <tr>
                        <td class="d">1<br />
                            Low Quality
                        </td>
                        <td class="d">3<br />
                            Average Quality
                        </td>
                        <td class="d">5<br />
                            Above Average Quality
                        </td>
                        <td class="d">7<br />
                            High Quality
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 1: Frequency</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D5_1_1" runat="server" Enabled="False" /><asp:Label ID="lbl_Supervision_1_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D5_1_2" runat="server" Enabled="False" /><asp:Label ID="lbl_Supervision_1_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D5_1_3" runat="server" Enabled="False" /><asp:Label ID="lbl_Supervision_1_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D5_1_4" runat="server" Enabled="False" /><asp:Label ID="lbl_Supervision_1_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 2: Supervision Style</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D5_2_1" runat="server" Enabled="False" /><asp:Label ID="lbl_Supervision_2_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D5_2_2" runat="server" Enabled="False" /><asp:Label ID="lbl_Supervision_2_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D5_2_3" runat="server" Enabled="False" /><asp:Label ID="lbl_Supervision_2_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D5_2_4" runat="server" Enabled="False" /><asp:Label ID="lbl_Supervision_2_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 3: Supervisor to Staff Ratio</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D5_3_1" runat="server" Enabled="False" /><asp:Label ID="lbl_Supervision_3_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D5_3_2" runat="server" Enabled="False" /><asp:Label ID="lbl_Supervision_3_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D5_3_3" runat="server" Enabled="False" /><asp:Label ID="lbl_Supervision_3_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D5_3_4" runat="server" Enabled="False" /><asp:Label ID="lbl_Supervision_3_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 4: Group/Peer Supervision</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D5_4_1" runat="server" Enabled="False" /><asp:Label ID="lbl_Supervision_4_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D5_4_2" runat="server" Enabled="False" /><asp:Label ID="lbl_Supervision_4_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D5_4_3" runat="server" Enabled="False" /><asp:Label ID="lbl_Supervision_4_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D5_4_4" runat="server" Enabled="False" /><asp:Label ID="lbl_Supervision_4_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 5: Supervisor Observations</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D5_5_1" runat="server" Enabled="False" /><asp:Label ID="lbl_Supervision_5_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D5_5_2" runat="server" Enabled="False" /><asp:Label ID="lbl_Supervision_5_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D5_5_3" runat="server" Enabled="False" /><asp:Label ID="lbl_Supervision_5_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D5_5_4" runat="server" Enabled="False" /><asp:Label ID="lbl_Supervision_5_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <div class="piqriscore">
                                <h5 class="piqriscore">Circle Subscale Score</h5>
                                <table class="d">
                                    <tr>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_D5_1" runat="server" Enabled="False" /><br />
                                            1<br />
                                            All indicator rows scored 1 and none scored 3, 5, or 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_D5_2" runat="server" Enabled="False" /><br />
                                            2<br />
                                            At least 1 indicator row scored 1, and others scored 3, 5, or 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_D5_3" runat="server" Enabled="False" /><br />
                                            3<br />
                                            All indicators rows scored 3 and none scored 5 or 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_D5_4" runat="server" Enabled="False" /><br />
                                            4<br />
                                            At least one indicator row scored 3, and others scored 5 or 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_D5_5" runat="server" Enabled="False" /><br />
                                            5<br />
                                            All indicator rows scored 5 and none scored 7 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_D5_6" runat="server" Enabled="False" /><br />
                                            6<br />
                                            At least one indicator row scored 5 and others scored 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_D5_7" runat="server" Enabled="False" /><br />
                                            7<br />
                                            All indicator rows scored 7.
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
                Comments:<div>
                    <asp:TextBox ID="txtComment_D5" runat="server" TextMode="MultiLine" Width="500px" Height="85px"></asp:TextBox>
                    <asp:UpdatePanel ID="UpdatePanel18" runat="server">
                        <ContentTemplate>
                            <asp:LinkButton ID="lnkSubmitD5" runat="server" OnClick="lnkSubmitD5_Click" ValidationGroup="Val1">Submit</asp:LinkButton>
                            <asp:PlaceHolder ID="plcError_D5" runat="server"></asp:PlaceHolder>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator18" runat="server" ErrorMessage='"Please enter maximum 500 charachters."' SetFocusOnError="True" ControlToValidate="txtComment_D5" ValidationExpression="^[\S\s]{1,500}$" ValidationGroup="Val1"></asp:RegularExpressionValidator>
                            <!--FORMVIEW-->
                            <asp:FormView ID="FormView18" runat="server" DataSourceID="SqlDataSource18" EnableModelValidation="True" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" GridLines="Both">

                                <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White"></EditRowStyle>

                                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510"></FooterStyle>

                                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White"></HeaderStyle>
                                <ItemTemplate>
                                    <p>

                                        <sub>
                                            <asp:Label Text='<%# Bind("ErikosnDate_D5") %>' runat="server" ID="ErikosnDate_D5Label" /></sub><br />
                                        Erikson Comments:
                        <asp:Label Text='<%# Bind("EriksonComments_D5") %>' runat="server" ID="EriksonComments_D5Label" /><br />
                                        <br />
                                        <sub>

                                            <asp:Label Text='<%# Bind("ISBEDate_D5") %>' runat="server" ID="ISBEDate_D5Label" /></sub><br />
                                        ISBE Comments:
                        <asp:Label Text='<%# Bind("ISBEComments_D5") %>' runat="server" ID="ISBEComments_D5Label" /><br />
                                        <br />
                                        <sub>
                                            <asp:Label Text='<%# Bind("SiteDate_D5") %>' runat="server" ID="SiteDate_D5Label" /></sub><br />
                                        Site Comments:
                        <asp:Label Text='<%# Bind("SiteComments_D5") %>' runat="server" ID="SiteComments_D5Label" /><br />
                                    </p>
                                </ItemTemplate>
                                <PagerStyle HorizontalAlign="Center" ForeColor="#8C4510"></PagerStyle>

                                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510"></RowStyle>
                            </asp:FormView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource18" ConnectionString='<%$ ConnectionStrings:ISBEPI_DEV %>' SelectCommand="SELECT [ErikosnDate_D5], [EriksonComments_D5], [ISBEDate_D5], [ISBEComments_D5], [SiteDate_D5], [SiteComments_D5] FROM [PIQRI_Comments] WHERE ([Schd_ID] = @Schd_ID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hfSchdId" PropertyName="Value" Name="Schd_ID" Type="Int32"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>

            <!----------------------------------------------------------------------------------------->
            <div style="cursor: pointer;" onclick="javascript:DivClicked('CPRN');">
                <h3 class="scoringTitle">
                    <img src="../Images/edit_add.png" height="40" style="width: 40px" />Subscale:  D6.  Community Partnerships / Resource Networks</h3>
            </div>
            <!---------------------------------------------------------------->
            <div id="CPRN" style="display: none;">
                <table class="d">
                    <tr>
                        <td colspan="4">
                            <h3>Subscale:  D6.  Community Partnerships / Resource Networks</h3>
                        </td>
                    </tr>
                    <tr>
                        <td class="d">1<br />
                            Low Quality
                        </td>
                        <td class="d">3<br />
                            Average Quality
                        </td>
                        <td class="d">5<br />
                            Above Average Quality
                        </td>
                        <td class="d">7<br />
                            High Quality
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 1: Community Presence</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D6_1_1" runat="server" Enabled="False" /><asp:Label ID="lbl_CPRN_1_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D6_1_2" runat="server" Enabled="False" /><asp:Label ID="lbl_CPRN_1_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D6_1_3" runat="server" Enabled="False" /><asp:Label ID="lbl_CPRN_1_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D6_1_4" runat="server" Enabled="False" /><asp:Label ID="lbl_CPRN_1_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 2: Staff Awareness/Involvement</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D6_2_1" runat="server" Enabled="False" /><asp:Label ID="lbl_CPRN_2_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D6_2_2" runat="server" Enabled="False" /><asp:Label ID="lbl_CPRN_2_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D6_2_3" runat="server" Enabled="False" /><asp:Label ID="lbl_CPRN_2_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_D6_2_4" runat="server" Enabled="False" /><asp:Label ID="lbl_CPRN_2_4" runat="server"></asp:Label>
                        </td>
                    </tr>

                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <div class="piqriscore">
                                <h5 class="piqriscore">Circle Subscale Score</h5>
                                <table class="d">
                                    <tr>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_D6_1" runat="server" Enabled="False" /><br />
                                            1<br />
                                            All indicator rows scored 1 and none scored 3, 5, or 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_D6_2" runat="server" Enabled="False" /><br />
                                            2<br />
                                            At least 1 indicator row scored 1, and others scored 3, 5, or 7
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_D6_3" runat="server" Enabled="False" /><br />
                                            3<br />
                                            All indicators rows scored 3 and none scored 5 or 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_D6_4" runat="server" Enabled="False" /><br />
                                            4<br />
                                            At least one indicator row scored 3, and others scored 5 or 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_D6_5" runat="server" Enabled="False" /><br />
                                            5<br />
                                            All indicator rows scored 5 and none scored 7 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_D6_6" runat="server" Enabled="False" /><br />
                                            6<br />
                                            At least one indicator row scored 5 and others scored 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_D6_7" runat="server" Enabled="False" /><br />
                                            7<br />
                                            All indicator rows scored 7.
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
                Comments:<div>
                    <asp:TextBox ID="txtComment_D6" runat="server" TextMode="MultiLine" Width="500px" Height="85px"></asp:TextBox>
                    <asp:UpdatePanel ID="UpdatePanel19" runat="server">
                        <ContentTemplate>
                            <asp:LinkButton ID="lnkSubmitD6" runat="server" OnClick="lnkSubmitD6_Click" ValidationGroup="Val1">Submit</asp:LinkButton>
                            <asp:PlaceHolder ID="plcError_D6" runat="server"></asp:PlaceHolder>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator19" runat="server" ErrorMessage='"Please enter maximum 500 charachters."' SetFocusOnError="True" ControlToValidate="txtComment_D6" ValidationExpression="^[\S\s]{1,500}$" ValidationGroup="Val1"></asp:RegularExpressionValidator>
                            <!--FORMVIEW-->
                            <asp:FormView ID="FormView19" runat="server" DataSourceID="SqlDataSource19" EnableModelValidation="True" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" GridLines="Both">

                                <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White"></EditRowStyle>

                                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510"></FooterStyle>

                                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White"></HeaderStyle>
                                <ItemTemplate>
                                    <p>

                                        <sub>
                                            <asp:Label Text='<%# Bind("ErikosnDate_D6") %>' runat="server" ID="ErikosnDate_D6Label" /></sub><br />
                                        Erikson Comments:
                        <asp:Label Text='<%# Bind("EriksonComments_D6") %>' runat="server" ID="EriksonComments_D6Label" /><br />
                                        <br />
                                        <sub>

                                            <asp:Label Text='<%# Bind("ISBEDate_D6") %>' runat="server" ID="ISBEDate_D6Label" /></sub><br />
                                        ISBE Comments:
                        <asp:Label Text='<%# Bind("ISBEComments_D6") %>' runat="server" ID="ISBEComments_D6Label" /><br />
                                        <br />
                                        <sub>
                                            <asp:Label Text='<%# Bind("SiteDate_D6") %>' runat="server" ID="SiteDate_D6Label" /></sub><br />
                                        Site Comments:
                        <asp:Label Text='<%# Bind("SiteComments_D6") %>' runat="server" ID="SiteComments_D6Label" /><br />
                                    </p>
                                </ItemTemplate>
                                <PagerStyle HorizontalAlign="Center" ForeColor="#8C4510"></PagerStyle>

                                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510"></RowStyle>
                            </asp:FormView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource19" ConnectionString='<%$ ConnectionStrings:ISBEPI_DEV %>' SelectCommand="SELECT [ErikosnDate_D6], [EriksonComments_D6], [ISBEDate_D6], [ISBEComments_D6], [SiteDate_D6], [SiteComments_D6] FROM [PIQRI_Comments] WHERE ([Schd_ID] = @Schd_ID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hfSchdId" PropertyName="Value" Name="Schd_ID" Type="Int32"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            <!----------------------------------------------------------------------------------------->
        </div>

        <!-------------------------------------------------------------------------------------------------------------------------->
        <div style="cursor: pointer;" onclick="javascript:DivClicked('PM_E');">
            <h3 class="finaltoolTitle">
                <img src="../Images/edit_add.png" height="40" style="width: 40px" />E.  Progress Monitoring<br />
                Subscales E1 – E3 </h3>
        </div>
        <div id="PM_E" style="display: none;">
            <div class="Purpose">PURPOSE</div>
            <br />
            <div class="Purpose_topic">
                Scale E is focused on assessing the extent to which the program monitors its service delivery and uses data to demonstrate how specific child and family outcomes are achieved.   It looks at what types of data the program collects, how data quality is monitored, as well as how the data is used by the program for the effective delivery of program services. Reporting child and family outcome data is one way in which programs can demonstrate their accountability to their oversight body/governing entity as well as their funding sources.  
            </div>
            <!----------------------------------------------------------------------------------------->
            <div style="cursor: pointer;" onclick="javascript:DivClicked('PM_E1');">
                <h3 class="scoringTitle">
                    <img src="../Images/edit_add.png" height="40" style="width: 40px" />Subscale:  E1.  Program Monitoring</h3>
            </div>
            <!---------------------------------------------------------------->
            <div id="PM_E1" style="display: none;">
                <table class="d">
                    <tr>
                        <td colspan="4">
                            <h3>Subscale:  E1.  Program Monitoring</h3>
                        </td>
                    </tr>
                    <tr>
                        <td class="d">1<br />
                            Low Quality
                        </td>
                        <td class="d">3<br />
                            Average Quality
                        </td>
                        <td class="d">5<br />
                            Above Average Quality
                        </td>
                        <td class="d">7<br />
                            High Quality
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 1: Data Collection Process</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_E1_1_1" runat="server" Enabled="False" /><asp:Label ID="lbl_PM_E1_1_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_E1_1_2" runat="server" Enabled="False" /><asp:Label ID="lbl_PM_E1_1_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_E1_1_3" runat="server" Enabled="False" /><asp:Label ID="lbl_PM_E1_1_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_E1_1_4" runat="server" Enabled="False" /><asp:Label ID="lbl_PM_E1_1_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 2: Data Management System</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_E1_2_1" runat="server" Enabled="False" /><asp:Label ID="lbl_PM_E1_2_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_E1_2_2" runat="server" Enabled="False" /><asp:Label ID="lbl_PM_E1_2_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_E1_2_3" runat="server" Enabled="False" /><asp:Label ID="lbl_PM_E1_2_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_E1_2_4" runat="server" Enabled="False" /><asp:Label ID="lbl_PM_E1_2_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 3: Utilization of Program Data</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_E1_3_1" runat="server" Enabled="False" /><asp:Label ID="lbl_PM_E1_3_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_E1_3_2" runat="server" Enabled="False" /><asp:Label ID="lbl_PM_E1_3_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_E1_3_3" runat="server" Enabled="False" /><asp:Label ID="lbl_PM_E1_3_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_E1_3_4" runat="server" Enabled="False" /><asp:Label ID="lbl_PM_E1_3_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <div class="piqriscore">
                                <h5 class="piqriscore">Circle Subscale Score</h5>
                                <table class="d">
                                    <tr>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_E1_1" runat="server" Enabled="False" /><br />
                                            1<br />
                                            All indicator rows scored 1 and none scored 3, 5, or 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_E1_2" runat="server" Enabled="False" /><br />
                                            2<br />
                                            At least 1 indicator row scored 1, and others scored 3, 5, or 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_E1_3" runat="server" Enabled="False" /><br />
                                            3<br />
                                            All indicators rows scored 3 and none scored 5 or 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_E1_4" runat="server" Enabled="False" /><br />
                                            4<br />
                                            At least one indicator row scored 3, and others scored 5 or 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_E1_5" runat="server" Enabled="False" /><br />
                                            5<br />
                                            All indicator rows scored 5 and none scored 7 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_E1_6" runat="server" Enabled="False" /><br />
                                            6<br />
                                            At least one indicator row scored 5 and others scored 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_E1_7" runat="server" Enabled="False" /><br />
                                            7<br />
                                            All indicator rows scored 7.
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
                Comments:<div>
                    <asp:TextBox ID="txtComment_E1" runat="server" TextMode="MultiLine" Width="500px" Height="85px"></asp:TextBox>
                    <asp:UpdatePanel ID="UpdatePanel20" runat="server">
                        <ContentTemplate>
                            <asp:LinkButton ID="lnkSubmitE1" runat="server" OnClick="lnkSubmitE1_Click" ValidationGroup="Val1">Submit</asp:LinkButton>
                            <asp:PlaceHolder ID="plcError_E1" runat="server"></asp:PlaceHolder>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator20" runat="server" ErrorMessage='"Please enter maximum 500 charachters."' SetFocusOnError="True" ControlToValidate="txtComment_E1" ValidationExpression="^[\S\s]{1,500}$" ValidationGroup="Val1"></asp:RegularExpressionValidator>
                            <!--FORMVIEW-->
                            <asp:FormView ID="FormView20" runat="server" DataSourceID="SqlDataSource20" EnableModelValidation="True" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" GridLines="Both">

                                <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White"></EditRowStyle>

                                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510"></FooterStyle>

                                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White"></HeaderStyle>
                                <ItemTemplate>
                                    <p>

                                        <sub>
                                            <asp:Label Text='<%# Bind("ErikosnDate_E1") %>' runat="server" ID="ErikosnDate_E1Label" /></sub><br />
                                        Erikson Comments:
                        <asp:Label Text='<%# Bind("EriksonComments_E1") %>' runat="server" ID="EriksonComments_E1Label" /><br />
                                        <br />
                                        <sub>

                                            <asp:Label Text='<%# Bind("ISBEDate_E1") %>' runat="server" ID="ISBEDate_E1Label" /></sub><br />
                                        ISBE Comments:
                        <asp:Label Text='<%# Bind("ISBEComments_E1") %>' runat="server" ID="ISBEComments_E1Label" /><br />
                                        <br />
                                        <sub>
                                            <asp:Label Text='<%# Bind("SiteDate_E1") %>' runat="server" ID="SiteDate_E1Label" /></sub><br />
                                        Site Comments:
                        <asp:Label Text='<%# Bind("SiteComments_E1") %>' runat="server" ID="SiteComments_E1Label" /><br />
                                    </p>
                                </ItemTemplate>
                                <PagerStyle HorizontalAlign="Center" ForeColor="#8C4510"></PagerStyle>

                                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510"></RowStyle>
                            </asp:FormView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource20" ConnectionString='<%$ ConnectionStrings:ISBEPI_DEV %>' SelectCommand="SELECT [ErikosnDate_E1], [EriksonComments_E1], [ISBEDate_E1], [ISBEComments_E1], [SiteDate_E1], [SiteComments_E1] FROM [PIQRI_Comments] WHERE ([Schd_ID] = @Schd_ID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hfSchdId" PropertyName="Value" Name="Schd_ID" Type="Int32"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            <!----------------------------------------------------------------------------------------->
            <div style="cursor: pointer;" onclick="javascript:DivClicked('SM');">
                <h3 class="scoringTitle">
                    <img src="../Images/edit_add.png" height="40" style="width: 40px" />Subscale:  E2.  Staff Monitoring</h3>
            </div>
            <!---------------------------------------------------------------->
            <div id="SM" style="display: none;">
                <table class="d">
                    <tr>
                        <td colspan="4">
                            <h3>Subscale:  E2.  Staff Monitoring</h3>
                        </td>
                    </tr>
                    <tr>
                        <td class="d">1<br />
                            Low Quality
                        </td>
                        <td class="d">3<br />
                            Average Quality
                        </td>
                        <td class="d">5<br />
                            Above Average Quality
                        </td>
                        <td class="d">7<br />
                            High Quality
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 1: Presence of PD Plans</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_E2_1_1" runat="server" Enabled="False" /><asp:Label ID="lbl_SM_1_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_E2_1_2" runat="server" Enabled="False" /><asp:Label ID="lbl_SM_1_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_E2_1_3" runat="server" Enabled="False" /><asp:Label ID="lbl_SM_1_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_E2_1_4" runat="server" Enabled="False" /><asp:Label ID="lbl_SM_1_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 2: Management Involvement in PD</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_E2_2_1" runat="server" Enabled="False" /><asp:Label ID="lbl_SM_2_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_E2_2_2" runat="server" Enabled="False" /><asp:Label ID="lbl_SM_2_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_E2_2_3" runat="server" Enabled="False" /><asp:Label ID="lbl_SM_2_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_E2_2_4" runat="server" Enabled="False" /><asp:Label ID="lbl_SM_2_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->

                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <div class="piqriscore">
                                <h5 class="piqriscore">Circle Subscale Score</h5>
                                <table class="d">
                                    <tr>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_E2_1" runat="server" Enabled="False" /><br />
                                            1<br />
                                            All indicator rows scored 1 and none scored 3, 5, or 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_E2_2" runat="server" Enabled="False" /><br />
                                            2<br />
                                            At least 1 indicator row scored 1, and others scored 3, 5, or 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_E2_3" runat="server" Enabled="False" /><br />
                                            3<br />
                                            All indicators rows scored 3 and none scored 5 or 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_E2_4" runat="server" Enabled="False" /><br />
                                            4<br />
                                            At least one indicator row scored 3, and others scored 5 or 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_E2_5" runat="server" Enabled="False" /><br />
                                            5<br />
                                            All indicator rows scored 5 and none scored 7
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_E2_6" runat="server" Enabled="False" /><br />
                                            6<br />
                                            At least one indicator row scored 5 and others scored 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_E2_7" runat="server" Enabled="False" /><br />
                                            7<br />
                                            All indicator rows scored 7.
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
                Comments:<div>
                    <asp:TextBox ID="txtComment_E2" runat="server" TextMode="MultiLine" Width="500px" Height="85px"></asp:TextBox>
                    <asp:UpdatePanel ID="UpdatePanel21" runat="server">
                        <ContentTemplate>
                            <asp:LinkButton ID="lnkSubmitE2" runat="server" OnClick="lnkSubmitE2_Click" ValidationGroup="Val1">Submit</asp:LinkButton>
                            <asp:PlaceHolder ID="plcError_E2" runat="server"></asp:PlaceHolder>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator21" runat="server" ErrorMessage='"Please enter maximum 500 charachters."' SetFocusOnError="True" ControlToValidate="txtComment_E2" ValidationExpression="^[\S\s]{1,500}$" ValidationGroup="Val1"></asp:RegularExpressionValidator>
                            <!--FORMVIEW-->
                            <asp:FormView ID="FormView21" runat="server" DataSourceID="SqlDataSource21" EnableModelValidation="True" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" GridLines="Both">

                                <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White"></EditRowStyle>

                                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510"></FooterStyle>

                                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White"></HeaderStyle>
                                <ItemTemplate>
                                    <p>

                                        <sub>
                                            <asp:Label Text='<%# Bind("ErikosnDate_E2") %>' runat="server" ID="ErikosnDate_E2Label" /></sub><br />
                                        Erikson Comments:
                        <asp:Label Text='<%# Bind("EriksonComments_E2") %>' runat="server" ID="EriksonComments_E2Label" /><br />
                                        <br />
                                        <sub>

                                            <asp:Label Text='<%# Bind("ISBEDate_E2") %>' runat="server" ID="ISBEDate_E2Label" /></sub><br />
                                        ISBE Comments:
                        <asp:Label Text='<%# Bind("ISBEComments_E2") %>' runat="server" ID="ISBEComments_E2Label" /><br />
                                        <br />
                                        <sub>
                                            <asp:Label Text='<%# Bind("SiteDate_E2") %>' runat="server" ID="SiteDate_E2Label" /></sub><br />
                                        Site Comments:
                        <asp:Label Text='<%# Bind("SiteComments_E2") %>' runat="server" ID="SiteComments_E2Label" /><br />
                                    </p>
                                </ItemTemplate>
                                <PagerStyle HorizontalAlign="Center" ForeColor="#8C4510"></PagerStyle>

                                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510"></RowStyle>
                            </asp:FormView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource21" ConnectionString='<%$ ConnectionStrings:ISBEPI_DEV %>' SelectCommand="SELECT [ErikosnDate_E2], [EriksonComments_E2], [ISBEDate_E2], [ISBEComments_E2], [SiteDate_E2], [SiteComments_E2] FROM [PIQRI_Comments] WHERE ([Schd_ID] = @Schd_ID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hfSchdId" PropertyName="Value" Name="Schd_ID" Type="Int32"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            <!---------------------------------------------------------------->
            <div style="cursor: pointer;" onclick="javascript:DivClicked('OM');">
                <h3 class="scoringTitle">
                    <img src="../Images/edit_add.png" height="40" style="width: 40px" />Subscale:  E3.  Outcome Measurement</h3>
            </div>
            <!---------------------------------------------------------------->
            <div id="OM" style="display: none;">
                <table class="d">
                    <tr>
                        <td colspan="4">
                            <h3>Subscale:  E3.  Outcome Measurement</h3>
                        </td>
                    </tr>
                    <tr>
                        <td class="d">1<br />
                            Low Quality
                        </td>
                        <td class="d">3<br />
                            Average Quality
                        </td>
                        <td class="d">5<br />
                            Above Average Quality
                        </td>
                        <td class="d">7<br />
                            High Quality
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 1: Program Outcomes</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_E3_1_1" runat="server" Enabled="False" /><asp:Label ID="lbl_OM_1_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_E3_1_2" runat="server" Enabled="False" /><asp:Label ID="lbl_OM_1_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_E3_1_3" runat="server" Enabled="False" /><asp:Label ID="lbl_OM_1_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_E3_1_4" runat="server" Enabled="False" /><asp:Label ID="lbl_OM_1_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <h5>Indicator Row 2: Communication of Program Results/Outcomes</h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_E3_2_1" runat="server" Enabled="False" /><asp:Label ID="lbl_OM_2_1" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_E3_2_2" runat="server" Enabled="False" /><asp:Label ID="lbl_OM_2_2" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_E3_2_3" runat="server" Enabled="False" /><asp:Label ID="lbl_OM_2_3" runat="server"></asp:Label>
                        </td>
                        <td class="q">
                            <asp:CheckBox ID="Chkbx_E3_2_4" runat="server" Enabled="False" /><asp:Label ID="lbl_OM_2_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <!-------------------------------------------------------------------->

                    <!-------------------------------------------------------------------->
                    <tr>
                        <td colspan="4">
                            <div class="piqriscore">
                                <h5 class="piqriscore">Circle Subscale Score</h5>
                                <table class="d">
                                    <tr>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_E3_1" runat="server" Enabled="False" /><br />
                                            1<br />
                                            All indicator rows scored 1 and none scored 3, 5, or 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_E3_2" runat="server" Enabled="False" /><br />
                                            2<br />
                                            At least 1 indicator row scored 1, and others scored 3, 5, or 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_E3_3" runat="server" Enabled="False" /><br />
                                            3<br />
                                            All indicators rows scored 3 and none scored 5 or 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_E3_4" runat="server" Enabled="False" /><br />
                                            4<br />
                                            At least one indicator row scored 3, and others scored 5 or 7.
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_E3_5" runat="server" Enabled="False" /><br />
                                            5<br />
                                            All indicator rows scored 5 and none scored 7 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_E3_6" runat="server" Enabled="False" /><br />
                                            6<br />
                                            At least one indicator row scored 5 and others scored 7. 
                                        </td>
                                        <td class="d">
                                            <asp:CheckBox ID="Chkbx_score_E3_7" runat="server" Enabled="False" /><br />
                                            7<br />
                                            All indicator rows scored 7.
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
                Comments:<div>
                    <asp:TextBox ID="txtComment_E3" runat="server" TextMode="MultiLine" Width="500px" Height="85px"></asp:TextBox>
                    <asp:UpdatePanel ID="UpdatePanel22" runat="server">
                        <ContentTemplate>
                            <asp:LinkButton ID="lnkSubmitE3" runat="server" OnClick="lnkSubmitE3_Click" ValidationGroup="Val1">Submit</asp:LinkButton>
                            <asp:PlaceHolder ID="plcError_E3" runat="server"></asp:PlaceHolder>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator22" runat="server" ErrorMessage='"Please enter maximum 500 charachters."' SetFocusOnError="True" ControlToValidate="txtComment_E3" ValidationExpression="^[\S\s]{1,500}$" ValidationGroup="Val1"></asp:RegularExpressionValidator>
                            <!--FORMVIEW-->
                            <asp:FormView ID="FormView22" runat="server" DataSourceID="SqlDataSource22" EnableModelValidation="True" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" GridLines="Both">

                                <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White"></EditRowStyle>

                                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510"></FooterStyle>

                                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White"></HeaderStyle>
                                <ItemTemplate>
                                    <p>

                                        <sub>
                                            <asp:Label Text='<%# Bind("ErikosnDate_E3") %>' runat="server" ID="ErikosnDate_E3Label" /></sub><br />
                                        Erikson Comments:
                        <asp:Label Text='<%# Bind("EriksonComments_E3") %>' runat="server" ID="EriksonComments_E3Label" /><br />
                                        <br />
                                        <sub>

                                            <asp:Label Text='<%# Bind("ISBEDate_E3") %>' runat="server" ID="ISBEDate_E3Label" /></sub><br />
                                        ISBE Comments:
                        <asp:Label Text='<%# Bind("ISBEComments_E3") %>' runat="server" ID="ISBEComments_E3Label" /><br />
                                        <br />
                                        <sub>
                                            <asp:Label Text='<%# Bind("SiteDate_E3") %>' runat="server" ID="SiteDate_E3Label" /></sub><br />
                                        Site Comments:
                        <asp:Label Text='<%# Bind("SiteComments_E3") %>' runat="server" ID="SiteComments_E3Label" /><br />
                                    </p>
                                </ItemTemplate>
                                <PagerStyle HorizontalAlign="Center" ForeColor="#8C4510"></PagerStyle>

                                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510"></RowStyle>
                            </asp:FormView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource22" ConnectionString='<%$ ConnectionStrings:ISBEPI_DEV %>' SelectCommand="SELECT [ErikosnDate_E3], [EriksonComments_E3], [ISBEDate_E3], [ISBEComments_E3], [SiteDate_E3], [SiteComments_E3] FROM [PIQRI_Comments] WHERE ([Schd_ID] = @Schd_ID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hfSchdId" PropertyName="Value" Name="Schd_ID" Type="Int32"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>  
   </asp:View>
        <asp:View ID="View2" runat="server">
            <div>
                <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
            </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>
