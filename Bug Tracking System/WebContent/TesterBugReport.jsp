<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bug Report</title>
<link rel="stylesheet" type="text/css" href="CSS/departmentstyle.css">
</head>

<body>
<%@include file="Include/Header.jsp"%>
<hr>
<table id="linktable">
<tr>
<td>
<a href="TesterHome.jsp">[ Home ]</a>
</td>
<td>
<a href="Logout.jsp">[ Logout ]</a>
</td>
</tr>
</table>
<br><br>
<select name="review" onchange = "location = this.value">
<option disabled selected value> Bug Review </option>
<option name="bugreport" value="TesterBugReport.jsp">Bug Report</option>
<option name="viewbugs" value="TesterViewBugs.jsp">View Bugs</option>
<option name="editprofile" value="TesterEditProfile.jsp">Edit Profile</option>
<option name="changepassword" value="TesterChangePassword.jsp">Change Password</option>
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
String query = "SELECT project_name FROM project";
ResultSet rs1,rs2;
Statement stmt1,stmt2; 
stmt1= connect.createStatement();
rs1 = stmt1.executeQuery(query);
String sql = "SELECT project_lead from project";
stmt2 = connect.createStatement();
rs2 = stmt2.executeQuery(sql);
%>

<form action="${pageContext.request.contextPath}/TesterBugReportController" method="post">
<h2 id="bughead"b>Assign Bug</h2>
 <label for="bugname">Bug Name : </label>
 <input type="text" name="bugname" required/>
 <br>
 <label for="bugtype">Bug Type: </label>
 <input type="text" name="bugtype" required/>
 <br>
<label for="buglevel">Bug Level : </label>
<select name="buglevel" required>
<option disabled selected value>--select an option--</option>
<option name="level1" >Level 1</option>
<option name="level2">Level 2</option>
<option name="level3">Level 3</option>
</select>
<br>
<label for="priority">Priority : </label>
<select name="priority" required>
<option disabled selected value>--select an option--</option>
<option name="low" >Low</option>
<option name="medium">Medium</option>
<option name="high">High</option>
</select>
<br>
<label for="projectname">Project Name : </label>
<select name="projectname" required>
<option disabled selected value>--select an option--</option>
<% while(rs1.next()) { %>
<option name="project"><%=rs1.getString("project_name") %></option> 
<% } %>
</select>
<br>

<label for="employeename">Employee Name : </label>
<select name="employeename" required>
<option disabled selected value>--select an option--</option>
<% while(rs2.next()) { %>
<option name="project"><%=rs2.getString("project_lead") %></option> 
<% } %>
</select>
<br>

<label for="testername">Tester Name : </label>
<input type="text" name="testername" value="<%=fname%>" required readonly/>
<br>
<label for="bugdate">Bug Date : </label>
<input type="date" name="bugdate"/>
<br>

<label for="status">Status : </label>
<select name="status" required>
<option disabled selected value>--select an option--</option>
<option name="open" >Open</option>
<option name="inprgress">In Progress</option>
<option name="closed">Closed</option>
</select>
<br>
<input type="submit" value="Submit"/>
</form>
<br>
<hr>
<%@include file="Include/Footer.jsp"%>
</body>
</html>