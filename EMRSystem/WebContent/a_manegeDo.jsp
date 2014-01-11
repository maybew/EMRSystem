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
			<h2>Administrator Account</h2>
			<p id="page-intro">Doctor Management  | <a href="#addD" rel="modal">Add Doctor</a></p>

            <form>
                <input type="radio" name="search" value="Name" />By Name of Doctor<br />
                <input type="text"><br/>
                <input type="radio" name="search" value="ID" />By ID of Doctor<br />
                <input type="text"><br/>
                <input class="button" type="submit" value="Search" />
            </form>
			<div class="clear"></div> <!-- End .clear -->
        <br/>
        <br/>
        <div class="content-box"><!-- Start Content Box -->

        <div class="content-box-header">

            <h3>Doctor Management</h3>

        </div> <!-- End .content-box-header -->

        <div class="content-box-content">

            <div class="clear"></div>

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
                    <th>Action</th>
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
                    <td><a href="#personal_info" rel="modal" title="patient">Cissy</a></td>
                    <td>Depart_1</td>
                    <td>Posi_1</td>

                    <td>
                        <a href="#edit" rel="modal" title="more">Edit</a>
                        &nbsp;&nbsp;|&nbsp;&nbsp;
                        <a class="a_delete" href="#delete" rel="modal" title="more">Delete</a>
                    </td>
                </tr>

                <tr>

                    <td>200930252</td>
                    <td><a href="#personal_info" rel="modal" title="patient">AV</a></td>
                    <td>Depart_1</td>
                    <td>Posi_1</td>

                    <td>
                        <a href="#edit" rel="modal" title="more">Edit</a>
                        &nbsp;&nbsp;|&nbsp;&nbsp;
                        <a class="a_delete" href="#delete" rel="modal" title="more">Delete</a>
                    </td>
                </tr>

                <tr>

                    <td>200930253</td>
                    <td><a href="#personal_info" rel="modal" title="patient">Jack</a></td>
                    <td>Depart_1</td>
                    <td>Posi_1</td>

                    <td>
                        <a href="#edit" rel="modal" title="more">Edit</a>
                        &nbsp;&nbsp;|&nbsp;&nbsp;
                        <a class="a_delete" href="#delete" rel="modal" title="more">Delete</a>
                    </td>
                </tr>

                <tr>

                    <td>200930254</td>
                    <td><a href="#personal_info" rel="modal" title="patient">Walker</a></td>
                    <td>Depart_1</td>
                    <td>Posi_1</td>

                    <td>
                        <a href="#edit" rel="modal" title="more">Edit</a>
                        &nbsp;&nbsp;|&nbsp;&nbsp;
                        <a class="a_delete" href="#delete" rel="modal" title="more">Delete</a>
                    </td>
                </tr>
                <tr>

                    <td>200930255</td>
                    <td><a href="#personal_info" rel="modal" title="patient">Eddy</a></td>
                    <td>Depart_1</td>
                    <td>Posi_1</td>

                    <td>
                        <a href="#edit" rel="modal" title="more">Edit</a>
                        &nbsp;&nbsp;|&nbsp;&nbsp;
                        <a class="a_delete" href="#delete" rel="modal" title="more">Delete</a>
                    </td>
                </tr>

                <tr>

                    <td>200930256</td>
                    <td><a href="#personal_info" rel="modal" title="patient">Erik</a></td>
                    <td>Depart_1</td>
                    <td>Posi_1</td>

                    <td>
                        <a href="#edit" rel="modal" title="more">Edit</a>
                        &nbsp;&nbsp;|&nbsp;&nbsp;
                        <a class="a_delete" href="#delete" rel="modal" title="more">Delete</a>
                    </td>
                </tr>
                </tbody>

            </table>

        </div> <!-- End #tab1 -->



        </div> <!-- End .content-box-content -->

        </div> <!-- End .content-box -->
        <div id="records" style="display: none"> <!-- Messages are shown when a link with these attributes are clicked: href="#messages" rel="modal"  -->

                <h3>All Medical Records  | <a href="#"> Print</a></h3>

                <p>
                    <strong>Record ID :</strong> 200930258<br />
                </p>

                <p class="p_line">
                    <strong>Patient Name :</strong> Cissy<br />

                </p>

                <p class="p_line">

                    <strong>Last Modified :</strong> 2012.04.15<br />
                </p>

                <p class="p_line">
                    <strong>Doctor :</strong> Ex
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
                <br>
                <div class="pagination">

                    <a href="#" class="number current" title="1">1</a>
                    <a href="#" class="number" title="2">2</a>
                    <a href="#" class="number" title="3">3</a>
                    <a href="#" class="number" title="4">4</a>

                </div> <!-- End .pagination -->

                <form action="#" method="post">
                    <br>
                    <h4  class="p_line"></h4>

                    <h4>Add Record Detail</h4>

                    <fieldset>
                        <textarea class="textarea" name="textfield" cols="79" rows="5"></textarea>
                    </fieldset>
                    <fieldset>
                        <select name="dropdown" class="small-input">
                        <option value="option1">Visitation detail</option>
                        <option value="option2">Health care information</option>
                        <option value="option2">Medication information</option>
                        <option value="option2">Addition information</option>
                        </select>
                    </fieldset>
                    <fieldset>

                        <input class="button" type="submit" value="Add" />

                    </fieldset>


                </form>

            </div> <!-- End #records -->
        <div id="edit" style="display: none"> <!-- Messages are shown when a link with these attributes are clicked: href="#messages" rel="modal"  -->

            <h3>Edit &nbsp;|&nbsp;<a href="#">Save</a></h3>
            <p class="p_line">
            <div  class="detail_facebox">
                <a href="#"><img src="resources/img/Patient_1.jpg"></a>
            </div>
            <div class="detail">
                <p class="float_right"><strong>ID  </strong>:
                <p class="float_right"><strong>Name  </strong>:

                <p class="float_right"><strong>Gender  </strong>:
                <p class="float_right"><strong>Age  </strong>:
                <p class="float_right"><strong>Department  </strong>:
                <p class="float_right"><strong>Position  </strong>:
                <p class="float_right"><strong>Phone  </strong>:
                <p class="float_right"><strong>E-mail  </strong>:

            </div>
            <div >
                <p class="float_left"><input class="edit" value="200932058">
                <p class="float_left"><input class="edit" value="Cissy">
                <p class="float_left">
                    <select class="edit">
                        <option value ="mail">Male</option>
                        <option value ="female" selected>Female</option>
                    </select>
                <p class="float_left"><input class="edit" value="21">
                <p class="float_left">
                    <select class="edit">
                        <option value ="depart_1">Depart_1</option>
                        <option value ="depart_2" selected>Depart_2</option>
                        <option value ="depart_3">Depart_3</option>
                        <option value ="depart_4">Depart_4</option>
                    </select>
                <p class="float_left">
                    <select class="edit">
                        <option value ="position_1">Position_1</option>
                        <option value ="position_2">Position_2</option>
                        <option value ="position_3" selected>Position_3</option>
                        <option value ="position_4">Position_4</option>
                    </select>
                <p class="float_left"><input class="edit" value="+86 111 2222 3333">

                <p class="float_left"><input class="edit" value="cissy_yan@qq.com">

            </div>
            <br>

            </p>
        </div> <!-- End #personal_info -->
        <div id="addD" style="display: none"> <!-- Messages are shown when a link with these attributes are clicked: href="#messages" rel="modal"  -->

            <h3>Add New Doctor&nbsp;|&nbsp;<a href="#">Save</a></h3>
            <p class="p_line">
            <div  id="detail_facebox">
                <a href="#"><img src="resources/img/Add.jpg"></a>
            </div>
            <div id="detail">
                <p class="float_right"><strong>ID  </strong>:
                <p class="float_right"><strong>Name  </strong>:

                <p class="float_right"><strong>Gender  </strong>:
                <p class="float_right"><strong>Age  </strong>:
                <p class="float_right"><strong>Department  </strong>:
                <p class="float_right"><strong>Position  </strong>:
                <p class="float_right"><strong>Phone  </strong>:
                <p class="float_right"><strong>E-mail  </strong>:

            </div>
            <div >
                <p class="float_left"><input class="edit" value="">
                <p class="float_left"><input class="edit" value="">
                <p class="float_left">
                    <select class="edit">
                        <option value ="mail">Male</option>
                        <option value ="female">Female</option>
                    </select>
                <p class="float_left"><input class="edit" value="">
                <p class="float_left">
                    <select class="edit">
                        <option value ="depart_1">Depart_1</option>
                        <option value ="depart_2">Depart_2</option>
                        <option value ="depart_3">Depart_3</option>
                        <option value ="depart_4">Depart_4</option>
                    </select>
                <p class="float_left">
                    <select class="edit">
                        <option value ="position_1">Position_1</option>
                        <option value ="position_2">Position_2</option>
                        <option value ="position_3">Position_3</option>
                        <option value ="position_4">Position_4</option>
                    </select>
                <p class="float_left"><input class="edit" value="">

                <p class="float_left"><input class="edit" value="">

            </div>
            <br>

            </p>
        </div> <!-- End #personal_info -->
        <div id="delete" style="display: none"> <!-- Messages are shown when a link with these attributes are clicked: href="#messages" rel="modal"  -->

            <h3>Are you sure? &nbsp;|&nbsp;<a href="#" class="a_delete">Delete</a></h3>
            <p class="p_line">
            <div  class="detail_facebox">
                <a href="#"><img src="resources/img/Patient_1.jpg"></a>
            </div>
            <div class="detail">
                <p class="float_right"><strong>ID  </strong>:
                <p class="float_right"><strong>Name  </strong>:

                <p class="float_right"><strong>Gender  </strong>:
                <p class="float_right"><strong>Age  </strong>:
                <p class="float_right"><strong>Department  </strong>:
                <p class="float_right"><strong>Position  </strong>:
                <p class="float_right"><strong>Phone  </strong>:
                <p class="float_right"><strong>E-mail  </strong>:

            </div>
            <div >
                <p class="float_left">200932058
                <p class="float_left">Cissy
                <p class="float_left">Female

                <p class="float_left">21
                <p class="float_left">Depart_2
                <p class="float_left">Position_3
                <p class="float_left">+86 111 2222 3333

                <p class="float_left">cissy_yan@qq.com

            </div>
            <br>

            </p>
        </div> <!-- End #personal_info -->
        <div id="personal_info" style="display: none"> <!-- Messages are shown when a link with these attributes are clicked: href="#messages" rel="modal"  -->

            <h3>Doctor Information</h3>
            <p class="p_line">
            <div  class="detail_facebox">
                <img src="resources/img/Patient_1.jpg">
            </div>


            <div class="detail">
                <p class="float_right"><strong>ID  </strong>:
                <p class="float_right"><strong>Name  </strong>:

                <p class="float_right"><strong>Gender  </strong>:
                <p class="float_right"><strong>Age  </strong>:
                <p class="float_right"><strong>Department  </strong>:
                <p class="float_right"><strong>Position  </strong>:
                <p class="float_right"><strong>Phone  </strong>:
                <p class="float_right"><strong>E-mail  </strong>:

            </div>
            <div >
                <p class="float_left">200932058
                <p class="float_left">Cissy
                <p class="float_left">Female

                <p class="float_left">21
                <p class="float_left">Depart_2
                <p class="float_left">Position_3
                <p class="float_left">+86 111 2222 3333

                <p class="float_left">cissy_yan@qq.com

            </div>
            </p>
        </div> <!-- End #personal_info -->


		
	</div></div></body>
  

<!-- Download From www.exet.tk-->
</html>
