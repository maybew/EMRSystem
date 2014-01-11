<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.emrs.po.*"%>
<%
Account account = (Account)session.getAttribute("account");
Doctor doctor = null;
if(account != null && account.getType().equals("doctor"))
	doctor = (Doctor)account;
else
	response.sendRedirect("login.jsp");
%>
<%
String url = request.getRequestURI();
String block = null;
System.out.println(url);
if("/EMRSystem/d_detail.jsp".equals(url) || "/EMRSystem/d_edit.jsp".equals(url))
	block = "0_1";
else if("/EMRSystem/d_changepassword.jsp".equals(url))
	block = "0_2";
else if("/EMRSystem/d_search.jsp".equals(url))
	block = "1_1";
else if("/EMRSystem/d_patient.jsp".equals(url))
	block = "1_2";
else if("/EMRSystem/d_recent.jsp".equals(url))
	block = "1_3";
else if("/EMRSystem/d_newrecord.jsp".equals(url))
	block = "2_1";
%>

<div id="sidebar">
	<div id="sidebar-wrapper">

		<h1 id="sidebar-title">
			<a href="#">EMRS</a>
		</h1>

		<a href="#"><img id="logo" src="resources/images/logo.png"
			alt="Simpla Admin logo" /></a>

		<div style="color: #ffffff;" id="profile-links">
			Hello, Doctor <%if(doctor != null) {%><%=doctor.getLname() %><%} %><br /> <br /> <a href="login.jsp"
				title="Sign Out" style="color: #b2b2b2;">Sign Out</a>
		</div>

		<ul id="main-nav">

			<li><a id="account" class="nav-top-item no-submenu <%if(block.startsWith("0")) {%>current<%} %>" href="#">
					Personal Info.
			</a>
				<ul>
					<li><a <%if(block.equals("0_1")) {%>class="current"<%} %> href="./d_detail.jsp">Detail Info.</a></li>
					<li><a <%if(block.equals("0_2")) {%>class="current"<%} %> href="./d_changepassword.jsp">Change Password</a></li>
					<!-- Add class "current" to sub menu items also -->

				</ul></li>

			<li><a id="system" class="nav-top-item no-submenu <%if(block.startsWith("1")) {%>current<%} %>" href="#">
					View Records
			</a>
				<ul>
					<li><a <%if(block.equals("1_1")) {%>class="current"<%} %> href="./d_search.jsp">Search Records</a></li>
					<li><a <%if(block.equals("1_2")) {%>class="current"<%} %> href="./d_patient.jsp">Patient</a></li>
					<li><a <%if(block.equals("1_3")) {%>class="current"<%} %> href="./d_recent.jsp">Recent Records</a></li>

				</ul></li>

			<li><a id="statistic" class="nav-top-item no-submenu <%if(block.startsWith("2")) {%>current<%} %>" href="#"> <!-- Add the class "current" to current menu item -->
					New Record
			</a>
				<ul>
					<li><a <%if(block.equals("2_1")) {%>class="current"<%} %> href="./d_newrecord.jsp">Create a Record</a></li>

				</ul></li>
		</ul>
	</div>
</div>