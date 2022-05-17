<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Employee</title>
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
<select name="employee" onchange = "location = this.value">
<option disabled selected value> Employees </option>
<option name="viewemployee" value="AdminViewEmployee.jsp">View Employee</option>
</select>
<br>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/bts","help","help");

String query = "SELECT * FROM registration";
Statement stmt = connect.createStatement();
ResultSet rs = stmt.executeQuery(query);
%>

<center>
<h2 id="empllist">View Employee</h2>
<table border="1" id="empltable">
<thead>
<th>User ID</th>
<th>First Name</th>
<th>Gender</th>
<th>Phone No</th>
<th>Email ID</th>
<th>Date of Joining</th>
<th>Department</th>
<th>Designation</th>
<th>Action</th>
</thead>

<% while(rs.next()) { %>
<tr>
<td><%=rs.getInt("user_id")%></td>
<td><%=rs.getString("first_name")%></td>
<td><%=rs.getString("gender")%></td>
<td><%=rs.getString("phone_no")%></td>
<td><%=rs.getString("email_id")%></td>
<td><%=rs.getString("date_of_joining")%></td>
<td><%=rs.getString("department")%></td>
<td><%=rs.getString("designation")%></td>
<td><a href="DeleteEmployee.jsp?id=<%=rs.getInt("user_id")%>" onclick="if(!confirm('Are you sure delete?')) return false">Delete</a></td>
</tr>
<% }%>

</table>
</center>
<br>
<hr>
<%@include file="Include/Footer.jsp"%>
</body>
</html>