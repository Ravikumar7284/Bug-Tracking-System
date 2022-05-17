package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uemail = request.getParameter("uemail");
		String userpasswd = request.getParameter("userpasswd");
		String department = request.getParameter("department");
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/bts","help","help");
			
			Statement stmt = connect.createStatement();
			
			String query = "SELECT * FROM registration where email_id ='"+uemail+"' AND user_password='"+userpasswd+"' AND department='"+department+"' ";
			
			ResultSet rs = stmt.executeQuery(query);
			int i=0;
			while(rs.next())
			{
				i++;
				String emailID = rs.getString("email_id");
				String passWD = rs.getString("user_password");
				String dept = rs.getString("department");
				
				if(uemail.equals(emailID) && userpasswd.equals(passWD) && dept.equals("development"))
				{
					request.getSession().invalidate();
					HttpSession session = request.getSession();
					session.setAttribute("fname",rs.getString("first_name"));
					response.sendRedirect("DeveloperHome.jsp?param1=success");
				}
				 if(uemail.equals(emailID) && userpasswd.equals(passWD) && dept.equals("testing"))
				{
					request.getSession().invalidate();
					HttpSession session = request.getSession();
					session.setAttribute("fname",rs.getString("first_name"));
					response.sendRedirect("TesterHome.jsp?param1=success");
				}
				if(uemail.equals(emailID) && userpasswd.equals(passWD) && dept.equals("administration"))
				{
					request.getSession().invalidate();
					HttpSession session = request.getSession();
					session.setAttribute("fname",rs.getString("first_name"));
					response.sendRedirect("AdminHome.jsp?param1=success");
				}
			}
			
			if(i==0)
			{
				response.sendRedirect("Error.jsp");
			}
	
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
