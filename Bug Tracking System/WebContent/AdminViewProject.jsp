
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Project</title>
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
<br>
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

<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/bts","help","help");

String query = "SELECT * FROM project";
Statement stmt = connect.createStatement();
ResultSet rs = stmt.executeQuery(query);
%>
 
<center>
<h2 id="projlist">View Project</h2>
<table border="1" id="bugtable">
<thead>
<th>Project Name</th>
<th>Project Description</th>
<th>Client Name</th>
<th>Submission Date</th>
<th>Project Lead</th>
<th>Administrtor Name</th>
<th>Update Action</th>
<th>Delete Action</th>
</thead>

<% while(rs.next()) { %>
<tr>
<td><%=rs.getString("project_name")%></td>
<td><%=rs.getString("project_description")%></td>
<td><%=rs.getString("client_name")%></td>
<td><%=rs.getString("submission_date")%></td>
<td><%=rs.getString("project_lead")%></td>
<td><%=rs.getString("administrator_name") %></td>
<td><a href="AdminUpdateProject.jsp?name=<%=rs.getString("project_name")%>">Update</a></td>
<td><a href="DeleteProject.jsp?name=<%=rs.getString("project_name")%>" onclick="if(!confirm('Are you sure delete?')) return false">Delete</a> </td>
</tr>
<% }%>

</table>
</center>
<br>
<hr>
<%@include file="Include/Footer.jsp"%>
</body>
</html>