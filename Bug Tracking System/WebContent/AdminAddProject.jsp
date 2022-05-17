<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Project</title>
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
<select name="project" onchange = "location = this.value">
<option disabled selected value> Projects </option>
<option name="addproject" value="AdminAddProject.jsp">Add Project</option>
<option name="viewproject" value="AdminViewProject.jsp">View Project</option>
<option name="updateproject" value="AdminUpdateProject.jsp">Update Project</option>
</select>

<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/bts","help","help");

String query = "SELECT first_name FROM registration where department='development'";
Statement stmt = connect.createStatement();
ResultSet rs = stmt.executeQuery(query);
%>

<br>
<form action="${pageContext.request.contextPath}/AdminAddProjectController" method="post">
<h2 id="projhead">Add Project</h2>
<label for="projectname">Project Name : </label>
<input type="text" name="projectname" required/>
<br>

<label for="projectdescription">Project Description : </label>
<textarea rows="4" cols="40" id="projdesc" name="projectdescription">
</textarea>
<br>

<label for="clientname">Client Name: </label>
<input type="text" name="clientname" required />
<br>

<label for="submissiondate">Submission Date : </label>
<input type="date" name="submissiondate" required/>
<br>


<label for="projectlead">Project Lead : </label>
<select name="projectlead">
<option disabled selected value> -- select an option -- </option>
<%while(rs.next()) { %>
<option name="employee"><%=rs.getString("first_name")%></option>
<%} %>
</select>
<br>

<label for="adminname">Administrator :</label>
<input type="text" name="administratorname" value="<%=fname%>" readonly/>
<br>

<input type="submit" value="Submit"/>
</form>
<br>
<hr>
<%@include file="Include/Footer.jsp"%>
</body>
</html>
</body>
</html>