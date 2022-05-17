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
import javax.sql.DataSource;


@WebServlet("/RegistrationController")
public class RegistrationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String fname = request.getParameter("fname");
		String lname= request.getParameter("lname");
		String gender = request.getParameter("gender");
		String dob = request.getParameter("dob");
		String uphone = request.getParameter("uphone");
		String uemail = request.getParameter("uemail");
		String doj = request.getParameter("doj");
		String department = request.getParameter("department");
		String designation = request.getParameter("designation");
		String userpasswd = request.getParameter("userpasswd");
		String confpasswd = request.getParameter("confpasswd");
		String hintquestion = request.getParameter("hintquestion");
		String hintanswer = request.getParameter("hintanswer");
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/bts","help","help");
		
			String query = "INSERT INTO registration"
					+ " (first_name,last_name,gender,date_of_birth,phone_no,email_id,date_of_joining,department,designation,user_password,confirm_password,hint_question,hint_answer)"
					+ " VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";

			
			PreparedStatement stmt = connect.prepareStatement(query);
			
			stmt.setString(1,fname);
			stmt.setString(2,lname);
			stmt.setString(3,gender );
			stmt.setString(4,dob);
			stmt.setString(5,uphone);
			stmt.setString(6,uemail);
			stmt.setString(7,doj);
			stmt.setString(8,department);
			stmt.setString(9,designation);
			stmt.setString(10,userpasswd);
			stmt.setString(11,confpasswd);
			stmt.setString(12,hintquestion);
			stmt.setString(13,hintanswer);
			
			int x=stmt.executeUpdate();
			
			
            if(x>0)
            {
                response.sendRedirect("Home.jsp");
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
