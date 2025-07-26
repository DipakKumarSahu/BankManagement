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

@WebServlet("/myServlet")
public class myServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public myServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("username");
        String password = request.getParameter("password");

        // Step 1: Admin Login Check
        if (AdminLog.validateUser(userId, password)) {
            // If admin login is successful, redirect to the admin page
            response.setContentType("text/html");
            RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
            rd.include(request, response);
            return; // Stop further processing for admin login
        } 

        // Step 2: User Login Processing
        HttpSession session = request.getSession();
        try {
            // Establish connection to the database
            Connection conn = DBConnection.getConnection();

            // Step 3: Fetch account number (acno) from netbanking table based on username and password
            String query = "SELECT * FROM netbanking WHERE username = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, userId);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();

            // Step 4: If the username and password match in netbanking
            if (rs.next()) {
                // Get the username and acno from netbanking
                String dbUsername = rs.getString("username");
                String acno = rs.getString("acno");  // Get account number

                // Step 5: Use acno to get the corresponding status from user_data table
                String statusQuery = "SELECT status FROM user_data WHERE acno = ?";
                PreparedStatement statusStmt = conn.prepareStatement(statusQuery);
                statusStmt.setString(1, acno);
                ResultSet statusRs = statusStmt.executeQuery();

                // Step 6: If status is found for the account number
                if (statusRs.next()) {
                    String status = statusRs.getString("status");

                    // If status is "active", allow login
                    if ("active".equalsIgnoreCase(status)) {
                        // Step 7: Fetch balance from user_data table
                        String balanceQuery = "SELECT balance FROM user_data WHERE acno = ?";
                        PreparedStatement balanceStmt = conn.prepareStatement(balanceQuery);
                        balanceStmt.setString(1, acno);
                        ResultSet balanceRs = balanceStmt.executeQuery();

                        // Step 8: If balance is found for the account number
                        if (balanceRs.next()) {
                            float balance = balanceRs.getFloat("balance");

                            // Store user details in session
                            session.setAttribute("username", dbUsername);
                            session.setAttribute("balance", balance);
                            session.setAttribute("acno", acno);

                            // Redirect to the user welcome page
                            response.sendRedirect("UserWelcome.jsp");
                        } else {
                            // If balance not found for the given account number
                            request.setAttribute("error", "Account balance not found.");
                            RequestDispatcher dispatcher = request.getRequestDispatcher("UserLogin.jsp");
                            dispatcher.forward(request, response);
                        }
                    } else {
                        // If account status is inactive
                        request.setAttribute("error", "Account is inactive. Please contact support.");
                        RequestDispatcher dispatcher = request.getRequestDispatcher("UserLogin.jsp");
                        dispatcher.forward(request, response);
                    }
                } else {
                    // If status not found for the account number in user_data table
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
