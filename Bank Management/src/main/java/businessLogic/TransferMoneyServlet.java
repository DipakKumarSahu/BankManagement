package businessLogic;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;

@WebServlet("/TransferMoneyServlet")
public class TransferMoneyServlet extends HttpServlet {
 
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String senderAcno = request.getParameter("senderAcno");
        String receiverAcno = request.getParameter("receiverAcno");
        float amount = Float.parseFloat(request.getParameter("amount"));

        if (senderAcno.equals(receiverAcno)) {  // ✅ Self-transfer check
            request.setAttribute("message", "❌ You cannot transfer money to your own account.");
            request.getRequestDispatcher("UserPayment.jsp").forward(request, response);
            return;
        }

        Connection conn = null;
        PreparedStatement checkBalanceStmt = null;
        PreparedStatement checkReceiverStmt = null;
        PreparedStatement deductStmt = null;
        PreparedStatement addStmt = null;
        PreparedStatement insertTransactionStmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankmanagement", "root", "1234");

            conn.setAutoCommit(false); // Start transaction

            // Step 1: Check sender balance
            checkBalanceStmt = conn.prepareStatement("SELECT balance FROM user_data WHERE acno = ?");
            checkBalanceStmt.setString(1, senderAcno);
            ResultSet rs = checkBalanceStmt.executeQuery();

            float updatedBalance = 0.0f;  

            if (!rs.next() || rs.getFloat("balance") < amount) {
                request.setAttribute("message", "❌ Insufficient balance!");
                request.getRequestDispatcher("UserPayment.jsp").forward(request, response);
                return;
            } else {
                updatedBalance = rs.getFloat("balance") - amount;  
            }

            // Step 2: Check if receiver account exists
            checkReceiverStmt = conn.prepareStatement("SELECT acno FROM user_data WHERE acno = ?");
            checkReceiverStmt.setString(1, receiverAcno);
            ResultSet receiverRs = checkReceiverStmt.executeQuery();

            if (!receiverRs.next()) {  // ✅ Receiver ka account nahi mila
                request.setAttribute("message", "❌ Receiver account does not exist!");
                request.getRequestDispatcher("UserPayment.jsp").forward(request, response);
                return;
            }

            // Step 3: Deduct amount from sender
            deductStmt = conn.prepareStatement("UPDATE user_data SET balance = balance - ? WHERE acno = ?");
            deductStmt.setFloat(1, amount);
            deductStmt.setString(2, senderAcno);
            deductStmt.executeUpdate();

            // Step 4: Add amount to receiver
            addStmt = conn.prepareStatement("UPDATE user_data SET balance = balance + ? WHERE acno = ?");
            addStmt.setFloat(1, amount);
            addStmt.setString(2, receiverAcno);
            addStmt.executeUpdate();

            // Step 5: Insert transaction entry
            String transactionQuery = "INSERT INTO transaction_history (acno, receiver_acno, amount, date) VALUES (?, ?, ?, NOW())";
            insertTransactionStmt = conn.prepareStatement(transactionQuery);
            insertTransactionStmt.setString(1, senderAcno);
            insertTransactionStmt.setString(2, receiverAcno);
            insertTransactionStmt.setFloat(3, amount);
            insertTransactionStmt.executeUpdate();

            conn.commit(); // Commit transaction

            // ✅ Update session with new balance
            HttpSession session = request.getSession();
            session.setAttribute("balance", updatedBalance);
            session.setAttribute("amount", amount);
            session.setAttribute("receiverAcno", receiverAcno);

            request.getRequestDispatcher("PaymentSuccess.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            if (conn != null) {
                try { conn.rollback(); } catch (SQLException ex) { ex.printStackTrace(); }
            }
            request.setAttribute("message", "❌ Transaction failed due to an error!");
            request.getRequestDispatcher("PaymentFailure.jsp").forward(request, response);
        } finally {
            try { if (checkBalanceStmt != null) checkBalanceStmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (checkReceiverStmt != null) checkReceiverStmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (deductStmt != null) deductStmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (addStmt != null) addStmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (insertTransactionStmt != null) insertTransactionStmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
}
