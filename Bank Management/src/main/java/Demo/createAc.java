package Demo;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;

@WebServlet("/createAc")
public class createAc extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form data from the user
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String dob = request.getParameter("dob");
        String gender = request.getParameter("gender");
        String aadharno = request.getParameter("aadharno");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String zipcode = request.getParameter("zipcode");
        float balance = Float.parseFloat(request.getParameter("balance"));

        // Validate balance (should be >= 500)
        if (balance < 500) {
            response.sendRedirect("createAc.jsp"); // Redirect to error page if balance is less than 500
        } else {
            // Process account creation and generate the account number
            String newAcno = generateNewAcno();
            boolean isSuccess = createAccountInDatabase(newAcno, fname, lname, email, phone, dob, gender, aadharno, address, city, state, zipcode, balance);

            if (isSuccess) {
                // Set the new account number in the request attribute
                request.setAttribute("acno", newAcno);

                // Forward to the JSP page to display success
                RequestDispatcher dispatcher = request.getRequestDispatcher("ReqCreated.jsp");
                dispatcher.forward(request, response);
            } else {
                response.sendRedirect("ReqCreationError.jsp"); // Redirect to error page
            }
        }
    }

    private String generateNewAcno() {
        String newAcno = "";
        // Database connection details
        String url = "jdbc:mysql://localhost:3306/bankmanagement";
        String username = "root"; // MySQL username
        String password = "1234"; // MySQL password

        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Load the MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            con = DriverManager.getConnection(url, username, password);

            // Query to get the last account number
            String getLastAcnoQuery = "SELECT acno FROM user_data ORDER BY acno DESC LIMIT 1";
            stmt = con.prepareStatement(getLastAcnoQuery);
            rs = stmt.executeQuery();

            // Generate the new account number
            if (rs.next()) {
                // Get the last account number from the result
                String lastAcno = rs.getString("acno");

                // Extract the numeric part of the last account number (assuming the prefix is '33')
                int lastAcnoNum = Integer.parseInt(lastAcno.substring(2)); // Removing prefix '33'

                // Generate a random number between 1 and 5
                Random rand = new Random();
                int randomAdd = rand.nextInt(5) + 1; // This will generate a number between 1 and 5
                int newAcnoNum = lastAcnoNum + randomAdd;

                // Format the new account number with '33' prefix and ensure it's 7 digits long
                newAcno = "33" + String.format("%07d", newAcnoNum);
            } else {
                // If there's no account number in the database, start from '330000001'
                newAcno = "330000001";
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return newAcno; // Return the new generated account number
    }

    private boolean createAccountInDatabase(String acno, String fname, String lname, String email, String phone, String dob, String gender, String aadharno, String address, String city, String state, String zipcode, float balance) {
        // Insert the data into the database
        String url = "jdbc:mysql://localhost:3306/bankmanagement";
        String username = "root"; // MySQL username
        String password = "1234"; // MySQL password
        Connection con = null;
        PreparedStatement stmt = null;

        try {
            // Load the MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the connection
            con = DriverManager.getConnection(url, username, password);

            // SQL query to insert the data into the user_data table
            String query = "INSERT INTO user_data (acno, fname, lname, email, phone, dob, gender, aadharno, address, city, state, zipcode, balance) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            stmt = con.prepareStatement(query);

            // Set values to the prepared statement
            stmt.setString(1, acno); // Set generated account number
            stmt.setString(2, fname);
            stmt.setString(3, lname);
            stmt.setString(4, email);
            stmt.setString(5, phone);
            stmt.setString(6, dob);
            stmt.setString(7, gender);
            stmt.setString(8, aadharno);
            stmt.setString(9, address);
            stmt.setString(10, city);
            stmt.setString(11, state);
            stmt.setString(12, zipcode);
            stmt.setFloat(13, balance);

            // Execute the query
            int result = stmt.executeUpdate();
            return result > 0; // Return true if insert was successful, else false

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }
}
