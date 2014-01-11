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
	var currentRecord = {};
	var gender = ['Male', 'Famale', 'Other'];
	var current;

		function postRequest(page, searchType, orderType, keyword, beginDate, endDate, department, gender) {
			$.post("search", {
				'action' : 'searchRecord',
				'page' : '1',
				'searchType' : searchType,
				'keyword' : keyword,
				'orderType' : orderType,
				'beginDate' : beginDate,
				'endDate' : endDate,
				'department' : department,
				'gender' : gender
				}, function(data, textStatus) {
					$('#allRecord').html('');
					allPatient = data.data;				
					appendAllPatient();
					}, 'json');	
			}

		function searchRecord() {
			var name = document.getElementsByName('searchType')[0].checked;
			var ssn = document.getElementsByName('searchType')[1].checked;
			if(name)
				searchType = 1;
			else if(ssn)
				searchType = 2;
			else searchType = 0;
			keyword = $('#keyword').val();
			orderType = $('#orderType').val();
			
			beginDate = $('#beginDate').val();
			endDate = $('#endDate').val();
			department = $('#department').val();
			gender = $('#gender').val();
			postRequest(1, searchType, orderType, keyword, beginDate, endDate, department, gender);
			}

		function appendAllPatient() {			
			for(var i=0;i<allPatient.length;i++)
				$('#allRecord').append(makeAllItem(allPatient[i], i));
			$('a[rel*=modal]').facebox(); 
			}

		function makeAllItem(item, i) {
			var id = 'r_'+i;
			var html = '<td>'+item.rid+'</td>'+
            '<td>'+item.rctime+'</td>'+
            '<td><a href="#personal_info" onclick="changeInfo('+i+')" rel="modal" title="patient">'+item.patient.pfname+" "+item.patient.plname+'</a></td>'+
            '<td>'+item.patient.pbirthday+'</td>'+
            '<td>'+gender[item.patient.pgender]+'</td>'+
            '<td><a href="#doctor_info" onclick="changeDoctorInfo('+i+')" rel="modal" title="patient">'+item.doctor.dfname+'</a></td>'+
            '<td>'+item.doctor.ddepartment+'</td>'+
            '<td><a href="#records" onclick="changeRecord('+i+')" rel="modal" title="more">View detail</a></td>';

			var tr = document.createElement('tr');
			$(tr).html(html);

			return tr;
			} 

		function changeInfo(i) {
			var json = allPatient[i].patient;
			
			var ssn='*****'+json.ssn[0]+json.ssn[1]+json.ssn[2]+json.ssn[3];
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

		function changeDoctorInfo(i) {
			var json = allPatient[i].doctor;

			$('#dname').html(json.dfname+' '+json.dlname);
			$('#dgender').html(gender[json.dgender]);
			$('#dbirthdate').html(json.dbirthday);
			$('#did').html(json.did);
			$('#dphone').html(json.dphone);
			$('#ddepartment').html(json.ddepartment);
			$('#dolocation').html(json.dolocation);
			$('#dohour').html(json.dohour);
			$('#dposition').html(json.dposition);
			}
		
		function changeRecord(i) {
			var json = allPatient[i];
				$('#rid').html(json.rid);
				$('#rpatient').html(json.patient.pfname + " " + json.patient.plname);
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

		function nextRecord() {
			recordPage = recordPage + 1;
			changeRecord();
			}

		function previousRecord() {
			recordPage = recordPage - 1;
			changeRecord();
			}

		
		$(document).ready(function() {
			postRequest(1, 0, 0, "", "", "", "", -1);
			});
	</script>	
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
			<form>
			<input type="hidden" name="action" value="searchRecord">
            <div style="display: block">
			<p id="page-intro">Search Medical Record
            
                <table>

                    <p style="color: #110a56;">Query By Time : From
                            <input type="text" id="beginDate" onclick="calendar();"/>
                            To
                            <input type="text" id="endDate" onclick="calendar();"/>

                    <br>
                    <p style="color:#110a56;">Query By Patient :
                    <input id="keyword" type="text">
                    <input name="searchType" value="1" type="radio">Query By Name
                    <input name="searchType" value="2" type="radio">Query By ID/SSN


                    <p style="color: #110a56;">Order :
                                <select id="orderType">
                                    <option value ="0">Default</option>
                                    <option value ="1">By Patient Name from a-z</option>
                                    <option value ="2">By Patient Name from z-a</option>
                                    <option value ="3">By create time from near to far</option>
                                    <option value ="4">By create time from far to near</option>
                                </select>
                    <br>
                    <br>
                    <button type="button" onclick="return searchRecord()" class="button">Search</button>
                    <button type="reset" class="button">Reset</button>
                </table>
            

            </div>
			<div class="clear"></div> <!-- End .clear -->
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
                                <th>
               						Time
                                </th>
                                <th>
                                	Name
                                </th>
                                <th>Age</th>
                                <th>Gender
                                    <select id="gender" class="small-input-2">
                                        <option value="-1">All</option>
                                        <option value="0">Male</option>
                                        <option value="1">Female</option>
                                        <option value="2">Other</option>
                                    </select>
                                </th>
                                <th>Doctor</th>
                                <th>Department
                                    <select id="department">
                                        <option value="All">All</option>
                                        <option value="First">First</option>
                                        <option value="Second">Second</option>
                                        <option value="Third">Third</option>
                                        <option value="Fouth">Fouth</option>
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
				<tbody id="allRecord">
                
                <!-- Content of all patient -->
                </tbody>

                        </table>

                    </div> <!-- End #tab1 -->



                </div> <!-- End .content-box-content -->

            </div> <!-- End .content-box -->
            </form>
            <div class="clear"></div> <!-- End .clear -->

            <div id="records" style="display: none"> <!-- Messages are shown when a link with these attributes are clicked: href="#messages" rel="modal"  -->

                <h3>All Medical Records  | <a href="#"> Print</a></h3>
                <p>
                    <strong>Record ID :</strong> <div id="rid"></div><br />

                <p class="p_line">
                    <strong>Patient Name :</strong> <div id="rpatient"></div><br />


                <p class="p_line">

                    <strong>Last Modified :</strong> <div id="rmtime"></div><br />

                <p class="p_line">
                    <strong>Doctor :</strong> <div id="rdoctor"></div>

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
                <br>
                <div class="pagination">

                    <a href="#" title="Previous Page" onclick="previousRecord()">&laquo; Previous</a>
                    <a href="#" title="Next Page" onclick="nextRecord()">Next &raquo;</a>

                </div> <!-- End .pagination -->

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
        </div> <!-- End #personal_info -->


            <div id="doctor_info" style="display: none"> <!-- Messages are shown when a link with these attributes are clicked: href="#messages" rel="modal"  -->

            <h3>Doctor Information</h3>
            <p class="p_line">
            <div  class="detail_facebox">
                <img src="resources/img/Doctor_1.jpg">
            </div>


            <div style="margin-left: 23em;">
                <p><strong>Doctor Name :</strong> <span id="dname"></span></p>
                <p><strong>Gender</strong>  <span id="dgender"></span>
                <p><strong>Department</strong>  <span id="ddepartment"></span>
                <p><strong>Position</strong>  <span id="dposition"></span>
                <p><strong>ID</strong>  <span id="did"></span>

                <p><strong>Phone</strong>  <span id="dphone"></span>
                <p><strong>E-mail</strong>  <span id="demail"></span>
                <p><strong>Office Location</strong>  <span id="dolocation"></span>
                <p><strong>Office Hour</strong>  <span id="dohour"></span>
            </div>
        </div> <!-- End #personal_info -->


            <div id="footer">
                <small> <!-- Remove this notice or replace it with whatever you want -->
                    &#169; Copyright 2012 EMRS | Powered by <a href="#">EMRS</a> | <a href="#">Top</a>
                </small>
            </div><!-- End #footer -->
			
		</div> <!-- End #main-content -->
		
	</div>
    </body>
  

<!-- Download From www.exet.tk-->
</html>
