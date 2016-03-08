<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="HVP.contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="header-strip">
        <div class="container">
            <h1 class="bot-mar-10">Contact Us</h1>
        </div>
    </div>
    
    <div class="container content page-interior">

        <div class="row top-mar-10">

            <div class="col-md-4 top-mar-20"> 
                <h2>General Questions</h2>
                <div class="clear-both"></div>
                <strong>For General Questions, contact the ISBE Early Childhood Team</strong><br>
                Penny Smith, Principal Consultant<br>
                (217) 524-4835<br>
                <a href="mailto:pesmith@isbe.net">pesmith@isbe.net</a><br>
            </div>

            <div class="col-md-4 top-mar-20"> 
                <h2>Monitoring Questions</h2>
                <div class="clear-both"></div>
                <strong>For Monitoring Questions, contact Erikson Institute</strong><br>
                Saima Gowani<br>
                312-893-7204<br>
                <a href="mailto:isbe@erikson.edu">isbe@erikson.edu</a><br>
            </div>

            <div class="col-md-4 top-mar-20"> 
                <h2>Training & Technical Assistance</h2>
                <div class="clear-both"></div>
                <strong>For Training and Technical Assistance, contact The Ounce</strong><br>
                Kelly Woodlock, Director &ndash; Ounce Institute<br>
                (312)-453-1988<br>
                <a href="mailto:kwoodlock@ounceofprevention.org">kwoodlock@ounceofprevention.org</a><br>
            </div>

        </div> <!-- .row --> 

        <div class="row top-mar-10">

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
