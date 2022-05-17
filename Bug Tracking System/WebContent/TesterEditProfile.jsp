<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile</title>
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

String query = "SELECT * FROM registration where first_name='"+fname+"'";
Statement stmt = connect.createStatement();
ResultSet rs = stmt.executeQuery(query);
%>

<% while(rs.next()) { %>
<form action="${pageContext.request.contextPath}/TesterEditProfileController" method="post">
<h2 id="profilehead">Edit Profile</h2>

 <label for="userid">USER ID :</label>
<input type="text" name="userid" value="<%=rs.getInt("user_id") %>" readonly />
<br>

 <label for="firstname">First Name :</label>
 <input type="text" name="fname" value="<%=rs.getString("first_name") %>" required/>
<br>

 <label for="lastname">Last Name : </label>
<input type="text" name="lname" value="<%=rs.getString("last_name") %>" required/>
<br>

 <label for="phoneno">Phone No. : </label>
<input type="text" name="uphone" value="<%=rs.getInt("phone_no") %>" maxlength=10 required/>
<br>

 <label for="emailid">Email ID : </label>
<input type="text" name="uemail" value="<%=rs.getString("email_id") %>" required/>
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