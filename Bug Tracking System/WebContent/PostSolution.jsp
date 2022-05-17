<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Post Solution</title>
<link rel="stylesheet" type="text/css" href="CSS/departmentstyle.css">
</head>

<body>
<%@include file="Include/Header.jsp"%>
<hr>
<table id="linktable">
<tr>
<td>
<a href="DeveloperHome.jsp">[ Home ]</a>
</td>
<td>
<a href="Logout.jsp">[ Logout ]</a>
</td>
</tr>
</table>
<br><br>
<select name="review" onchange = "location = this.value">
<option disabled selected value> Bug Review </option>
<option name="viewbugs" value="DeveloperViewBug.jsp">View Bugs</option>
<option name="editprofile" value="DeveloperEditProfile.jsp">Edit Profile</option>
<option name="changepassword" value="DeveloperChangePassword.jsp">Change Password</option>
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

String query = "SELECT * FROM bugs where employee_name='"+fname+"'";
Statement stmt = connect.createStatement();
ResultSet rs = stmt.executeQuery(query);
%>
<% if(rs.next()) { %>
<form action="${pageContext.request.contextPath}/PostSolutionController" method="post">
<h2 id="solutionhead">Solution</h2>

<label for="bugname">Bug Name :</label>
<input type="text" name="bugname" value="<%=rs.getString("bug_name")%>"  readonly/>
<br>
<%} %>
<label for="status">Status : </label>
<select name="status" required>
<option disabled selected value>--select an option--</option>
<option name="open" >Open</option>
<option name="inprgress">In Progress</option>
<option name="closed">Closed</option>
</select>
<br>

<textarea id="solutext" name="solutiontext" rows="5" cols="40">
</textarea>
<br>
<input type="submit" value="Submit"/>
</form>

<br>
<hr>
<%@include file="Include/Footer.jsp"%>
</body>
</html>