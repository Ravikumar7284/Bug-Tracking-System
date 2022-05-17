<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tester Home</title>
<link rel="stylesheet" type="text/css" href="CSS/departmentstyle.css">
</head>

<%
if(request.getParameter("param1")!=null){%>
    
<script>alert('Login Sucess!')</script>

<%}
if(request.getParameter("param2")!=null){%>

<script>alert('Please check login credentials!')</script>
 <%
}
%> 

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
<img alt="tester" src="Images/tester.png" id="adminimg"/>
<hr>
<%@include file="Include/Footer.jsp"%>
</body>
</html>