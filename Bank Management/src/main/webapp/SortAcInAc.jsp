<%@ page import="java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<html>
<head>
    <title>Inactive Accounts</title>
     <link rel="icon" href="images\newLogo.JPG" type="image/jpg">
    <link rel="stylesheet" href="navBaarFooter.css">
    <style>
        /* Global reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #39ffcf0f;
            color: #333;
        }

       
        /* Table Styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table th, table td {
            padding: 12px 15px;
            text-align: left;
            font-size: 12px;
        }

        table th {
            background-color: #0000007a;
            color: white;
        }

        table tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        table tr:hover {
            background-color: #ddd;
        }

        table td form input[type="submit"] {
            background-color: #f44336;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
        }

        table td form input[type="submit"]:hover {
            background-color: #e53935;
        }
        
        .head2 a{
         height:8vh;
        }
        

    </style>
</head>
<body>

   <div class="head2">
        <img src="images\ourlogo.svg" class="logo" alt="Logo">
        <a href="index.html" class="active">Home</a>
        <a href="admin.jsp">Admin page</a>
        <a href="login.html">Login</a>
        <a href="login.html" class="logout-button" onclick="confirmLogout()">Logout</a>
    </div>

    <!-- Inactive Accounts List -->
    <h2 style="text-align:center;">Inactive Accounts</h2>

    <!-- Display Inactive Accounts Table -->
    <table border="1">
        <thead>
            <tr>
                <th>Sl No</th>
                <th>Account No</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Status</th>
                <th>Address</th>
                <th>City</th>
                <th>State</th>
                <th>Zipcode</th>
                <th>Aadhar No</th>
                <th>Created At</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%  
                Connection con = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;

                try {
                    String dbURL = "jdbc:mysql://localhost:3306/bankmanagement";
                    String dbUser = "root";
                    String dbPassword = "1234";

                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection(dbURL, dbUser, dbPassword);

                    String query = "SELECT * FROM user_data WHERE status = 'Inactive'"; 

                    stmt = con.prepareStatement(query);
                    rs = stmt.executeQuery();

                    while(rs.next()) {
            %>
                        <tr>
                            <td><%= rs.getInt("slno") %></td>
                            <td><%= rs.getInt("acno") %></td>
                            <td><%= rs.getString("fname") %></td>
                            <td><%= rs.getString("lname") %></td>
                            <td><%= rs.getString("email") %></td>
                            <td><%= rs.getString("phone") %></td>
                            <td><%= rs.getString("status") %></td>
                            <td><%= rs.getString("address") %></td>
                            <td><%= rs.getString("city") %></td>
                            <td><%= rs.getString("state") %></td>
                            <td><%= rs.getString("zipcode") %></td>
                            <td><%= rs.getString("aadharno") %></td>
                            <td><%= rs.getString("created_at") %></td>
                            <td>
                                <form action="ReqHandle" method="post">
                                    <input type="hidden" name="slno" value="<%= rs.getInt("slno") %>"/>
                                    <input type="submit" value="Activate" />
                                </form>
                            </td>
                        </tr>
            <%      }
                } catch(Exception e) {
                    e.printStackTrace();
                } finally {
                    try { if (rs != null) rs.close(); } catch(Exception e) {}
                    try { if (stmt != null) stmt.close(); } catch(Exception e) {}
                    try { if (con != null) con.close(); } catch(Exception e) {}
                }
            %>
        </tbody>
    </table>
    

</body>
</html>	<!-- done -->
