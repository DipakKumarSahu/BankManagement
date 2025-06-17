<%@ page import="java.sql.*" %>
<%@ page import="Demo.DBConnection" %>  <%-- ✅ Correct Package Import --%>
<html>
<head>
    <title>Update Requests</title>
    <style>
   		 body{
   			 font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    		 background-color: #ffffff;
    		 color: #333;
   			 padding-left: 0;
    		overflow-x: hidden;
   			 background-image: url('images/Auto Layout Horizontal.svg');
    		background-size: cover;
   			 background-position: center;
   			 background-repeat: no-repeat;
    		background-attachment: fixed;
    }
        table {
            width: 80%;
            border-collapse: collapse;
            margin: 20px auto;
        }
        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid black;
        }
        th {
   			 background-color: #0000007a;
    		 color: white;
		}
        button {
            padding: 5px 10px;
            cursor: pointer;
            margin: 2px;
        }
         .backButton {
    		background-color: black;
    		color: white;
    		text-decoration: none;
    		width: 72px;
    		display: flex;
   			 height: 4vh;
    		border-radius: 6px;
   			 position: relative;
    		left: 30px;
   			 justify-content: center;
   			 padding-top:3px;
    }
        .approve { background-color: green; color: white; }
        .reject { background-color: red; color: white; }
    </style>
</head>
<body>
	<a class="backButton" href="admin.jsp">Back</a>
    <h2 align="center">Pending Update Requests</h2>
    <table>
        <tr>
            <th>Account No</th>
            <th>Column</th>
            <th>Old Value</th>
            <th>New Value</th>
            <th>Action</th>
        </tr>
        <%
            Connection con = null;
            PreparedStatement pst = null;
            ResultSet rs = null;
            try {
                con = DBConnection.getConnection();
                pst = con.prepareStatement("SELECT * FROM update_requests WHERE request_status='Pending'");
                rs = pst.executeQuery();
                
                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("acno") %></td>
            <td><%= rs.getString("column_name") %></td>
            <td><%= rs.getString("old_value") %></td>
            <td><%= rs.getString("new_value") %></td>
            <td>
                <form action="AdminApproveServlet" method="POST">
                    <input type="hidden" name="request_id" value="<%= rs.getInt("id") %>">
                    <input type="hidden" name="acno" value="<%= rs.getString("acno") %>">
                    <input type="hidden" name="column" value="<%= rs.getString("column_name") %>">
                    <input type="hidden" name="new_value" value="<%= rs.getString("new_value") %>">
                    <button type="submit" name="action" value="approve" class="approve">Approve</button>
                    <button type="submit" name="action" value="reject" class="reject">Reject</button>
                </form>
            </td>
        </tr>
        <% 
                } 
            } catch (Exception e) {
                out.println("<tr><td colspan='5' style='color:red;'>Error: " + e.getMessage() + "</td></tr>");
            } finally {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
                if (con != null) con.close();
            }
        %>
    </table>
</body>
</html>
