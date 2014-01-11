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
		<script type="text/javascript" src="resources/scripts/vanadium.js"></script>
		
		
		<script>
	var allPatient = {};
	var allRecord = {};
	var myPatient = {};
	var currentRecord = {};
	var cCondition, cKeyword, cPage, recordPage;
	var gender = ['Male', 'Famale'];
	var current;

		function postRequest(page, condition, keyword) {
			cCondition = condition;
			cKeyword = keyword;
			cPage = page;
			$.post("search", {
				'action' : 'allPatient',
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

		function deletePatient() {
			
			var json = allPatient[current];
			$.post("patient", {
				'action' : 'delete',
				'pid' : json.pid,
				}, function(data, textStatus) {
					location.reload();
					});	
			}

		function makeAllItem(item, i) {
			var id = 'r_'+i;
			var ssn = item.ssn;
			var display = '*****'+ssn[0]+ssn[1]+ssn[2]+ssn[3];
				
			var html = '<td>'+display+'</td>'+
            '<td><a href="#personal_info" onclick="changeInfo('+i+')" rel="modal" title="patient">'+item.pfname+' '+item.plname+'</a></td>'+
            '<td>'+item.pbirthday+'</td>'+
            '<td>'+gender[item.pgender]+'</td>'+
            '<td><a rel="modal" class="a_delete" href="#delete" title="more" onclick="changeDeleteInfo('+i+')">Delete</a></td>';

			var tr = document.createElement('tr');
			$(tr).html(html);

			return tr;
			} 

		function changeDeleteInfo(i) {
			
			current = i;
			var json = allPatient[i];
			var ssn='*****'+json.ssn[0]+json.ssn[1]+json.ssn[2]+json.ssn[3];
			$('#dname').html(json.pfname+' '+json.plname);
			$('#dgender').html(gender[json.pgender]);
			$('#dbirthdate').html(json.pbirthday);
			$('#dpid').html(json.pid);
			$('#dssn').html(ssn);
			$('#dphone').html(json.pphone);
			$('#demail').html(json.pemail);
			$('#daddress').html(json.paddress);
			$('#dename').html(json.pename);
			$('#dephone').html(json.pephone);
			$('#deaddress').html(json.peaddress);
			$('#deemail').html(json.peemail);
			$('#diname').html(json.piname);
			$('#diphone').html(json.piphone);
			$('#diaddress').html(json.piaddress);
			$('#diemail').html(json.piemail);
			$('#ditype').html(json.pitype);
			$('#diexpire').html(json.piexpire);
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
		
		$('document').ready(function() {
			postRequest(1, 1, '');
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
			<p id="page-intro">Patient Management  | <a href="a_addPatient.jsp">Add Patient</a></p>

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

            <h3>Patient Management</h3>

        </div> <!-- End .content-box-header -->

        <div class="content-box-content">

            <div class="clear"></div>

        <div class="tab-content default-tab" id="tab1"> <!-- This is the target div. id must match the href of this div's tab -->
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
				<tbody id="allPatient">
                <!-- Content of all patient -->
                </tbody>

            </table>

        </div> <!-- End #tab1 -->



        </div> <!-- End .content-box-content -->

        </div> <!-- End .content-box -->

        <div id="edit" style="display: none"> <!-- Messages are shown when a link with these attributes are clicked: href="#messages" rel="modal"  -->

            <h3>Edit &nbsp;|&nbsp;<a href="#">Save</a></h3>
            <p class="p_line">
            <div  class="detail_facebox">
                <a href="#"><img src="resources/img/Patient_1.jpg"></a>
            </div>
            <p style="margin-left: 260px;color: #062856;">Health Insurance</p>
            <div id="detail">
                <p class="float_right"><strong>SSN  </strong>:
                <p class="float_right"><strong>Name  </strong>:
                <p class="float_right"><strong>Gender  </strong>:
                <p class="float_right"><strong>Age  </strong>:
                <p class="float_right"><strong>Birth  </strong>:
                <p class="float_right"><strong>Address  </strong>:
                <p class="float_right"><strong>Phone  </strong>:
                <p class="float_right"><strong>E-mail  </strong>:
            </div>
            <div >
                <p class="float_left"><input class="edit" value="123">
                <p class="float_left"><input class="edit" value="C">
                <p class="float_left">
                    <select class="edit">
                        <option value ="mail">Male</option>
                        <option value ="female" selected>Female</option>
                    </select>
                <p class="float_left"><input class="edit" value="21">
                <p class="float_left"><input class="edit" value="900925">
                <p class="float_left"><input class="edit" value="409A">
                <p class="float_left"><input class="edit" value="808 808 808">
                <p class="float_left"><input class="edit" value="cissy_yan@qq.com">
                </p>
            </div>
            <p>
            <div class="detail_facebox"  style="width: 260px;">
                <p>Emergency Contact</p>
                <div class="detail_1">
                    <p class="float_right"><strong>Name  </strong>:
                    <p class="float_right"><strong>Address  </strong>:
                    <p class="float_right"><strong>Phone  </strong>:
                    <p class="float_right"><strong>E-mail  </strong>:
                </div>
                <div >

                    <p class="float_left"><input class="edit" value="Company Name">
                    <p class="float_left"><input class="edit" value="Company Address">
                    <p class="float_left"><input class="edit" value="Company Phone">
                    <p class="float_left"><input class="edit" value="Company Email">

                </div>

            </div>
            <div class="detail_2" style="width: 250px;">
                <p>Health Insurance</p>
                <div class="detail_1">
                    <p class="float_right"><strong>Company  </strong>:
                    <p class="float_right"><strong>Address  </strong>:
                    <p class="float_right"><strong>Phone  </strong>:
                    <p class="float_right"><strong>Email  </strong>:
                    <p class="float_right"><strong>Type  </strong>:
                    <p class="float_right"><strong>Expiration  </strong>:
                </div>
                <div >

                    <p class="float_left"><input class="edit" value="Company Name">
                    <p class="float_left"><input class="edit" value="Company Address">
                    <p class="float_left"><input class="edit" value="Company Phone">
                    <p class="float_left"><input class="edit" value="Company Email">
                    <p class="float_left"><input class="edit" value="Type A">
                    <p class="float_left"><input class="edit" value="2014">

                </div>

            </div>
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        </div> <!-- End #personal_info -->
        
        <div id="addP" style="display: none"> <!-- Messages are shown when a link with these attributes are clicked: href="#messages" rel="modal"  -->
		<form action="signup">
		<input type="hidden" name="type" value="patient" />
            <h3>Add New Patient&nbsp;|&nbsp;<input type="submit" value="Save" class="button"></h3>
            <p class="p_line">
            <div  id="detail_facebox">
                <a href="#"><img src="resources/img/Add.jpg"></a>
            </div>
            <p style="margin-left: 260px;color: #062856;">Health Insurance</p>
            
            <div class="detail">


				<p class="float_right"><strong>Username  </strong>:
                <p class="float_right"><strong>SSN  </strong>:
                <p class="float_right"><strong>Password  </strong>:
                <p class="float_right"><strong>First Name  </strong>:
                <p class="float_right"><strong>Last Name  </strong>:
                <p class="float_right"><strong>Gender  </strong>:
                <p class="float_right"><strong>Birth  </strong>:
                <p class="float_right"><strong>Address  </strong>:
                <p class="float_right"><strong>Phone  </strong>:
                <p class="float_right"><strong>E-mail  </strong>:
            </div>
            <div>
                <p class="float_left"><input name="pid" value="" class="edit">
                <p class="float_left"><input class="edit" name="ssn" value="">
                <p class="float_left"><input class="edit" type="password" name="password" value="">
                <p class="float_left"><input class="edit" name="fname" value="">
                <p class="float_left"><input class="edit" name="lname" value="">
                <p class="float_left">
                    <select class="edit" name="gender">
                        <option value ="0">Male</option>
                        <option value ="1">Female</option>
                    </select>
                <p class="float_left"><input class="edit" name="birthdate" value="">
                <p class="float_left"><input class="edit" name="address" value="">
                <p class="float_left"><input class="edit" name="phone" value="">
                <p class="float_left"><input class="edit" name="email" value="">
            </div>
            <p>
            <div class="detail_facebox"  style="width: 260px;">
                <p>Emergency Contact</p>
                    <div class="detail_1">
                        <p class="float_right"><strong>Name  </strong>:
                        <p class="float_right"><strong>Address  </strong>:
                        <p class="float_right"><strong>Phone  </strong>:
                        <p class="float_right"><strong>E-mail  </strong>:
                    </div>
                    <div >

                        <p class="float_left"><input class="edit" name="ename" value="">
                        <p class="float_left"><input class="edit" name="eaddress" value="">
                        <p class="float_left"><input class="edit" name="ephone" value="">
                        <p class="float_left"><input class="edit" name="eemail" value="">

                    </div>

            </div>
            <div class="detail_2" style="width: 250px;">
                <p>Health Insurance</p>
                <div class="detail_1">
                    <p class="float_right"><strong>Company  </strong>:
                    <p class="float_right"><strong>Address  </strong>:
                    <p class="float_right"><strong>Phone  </strong>:
                    <p class="float_right"><strong>Email  </strong>:
                    <p class="float_right"><strong>Type  </strong>:
                    <p class="float_right"><strong>Expiration  </strong>:
                </div>
                <div >

                    <p class="float_left"><input class="edit" name="icname" value="">
                    <p class="float_left"><input class="edit" name="icaddress" value="">
                    <p class="float_left"><input class="edit" name="icphone" value="">
                    <p class="float_left"><input class="edit" name="icemail" value="">
                    <p class="float_left"><input class="edit" name="icpolicynum" value="">
                    <p class="float_left"><input class="edit" name="icexpiredate" value="">

                </div>

            </div>
			</form>
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        </div> <!-- End #personal_info -->
        <div id="delete" style="display: none"> <!-- Messages are shown when a link with these attributes are clicked: href="#messages" rel="modal"  -->

            <h3>Are you sure? &nbsp;|&nbsp;<a href="#" onclick="return deletePatient()" class="a_delete">Delete</a></h3>
            <p class="p_line">
            <div  class="detail_facebox">
                <a href="#"><img src="resources/img/Patient_1.jpg"></a>
            </div>
            <p style="margin-left: 260px;color: #062856;">Health Insurance</p>
            <div class="detail">
                <p class="float_right"><strong>Username  </strong>:
                <p class="float_right"><strong>SSN  </strong>:
                <p class="float_right"><strong>Name  </strong>:
                <p class="float_right"><strong>Gender  </strong>:
                <p class="float_right"><strong>Birth  </strong>:
                <p class="float_right"><strong>Address  </strong>:
                <p class="float_right"><strong>Phone  </strong>:
                <p class="float_right"><strong>E-mail  </strong>:
            </div>
            <div>
            	<p class="float_left"><div id="dpid"></div>
                <p class="float_left"><div id="dssn"></div>
                <p class="float_left"><div id="dname"></div>
                <p class="float_left"><div id="dgender"></div>
                <p class="float_left"><div id="dbirthdate"></div>
                <p class="float_left"><div id="daddress"></div>
                <p class="float_left"><div id="dphone"></div>
                <p class="float_left"><div id="demail"></div>
                </p>
            </div>
            <p>
            <div class="detail_facebox"  style="width: 260px;">
                <p>Emergency Contact</p>
                <div class="detail_1">
                    <p class="float_right"><strong>Name  </strong>:
                    <p class="float_right"><strong>Address  </strong>:
                    <p class="float_right"><strong>Phone  </strong>:
                    <p class="float_right"><strong>E-mail  </strong>:
                </div>
                <div >

                    <p class="float_left"><div id="dename"></div>
                    <p class="float_left"><div id="deaddress"></div>
                    <p class="float_left"><div id="dephone"></div>
                    <p class="float_left"><div id="deemail"></div>

                </div>

            </div>
            <div class="detail_2" style="width: 250px;">
                <p>Health Insurance</p>
                <div class="detail_1">
                    <p class="float_right"><strong>Company  </strong>:
                    <p class="float_right"><strong>Address  </strong>:
                    <p class="float_right"><strong>Phone  </strong>:
                    <p class="float_right"><strong>Email  </strong>:
                    <p class="float_right"><strong>Type  </strong>:
                    <p class="float_right"><strong>Expiration  </strong>:
                </div>
                <div >

                    <p class="float_left"><div id="diname"></div>
                    <p class="float_left"><div id="diaddress"></div>
                    <p class="float_left"><div id="diphone"></div>
                    <p class="float_left"><div id="diemail"></div>
                    <p class="float_left"><div id="ditype"></div>
                    <p class="float_left"><div id="diexpire"></div>

                </div>

            </div>
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>


            </p>
        </div> <!-- End #personal_info -->
        <div id="personal_info" style="display: none"> <!-- Messages are shown when a link with these attributes are clicked: href="#messages" rel="modal"  -->

            <h3>Patient Information</h3>
            <p class="p_line">
            <div  class="detail_facebox">
                <a href="#"><img src="resources/img/Patient_1.jpg"></a>
            </div>
            <p style="margin-left: 260px;color: #062856;">Health Insurance</p>
            <div class="detail">
                <p class="float_right"><strong>SSN  </strong>:
                <p class="float_right"><strong>Name  </strong>:
                <p class="float_right"><strong>Gender  </strong>:
                <p class="float_right"><strong>Age  </strong>:
                <p class="float_right"><strong>Birth  </strong>:
                <p class="float_right"><strong>Address  </strong>:
                <p class="float_right"><strong>Phone  </strong>:
                <p class="float_right"><strong>E-mail  </strong>:
            </div>
            <div >
                <p class="float_left">123
                <p class="float_left">C
                <p class="float_left">Female
                <p class="float_left">21
                <p class="float_left">900925
                <p class="float_left">409A
                <p class="float_left">808 808 808
                <p class="float_left">cissy_yan@qq.com
                </p>
            </div>
            <p>
            <div class="detail_facebox"  style="width: 260px;">
                <p>Emergency Contact</p>
                <div class="detail_1">
                    <p class="float_right"><strong>Name  </strong>:
                    <p class="float_right"><strong>Address  </strong>:
                    <p class="float_right"><strong>Phone  </strong>:
                    <p class="float_right"><strong>E-mail  </strong>:
                </div>
                <div >

                    <p class="float_left">Company Name
                    <p class="float_left">Company Address
                    <p class="float_left">Company Phone
                    <p class="float_left">Company Email

                </div>

            </div>
            <div class="detail_2" style="width: 250px;">
                <p>Health Insurance</p>
                <div class="detail_1">
                    <p class="float_right"><strong>Company  </strong>:
                    <p class="float_right"><strong>Address  </strong>:
                    <p class="float_right"><strong>Phone  </strong>:
                    <p class="float_right"><strong>Email  </strong>:
                    <p class="float_right"><strong>Type  </strong>:
                    <p class="float_right"><strong>Expiration  </strong>:
                </div>
                <div >

                    <p class="float_left">Company Name
                    <p class="float_left">Company Address
                    <p class="float_left">Company Phone
                    <p class="float_left">Company Email
                    <p class="float_left">Type A
                    <p class="float_left">2014

                </div>

            </div>
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>


            </p>
        </div> <!-- End #personal_info -->
       





        </div></div></body>
  

<!-- Download From www.exet.tk-->
</html>
