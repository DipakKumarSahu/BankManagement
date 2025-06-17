package Demo;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;

@WebServlet("/TransactionServlet")
public class TransactionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Transaction> transactions = new ArrayList<>();
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection();
            conn.setAutoCommit(false); // ✅ Transaction Start

            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT * FROM transaction_history ORDER BY date DESC");

            System.out.println("Fetching transactions from database..."); // ✅ Debugging Message

            while (rs.next()) {
                Transaction t = new Transaction();
                t.setId(rs.getInt("id"));
                t.setAcno(rs.getString("acno"));
                t.setReceiverAcno(rs.getString("receiver_acno"));
                t.setAmount(rs.getFloat("amount"));
                t.setDate(rs.getTimestamp("date"));
                transactions.add(t);
            }

            System.out.println("Total transactions fetched: " + transactions.size()); // ✅ Check transaction count

            conn.commit(); // ✅ Transaction Commit

        } catch (Exception e) {
            e.printStackTrace();
            if (conn != null) {
                try {
                    conn.rollback(); // ✅ If error occurs, rollback changes
                    System.out.println("Transaction Rolled Back due to an error!");
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        } finally {
            try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }

        request.setAttribute("transactions", transactions);
        RequestDispatcher dispatcher = request.getRequestDispatcher("transactions.jsp");
        dispatcher.forward(request, response);
    }
}                                                                                                                                                                            
