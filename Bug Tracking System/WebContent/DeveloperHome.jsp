<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Developer Home</title>
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
<img alt="developer" src="Images/developer.jpg" id="adminimg"/>
<hr>
<%@include file="Include/Footer.jsp"%>
</body>
</html>