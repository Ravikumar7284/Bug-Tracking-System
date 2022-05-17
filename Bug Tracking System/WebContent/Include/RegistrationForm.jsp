<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
</head>
<body>
<h2>REGISTRATION FORM</h2>
<form action="${pageContext.request.contextPath}/RegistrationController" method="post" id="registrationform">

 <label for="userid">USER ID:</label>
<input type="text" name="userid" readonly />
<br>

 <label for="firstname">First Name :</label>
 <input type="text" name="fname" required/>
<br>

 <label for="lastname">Last Name : </label>
<input type="text" name="lname" required/>
<br>

 <label for="gender">Gender : </label>
<select name="gender">
<option disabled selected value> -- select an option -- </option>
<option value="male">Male</option>
<option value="female">Female</option>
<option value="notdisclosed">Not Disclosed</option>
</select>
<br>

 <label for="dateofbirth">Date of Birth : </label>
<input type="date" name="dob"/>
<br>

 <label for="phoneno">Phone No. : </label>
<input type="text" name="uphone" maxlength="10" required/>
<br>

 <label for="emailid">Email ID :</label>
 <input type="email" name="uemail" required>
<br>

 <label for="dateofjoining">Date of Joining : </label>
 <input type="date" name="doj" required/>
<br>

 <label for="department">Department : </label>
<select name="department" required>
<option disabled selected value> -- select an option -- </option>
  <option value="development">Development</option>
  <option value="testing">Testing</option>
  <option value="administration">Administration</option>
</select>
<br>

 <label for="designation">Designation :</label>
<select name="designation" required>
<option disabled selected value> -- select an option -- </option>
  <option value="developer">Developer</option>
  <option value="tester">Tester</option>
  <option value="administrator">Administrator</option>
</select>
<br>

 <label for="password">Password : </label>
<input type="password" name="userpasswd" id="userpasswd" required/>
<br>

 <label for="confirmpassword">Confirm Password : </label>
<input type="password" name="confpasswd" id="confpasswd" required/>
<br>

 <label for="hintquestion">Hint Question :</label>
<select name="hintquestion" required>
<option disabled selected value> -- select an option -- </option>
  <option value="mother">What is your mother  name?</option>
  <option value="food">What is your favorite food?</option>
  <option value="born">What city were you born in?</option>
</select>
<br>

<label for="hintanswer" >Hint Answer :</label>
 <input type="text" name="hintanswer" required/>
<br> 

<input type="submit" value="Register" onclick="return Validate()"/>
<input type="button" value="Reset" onclick="resetFunction()"/>
</form>

<script type="text/javascript">
    function Validate() {
        var password = document.getElementById("userpasswd").value;
        var confirmPassword = document.getElementById("confpasswd").value;;
        if (password != confirmPassword) {
            alert("Passwords do not match.");
            return false;
        }
        return true;
    }
</script>

<script>
function resetFunction() {
  document.getElementById("registrationform").reset();
}
</script>
</body>
</html>