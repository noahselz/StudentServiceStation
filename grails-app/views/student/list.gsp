<%@ page contentType="text/html;charset=UTF-8" %>
<html>
	<head>
		<script src="https://cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>
		<script src="https://cdn.datatables.net/1.10.10/js/dataTables.bootstrap.min.js"></script>
		<link rel="stylesheet" href="https://cdn.datatables.net/1.10.10/css/dataTables.bootstrap.min.css">
		<meta name="layout" content="main"/>
		<title>StudentList</title>
	</head>
	<body>
		<div class="panel panel-primary">
			<div class="panel-heading">
              <h3 class="panel-title">Student Statistics</h3>
            </div>
            <p></p>
			<p> Total Students : ${numStuds}</p>
			<p> Percent Students with Service Hours : ${percStuds}%</p>
			<p> Average Service Hours : ${avgHours}</p>
			<p> Total number of Service Hours this year : ${yearTotal}</p>
			<p> Total number of Service Hours : ${grandTotal}</p>
		</div>
		
	
		
	  <div class="body">
	  	<table id = "tblStuds" class = "table table-striped">
	  		<thead>
	  			<h3>Student List</h3> 
	  			<tr>	
	  				<th>Number</th>
	  				<th>ACID</th>
	  				<th>First Name</th>
	  				<th>Last Name</th>
	  				<th>Year</th>
	  			</tr>
	  		<thead/>
	  			<tbody>
	  				
	  				<g:each in = "${students}" var = "s">
		  				<tr>
		  				<td>${s.id}</td>
		  				<td><a href="/nselz06/student/profile/?id=${s.id}">${s.acId}</a></td>
		  				<td>${s.Fname}</td>
		  				<td>${s.Lname}</td>
		  				<td>${s.year}</td>
		  				</tr>
	  				</g:each>
	  			</tbody>
	  	</table>
	  </div>
	  <button id = "Add" type="button" class="btn btn-default">Add Student</button>
	   
	  <div id = "formpanel" class="panel panel-primary">
            <div class="panel-heading">
              <h3 class="panel-title">New Student</h3>
            </div>
            <div style="padding-left:25px; padding-top: 15px">
            	<p>When creating new students, all field are required.</p>
            </div>
            <div id = "error" class="alert alert-danger fade in" style ="visibility: hidden";>
	    		<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a>
	    		<strong>Error!</strong> You must fill out all the forms to create a student!
	  		</div>
            <div class="panel-body">
            	<form action="/nselz06/student/create" id = "userform" class="form-horizontal">
				  <div class="form-group">
				    <label class="col-sm-2 control-label">First Name:</label>
				    <div class="col-sm-10">
				      <input name = "fname" type="text" class="form-control" id="fname" placeholder="enter first name">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="labelLName" class="col-sm-2 control-label">Last Name:</label>
				    <div class="col-sm-10">
				      <input name = "lname" type="text" class="form-control" id="lname" placeholder="enter last name">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="labelacId" class="col-sm-2 control-label">ACID:</label>
				    <div class="col-sm-10">
				      <input name = "acid" type="text" class="form-control" id="acid" placeholder="enter ACID">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label class="col-sm-2 control-label">Year:</label>
				    <div class="col-sm-10">
				       <select name = year id = year class="form-control">
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
				      <input id = "createUser" class="btn btn-default" type="submit" value="Submit">
				    </div>
				  </div>
				</form>
            </div>
      </div>
	
	</body>
	<footer>
		
	</footer>
</html>