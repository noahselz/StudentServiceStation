<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="layout" content="main"/>
	<title>Service Hour List</title>
	<script src="https://cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.10/js/dataTables.bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.10/css/dataTables.bootstrap.min.css">
</head>
<body>
  <div class="body">
  	<table id = "servtable">
  		<thead>
  			<h3>Service Hour List</h3> 
  			<tr>
  				<th>Duration</th>
  				<th>Date</th>
  				<th>Event</th>
  				<th>Organization</th>
  				<th>Modify/Delete</th>
  			</tr>
  		</thead>
  			<tbody>
  				<g:each in = "${servs}" var = "s">
	  				<tr>
	  				<td>${s.duration}</td>
	  				<td>${s.start}</td>
	  				<td>${s.event}</td>
	  				<td>${s.org}</td>
	  				<td><button name = "${s.id}"  type="button" class="delete btn btn-default">Delete</button><button oid = "${s.id}"  type="button" class="edit btn btn-default">Edit</button></td>
	  				</tr>
  				</g:each>
  			</tbody>
  	</table>
  	
  	<button id = "servlistCreate" type = "button" class = "btn btn-default">Add Service Op</button>
  	
  	<div id = "editservpanel" class="panel panel-primary">
         
    </div>
  	<div id = "createservpanel" class="panel panel-primary">
  		
    </div>
    <div id = "studlistpanel" class="panel panel-primary">
  		<div class="panel-heading">
			<h3 class="panel-title">Pick Student to add Service Hours</h3>
		</div>
		<table id = "tblStuds" class = "table table-striped">
			<thead>
	  			<h3>Student List</h3> 
	  			<tr>	
	  				<th>Select</th>
	  				<th>ACID</th>
	  				<th>First Name</th>
	  				<th>Last Name</th>
	  				<th>Year</th>
	  			</tr>
			<thead/>
			<tbody>
	  			<g:each in = "${students}" var = "s">
		  			<tr>
		  			<td> <button name = "${s.id}"  type="button" class="select btn btn-default">Select</button> </td>
		  			<td><a href="/nselz06/student/profile/?id=${s.id}">${s.acId}</a></td>
		  			<td>${s.Fname}</td>
		  			<td>${s.Lname}</td>
		  			<td>${s.year}</td>
		  			</tr>
	  			</g:each>
	 		</tbody>
		</table>
    </div>
  </div>
</body>
</html>