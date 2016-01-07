<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="main"/>

<script src="https://cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.10/js/dataTables.bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.10/css/dataTables.bootstrap.min.css">

<title>Student Report</title>
</head>
<body>
  <div class="body">
	<h3>Student Report for ${stud.Fname} ${stud.Lname }</h3>  
	<p>
		Student ACID : ${stud.acId}
		</br>
		Student Year : ${stud.year}
	</p>
 	</br>
  	<h4>Grand Total of Hours Served : ${grandtotal}</h4>
  	</br>
  	<h4>Grand Total of Hours Served  in ${year}: ${yeartotal}</h4>
  	</br>
  	<table>
  		<thead>
  			<h4>Service Hour List</h4> 
  			<tr>
  				<th>Date</th>
  				<th>Duration</th>
  				<th>Event</th>
  				<th>Organization</th>
  			</tr>
  		</thead>
  			<tbody>
  				<g:each in = "${servs}" var = "s">
	  				<tr>
	  				<td>${s.start}</td>
	  				<td>${s.duration}</td>
	  				<td>${s.event}</td>
	  				<td>${s.org}</td>
	  				</tr>
  				</g:each>
  			</tbody>
  	</table>
  </div>
</body>
</html>