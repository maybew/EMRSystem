<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
 <head>
		
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		
		<title>EMRS</title>

		<link rel="stylesheet" href="resources/css/reset.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="resources/css/style.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="resources/css/invalid.css" type="text/css" media="screen" />	

		<!-- jQuery -->
		<script type="text/javascript" src="resources/scripts/jquery-1.3.2.min.js"></script>
		<script type="text/javascript" src="resources/scripts/simpla.jquery.configuration.js"></script>
		<script type="text/javascript" src="resources/scripts/facebox.js"></script>
		<script type="text/javascript" src="resources/scripts/jquery.wysiwyg.js"></script>
		<script type="text/javascript" src="resources/scripts/jquery.datePicker.js"></script>
		<script type="text/javascript" src="resources/scripts/jquery.date.js"></script>
		
	</head>
  
	<body><div id="body-wrapper"> <!-- Wrapper for the radial gradient background -->
		<%@ include file="inc/d_navigation.jsp"%>
		
		<div id="main-content" > <!-- Main Content Section with everything -->
			
			<noscript> <!-- Show a notification if the user has disabled javascript -->
				<div class="notification error png_bg">
					<div>
						Javascript is disabled or is not supported by your browser. Please <a href="http://browsehappy.com/" title="Upgrade to a better browser">upgrade</a> your browser or <a href="http://www.google.com/support/bin/answer.py?answer=23852" title="Enable Javascript in your browser">enable</a> Javascript to navigate the interface properly.
					Download From <a href="http://www.exet.tk">exet.tk</a></div>
				</div>
			</noscript>
			
			<!-- Page Head -->
			<h2>Welcome Cooper</h2>
            <div style="display: block">
			<p id="page-intro">Personal Information | <a href="d_edit.jsp">edit</a> </p>
			<div class="info">
                <div id="photo" >
                    <img src="resources/img/Doctor_1.jpg">
                </div>
                <div id="detail">
                    <p class="float_right">First Name  :
                    <p class="float_right">Last Name  :
                    <p class="float_right">Gender  :
                    <p class="float_right">Birth Date  :
                    <p class="float_right">Department  :
                    <p class="float_right">Position  :
                    <p class="float_right">Phone  :
                    <p class="float_right">E-mail  :
                    <p class="float_right">Personal Description  :
                </div>
                <div id="p_info">
                    <p class="float_left">  <%=doctor.getFname() %>
                    <p class="float_left">  <%=doctor.getLname() %>
                    <p class="float_left">  <%=doctor.getGender() == 0?"Male":"Female" %>
                    <p class="float_left">  <%=doctor.getBirthdate().toString() %>
                    <p class="float_left">  <%=doctor.getDepartment() %>
                    <p class="float_left">  <%=doctor.getPosition() %>
                    <p class="float_left">  <%=doctor.getPhone() %>
                    <p class="float_left">  <%=doctor.getEmail() %>
                    <p class="float_left">  Knock Knock Knock  Penny
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
