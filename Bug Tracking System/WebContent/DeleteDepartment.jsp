<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String name=request.getParameter("name");
try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/bts","help","help");

	String query = "DELETE FROM department where department_name='"+name+"'";
	Statement stmt = connect.createStatement();
	int i = stmt.executeUpdate(query);
	
	if(i>0)
	{
		response.sendRedirect("AdminViewDepartment.jsp");
	}
	else
	{
		response.sendRedirect("Error.jsp");
	}
}
catch(Exception e)
{
e.printStackTrace();
}
%>