<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="layout" content="main"/>
	<title>Agency Manager</title>
	<script src="https://cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.10/js/dataTables.bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.10/css/dataTables.bootstrap.min.css">
</head>
<body>
  <div class="body">
  	<table id = "agencytable">
  		<thead>
  			<h3>Agency List</h3> 
  			<tr>
  				<th>Name</th>
  				<th>Modify/Delete</th>
  			</tr>
  		</thead>
  			<tbody>
  				<g:each in = "${agency}" var = "a">
	  				<tr>
	  				<td>${a.name}</td>
	  				<td><button name = "${a.id}"  type="button" class="deleteAg btn btn-default">Delete</button><button oid = "${a.id}"  type="button" class="editAg btn btn-default">Edit</button></td>
	  				</tr>
  				</g:each>
  			</tbody>
  	</table>
  	<button id= "createAgency" class = "btn btn-default">Create Agency</button>
  	
  	<div id = "editagencypanel" class="panel panel-primary">
  	
    </div>
  	<div id = "createagencypanel" class="panel panel-primary">
  		<div class="panel-heading">
              <h3 class="panel-title">Create Agency</h3>
            </div>
            <div style="padding-left:25px; padding-top: 15px">
            	<p>When creating Agency, all field are required.</p>
            </div>
            
            <div id = "error" class="alert alert-danger fade in" style ="visibility: hidden">
	    		<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a>
	    		<strong>Error!</strong> You must fill out all the forms to create an Agency!
	  		</div>
            <div class="panel-body">
            	<form id = "createagencyform" class="form-horizontal">	  
				  <div class="form-group">
				    <label for="labelduration" class="col-sm-2 control-label">Name:</label>
				    <div class="col-sm-10">
				      <input name = "name" type="text" class="form-control" id="name" placeholder="enter agency name">
				    </div>
				  </div>
				</form>
				<button id = "createAg">Submit</button>
			</div>
    	</div>
  	
  </div>
</body>
</html>