<%@ page import="java.util.List" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="Demo.Transaction" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Transaction History</title>
    <link rel="icon" href="images/newLogo.JPG" type="image/jpg">
    <style>
    body {
        font-family: Arial, sans-serif;
        margin: 20px;
        padding: 20px;
        background-color: #f8f9fa;
    }

    h2 {
        text-align: center;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    th, td {
        border: 1px solid #ddd;
        padding: 10px;
        text-align: center;
    }

    th {
        background-color: #00000063;
        color: white;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    
    a {
        background-color: black;
        color: white;
        padding: 10px;
        text-decoration: none;
        border-radius: 5px;
    }
    
    a:hover {
        background-color: white;
        color: black;
        border: 2px solid black;
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
    <a href="admin.jsp">Back</a>
    
    <h2>Transaction History</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Sender Account</th>
            <th>Receiver Account</th>
            <th>Amount</th>
            <th>Date</th>
        </tr>
        <%
            List<Transaction> transactions = (List<Transaction>) request.getAttribute("transactions");
            if (transactions != null && !transactions.isEmpty()) {
                for (Transaction t : transactions) {
        %>
        <tr>
            <td><%= t.getId() %></td>
            <td><%= t.getAcno() %></td>
            <td><%= t.getReceiverAcno() %></td>
            <td><%= t.getAmount() %></td>
            <td><%= t.getDate() %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="5">No transactions found</td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>
