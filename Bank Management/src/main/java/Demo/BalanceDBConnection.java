

	
	package Demo;

	import java.sql.Connection;
	import java.sql.DriverManager;
	import java.sql.SQLException;

	public class BalanceDBConnection {
	    public static Connection getConnection() throws SQLException {
	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            String url = "jdbc:mysql://localhost:3306/bankmanagement";
	            String username = "root";
	            String password = "1234";
	            return DriverManager.getConnection(url, username, password);
	        } catch (ClassNotFoundException e) {
	            e.printStackTrace();
	            throw new SQLException("Database driver not found", e);
	        }
	    }
	}

	

