<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="main"/>
<title>Semester Report</title>
</head>
<body>
  <div class="body">
  <h3>Semester Report for ${stud.Fname} ${stud.Lname }</h3>  
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
  			<h4>Service Hour List By Semester</h4> 
  			<tr>
  				<th>Year</th>
  				<th>Semester</th>
  				<th>Hours</th>
  			</tr>
  		</thead>
  			<tbody>
  				<g:each in = "${Semesters}" var = "s">
	  				<tr>
	  				<td>${s.year}</td>
	  				<td>${s.season}</td>
	  				<td>${s.hours}</td>
	  				</tr>
  				</g:each>
  			</tbody>
  	</table>
  	
  		
  	</br>
  </div>
</body>
</html>