<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>
<html>
<head>
    <title>Read All Data</title>
     <link rel="icon" href="images\newLogo.JPG" type="image/jpg">
    <style>
 h2{
   text-align:center;
 }
 
  a{
    	background-color:black;
    	color:white;
    	padding:10px;
    	text-decoration:none;
    	border-radius:5px;
    	
    }
    
    a:hover{
    background-color:white;
    color:black;
    border:2px solid black;
    }
    
    table{
    margin-top:20px;
    text-align:center;
    }
    
    ::-webkit-scrollbar {
    width: 9px;
	}

	::-webkit-scrollbar-track {
    	background: #58575746;
    	border-radius: 10px;
	}

	::-webkit-scrollbar-thumb {
   		background: #888;
    	border-radius: 10px;
    	border: 3px solid #f1f1f1;
	}

	::-webkit-scrollbar-thumb:hover {
   		 background: #353232;
	}
 
 
 
</style>
</head>

<body>
    <h2>All Users Data</h2>
    <a href="admin.jsp">Back</a>
    <table border="1">
        <tr>
        	 <th>SlNo</th>
            <th>Account Number</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>DOB</th>
            <th>Gender</th>
            <th>Aadhar No.</th>
            <th>Address</th>
            <th>City</th>
            <th>State</th>
            <th>Zip Code</th>
            <th>Balance</th>
        </tr>
        
        <%
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;
            try {
                // Database connection
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankmanagement", "root", "1234");
                stmt = con.createStatement();
                
                // Query to fetch data
                String query = "SELECT * FROM user_data";
                rs = stmt.executeQuery(query);
                
                while (rs.next()) {
        %>
        <tr>
        <td><%= rs.getInt("slno") %></td>
            <td><%= rs.getInt("acno") %></td>
            <td><%= rs.getString("fname") %></td>
            <td><%= rs.getString("lname") %></td>
            <td><%= rs.getString("email") %></td>
            <td><%= rs.getString("phone") %></td>
            <td><%= rs.getString("dob") %></td>
            <td><%= rs.getString("gender") %></td>
            <td><%= rs.getString("aadharno") %></td>
            <td><%= rs.getString("address") %></td>
            <td><%= rs.getString("city") %></td>
            <td><%= rs.getString("state") %></td>
            <td><%= rs.getString("zipcode") %></td>
            <td><%= rs.getString("balance") %></td>
        </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (con != null) con.close();
                } catch (SQLException se) {
                    se.printStackTrace();
                }
            }
        %>
    </table>
</body>
</html>
