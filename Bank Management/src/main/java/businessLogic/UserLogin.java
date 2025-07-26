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

/**
 * Servlet implementation class UserLogin
 */
@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UserLogin() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();

        try {
            Connection conn = DBConnection.getConnection();
            
            // Step 1: Verify username and password in netbanking table
            String query1 = "SELECT * FROM netbanking WHERE username = ? AND password = ?";
            PreparedStatement stmt1 = conn.prepareStatement(query1);
            stmt1.setString(1, username);
            stmt1.setString(2, password);
            ResultSet rs1 = stmt1.executeQuery();

            if (rs1.next()) {
                // Step 2: If username and password are correct, fetch acno
                String dbUsername = rs1.getString("username");
                int acno = rs1.getInt("acno"); // Fetch acno of matched user

                // Step 3: Check if user_data table has "active" status for this acno
                String query2 = "SELECT status FROM user_data WHERE acno = ?";
                PreparedStatement stmt2 = conn.prepareStatement(query2);
                stmt2.setInt(1, acno);
                ResultSet rs2 = stmt2.executeQuery();

                if (rs2.next()) {
                    String status = rs2.getString("status");

                    // Debugging: print the status value to ensure it's being fetched correctly
                    System.out.println("User status from user_data table: " + status);

                    // Step 4: If status is "active", proceed with login
                    if ("active".equalsIgnoreCase(status)) {
                        float balance = rs1.getFloat("balance");

                        // Store user details in session
                        session.setAttribute("username", dbUsername);
                        session.setAttribute("balance", balance);
                        session.setAttribute("acno", acno);

                        // Redirect to welcome page
                        response.sendRedirect("UserWelcome.jsp");
                    } else {
                        // If status is not active, show error
                        request.setAttribute("error", "Account is inactive. Please contact support.");
                        RequestDispatcher dispatcher = request.getRequestDispatcher("UserLogin.jsp");
                        dispatcher.forward(request, response);
                    }
                } else {
                    // If no status found for acno in user_data table
                    request.setAttribute("error", "Account not found in user_data.");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("UserLogin.jsp");
                    dispatcher.forward(request, response);
                }
            } else {
                // If username or password is incorrect
                request.setAttribute("error", "Invalid Username or Password");
                RequestDispatcher dispatcher = request.getRequestDispatcher("UserLogin.jsp");
                dispatcher.forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Database Error");
            RequestDispatcher dispatcher = request.getRequestDispatcher("UserLogin.jsp");
            dispatcher.forward(request, response);
        }
    }
}
