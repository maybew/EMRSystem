<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
 <head>
		
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		
		<title>EMRS</title>
		
		<link rel="stylesheet" href="resources/css/reset.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="resources/css/style.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="resources/css/invalid.css" type="text/css" media="screen" />	
	
		<script type="text/javascript" src="resources/scripts/jquery-1.3.2.min.js"></script>
		<script type="text/javascript" src="resources/scripts/simpla.jquery.configuration.js"></script>
		<script type="text/javascript" src="resources/scripts/facebox.js"></script>
		<script type="text/javascript" src="resources/scripts/jquery.wysiwyg.js"></script>
		<script type="text/javascript" src="resources/scripts/jquery.datePicker.js"></script>
		<script type="text/javascript" src="resources/scripts/jquery.date.js"></script>
		
	</head>
  
	<body><div id="body-wrapper">
	<%@ include file="inc/p_navigation.jsp"%>
		
		<div id="main-content" > <!-- Main Content Section with everything -->
			
			<noscript> <!-- Show a notification if the user has disabled javascript -->
				<div class="notification error png_bg">
					<div>
						Javascript is disabled or is not supported by your browser. Please <a href="http://browsehappy.com/" title="Upgrade to a better browser">upgrade</a> your browser or <a href="http://www.google.com/support/bin/answer.py?answer=23852" title="Enable Javascript in your browser">enable</a> Javascript to navigate the interface properly.
					Download From <a href="http://www.exet.tk">exet.tk</a></div>
				</div>
			</noscript>
			
			<!-- Page Head -->
			<h2>Welcome <%=patient.getFname() %></h2>
            <div style="display: block">
			<p id="page-intro">Health Insecure Information</p>
			<div class="info">
                <div id="photo" >
                    <img  src="resources/img/Patient_1.jpg">
                </div>
                <div id="detail">
                    <p class="float_right">Insurance Company Name  :

                    <p class="float_right">Insurance Company Address  :
                    <p class="float_right">Phone Number  :
                    <p class="float_right">E-mail  :
                    <p class="float_right">Tax  :
                    <p class="float_right">Insurance Policy Number  :
                    <p class="float_right">Type of Insurance Policy  :
                    <p class="float_right">Expiration Date  :

                </div>
                <div id="p_info">
                    <p class="float_left">  <%=patient.getIcname() %>

                    <p class="float_left">  <%=patient.getIcaddress() %>
                    <p class="float_left">  <%=patient.getIcphone() %>
                    <p class="float_left">  <%=patient.getIcemail() %>
                    <p class="float_left">  <%=patient.getIctax() %>
                    <p class="float_left">  <%=patient.getIcpolicynum() %>
                    <p class="float_left">  <%=patient.getIcpolicytype() %>
                    <p class="float_left">  <%=patient.getIcexpiredate() %>

                </div>
            </div>
            </div>

			<div class="clear"></div> <!-- End .clear -->

			<div id="footer">
				<small> <!-- Remove this notice or replace it with whatever you want -->
						&#169; Copyright 2012 EMRS | Powered by <a href="#">EMRS</a> | <a href="#">Top</a>
				</small>
			</div><!-- End #footer -->
			
		</div> <!-- End #main-content -->
		
	</div></body>
  

<!-- Download From www.exet.tk-->
</html>
