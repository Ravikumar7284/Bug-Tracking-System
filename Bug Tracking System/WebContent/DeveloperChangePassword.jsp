<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change Password</title>
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
<form action="${pageContext.request.contextPath}/DeveloperChangePasswordController" method="post">
<h2 id="passwordhead">Change Password</h2>

 <label for="firstname">First Name : </label>
<input type="text" name="fname" value="<%=fname%>" readonly />
<br>

 <label for="password">Password : </label>
<input type="password" name="userpasswd" required/>
<br>

 <label for="confirmpassword">Confirm Password : </label>
<input type="password" name="confpasswd" required/>
<br>

<input type="submit" value="Submit"/>
<br>
</form>
<br>
<hr>
<%@include file="Include/Footer.jsp"%>
</body>
</html>