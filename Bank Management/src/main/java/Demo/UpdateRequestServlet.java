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

@WebServlet("/updateRequestServlet")
public class UpdateRequestServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String acno = (String) session.getAttribute("acno");  // Get account number from session

        String updateField = request.getParameter("updateField");  // Which field to update
        String newValue = request.getParameter(updateField);       // Get new value

        if (acno == null || updateField == null || newValue == null || newValue.trim().isEmpty()) {
            response.sendRedirect("UserUpdateError.jsp");
            return;
        }

        try (Connection con = DBConnection.getConnection()) {
            // Fetch old value
            String oldValue = null;
            PreparedStatement fetchOldValue = con.prepareStatement("SELECT " + updateField + " FROM user_data WHERE acno = ?");
            fetchOldValue.setString(1, acno);
            ResultSet rs = fetchOldValue.executeQuery();
            if (rs.next()) {
                oldValue = rs.getString(1);
            }

            if (oldValue == null) {
                response.sendRedirect("UserUpdateError.jsp");
                return;
            }

            // Insert update request
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO update_requests (acno, column_name, old_value, new_value) VALUES (?, ?, ?, ?)"
            );
            ps.setString(1, acno);
            ps.setString(2, updateField);
            ps.setString(3, oldValue);
            ps.setString(4, newValue);
            ps.executeUpdate();

            response.sendRedirect("UserUpdateSuccess.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("UserUpdateError.jsp");
        }
    }
}
