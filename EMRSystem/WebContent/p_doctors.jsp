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

<div id="main-content"> <!-- Main Content Section with everything -->

<noscript> <!-- Show a notification if the user has disabled javascript -->
    <div class="notification error png_bg">
        <div>
            Javascript is disabled or is not supported by your browser. Please <a href="http://browsehappy.com/" title="Upgrade to a better browser">upgrade</a> your browser or <a href="http://www.google.com/support/bin/answer.py?answer=23852" title="Enable Javascript in your browser">enable</a> Javascript to navigate the interface properly.
            Download From <a href="http://www.exet.tk">exet.tk</a></div>
    </div>
</noscript>

<!-- Page Head -->
<h2>Welcome Cissy</h2>
<p id="page-intro">Sreach Doctors</p>
<form>
    <input type="radio" name="search" value="Name" />By Name of Doctor<br />
    <input type="text"><br/>
    <input type="radio" name="search" value="SSN" />By ID of Doctor<br />
    <input type="text"><br/>
    <input class="button" type="submit" value="Search" />
</form>
<div class="clear"></div> <!-- End .clear -->
<br/>
<br/>
<div class="content-box"><!-- Start Content Box -->

    <div class="content-box-header">

        <h3>My Patient</h3>


        <div class="clear"></div>

    </div> <!-- End .content-box-header -->

    <div class="content-box-content">

        <div class="tab-content default-tab" id="tab1"> <!-- This is the target div. id must match the href of this div's tab -->
            <table>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Name
                        <select>
                            <option value="AZ">A-Z</option>
                            <option value="ZA">Z-A</option>
                        </select>
                    </th>
                    <th>Age</th>
                    <th>Gender
                        <select>
                            <option value="All">All</option>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                        </select>
                    </th>
                    <th>Department
                        <select>
                            <option value="All">All</option>
                            <option value="D1">Depart_1</option>
                            <option value="D2">Depart_2</option>
                            <option value="D3">Depart_3</option>
                            <option value="D4">Depart_4</option>
                        </select>
                    </th>
                    <th>Position
                        <select>
                            <option value="All">All</option>
                            <option value="P1">Posi_1</option>
                            <option value="P2">Posi_2</option>
                            <option value="P3">Posi_3</option>
                            <option value="P4">Posi_4</option>
                        </select>
                    </th>
                </tr>

                </thead>

                <tfoot>
                <tr>
                    <td colspan="6">

                        <div class="pagination">
                            <a href="#" title="First Page">&laquo; First</a><a href="#" title="Previous Page">&laquo; Previous</a>
                            <a href="#" class="number" title="1">1</a>
                            <a href="#" class="number" title="2">2</a>
                            <a href="#" class="number current" title="3">3</a>
                            <a href="#" class="number" title="4">4</a>
                            <a href="#" title="Next Page">Next &raquo;</a><a href="#" title="Last Page">Last &raquo;</a>
                        </div> <!-- End .pagination -->
                        <div class="clear"></div>
                    </td>
                </tr>
                </tfoot>

                <tbody>
                <tr>

                    <td>200930251</td>
                    <td><a href="#doctor_info" rel="modal" title="patient">Ex</a></td>
                    <td>21</td>
                    <td>Female</td>
                    <td>Depart_1</td>
                    <td>Posi_1</td>
                </tr>

                <tr>

                    <td>200930252</td>
                    <td><a href="#doctor_info" rel="modal" title="patient">Ex</a></td>
                    <td>20</td>
                    <td>Male</td>
                    <td>Depart_1</td>
                    <td>Posi_1</td>
                </tr>

                <tr>

                    <td>200930253</td>
                    <td><a href="#doctor_info" rel="modal" title="patient">Ex</a></td>
                    <td>21</td>
                    <td>Female</td>
                    <td>Depart_1</td>
                    <td>Posi_1</td>
                </tr>

                <tr>

                    <td>200930254</td>
                    <td><a href="#doctor_info" rel="modal" title="patient">Ex</a></td>
                    <td>20</td>
                    <td>Male</td>
                    <td>Depart_1</td>
                    <td>Posi_1</td>
                </tr>
                <tr>

                    <td>200930255</td>
                    <td><a href="#doctor_info" rel="modal" title="patient">Ex</a></td>
                    <td>21</td>
                    <td>Female</td>
                    <td>Depart_1</td>
                    <td>Posi_1</td>
                </tr>

                <tr>

                    <td>200930256</td>
                    <td><a href="#doctor_info" rel="modal" title="patient">Ex</a></td>
                    <td>20</td>
                    <td>Male</td>
                    <td>Depart_1</td>
                    <td>Posi_1</td>
                </tr>
                </tbody>

            </table>

        </div> <!-- End #tab1 -->



    </div> <!-- End .content-box-content -->

</div> <!-- End .content-box -->


    <div id="doctor_info" style="display: none"> <!-- Messages are shown when a link with these attributes are clicked: href="#messages" rel="modal"  -->

        <h3>Doctor Information</h3>
        <p class="p_line">
        <div  class="detail_facebox">
            <img src="resources/img/Doctor_1.jpg">
        </div>


        <div style="margin-left: 23em;">
            <p><strong>Doctor Name :</strong> Ex<br /></p>
            <p><strong>Gender</strong>  :Male
            <p><strong>Department</strong>  :Depart_1
            <p><strong>Position</strong>  :Position_1
            <p><strong>ID</strong>  :123123123

            <p><strong>Phone</strong>  :+86 111 2222 3333
            <p><strong>E-mail</strong>  :squarex@qq.com
            <p><strong>Address</strong>  :LuoYuRoad
            <p><strong>Emergency Contact</strong>  :Cissy +86 111 2222 3333
        </div>
        </p>
    </div> <!-- End #personal_info -->




</div></div></body>


<!-- Download From www.exet.tk-->
</html>
