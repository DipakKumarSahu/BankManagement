package businessLogic;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("Connecting to database..."); // ✅ Debugging Message
            return DriverManager.getConnection("jdbc:mysql://localhost:3306/bankmanagement", "root", "1234");
        } catch (Exception e) {
            e.printStackTrace();
            throw new SQLException("Error connecting to the database");
        }
    }
}

