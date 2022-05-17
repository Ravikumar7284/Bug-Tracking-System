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

@WebServlet("/PostSolutionController")
public class PostSolutionController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bugname = request.getParameter("bugname");
		String status = request.getParameter("status");
		String solutiontext = request.getParameter("solutiontext");
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/bts","help","help");
			
			String query = "UPDATE bugs SET status=?,solution=? where bug_name='"+bugname+"'";
			
			PreparedStatement stmt = connect.prepareStatement(query);
			
			stmt.setString(1, status);
			stmt.setString(2,solutiontext);
			
			int x = stmt.executeUpdate();
			
			if(x>0)
			{
				response.sendRedirect("DeveloperHome.jsp");
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


