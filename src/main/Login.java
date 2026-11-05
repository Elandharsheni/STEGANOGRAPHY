package main;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Data.util;

@WebServlet("/Login1")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String em = request.getParameter("em");
		String pa = request.getParameter("pw");
		HttpSession session = request.getSession();

		if ("ADMIN@gmail.com".equalsIgnoreCase(em) && "ADMIN@123".equalsIgnoreCase(pa)) {
			request.getRequestDispatcher("admin.jsp").forward(request, response);
			return;
		}

		String query = "SELECT * FROM register WHERE email = ? AND password = ?";
		try (Connection connection = util.getconnection();
				PreparedStatement statement = connection.prepareStatement(query)) {
			statement.setString(1, em);
			statement.setString(2, pa);
			try (ResultSet rs = statement.executeQuery()) {
				if (rs.next()) {
					String role = rs.getString("enroll");
					String email = rs.getString("email");

					if ("LAB".equals(role)) {
						session.setAttribute("mail", email);
						session.setAttribute("Role", 6);
						request.getRequestDispatcher("Lab.jsp").forward(request, response);
						return;
					} else if ("DOCTOR".equals(role)) {
						session.setAttribute("mail", email);
						session.setAttribute("Role", role);
						session.setAttribute("id", rs.getString(1));
						session.setAttribute("name", rs.getString(2));
						request.getRequestDispatcher("doctor.jsp").forward(request, response);
						return;
					} else if ("STAFF".equals(role)) {
						session.setAttribute("mail", email);
						session.setAttribute("Role", role);
						session.setAttribute("id", rs.getString(1));
						session.setAttribute("name", rs.getString(2));
						request.getRequestDispatcher("staff.jsp").forward(request, response);
						return;
					}
				}
			}
			PrintWriter out = response.getWriter();
			out.print("<html><body><script>alert('Usermail or Password are incorrect')</script></body></html>");
			request.getRequestDispatcher("Login.jsp").include(request, response);
		} catch (SQLException e) {
			getServletContext().log("Database error during login.", e);
			response.sendError(HttpServletResponse.SC_SERVICE_UNAVAILABLE,
					"Database unavailable. Check STEGNO_DB_URL, STEGNO_DB_USER, and STEGNO_DB_PASSWORD.");
		}
	}

}
