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
			<p id="page-intro">Position Management  | <a href="#addPo" rel="modal">Add Position</a></p>

            <form>
                <input type="radio" name="search" value="Name" />By Name of Position<br />
                <input type="text"><br/>
                <input type="radio" name="search" value="ID" />By ID of Position<br />
                <input type="text"><br/>
                <input class="button" type="submit" value="Search" />
            </form>
			<div class="clear"></div> <!-- End .clear -->
        <br/>
        <br/>
        <div class="content-box"><!-- Start Content Box -->

        <div class="content-box-header">

            <h3>Position Management</h3>

        </div> <!-- End .content-box-header -->

        <div class="content-box-content">

            <div class="clear"></div>

        <div class="tab-content default-tab" id="tab1"> <!-- This is the target div. id must match the href of this div's tab -->
            <table>
                <thead>
                <tr>
                    <th>Position ID</th>
                    <th>Position Name
                        <select>
                            <option value="AZ">A-Z</option>
                            <option value="ZA">Z-A</option>
                        </select>
                    </th>
                    <th>Position Size</th>
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
                    <td>Posi_1</td>
                    <td>10</td>


                    <td>

                        <a class="a_delete" href="#delete" rel="modal" title="more">Delete</a>
                    </td>
                </tr>

                <tr>

                    <td>200930252</td>
                    <td>Posi_2</td>
                    <td>20</td>

                    <td>

                        <a class="a_delete" href="#delete" rel="modal" title="more">Delete</a>
                    </td>
                </tr>

                <tr>

                    <td>200930253</td>
                    <td>Posi_3</td>
                    <td>30</td>

                    <td>

                        <a class="a_delete" href="#delete" rel="modal" title="more">Delete</a>
                    </td>
                </tr>

                <tr>

                    <td>200930254</td>
                    <td>Posi_4</td>
                    <td>40</td>

                    <td>

                        <a class="a_delete" href="#delete" rel="modal" title="more">Delete</a>
                    </td>
                </tr>

                </tbody>

            </table>

        </div> <!-- End #tab1 -->



        </div> <!-- End .content-box-content -->

        </div> <!-- End .content-box -->


        <div id="addPo" style="display: none"> <!-- Messages are shown when a link with these attributes are clicked: href="#messages" rel="modal"  -->

            <h3>Add New Position&nbsp;|&nbsp;<a href="#">Save</a></h3>
            <p class="p_line">

            <div id="detail">
                <p class="float_right"><strong>Position ID  </strong>:
                <p class="float_right"><strong>Position Name  </strong>:
            </div>
            <div >
                <p class="float_left"><input class="edit" value="">
                <p class="float_left"><input class="edit" value="">

            </div>
            <br>

            </p>
        </div> <!-- End #personal_info -->
        <div id="delete" style="display: none"> <!-- Messages are shown when a link with these attributes are clicked: href="#messages" rel="modal"  -->

            <h3>Are you sure? &nbsp;|&nbsp;<a href="#" class="a_delete">Delete</a></h3>
            <p class="p_line">

            <div>
                <p><strong>Position ID  </strong>:200932058
                <p><strong>Position Name  </strong>:Posi_1
                <p><strong>Position Size  </strong>:10
            </div>
            </p>
        </div> <!-- End #personal_info -->



		
	</div></div></body>
  

<!-- Download From www.exet.tk-->
</html>
