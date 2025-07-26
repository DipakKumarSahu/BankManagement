package businessLogic;

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

/**
 * Servlet implementation class ReqHandle
 */
@WebServlet("/ReqHandle")
public class ReqHandle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
int slno = Integer.parseInt(request.getParameter("slno"));
        
        Connection con = null;
        PreparedStatement stmt = null;
        
        try {
            String dbURL = "jdbc:mysql://localhost:3306/bankmanagement";
            String dbUser = "root";
            String dbPassword = "1234";
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(dbURL, dbUser, dbPassword);
            
            
            // Fetch current status
            String query = "SELECT status FROM user_data WHERE slno = ?";
            stmt = con.prepareStatement(query);
            stmt.setInt(1, slno);
            ResultSet rs = stmt.executeQuery();
            
            String currentStatus = null;
            if (rs.next()) {
                currentStatus = rs.getString("status");
            }
            
            // Toggle the status
            String newStatus = (currentStatus.equals("Active")) ? "Inactive" : "Active";
            
            // Update the status in database
            query = "UPDATE user_data SET status = ? WHERE slno = ?";
            stmt = con.prepareStatement(query);
            stmt.setString(1, newStatus);
            stmt.setInt(2, slno);
            int rowsAffected = stmt.executeUpdate();
            
            if (rowsAffected > 0) {
                response.sendRedirect("ReqHandle.jsp");
            } else {
                response.getWriter().println("Error updating status.");
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            try { if (stmt != null) stmt.close(); } catch(Exception e) {}
            try { if (con != null) con.close(); } catch(Exception e) {}
        }
            
	}

}
