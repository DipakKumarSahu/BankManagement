package businessLogic;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/MinusBalance")
public class MinusBalance extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public MinusBalance() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get account number and amount from the request
        String acno = request.getParameter("acno");
        String receiverAcno = "Bank"; // Hardcoded receiver account as "Bank"
        double amount = Double.parseDouble(request.getParameter("amount"));

        // Set response content type
        response.setContentType("text/html");

        // Database connection
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Use the DBConnection class to get a connection
            conn = DBConnection.getConnection();

            // Check if account exists and get the current balance
            String checkBalanceQuery = "SELECT balance FROM user_data WHERE acno = ?";
            ps = conn.prepareStatement(checkBalanceQuery);
            ps.setString(1, acno);
            rs = ps.executeQuery();

            if (rs.next()) {
                double balance = rs.getDouble("balance");

                if (balance >= amount) {
                    // Deduct the amount from the balance
                    String updateBalanceQuery = "UPDATE user_data SET balance = balance - ? WHERE acno = ?";
                    ps = conn.prepareStatement(updateBalanceQuery);
                    ps.setDouble(1, amount);
                    ps.setString(2, acno);
                    int rowsUpdated = ps.executeUpdate();

                    if (rowsUpdated > 0) {
                        // Insert transaction history with receiver_acno as "Bank"
                        String insertHistoryQuery = "INSERT INTO transaction_history (acno, receiver_acno, amount, date) VALUES (?, ?, ?, NOW())";
                        ps = conn.prepareStatement(insertHistoryQuery);
                        ps.setString(1, acno);
                        ps.setString(2, receiverAcno); // Receiver account is "Bank"
                        ps.setDouble(3, amount);
                        ps.executeUpdate();

                        // Success - redirect to the success page
                        response.sendRedirect("MinusBalanceSuccess.jsp?balance=" + (balance - amount));
                    } else {
                        // Failure - redirect to the unsuccessful page
                        response.sendRedirect("MinusBalanceUnsuccess.jsp");
                    }
                } else {
                    // Insufficient funds - redirect to the unsuccessful page
                    response.sendRedirect("MinusBalanceUnsuccess.jsp");
                }
            } else {
                // Account not found - redirect to the unsuccessful page
                response.sendRedirect("MinusBalanceUnsuccess.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("MinusBalanceUnsuccess.jsp");
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    }
}
