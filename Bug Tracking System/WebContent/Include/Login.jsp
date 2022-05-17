<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="CSS/homestyle.css">
<title>Login</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/LoginController" method="post">
<select name="department" required>
  <option disabled selected value>--select an option--</option>
  <option value="development">Development</option>
  <option value="testing">Testing</option>
  <option value="administration">Administration</option>
</select>
<br>
 <label for="emailid">Email ID : </label>
<input type="text" name="uemail" required/>
<br>
 <label for="password">Password : </label>
<input type="password" name="userpasswd" required/>
<br>
<input type="submit" value="Login">
<br>
<p style="margin-left:80px">If New User <a href="Registration.jsp">Click Here</a></p>
</form>
</body>
</html>