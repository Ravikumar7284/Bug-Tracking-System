package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/TesterBugReportController")
public class TesterBugReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String bugname = request.getParameter("bugname");
		String bugtype = request.getParameter("bugtype");
		String buglevel = request.getParameter("buglevel");
		String priority = request.getParameter("priority");
		String projectname = request.getParameter("projectname");
		String testername = request.getParameter("testername");
		String bugdate = request.getParameter("bugdate");
		String employeename = request.getParameter("employeename");
		String status = request.getParameter("status");
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/bts","help","help");
			
			String query = "INSERT INTO bugs(bug_name,bug_type,bug_level,priority,project_name,tester_name,bugdate,employee_name,status)"
					+ "VALUES(?,?,?,?,?,?,?,?,?)";
			
			PreparedStatement stmt = connect.prepareStatement(query);
			
			stmt.setString(1,bugname);
			stmt.setString(2,bugtype);
			stmt.setString(3,buglevel);
			stmt.setString(4,priority);
			stmt.setString(5,projectname);
			stmt.setString(6,testername);
			stmt.setString(7,bugdate);
			stmt.setString(8,employeename);
			stmt.setString(9,status);
			
			int x = stmt.executeUpdate();
			
			if(x>0)
			{
				response.sendRedirect("TesterViewBugs.jsp");
			}
			else
			{
				response.sendRedirect("Error.jsp");
			}
			
		}catch (Exception e) {
		e.printStackTrace();
		}
	}

}
