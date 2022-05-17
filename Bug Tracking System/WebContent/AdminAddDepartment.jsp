<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Department</title>
<link rel="stylesheet" type="text/css" href="CSS/departmentstyle.css">
</head>

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
<%
String fname= (String)session.getAttribute("fname");
%>     
<h2>Welcome <%=fname%></h2>
<br>
<select name="department" onchange = "location = this.value">
<option disabled selected value> Departments </option>
<option name="adddepartment" value="AdminAddDepartment.jsp">Add Department</option>
<option name="viewdepartment" value="AdminViewDepartment.jsp">View Department</option>
</select>
<br>
<form action="${pageContext.request.contextPath}/AdminAddDepartmentController" method="post">
<h2 id="depthead">Add Department</h2>
<label for="deptname">Department Name : </label>
<input type="text" name="departmentname"/>
<br>
<label for="deptloc">Department Location : </label>
<input type="text" name="departmentlocation"/>
<br>
<input type="submit" value="Submit"/>
</form>
<br>
<hr>
<%@include file="Include/Footer.jsp"%>
</body>
</html>