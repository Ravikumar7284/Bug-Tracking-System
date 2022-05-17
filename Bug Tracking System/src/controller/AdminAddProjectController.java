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
import javax.servlet.http.HttpSession;

@WebServlet("/AdminAddProjectController")
public class AdminAddProjectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String projectname = request.getParameter("projectname");
		String projectdescription = request.getParameter("projectdescription");
		String clientname = request.getParameter("clientname");
		String submissiondate = request.getParameter("submissiondate");
		String projectlead = request.getParameter("projectlead");
		String administratorname = request.getParameter("administratorname");
		
		try
		{

			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/bts","help","help");
			
			String query = "INSERT INTO project (project_name,project_description,client_name,submission_date,project_lead,administrator_name) "
					+ "VALUES (?,?,?,?,?,?)";
			
			PreparedStatement stmt = connect.prepareStatement(query);
			
			stmt.setString(1,projectname);
			stmt.setString(2,projectdescription);
			stmt.setString(3,clientname);
			stmt.setString(4,submissiondate);
			stmt.setString(5,projectlead);
			stmt.setString(6, administratorname);
			
			int x = stmt.executeUpdate();
			
			if(x>0)
			{
				response.sendRedirect("AdminViewProject.jsp");
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
