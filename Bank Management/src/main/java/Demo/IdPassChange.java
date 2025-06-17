package Demo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;

@WebServlet("/UpdateCredentialsServlet")
public class IdPassChange extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetching form data
        String acno = request.getParameter("acno");
        String aadhar = request.getParameter("aadhar");
        String newUsername = request.getParameter("newUsername");
        String newPassword = request.getParameter("newPassword");

        // Establishing connection with database using DBConnection class
        try (Connection conn = DBConnection.getConnection()) {
            // Debugging Message
            System.out.println("Connection established with database");

            // Step 1: Check if acno exists in the netbanking table
            String checkAcnoQuery = "SELECT acno FROM netbanking WHERE acno = ?";
            PreparedStatement checkAcnoStmt = conn.prepareStatement(checkAcnoQuery);
            checkAcnoStmt.setString(1, acno);
            ResultSet rsAcno = checkAcnoStmt.executeQuery();

            if (rsAcno.next()) { // ACNO exists
                System.out.println("ACNO exists: " + acno);

                // Step 2: Check if aadhar matches with the user_data table
                String checkAadharQuery = "SELECT aadharno FROM user_data WHERE acno = ?";
                PreparedStatement checkAadharStmt = conn.prepareStatement(checkAadharQuery);
                checkAadharStmt.setString(1, acno);
                ResultSet rsAadhar = checkAadharStmt.executeQuery();

                if (rsAadhar.next()) { // Aadhar matched
                    String dbAadhar = rsAadhar.getString("aadharno");

                    // Step 3: Check if the entered Aadhar matches the stored Aadhar
                    if (dbAadhar.equals(aadhar)) {
                        // Step 4: If all checks pass, update username or password in the netbanking table
                        String updateQuery = "UPDATE netbanking SET username = ?, password = ? WHERE acno = ?";
                        PreparedStatement updateStmt = conn.prepareStatement(updateQuery);
                        updateStmt.setString(1, newUsername);
                        updateStmt.setString(2, newPassword);
                        updateStmt.setString(3, acno);

                        int rowsUpdated = updateStmt.executeUpdate();

                        if (rowsUpdated > 0) {
                            // Success, forward to success page
                            request.setAttribute("message", "Your username and/or password has been successfully updated.");
                            request.getRequestDispatcher("IdPassupdateSuccess.jsp").forward(request, response);
                        } else {
                            // Error in update
                            request.setAttribute("message", "Failed to update username and/or password.");
                            request.getRequestDispatcher("IdPassChange.jsp").forward(request, response);
                        }
                    } else {
                        // Aadhar mismatch
                        request.setAttribute("message", "Aadhar number does not match.");
                        request.getRequestDispatcher("IdPassChange.jsp").forward(request, response);
                    }
                } else {
                    // Aadhar not found
                    request.setAttribute("message", "Aadhar number not found in our records.");
                    request.getRequestDispatcher("IdPassChange.jsp").forward(request, response);
                }
            } else {
                // ACNO not found
                request.setAttribute("message", "Account number not found.");
                request.getRequestDispatcher("IdPassChange.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("message", "Database error: " + e.getMessage());
            request.getRequestDispatcher("IdPassChange.jsp").forward(request, response);
        }
    }
}
