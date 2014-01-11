<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
	<head>
		
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"></meta>
		
		<title>EMRS</title>

		<link rel="stylesheet" href="resources/css/reset.css" type="text/css" media="screen">
		<link rel="stylesheet" href="resources/css/style.css" type="text/css" media="screen">
		<link rel="stylesheet" href="resources/css/invalid.css" type="text/css" media="screen">
		
		<script type="text/javascript" src="resources/scripts/jquery-1.3.2.min.js"></script>
		<script type="text/javascript" src="resources/scripts/simpla.jquery.configuration.js"></script>
		<script type="text/javascript" src="resources/scripts/facebox.js"></script>
		<script type="text/javascript" src="resources/scripts/jquery.wysiwyg.js"></script>
		<script type="text/javascript" src="resources/scripts/jquery.datePicker.js"></script>
		<script type="text/javascript" src="resources/scripts/jquery.date.js"></script>
		<script>

		var allData = {};
		var current;
		function postRequest() {
			$.post("system", {
				'action' : 'department'
				}, function(data, textStatus) {
					$('#allData').html('');
					allData = data.data;					
					appendAllPatient();
					}, 'json');	
			}
		
		function appendAllPatient() {			
			for(var i=0;i<allData.length;i++)
				$('#allData').append(makeAllItem(allData[i], i));
			$('a[rel*=modal]').facebox(); 
			}

		function makeAllItem(item, i) {
				
			var html = '<td>'+item.dpid+'</td>'+
            '<td>'+item.name+'</td>'+
            '<td><a class="a_delete" href="#delete" onclick="changeRecord('+i+')" rel="modal" title="more">Delete</a></td>';

			var tr = document.createElement('tr');
			$(tr).html(html);

			return tr;
			} 

		function changeRecord(i) {
			current = i;
			var json = allData[i];
				$('#dpid').html(json.dpid);
				$('#dpname').html(json.name);
				
			}

		function deleteDepartment() {
			$.post("system", {
				'action' : 'deleteDepartment',
				'id' : allData[i].dpid
				}, function(data, textStatus) {
					location.reload();
					}, 'json');	
			}
		
		$('document').ready(function() {
			postRequest();
			});
		</script>
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
			<p id="page-intro">Department Management  | <a href="#addDe" rel="modal">Add Department</a></p>

			<div class="clear"></div> <!-- End .clear -->
        <br>
        <br>
        <div class="content-box"><!-- Start Content Box -->

        <div class="content-box-header">

            <h3>Department Management</h3>

        </div> <!-- End .content-box-header -->

        <div class="content-box-content">

            <div class="clear"></div>

        <div class="tab-content default-tab" id="tab1"> <!-- This is the target div. id must match the href of this div's tab -->
            <table>
                <thead>
                <tr>
                    <th>Department ID</th>
                    <th>Department Name
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

                <tbody id="allData">
                </tbody>

            </table>

        </div> <!-- End #tab1 -->



        </div> <!-- End .content-box-content -->

        </div> <!-- End .content-box -->


        <div id="addDe" style="display: none"> <!-- Messages are shown when a link with these attributes are clicked: href="#messages" rel="modal"  -->
			<form action="system">
			<input name="action" value="addDepartment" type="hidden">
            <h3>Add New Department&nbsp;|&nbsp;<input type="submit" class="button"></h3>
            <p class="p_line">

            <div id="detail">
                <p class="float_right"><strong>Department Name  </strong>:
            </div>
            <div >
                <p class="float_left"><input class="edit" name="name" value="">

            </div>
            <br>

            </p>
            </form>
        </div> <!-- End #personal_info -->
        <div id="delete" style="display: none"> <!-- Messages are shown when a link with these attributes are clicked: href="#messages" rel="modal"  -->

            <h3>Are you sure? &nbsp;|&nbsp;<a href="#" onclick="deleteDepartment()" class="a_delete">Delete</a></h3>
            <p class="p_line">

            <div>
                <p><strong>Department ID  </strong>: <span id="dpid"></span>
                <p><strong>Department Name  </strong>: <span id="dpname"></span>
            </div>
        </div> <!-- End #personal_info -->


	</div></div></body>
</html>
