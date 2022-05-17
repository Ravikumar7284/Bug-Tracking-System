<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Home</title>
<link rel="stylesheet" type="text/css" href="CSS/departmentstyle.css">
</head>

<%
if(request.getParameter("param1")!=null){%>
    
<script>alert('Login Sucess!')</script>

<%}
if(request.getParameter("param2")!=null){%>

<script>alert('Please check login credentials!')</script>
 <%
}
%> 

<body>
<%@include file="Include/Header.jsp"%>
<hr>
<table id="linktable">
<tr>
<td>
<a href="AdminHome.jsp">[ Home ]</a>
</td>
<td>
<a href="Logout.jsp">[ Logout ]</a>
</td>
</tr>
</table>
<br><br>

<select name="department" onchange = "location = this.value">
<option disabled selected value> Departments </option>
<option name="adddepartment" value="AdminAddDepartment.jsp">Add Department</option>
<option name="viewdepartment" value="AdminViewDepartment.jsp">View Department</option>
</select>
<select name="employee" onchange = "location = this.value">
<option disabled selected value> Employees </option>
<option name="viewemployee" value="AdminViewEmployee.jsp">View Employee</option>
</select>
<select name="project" onchange = "location = this.value">
<option disabled selected value> Projects </option>
<option name="addproject" value="AdminAddProject.jsp">Add Project</option>
<option name="viewproject" value="AdminViewProject.jsp">View Project</option>
<option name="updateproject" value="AdminUpdateProject.jsp">Update Project</option>
</select>
<br>
<%
String fname= (String)session.getAttribute("fname");
%>     
<h2>Welcome <%=fname%></h2>
<br>
<img alt="admin" src="Images/admin.png" id="adminimg"/>
<hr>
<%@include file="Include/Footer.jsp"%>
</body>
</html>