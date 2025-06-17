// Admin paise bhejne ke liye
package Demo;

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

	@WebServlet("/addBalance")
	public class AddBalanceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AddBalanceServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String receiverAcno = request.getParameter("acno");
        float amount = Float.parseFloat(request.getParameter("amount"));

        HttpSession session = request.getSession();
        Connection conn = null;
        PreparedStatement checkStmt = null, updateStmt = null, transactionStmt = null;
        ResultSet rs = null;

        try {
            // Get connection to the database
            conn = BalanceDBConnection.getConnection();
            conn.setAutoCommit(false); // ✅ Transaction Start

            // Step 1: Check if receiver's account exists
            String checkAccountQuery = "SELECT balance FROM user_data WHERE acno = ?";
            checkStmt = conn.prepareStatement(checkAccountQuery);
            checkStmt.setString(1, receiverAcno);
            rs = checkStmt.executeQuery();

            if (!rs.next()) {
                // Account not found, rollback transaction
                session.setAttribute("error", "Account number does not exist.");
                conn.rollback();
                response.sendRedirect("balanceAddError.jsp");
                return;
            }

            // Account found
            float currentBalance = rs.getFloat("balance");

            // Step 2: Update the balance
            float newBalance = currentBalance + amount;
            String updateBalanceQuery = "UPDATE user_data SET balance = ? WHERE acno = ?";
            updateStmt = conn.prepareStatement(updateBalanceQuery);
            updateStmt.setFloat(1, newBalance);
            updateStmt.setString(2, receiverAcno);
            updateStmt.executeUpdate();

            // Step 3: Save the transaction in transaction history
            String insertTransactionQuery = "INSERT INTO transaction_history (acno, receiver_acno, amount, date) VALUES (?, ?, ?, NOW())";
            transactionStmt = conn.prepareStatement(insertTransactionQuery);
            transactionStmt.setString(1, "Bank"); // ✅ Sender = Admin
            transactionStmt.setString(2, receiverAcno); // ✅ Receiver = User
            transactionStmt.setFloat(3, amount);
            transactionStmt.executeUpdate();

            conn.commit(); // ✅ Transaction Commit

            // Step 4: Redirect to success page
            session.setAttribute("message", "Balance added successfully! New Balance: " + newBalance);
            response.sendRedirect("balanceSuccess.jsp");

        } catch (SQLException e) {
            e.printStackTrace();
            try {
                if (conn != null) {
                    conn.rollback(); // ✅ If error occurs, rollback changes
                    System.out.println("Transaction Rolled Back due to an error!");
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            session.setAttribute("error", "Database error occurred.");
            response.sendRedirect("balanceAddError.jsp");
        } finally {
            try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (checkStmt != null) checkStmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (updateStmt != null) updateStmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (transactionStmt != null) transactionStmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
}
