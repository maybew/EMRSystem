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
		
	<script>
	var allPatient = {};
	var allRecord = {};
	var myPatient = {};
	var cCondition, cKeyword, cPage;
	var gender = ['Male', 'Famale'];
	var current;

		function postRequest(page, condition, keyword) {
			cCondition = condition;
			cKeyword = keyword;
			cPage = page;
			$.post("search", {
				'action' : 'searchPatientlist',
				'page' : '1',
				'condition' : condition,
				'keyword' : keyword
				}, function(data, textStatus) {
					$('#allPatient').html('');
					allPatient = data.data;
					allRecord = data.record;					
					appendAllPatient();
					}, 'json');	
			}

		function nextPage() {
			cPage = cPage + 1;
			postRequest(cPage, cCondition, cKeyword);
			}

		function previousPage() {
			cPage = cPage - 1;
			postRequest(cPage, cCondition, cKeyword);
			}

		function firstPage() {
			cPage = 1;
			postRequest(1, cCondition, cKeyword);
			}
		
		function searchPatient() {

			var name = document.getElementsByName('search')[0].checked;
			var ssn = document.getElementsByName('search')[1].checked;
			var condition;
			var keyword = '';
			
			if(name) {
				condition = 1;
				keyword = $('#nameField').attr('value');
			}
			else if(ssn) {
				condition = 0;
				keyword = $('#ssnField').attr('value');
			} else {
				condition = -1;
				}

			postRequest(1, condition, keyword);
			}

		function appendAllPatient() {			
			for(var i=0;i<allPatient.length;i++)
				$('#allPatient').append(makeAllItem(allPatient[i], i));
			$('a[rel*=modal]').facebox(); 
			}

		function makeAllItem(item, i) {
			var id = 'r_'+i;
			var ssn = item.pid;
			var display = '*****'+ssn[0]+ssn[1]+ssn[2]+ssn[3];
				
			var html = '<td>'+display+'</td>'+
            '<td><a href="#personal_info" onclick="changeInfo('+i+')" rel="modal" title="patient">'+item.pfname+' '+item.plname+'</a></td>'+
            '<td>'+item.pbirthday+'</td>'+
            '<td>'+gender[item.pgender]+'</td>'+

            '<td><a href="#records" rel="modal" title="more" onclick="return getRecords('+i+')">Show all</a></td>'+
            '<td><a href="#create" rel="modal" title="more" onclick="setCurrentPatient('+i+')">Add</a></td>';

			var tr = document.createElement('tr');
			$(tr).html(html);

			return tr;
			} 

		function changeInfo(i) {
			var json = allPatient[i];
			var ssn='*****'+json.pid[0]+json.pid[1]+json.pid[2]+json.pid[3];
			$('#pname').html(json.pfname+' '+json.plname);
			$('#pgender').html(gender[json.pgender]);
			$('#pbirthdate').html(json.pbirthday);
			$('#pid').html(ssn);
			$('#pphone').html(json.pphone);
			$('#pemail').html(json.pemail);
			$('#paddress').html(json.paddress);
			$('#pename').html(json.pename);
			$('#pephone').html(json.pephone);
			}
		function setCurrentPatient(i) {
			current = i;
			$('#addPid').attr('value', allPatient[i].pid);
			}
		
		function addPatient() {
			var json = allPatient[current];
			$.post("record", {
				'action' : 'addRecord',
				'pid' : json.pid,
				'health' : $('#healthInfo').val(),
				'visit' : $('#visitInfo').text(),
				'medical' : $('#medicalInfo').html(),
				'note' : $('#noteInfo').attr('value'),
				}, function(data, textStatus) {

					});	
			}

		function getRecords(i) {
			currentRecord = allRecord[i];
			recordPage = 0;
			changeRecord();
			}

		function nextRecord() {
			recordPage = recordPage + 1;
			changeRecord();
			}

		function previousRecord() {
			recordPage = recordPage - 1;
			changeRecord();
			}

		function changeRecord() {
			var json = currentRecord[recordPage];
				//$('#rpatient').html(json.patient.pid);
				$('#rdoctor').html(json.doctor.did);
				$('#rmtime').html(json.rmtime);
				$('#rvisit').html(json.visit[0].vtext);
				$('#vtime').html(json.visit[0].vctime);
				$('#rhealth').html(json.health[0].htext);
				$('#htime').html(json.health[0].hctime);
				$('#rmedical').html(json.medical[0].mtext);
				$('#mtime').html(json.medical[0].mctime);
				$('#rnote').html(json.note[0].ntext);
				$('#ntime').html(json.note[0].nctime);
				
			}
		$(document).ready(function() {
			postRequest(1, 1, "");
			});
	</script>
	</head>
  
	<body><div id="body-wrapper"> <!-- Wrapper for the radial gradient background -->
		<%@ include file="inc/d_navigation.jsp"%>
		
		<div id="main-content"> <!-- Main Content Section with everything -->
			
			<noscript> <!-- Show a notification if the user has disabled javascript -->
				<div class="notification error png_bg">
					<div>
						Javascript is disabled or is not supported by your browser. Please <a href="http://browsehappy.com/" title="Upgrade to a better browser">upgrade</a> your browser or <a href="http://www.google.com/support/bin/answer.py?answer=23852" title="Enable Javascript in your browser">enable</a> Javascript to navigate the interface properly.
					Download From <a href="http://www.exet.tk">exet.tk</a></div>
				</div>
			</noscript>
			
			<!-- Page Head -->
			<h2>Welcome <%=doctor.getFname() %></h2>
			<p id="page-intro">My Patient</p>
            <form>
                <input type="radio" name="search" value="Name" />By Name of Patient<br />
                <input type="text" id="nameField" /><br/>
                <input type="radio" name="search" value="SSN" />By SSN of Patient<br />
                <input type="text" id="ssnField" /><br/>
                <input class="button" type="button" value="Search" onclick="return searchPatient()" />
            </form>
			<div class="clear"></div> <!-- End .clear -->
        <br/>
        <br/>
        <div class="content-box"><!-- Start Content Box -->

        <div class="content-box-header">

            <h3>Patients</h3>

            

            <div class="clear"></div>

        </div> <!-- End .content-box-header -->

        <div class="content-box-content">

            <div class="clear"></div>

        
        <div>
            <table>
                <thead>
                <tr>
                    <th>SSN</th>
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
                    <th>Record</th>
                    <th>&nbsp;&nbsp;</th>
                </tr>

                </thead>

                <tfoot>
                
                <tr>
                    <td colspan="6">

                        <div class="pagination">
                            <a href="#" title="First Page">&laquo; First</a>
                            <a href="#" title="Previous Page">&laquo; Previous</a>
                            <a href="#" title="Next Page">Next &raquo;</a>
                        </div> <!-- End .pagination -->
                        <div class="clear"></div>
                    </td>
                </tr>
                </tfoot>

                <tbody id="allPatient">
                
                <!-- Content of all patient -->
                </tbody>

            </table>
        </div> <!-- End #tab2 -->


        </div> <!-- End .content-box-content -->

        </div> <!-- End .content-box -->
        <div id="records" style="display: none"> <!-- Messages are shown when a link with these attributes are clicked: href="#messages" rel="modal"  -->

                <h3>All Medical Records  | <a href="#"> Print</a></h3></h3>

                <p>
                    <strong>Record ID :</strong> <div id="rid"></div><br />
                </p>

                <p class="p_line">
                    <strong>Patient Name :</strong> <div id="rpatient"></div><br />

                </p>

                <p class="p_line">

                    <strong>Last Modified :</strong> <div id="rmtime"></div><br />
                </p>

                <p class="p_line">
                    <strong>Doctor :</strong> <div id="rdoctor"></div>
                </p>

                <p class="p_line">
                    <strong>Visitation detail &nbsp;</strong><br />
                    <strong style="color: #929796;" id="vtime"></strong>&nbsp;<div id="rvisit"></div><br />
                <p class="p_line" >
                    <strong>Health care information</strong><br />
                    <strong style="color: #929796;" id="htime"></strong>&nbsp;<div id="rhealth"></div><br />
                <p class="p_line">
                    <strong>Medication information</strong><br />
                    <strong style="color: #929796;" id="mtime"></strong>&nbsp;<div id="rmedical"></div><br />
                <p class="p_line">
                    <strong>Addition information</strong><br />
                    <strong style="color: #929796;" id="ntime"></strong>&nbsp;<div id="rnote"></div>
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
                <p><strong>Patient Name :</strong> <span id="pname"></span></p>
                <p><strong>Gender :</strong>  <span id="pgender"></span>
                <p><strong>Birth :</strong>  <span id="pbirthdate"></span>
                <p><strong>SSN :</strong>  <span id="pid"></span>

                <p><strong>Phone :</strong>  <span id="pphone"></span>
                <p><strong>E-mail :</strong>  <span id="pemail"></span>
                <p><strong>Address :</strong>  <span id="paddress"></span>
                <p><strong>Emergency Contact: </strong>  <span id="pename"></span>
                <p><strong>Emergency Phone: </strong>  <span id="pephone"></span>
            </div>
            </p>
        </div> <!-- End #personal_info -->
        <div id="create" style="display: none"> <!-- Messages are shown when a link with these attributes are clicked: href="#messages" rel="modal"  -->
		<form action="record">
            <h3>Create Record  | <a href="#"> Print</a></h3></h3>

            <p>
                <strong>Record ID :</strong> 200930258<br />
            </p>

            <p class="p_line">
                <strong>Patient Name :</strong> <span id="#cpname"></span><br />

            </p>

            <p class="p_line">

                <strong>Last Modified :</strong> today<br />
            </p>

            <p class="p_line">
                <strong>Doctor :</strong> Ex
            </p>

            <p class="p_line">
                <strong>Visitation detail &nbsp;</strong>
            <fieldset>
                <textarea id="visitInfo" class="textarea" name="visit" cols="79" rows="2"></textarea>
            </fieldset>


                <br />
            <p class="p_line" >
                <strong>Health care information</strong>
            <fieldset>
                <textarea id="healthInfo" class="textarea" name="health" cols="79" rows="2"></textarea>
            </fieldset>


                <br />
            <p class="p_line">
                <strong>Medication information</strong>
            <fieldset>
                <textarea id="medicalInfo" class="textarea" name="medical" cols="79" rows="2"></textarea>
            </fieldset>


                <br />
            <p class="p_line">
                <strong>Addition information</strong>
            <fieldset>
                <textarea id="noteInfo" class="textarea" name="note" cols="79" rows="2"></textarea>
            </fieldset>
			<input id="addPid" type="hidden" name="pid" value="" />
			<input type="hidden" name="action" value="addRecord" />
                 <br />
            <p class="p_line">
            <fieldset style="text-align: center;">
                <input class="button" type="submit" value="Save">
                &nbsp;&nbsp;&nbsp;&nbsp;
                <input class="button" type="button" value="Cancel">
            </fieldset>
            </p>
		</form>



        </div> <!-- End #create -->

        <div id="footer">
            <small> <!-- Remove this notice or replace it with whatever you want -->
                &#169; Copyright 2012 EMRS | Powered by <a href="#">EMRS</a> | <a href="#">Top</a>
            </small>
        </div><!-- End #footer -->

		
	</div></div></body>
  

<!-- Download From www.exet.tk-->
</html>
