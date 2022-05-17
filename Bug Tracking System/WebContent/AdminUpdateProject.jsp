<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Project</title>
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
<%
String fname= (String)session.getAttribute("fname");
String name = request.getParameter("name");
%>     
<h2>Welcome <%=fname%></h2>
<br>
<select name="project" onchange = "location = this.value">
<option disabled selected value> Projects </option>
<option name="addproject" value="AdminAddProject.jsp">Add Project</option>
<option name="viewproject" value="AdminViewProject.jsp">View Project</option>
<option name="updateproject" value="AdminUpdateProject.jsp">Update Project</option>
</select>
<br>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/bts","help","help");

String query = "SELECT * FROM project where project_name='"+name+"'";
Statement stmt = connect.createStatement();
ResultSet rs = stmt.executeQuery(query);
%>

<% while(rs.next()) { %>
<form action="${pageContext.request.contextPath}/AdminUpdateProjectController" method="post">
<h2 id="projhead">Update Project</h2>

<label for="adminname">Administrator :</label>
<input type="text" name="administratorname" value="<%=fname%>" readonly/>
<br>

<label for="projectname">Project Name : </label>
<input type="text" name="projectname" value="<%=rs.getString("project_name") %>" required readonly/>
<br>

<label for="projectdescription">Project Description : </label>
<textarea rows="4" cols="40" id="projdesc" name="projectdescription">
 <%=rs.getString("project_description") %>
</textarea>
<br>

<label for="submissiondate">Submission Date : </label>
<input type="date" name="submissiondate" value="<%=rs.getString("submission_date") %>" required/>
<br>

<input type="submit" value="Submit"/>
<br>
</form>
<%} %>
<br>
<hr>
<%@include file="Include/Footer.jsp"%>
</body>
</html>