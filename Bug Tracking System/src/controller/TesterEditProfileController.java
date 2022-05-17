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

@WebServlet("/TesterEditProfileController")
public class TesterEditProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userid = Integer.parseInt(request.getParameter("userid"));
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String uphone = request.getParameter("uphone");
		String uemail = request.getParameter("uemail");
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/bts","help","help");
			
			String query = "UPDATE registration SET first_name=?,last_name=?,phone_no=?,email_id=? where user_id='"+userid+"'";
			
			PreparedStatement stmt = connect.prepareStatement(query);
			
			stmt.setString(1, fname);
			stmt.setString(2,lname);
			stmt.setString(3,uphone);
			stmt.setString(4, uemail);
			
			int x = stmt.executeUpdate();
			
			if(x>0)
			{
				response.sendRedirect("TesterHome.jsp");
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
