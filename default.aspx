<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="HVP._default1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div id="main">  
			<div class="hero-wrap-home">
				<div class="hero-content-home">
					<h1>Prevention Initiative Birth to 3<br>Program Monitoring</h1>
					<div class="hero-intro bot-mar-35">
						Welcome to the PI Birth to 3 Program Monitoring website, a place where you can manage the monitoring process. Program Directors can use the general login to access your program’s monitoring materials. Home visitors, please use the home  visitor login to choose your program and complete an online survey.
					</div>
					<div class="bot-mar-30">
						<a href="/login.aspx" class="btn btn-lg btn-red">Login</a>
					</div>
					<div>
						<a href="/Survey/PIQRIHomeVisitorOnlineSurvey.aspx" style="line-height: 16px; padding-top: 16px;" class="btn btn-lg btn-gold">Home Visitor Survey<br><span class="uppercase text-xxs sans-serif-light-oblique">No Login Required</span></a>
					</div>
				</div>
			</div><!-- .hero-wrap-home -->
			
			<div class="bg-textured-1 sponsor-box">
				<div class="container">
					<div class="row">
						<div class="col-xs-6">
							<div class="sponsor-box-text text-block-1">
								Site developed by
							</div>
							<div class="logo-1">
								<img src="Images/logo-erikson-trans.png">
							</div>
						</div>
						<div class="col-xs-6">
							<div class="sponsor-box-text text-block-2">
								Site funded by
							</div>
							<div class="logo-2">
								<img src="Images/logo-isbepi-trans.png">
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="footer">
			    <div class="footer-contact-text">
					<a href="tel:+12175244835">217.524.4835</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a href="mailto:picqip@isbe.net">picqip@isbe.net</a>
				</div>		
			</div> <!-- .footer -->
		</div>
     </asp:Content>
