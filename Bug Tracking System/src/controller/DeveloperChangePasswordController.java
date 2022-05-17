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

@WebServlet("/DeveloperChangePasswordController")
public class DeveloperChangePasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fname = request.getParameter("fname");
		String userpasswd = request.getParameter("userpasswd");
		String confpasswd = request.getParameter("confpasswd");
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/bts","help","help");
			
			String query = "UPDATE registration SET user_password=?,confirm_password=? where first_name='"+fname+"'";
			
			PreparedStatement stmt = connect.prepareStatement(query);
			
			stmt.setString(1, userpasswd);
			stmt.setString(2, confpasswd);
			
			if(userpasswd.equals(confpasswd))
			{
				int x = stmt.executeUpdate();
				{
					response.sendRedirect("DeveloperHome.jsp");
				}
			}
			
			else
			{
				response.sendRedirect("Error.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}

}
