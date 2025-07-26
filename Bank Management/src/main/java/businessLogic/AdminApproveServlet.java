package businessLogic;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/AdminApproveServlet")
public class AdminApproveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int requestId = Integer.parseInt(request.getParameter("request_id"));
        String acno = request.getParameter("acno");
        String column = request.getParameter("column");
        String newValue = request.getParameter("new_value");
        String action = request.getParameter("action");

        try (Connection con = DBConnection.getConnection()) {  // ✅ Using DBConnection
            PreparedStatement ps;
            
            if ("approve".equals(action)) {
                // Update user_data table
                ps = con.prepareStatement("UPDATE user_data SET " + column + " = ? WHERE acno = ?");
                ps.setString(1, newValue);
                ps.setString(2, acno);
                ps.executeUpdate();

                // Mark request as approved
                ps = con.prepareStatement("UPDATE update_requests SET request_status='Approved' WHERE id=?");
                ps.setInt(1, requestId);
                ps.executeUpdate();
            } else {
                // Mark request as rejected
                ps = con.prepareStatement("UPDATE update_requests SET request_status='Rejected' WHERE id=?");
                ps.setInt(1, requestId);
                ps.executeUpdate();
            }

            response.sendRedirect("adminUpdateRequests.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}