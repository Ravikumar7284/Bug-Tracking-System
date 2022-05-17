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

@WebServlet("/AdminAddDepartmentController")
public class AdminAddDepartmentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String departmentname = request.getParameter("departmentname");
		String departmentlocation = request.getParameter("departmentlocation");
		
		try
		{
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/bts","help","help");
			
			String query = "INSERT INTO department (department_name,department_location) "
					+ "VALUES (?,?)";
			
			PreparedStatement stmt = connect.prepareStatement(query);
			
			stmt.setString(1,departmentname);
			stmt.setString(2,departmentlocation);
			
			int x = stmt.executeUpdate();
			
			if(x>0)
			{
				response.sendRedirect("AdminViewDepartment.jsp");
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
