<%@ page import="java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Management</title>
    <link rel="icon" href="images\newLogo.JPG" type="image/jpg">
    <link rel="stylesheet" href="navBaarFooter.css">
    <style>
        /* Global reset */

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Body Styling */
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #ffffff; /* Full white background */
    color: #333;
    padding-left: 0; /* Remove left padding */
    overflow-x: hidden; /* Prevent horizontal scrolling */
    background-image: url('images/Auto Layout Horizontal.svg');
            /* Image ka path */
     background-size: cover;
            /* Puri screen cover karega */
    background-position: center;
            /* Center mein dikhayega */
    background-repeat: no-repeat;
            /* Repeat nahi hoga */
     background-attachment: fixed;
            /* Scroll karne pe image fixed rahegi */
     z-index: 10;
}

	

/* Content Section Styling */
.container {
    width: 99%;
    margin: 20px auto;
    padding: 20px;
    background-color:#39ffcf0f;
    border-radius: 8px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    overflow-X:scroll;
}

/* Search Box Styling */
.search-form {
    text-align: center;
    margin-bottom: 20px;
}

.search-form input[type="text"] {
    padding: 8px 12px;
    border: 2px solid black;
    border-radius: 5px;
    font-size: 16px;
    width: 250px;
    margin-right: 10px;
    transition: all 0.3s;
    height:36px;
} 

	
	.search-form input[type="submit"] {
    background-color: black;
    color: white;
    border: 2px solid black;
    padding: 8px 20px;
    font-size: 12px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s, color 0.3s; /* Size change avoid kiya */
}

.search-form input[type="submit"]:hover {
    background-color: white;
    color: black;
    border: 2px solid black;
}
	


.search-form input[type="text"]:focus {
    border-color: black;
    outline: none;
}


/* Table Styling */
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
    position: relative;
    left: -1px;
}

th, td {
    padding: 6px 10px;
    text-align: left;
    border-bottom: 1px solid #ddd;
    font-size: 13px; /* Reduced font size for better fitting */
}

th {
    background-color: #0000007a;
    color: white;
}

/*tr:hover {
    background-color: #4a2725a1;
    color:white;
}*/

/* Action Button Styling */
input[type="submit"] {
    background-color: #f44336;
    color: white;
    border: none;
    padding: 6px 10px;
    cursor: pointer;
    /*transition: background-color 0.3s;*/
    font-size: 14px;
}

input[type="submit"]:hover {
    background-color: #f44336;
}
  .footer{
   position:static;
  }
 
 form label{
     font-family: unset;
    font-size: 19px;
    font-weight: bold;
}
 
 .head2 a {
  height:8vh;
 }

    </style>
</head>

<body>

		<body>
    <div class="head2">
        <img src="images\ourlogo.svg" class="logo" alt="Logo">
        <a href="index.html" class="active">Home</a>
        <a href="admin.jsp">Admin page</a>
        <a href="login.html">Login</a>
        <a href="login.html" class="logout-button" onclick="confirmLogout()">Logout</a>
    </div>
        
 

    <!-- Content Section -->
    <div class="container">
        <!-- Search Form -->
        <div class="search-form">
            <form action="ReqHandle.jsp" method="get">
                <label for="acno">Search by Account Number: </label>
                <input type="text" name="acno" id="acno" placeholder="Enter Account Number" />
                <input type="submit" value="Search" />
            </form>
        </div>

        <h2 style="text-align:center;">All Account Data</h2>

		<div class="table-container">
        <!-- Table for Account Data -->
        <table border="1">
            <thead>
                <tr>
                    <th>Sl No</th>
                    <th>Account No</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Balance</th>
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

                    String acno = request.getParameter("acno");

                    try {
                        String dbURL = "jdbc:mysql://localhost:3306/bankmanagement";
                        String dbUser = "root";
                        String dbPassword = "1234";

                        Class.forName("com.mysql.cj.jdbc.Driver");
                        con = DriverManager.getConnection(dbURL, dbUser, dbPassword);

                        String query = "SELECT * FROM user_data";
                        if (acno != null && !acno.isEmpty()) {
                            query += " WHERE acno = ?";
                            stmt = con.prepareStatement(query);
                            stmt.setInt(1, Integer.parseInt(acno));
                        } else {
                            stmt = con.prepareStatement(query);
                        }

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
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        +
                        
                        
                        
                        
                                <td><%= rs.getString("balance") %></td>
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
                                        <input type="submit" value="<%= rs.getString("status").equals("Active") ? "Deactivate" : "Activate" %>" />
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
       </div>
    </div>

   
<footer>
     <div class="footer">
        <p>&copy; 2025 FinTrust Bank. All Rights Reserved.</p>
        <div class="contact-info">
            <div>
                <i class="email"><img src="images\mailIconeWhite.svg" alt="Email"></i>
                <span>fintrustbank@gmail.com</span>
            </div>
            <div>
                <!-- Changed to fa-phone (correct phone icon) -->
                <i class="phone"><img src="images\PhoneIconWhite.svg" alt="Phone"></i>
                <span>1800-1234-556</span>
            </div>
            <div>
                <i class="location"><img src="images\location_onIconWhite.svg" alt="Location"></i>
                <span>India, Bengaluru</span>
            </div>
        </div>
    </div>
    </footer>

    <script>
        function confirmLogout() {
            const confirmAction = confirm("Do you want to logout?");
            if (confirmAction) {
                // Perform logout action here (e.g., redirect to login page)
                window.location.href = "login.html"; // Redirect to login page or any other action
            }
        }
    </script>

</body>
</html>
