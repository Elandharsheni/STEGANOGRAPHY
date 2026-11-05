package main;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Data.util;


@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html");
		          
		String id=request.getParameter("id");
		String n=request.getParameter("name");  
		String email=request.getParameter("email");  
		String p=request.getParameter("number");  
		String pa=request.getParameter("pas"); 
		String a=request.getParameter("enroll");
		String s="ACTIVE";
		
		try (Connection connection = util.getconnection();
			PreparedStatement ps = connection.prepareStatement("insert into register values(?,?,?,?,?,?,?)")) {
			ps.setString(1,id);
			ps.setString(2,n);
			ps.setString(3,email);
			ps.setString(4,p);
			ps.setString(5,pa);
			ps.setString(6,a);
			ps.setString(7,s);

			if (ps.executeUpdate() > 0) {
			PrintWriter out = response.getWriter();
			out.print("<html><body><script>alert('Registered Successfully');</script></body></html>");
			RequestDispatcher rs= request.getRequestDispatcher("Login.jsp");
			rs.include(request,response);
			}
		} catch (SQLException e) {
			getServletContext().log("Database error during registration.", e);
			response.sendError(HttpServletResponse.SC_SERVICE_UNAVAILABLE,
				"Database unavailable. Check STEGNO_DB_URL, STEGNO_DB_USER, and STEGNO_DB_PASSWORD.");
		}
	}
}