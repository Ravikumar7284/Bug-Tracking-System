
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Bugs</title>
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

String query = "SELECT * FROM bugs";
Statement stmt = connect.createStatement();
ResultSet rs = stmt.executeQuery(query);
%>

<center>
<h2 id="buglist">View Bugs</h2>
<table border="1" id="bugtable">
<thead>
<th>Bug Name</th>
<th>Bug Type</th>
<th>Bug Level</th>
<th>Priority</th>
<th>Project Name</th>
<th>Tester Name</th>
<th>Bug Date</th>
<th>Employee Name</th>
<th>Status</th>
<th>Solution</th>
<th>Delete</th>
</thead>

<% while(rs.next()) { %>
<tr>
<td><%=rs.getString("bug_name")%></td>
<td><%=rs.getString("bug_type")%></td>
<td><%=rs.getString("bug_level")%></td>
<td><%=rs.getString("priority")%></td>
<td><%=rs.getString("project_name")%></td>
<td><%=rs.getString("tester_name")%></td>
<td><%=rs.getString("bugdate")%></td>
<td><%=rs.getString("employee_name")%></td>
<td><%=rs.getString("status")%></td>
<td><%=rs.getString("solution") %></td>
<td><a href="DeleteBugs.jsp?name=<%=rs.getString("bug_name")%>" onclick="if(!confirm('Are you sure delete?')) return false">Delete</a></td>
</tr>
<% }%>

</table>
</center>
<br>
<hr>
<%@include file="Include/Footer.jsp"%>
</body>
</html>