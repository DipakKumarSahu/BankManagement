package Demo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class NetBankingCreate
 */
@WebServlet("/NetBankingCreate")
public class NetBankingCreate extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String accountno = request.getParameter("accountno");
        String aadharno = request.getParameter("aadharno");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmpassword = request.getParameter("confirmpassword");

        // Setup database connection
        String jdbcURL = "jdbc:mysql://localhost:3306/bankmanagement"; // Replace with your DB info
        String jdbcUsername = "root";
        String jdbcPassword = "1234";  // Replace with your DB password

        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            // Establish connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

            // Check if the account number and Aadhar number match and account is active
            String query = "SELECT * FROM user_data WHERE acno = ? AND aadharno = ? AND status = 'active'";
            pst = con.prepareStatement(query);
            pst.setString(1, accountno);
            pst.setString(2, aadharno);
            rs = pst.executeQuery();

            if (rs.next()) {
                // Account, Aadhar match and account is active
                if (password.equals(confirmpassword)) {
                    // Create new net banking account for the user (Do not insert Aadhar number)
                    String insertQuery = "INSERT INTO netbanking (acno, username, password, created_at) VALUES (?, ?, ?, NOW())";
                    pst = con.prepareStatement(insertQuery);
                    pst.setString(1, accountno);
                    pst.setString(2, username);
                    pst.setString(3, password);  // Aadhar number is not being saved here
                    pst.executeUpdate();

                    // Redirect to success page
                    response.sendRedirect("accountCreated.jsp");
                } else {
                    // Passwords do not match
                    response.sendRedirect("error.jsp?message=Passwords do not match");
                }
            } else {
                // Account number, Aadhar number do not match, or account is not active
                response.sendRedirect("error.jsp?message=Account Number and Aadhar Number do not match or account is not active");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?message=An error occurred. Please try again.");
        } finally {
            try {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
