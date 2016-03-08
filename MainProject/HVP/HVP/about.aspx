<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="HVP.about" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="header-strip">
        <div class="container">
            <h1 class="bot-mar-10">About</h1>
        </div>
    </div>
    
    <div class="container content page-interior">

        <div class="row top-mar-10">

            <div class="col-md-4 top-mar-20"> 
                <h2>The Illinois State Board of Education</h2>
                <p>The Illinois State Board of Education (ISBE) has partnered with Erikson Institute's Herr Research Center for Children and Social Policy and The Ounce of Prevention Fund to create a strengths-based home visiting monitoring program. PI Birth to 3 Program Monitoring Project is intended to support and enhance continuous quality improvement and ensure compliance to current and applicable home visiting standards.</p>
                <p><a href="http://www.isbe.net/" target="_blank">http://www.isbe.net/</a></p>
            </div>

            <div class="col-md-4 top-mar-20"> 
                <h2>Erikson Institute</h2>
                <p>Located in the city of Chicago, Erikson Institute is an independent institution of higher education that prepares child development and family service professionals. The Herr Research Center for Children & Social Policy is a unit of the Erikson Institute and strives to bring together perspectives from policy and research to promote the well-being of young children and their families.</p>
                <p><a href="http://www.erikson.edu/" target="_blank">http://www.erikson.edu/</a></p>
            </div>

            <div class="col-md-4 top-mar-20"> 
                <h2>The Ounce of Prevention</h2>
                <p>Founded in 1982, The Ounce is dedicated to ensuring quality early childhood experiences for all children from birth to five years. The Ounce currently serves over 4,000 children and families through early childhood and home visiting programs in the Chicago Area and throughout Illinois.</p>
                <p><a href="http://www.theounce.org/" target="_blank">http://www.theounce.org/</a></p>
            </div>

            <div class="col-md-12 top-mar-35">
                For more information, please visit the <a href="/contact.aspx">Contact</a> page on our site.
            </div>

        </div> <!-- .row --> 

        <div class="row top-mar-15">

            <div class="col-md-12 top-mar-45 text-center">
                <div class="inset-box-alt">
                    <div class="bot-mar-20">
                        <a href="/login.aspx" class="btn btn-md btn-red">Login</a>
                    </div>
                    <div>
                        <a href="/Survey/PIQRIHomeVisitorOnlineSurvey.aspx" style="line-height: 16px; padding-top: 12px;" class="btn btn-md btn-gold text-center">Home Visitor Survey<br><span class="uppercase text-xxs sans-serif-light-oblique">No Login Required</span></a>
                    </div>
                </div>
            </div>

        </div><!-- .row -->   

    </div>   
</asp:Content>
