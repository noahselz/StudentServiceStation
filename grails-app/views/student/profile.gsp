<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="main"/>
<title>Profile</title>
<script src="https://cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.10/js/dataTables.bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.10/css/dataTables.bootstrap.min.css">
</head>
<body>
	<h3>Student Info</h3>
  <div class="body">
  	<table>
  		<thead/>
  			<tbody>
  				<tr>
  					<th>ACID</th>
  					<th>First Name</th>
  					<th>Last Name</th>
  					<th>Year</th>
  				</tr>
  				<tr>
	  				<td>${currentStud.acId}</td>
	  				<td>${currentStud.Fname}</td>
		  			<td>${currentStud.Lname}</td>
		  			<td>${currentStud.year}</td>
	  			<tr>
  			</tbody>
  	</table>
  	
  	<div class="panel-body">
            
			  <button id = "Edit" type="button" class="btn btn-default">Edit Student</button>
			  <button id = "Delete" name= "${currentStud.id}" type="button" class="btn btn-default">Delete Student</button>
			  <button id = "toList" type = "button" class = "btn btn-default">Back to list page</button>
	</div>
  	
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
  			
  				<g:each in = "${currentStud.ops}" var = "s">
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
  </div>
  
  <div class="panel-body">
			  <button id = "servCreate" type = "button" class = "btn btn-default">Add Service Op</button>
			  <button id = "studentReport" name = "${currentStud.id}" type = "button" class = "btn btn-default">Get Student Report</button>
			  <button id = "semesterReport" name = "${currentStud.id}" type = "button" class = "btn btn-default">Get Semester Report</button>
	</div>
 	
 	<div id = "editservpanel" class="panel panel-primary">
           
    </div>
	
	<div id = "servpanel" class="panel panel-primary">
            <div class="panel-heading">
              <h3 class="panel-title">New ServiceOp</h3>
            </div>
            <div style="padding-left:25px; padding-top: 15px">
            	<p>When creating new ServiceOp, all field are required.</p>
            </div>
            <div id = "error" class="alert alert-danger fade in" style ="visibility: hidden";>
	    		<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a>
	    		<strong>Error!</strong> You must fill out all the forms to create a student!
	  		</div>
            <div class="panel-body">
            	<form id = "servform" class="form-horizontal">
            		<input name = "acid" type="text" class="form-control" id="acid" style= "visibility: hidden" value = "${currentStud.acId}">
					<input name = "id" type="text" class="form-control" id="id" style= "visibility: hidden" value = "${currentStud.id}">				  
				  <div class="form-group">
				    <label for="labelduration" class="col-sm-2 control-label">Duration:</label>
				    <div class="col-sm-10">
				      <input name = "duration" type="text" class="form-control" id="duration" placeholder="enter number of hours">
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="col-sm-2 control-label">Date:</label>
				    <div class="col-sm-10">
				      <input name = "start" type="date" class="form-control" id="start">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="labelevent" class="col-sm-2 control-label">Event:</label>
				    <div class="col-sm-10">
				      <input name = "event" type="text" class="form-control" id="event" placeholder="enter event name">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="labelorg" class="col-sm-2 control-label">Organization:</label>
				    <div class="col-sm-10">
				      <input name = "org" type="text" class="form-control" id="org" placeholder="enter affiliated organization">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				      <input id = "createOp" class="btn btn-default" type="button" value="Submit">
				    </div>
				  </div>
				</form>
            </div>
      </div>
      
	
	
	<div id = "editformpanel" class="panel panel-primary">
            <div class="panel-heading">
              <h3 class="panel-title">Edit Student</h3>
            </div>
            <div style="padding-left:25px; padding-top: 15px">
            	<p>All fields are required.</p>
            </div>
            <div id = "error" class="alert alert-danger fade in" style ="visibility: hidden";>
	    		<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a>
	    		<strong>Error!</strong> You must fill out all the forms to edit this student!
	  		</div>
            <div class="panel-body">
            	<form action="/nselz06/student/edit" id = "userform" class="form-horizontal">
				  
				  <div class="form-group">
				    <label class="col-sm-3 control-label">ID (Webserver use only):</label>
				    <div class="col-sm-10">
				      <input name = "id" type="text" class="form-control" id="id" readonly = true value = "${currentStud.id}">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label class="col-sm-2 control-label">First Name:</label>
				    <div class="col-sm-10">
				      <input name = "Fname" type="text" class="form-control" id="Fname" placeholder="enter first name" value = "${currentStud.Fname}">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="labelLName" class="col-sm-2 control-label">Last Name:</label>
				    <div class="col-sm-10">
				      <input name = "Lname" type="text" class="form-control" id="Lname" placeholder="enter last name" value = "${currentStud.Lname}">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="labelacId" class="col-sm-2 control-label">ACID:</label>
				    <div class="col-sm-10">
				      <input name = "acId" type="text" class="form-control" id="acId" placeholder="enter ACID" value = "${currentStud.acId}">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label class="col-sm-2 control-label">Year:</label>
				    <div class="col-sm-10">
				       <select name = year id = year class="form-control">
				       		<option value="${currentStud.year }">${currentStud.year }</option>
				       		<option value="2015">2015</option>
							<option value="2014">2014</option>
							<option value="2013">2013</option>
							<option value="2012">2012</option>
							<option value="2011">2011</option>
							<option value="2010">2010</option>
							<option value="2009">2009</option>
							<option value="2008">2008</option>
					    	<option value="2007">2007</option>
							<option value="2006">2006</option>
							<option value="2005">2005</option>
							<option value="2004">2004</option>
							<option value="2003">2003</option>
							<option value="2002">2002</option>
							<option value="2001">2001</option>
							<option value="2000">2000</option>
					  </select>
				    </div>
				  </div>
				  
				 
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				      <input id = "editUser" class="btn btn-default" type="submit" value="Save">
				    </div>
				  </div>
				</form>
            </div>
      </div>
		
</body>
</html>