<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
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
  
	<body>
	<div id="body-wrapper">
		<%@ include file="inc/a_navigation.jsp"%>
		
		<div id="main-content"> <!-- Main Content Section with everything -->
			
			<noscript> <!-- Show a notification if the user has disabled javascript -->
				<div class="notification error png_bg">
					<div>
						Javascript is disabled or is not supported by your browser. Please <a href="http://browsehappy.com/" title="Upgrade to a better browser">upgrade</a> your browser or <a href="http://www.google.com/support/bin/answer.py?answer=23852" title="Enable Javascript in your browser">enable</a> Javascript to navigate the interface properly.
					Download From <a href="http://www.exet.tk">exet.tk</a></div>
				</div>
			</noscript>
			
			<!-- Page Head -->
			<h2>Welcome Cooper</h2>
			<p id="page-intro">Recent Modified Records</p>

        <div class="content-box"><!-- Start Content Box -->

            <div class="content-box-header">

                <h3>Medical Records</h3>


                <div class="clear"></div>

            </div> <!-- End .content-box-header -->

            <div class="content-box-content">

                <div class="tab-content default-tab" id="tab1"> <!-- This is the target div. id must match the href of this div's tab -->
                    <table>
                        <thead>
                        <tr>
                            <th>Record ID</th>
                            <th>Time
                                <select class="small-input-1">
                                    <option value="near">Near</option>
                                    <option value="far">Far</option>
                                </select>
                            </th>
                            <th>Name
                                <select class="small-input-1">
                                    <option value="AZ">A-Z</option>
                                    <option value="ZA">Z-A</option>
                                </select>
                            </th>
                            <th>Age</th>
                            <th>Gender
                                <select class="small-input-2">
                                    <option value="All">All</option>
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                </select>
                            </th>
                            <th>Doctor</th>
                            <th>Department
                                <select>
                                    <option value="All">All</option>
                                    <option value="D1">Depart_1</option>
                                    <option value="D2">Depart_2</option>
                                    <option value="D3">Depart_3</option>
                                    <option value="D4">Depart_4</option>
                                </select>
                            </th>
                            <th>Record</th>
                        </tr>

                        </thead>

                        <tfoot>
                        <tr>
                            <td colspan="8">

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
                            <td>200930257</td>
                            <td>2012.09.25</td>
                            <td><a href="#personal_info" rel="modal" title="patient">Cissy</a></td>
                            <td>21</td>
                            <td>Female</td>
                            <td>Ex</td>
                            <td>Depart_1</td>
                            <td>have a fever&nbsp;&nbsp;<a href="#records" rel="modal" title="more">More...</a></td>
                        </tr>

                        <tr>
                            <td>200930258</td>
                            <td>2012.09.25</td>
                            <td><a href="#personal_info" rel="modal" title="patient">Cissy</a></td>
                            <td>20</td>
                            <td>Male</td>
                            <td>Ex</td>
                            <td>Depart_1</td>
                            <td>catch cold&nbsp;&nbsp;<a href="#records" rel="modal" title="more">More...</a></td>
                        </tr>

                        <tr>
                            <td>200930259</td>
                            <td>2012.09.25</td>
                            <td><a href="#personal_info" rel="modal" title="patient">Cissy</a></td>
                            <td>21</td>
                            <td>Female</td>
                            <td>Ex</td>
                            <td>Depart_1</td>
                            <td>fever&nbsp;&nbsp;<a href="#records" rel="modal" title="more">More...</a></td>
                        </tr>

                        <tr>
                            <td>200930260</td>
                            <td>2012.09.25</td>
                            <td><a href="#personal_info" rel="modal" title="patient">Cissy</a></td>
                            <td>20</td>
                            <td>Male</td>
                            <td>Ex</td>
                            <td>Depart_1</td>
                            <td>cold&nbsp;&nbsp;<a href="#records" rel="modal" title="more">More...</a></td>
                        </tr>
                        <tr>
                            <td>200930261</td>
                            <td>2012.09.25</td>
                            <td><a href="#personal_info" rel="modal" title="patient">Cissy</a></td>
                            <td>21</td>
                            <td>Female</td>
                            <td>Ex</td>
                            <td>Depart_1</td>
                            <td>fever&nbsp;&nbsp;<a href="#records" rel="modal" title="more">More...</a></td>
                        </tr>

                        <tr>
                            <td>200930262</td>
                            <td>2012.09.25</td>
                            <td><a href="#personal_info" rel="modal" title="patient">Cissy</a></td>
                            <td>20</td>
                            <td>Male</td>
                            <td>Ex</td>
                            <td>Depart_1</td>
                            <td>cold&nbsp;&nbsp;<a href="#records" rel="modal" title="more">More...</a></td>
                        </tr>
                        </tbody>

                    </table>

                </div> <!-- End #tab1 -->



            </div> <!-- End .content-box-content -->

        </div> <!-- End .content-box -->
        <div class="clear"></div> <!-- End .clear -->

        <div id="records" style="display: none"> <!-- Messages are shown when a link with these attributes are clicked: href="#messages" rel="modal"  -->

            <h3>Single Medical Record | <a href="#"> Print</a></h3>

            <p>
                <strong>Record ID :</strong>&nbsp;200930257<br />
            </p>

            <p class="p_line">
                <strong>Patient Name :</strong>&nbsp;Cissy<br />
            </p>

            <p class="p_line">
                <strong>Created Time :</strong> 2012.02.12<br />
                <strong>Last Modified :</strong> 2012.04.15<br />
            </p>

            <p class="p_line">
                <strong>Doctor :</strong>&nbsp;Ex<br />
                <strong>Department :</strong>&nbsp;Depart_1<br />
            </p>

            <p class="p_line">
                <strong>Visitation detail &nbsp;</strong><br />
                <strong style="color: #929796;">[2012.02.12]</strong>&nbsp;Neurologists and neurosurgeons are highly
                rated for their patient care and research achievements
                patient care and research achievements.<br />
                <strong style="color: #929796;">[2012.03.14]</strong>&nbsp;Neurologists and neurosurgeons are highly
                rated for their patient care and research achievements
                patient care and research achievements.<br />
            <p class="p_line" >
                <strong>Health care information</strong><br />
                <strong style="color: #929796;">[2012.03.14]</strong>&nbsp;Neurologists and neurosurgeons are highly
                rated for their patient care and research achievements.<br />
            <p class="p_line">
                <strong>Medication information</strong><br />
                <strong style="color: #929796;">[2012.03.14]</strong>&nbsp;Neurologists and neurosurgeons are highly
                rated for their patient care and research achievements.<br />
            <p class="p_line">
                <strong>Addition information</strong><br />
                <strong style="color: #929796;">[2012.04.15]</strong>&nbsp;Neurologists and neurosurgeons are highly
                rated for their patient care and research achievements.
            </p>

            <form action="#" method="post">
                <br>
                <h4  class="p_line"></h4>

                <h4>Add Record Detail</h4>

                <fieldset>
                    <textarea class="textarea" name="textfield" cols="79" rows="5"></textarea>
                </fieldset>

                <fieldset>
                    <select name="dropdown" class="small-input" />
                    <option value="option1">Visitation detail</option>
                    <option value="option2">Health care information</option>
                    <option value="option2">Medication information</option>
                    <option value="option2">Addition information</option>
                </fieldset>

                <fieldset>
                    <input class="button" type="submit" value="Add" />
                </fieldset>


            </form>

        </div> <!-- End #records -->


        <div id="personal_info" style="display: none"> <!-- Messages are shown when a link with these attributes are clicked: href="#messages" rel="modal"  -->

            <h3>Patient Information</h3>
            <p class="p_line">
            <div  id="detail_facebox">
                <img src="resources/img/Patient_1.jpg">
            </div>


            <div style="margin-left: 23em;">
                <p><strong>Patient Name :</strong> Cissy<br /></p>
                <p><strong>Gender</strong>  :Female
                <p><strong>Age</strong>  :21
                <p><strong>Birth</strong>  :1990.09.25
                <p><strong>SSN</strong>  :123123123

                <p><strong>Phone</strong>  :+86 111 2222 3333
                <p><strong>E-mail</strong>  :cissy_yan@qq.com
                <p><strong>Address</strong>  :409A Room
                <p><strong>Emergency Contact</strong>  :Ex 15802749321
            </div>
            </p>
        </div> <!-- End #personal_info -->
            <div id="footer">
                <small> <!-- Remove this notice or replace it with whatever you want -->
                    &#169; Copyright 2012 EMRS | Powered by <a href="#">EMRS</a> | <a href="#">Top</a>
                </small>
            </div><!-- End #footer -->
			
		</div> <!-- End #main-content -->
		
	</div></body>
  

<!-- Download From www.exet.tk-->
</html>
