<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Department</title>
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
<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/bts","help","help");

String query = "SELECT * FROM department";
Statement stmt = connect.createStatement();
ResultSet rs = stmt.executeQuery(query);
%>

<center>
<h2 id="deptlist">View Department</h2>
<table border="1" id="depttable">
<thead>
<th>Department Name</th>
<th>Department Location</th>
<th>Action</th>
</thead>

<% while(rs.next()) { %>
<tr>
<td><%=rs.getString("department_name")%></td>
<td><%=rs.getString("department_location")%></td>
<td><a href="DeleteDepartment.jsp?name=<%=rs.getString("department_name")%>" onclick="if(!confirm('Are you sure delete?')) return false">Delete</a></td>
</tr>
<% }%>

</table>
</center>
<br>
<hr>
<%@include file="Include/Footer.jsp"%>
</body>
</html>