<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="layout" content="main"/>
	<script src="https://cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.10/js/dataTables.bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.10/css/dataTables.bootstrap.min.css">
	<title>AC Service Station</title>
</head>
<body>
  <div class="body">
  <h2 class="">Welcome, Admin!</h2>
  </br>
  	<div class="panel panel-primary">
			<div class="panel-heading">
              <h3 class="panel-title">Key Performance Statistics</h3>
            </div>
            <p></p>
			<p> Grand Total Service Hours : ${kpi.grandTotal}</p>
			<p> Number of Students with 20 or more Service Hours : ${kpi.numGreatStuds}</p>
			<p> Total number of Service Hours this year : ${kpi.totalHoursYear}</p>
		</div>
		<button id = "toList" type = "button" class = "btn btn-default">See Student List</button>
		<button id = "toservList" type = "button" class = "btn btn-default">See Service Hour List</button>
		<button id = "toagencyList" type = "button" class = "btn btn-default">See Agency List</button>
  </div>
</body>
</html>