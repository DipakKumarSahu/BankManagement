<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Transaction History</title>
    <link rel="icon" href="images/newLogo.JPG" type="image/jpg">
    <link rel="stylesheet" href="navBaarFooter.css">
    <style>
        body {
            background-image: url('images/Auto Layout Horizontal.svg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }
        .head2 {
            height: 10vh;
        }
        .head2 a {
            height: 5vh;
        }
        h2 {
            text-align: center;
            margin: 10px 0 15px 0;
        }
        table {
            text-align: center;
            width: 80%;
            margin: auto;
            border-collapse: collapse;
        }
        .box {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }
        table th, table td {
            padding: 10px;
            border: 1px solid black;
        }
        table th {
            background-color: #0000007a;
            color: white;
        }
        .footer {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="head2">
        <img src="images/ourlogo.svg" class="logo" alt="Logo">
        <a href="UserWelcome.jsp">Back</a>
        <a href="index.html" class="active">Home</a>
        <a href="createAc.jsp" class="cta-button">Create Account</a>
        <a href="login.html">Login</a>
    </div>

    <h2>Your Transaction History</h2>

    <% 
        String acno = (String) session.getAttribute("acno");
        if (acno == null) { 
    %>
            <p style="color: red; text-align: center;">Error: Account number not found in session. Please log in again.</p>
    <%
            return; 
        } 

        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankmanagement", "root", "1234");

            // Fetch transactions where user is either sender or receiver
            String query = "SELECT * FROM transaction_history WHERE acno = ? OR receiver_acno = ? ORDER BY date DESC";
            pst = conn.prepareStatement(query);
            pst.setString(1, acno);
            pst.setString(2, acno);
            rs = pst.executeQuery();
    %>

    <div class="box">
        <table>
            <tr>
                <th>Sender Account</th>
                <th>Receiver Account</th>
                <th>Type</th>
                <th>Amount</th>
                <th>Date</th>
            </tr>
    <%  
            boolean hasTransactions = false;
            while (rs.next()) {
                hasTransactions = true;
                String senderAcno = rs.getString("acno");
                String receiverAcno = rs.getString("receiver_acno");
                String type = senderAcno.equals(acno) ? "Debit" : "Credit";
    %>
            <tr>
                <td><%= senderAcno %></td>
                <td><%= receiverAcno %></td>
                <td><%= type %></td>
                <td>₹<%= rs.getFloat("amount") %></td>
                <td><%= rs.getTimestamp("date") %></td>
            </tr>
    <%      
            }
            if (!hasTransactions) { 
    %>
            <tr>
                <td colspan="6">No transactions found.</td>
            </tr>
    <%      
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (pst != null) pst.close();
            if (conn != null) conn.close();
        }
    %>
        </table>
    </div>

</body>
</html>
