package businessLogic;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/UserWelcomeServlet")
public class UserDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserDetails() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");  // Get username from session

        if (username != null) {
            try {
                // Establish connection to the database
                Connection conn = DBConnection.getConnection();

                // Query to get acno (account number) from netbanking table based on the username
                String query1 = "SELECT acno FROM netbanking WHERE username = ?";
                PreparedStatement stmt1 = conn.prepareStatement(query1);
                stmt1.setString(1, username);
                ResultSet rs1 = stmt1.executeQuery();

                if (rs1.next()) {
                    String acno = rs1.getString("acno");  // Get the account number from the netbanking table

                    // Query to get user details from user_data table using the acno
                    String query2 = "SELECT acno, fname, lname, email, phone, dob, gender, aadharno, address, city, state, zipcode, balance FROM user_data WHERE acno = ?";
                    PreparedStatement stmt2 = conn.prepareStatement(query2);
                    stmt2.setString(1, acno);
                    ResultSet rs2 = stmt2.executeQuery();

                    if (rs2.next()) {
                        // Set user details as attributes for JSP
                    	request.setAttribute("acno", rs2.getString("acno"));
                        request.setAttribute("fname", rs2.getString("fname"));
                        request.setAttribute("lname", rs2.getString("lname"));
                        request.setAttribute("email", rs2.getString("email"));
                        request.setAttribute("phone", rs2.getString("phone"));
                        request.setAttribute("dob", rs2.getString("dob"));
                        request.setAttribute("gender", rs2.getString("gender"));
                        request.setAttribute("aadharno", rs2.getString("aadharno"));
                        request.setAttribute("address", rs2.getString("address"));
                        request.setAttribute("city", rs2.getString("city"));
                        request.setAttribute("state", rs2.getString("state"));
                        request.setAttribute("zipcode", rs2.getString("zipcode"));
                        request.setAttribute("balance", rs2.getFloat("balance"));
                    } else {
                        // If no data is found for the acno
                        request.setAttribute("error", "User data not found.");
                    }
                } else {
                    // If no acno is found for the username
                    request.setAttribute("error", "Account not found.");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("error", "Database error.");
            }

            // Forward the request to the UserWelcome.jsp page to display user data
            RequestDispatcher dispatcher = request.getRequestDispatcher("UserData.jsp");
            dispatcher.forward(request, response);
        } else {
            // If no username is found in session, redirect to login page
            response.sendRedirect("login.html");
        }
    }
}

	