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

@WebServlet("/AdminUpdateProjectController")
public class AdminUpdateProjectController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String administratorname = request.getParameter("administratorname");
		String projectname = request.getParameter("projectname");
		String projectdescription = request.getParameter("projectdescription");
		String submissiondate = request.getParameter("submissiondate");

		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/bts","help","help");
			
			String query = "UPDATE project SET administrator_name=?,project_name=?,project_description=?,submission_date=? where administrator_name='"+administratorname+"'";
			
			PreparedStatement stmt = connect.prepareStatement(query);
			
			stmt.setString(1, administratorname);
			stmt.setString(2,projectname);
			stmt.setString(3,projectdescription);
			stmt.setString(4, submissiondate);
			
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


