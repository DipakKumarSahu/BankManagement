<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Transfer Money - FinTrust Bank</title>
    <link rel="icon" href="images\newLogo.JPG" type="image/jpg">
    <link rel="stylesheet" href="navBaarFooter.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('images/Auto Layout Horizontal.svg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            z-index: 50;
        }

        .head2 {
            height: 10vh;
        }

        .head2 a {
            height: 5vh;
        }

        .box {
            display: flex;
            justify-content: space-around;
            margin-top: 55px;
        }

        .box img {
            height: 80vh;
        }

        label {
            display: block;
            margin-bottom: 8px;
        }

        input {
            width: 80%;
            padding: 8px;
            margin-bottom: 3px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            width: 40%;
            padding: 9px;
            background-color: #000000;
            color: white;
            border-radius: 55px;
            font-size: 12px;
            margin-left: 85px;
        }

        button:hover {
            background-color: #f7f7f7;
            color: black;
            border: 2px solid black;
        }

        .container {
            background-color: rgb(55 233 91 / 2%);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 22vw;
            height: 55vh;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        
        .footer{
			bottom:-62px;
		}
		
    </style>

    <script>
        function validateForm() {
            let senderAcno = document.getElementById("senderAcno").value;
            let receiverAcno = document.getElementById("receiverAcno").value;
            let amount = document.getElementById("amount").value;

            if (senderAcno === receiverAcno) {
                alert("❌ You cannot transfer money to your own account.");
                return false;
            }
            if (amount <= 0) {
                alert("❌ Please enter a valid amount.");
                return false;
            }

            return true;
        }
    </script>
</head>
<body>

<div class="head2">
        <img src="images\ourlogo.svg" class="logo" alt="Logo">
         <a href="UserWelcome.jsp">Back</a>
        <a href="index.html" class="active">Home</a>
        <a href="netBanking.html">Net Banking</a>
        <a href="UserLogin.jsp">Logout</a>
       
    </div>

   <div class="box">
        <img src="images/manWIthMoney.svg" alt="picture">	
    <div class="container">
        <h2>Transfer Money</h2>

        <% if (request.getAttribute("message") != null) { %>
            <p class="error"><%= request.getAttribute("message") %></p>
        <% } %>

        <form action="TransferMoneyServlet" method="post" onsubmit="return validateForm();">
            <label for="senderAcno">Your Account Number:</label>
            <input type="text" id="senderAcno" name="senderAcno" value="<%= session.getAttribute("acno") %>" readonly><br><br>

            <label for="receiverAcno">Receiver's Account Number:</label>
            <input type="text" id="receiverAcno" name="receiverAcno" required><br><br>

            <label for="amount">Amount:</label>
            <input type="number" id="amount" name="amount" required><br><br>

            <button type="submit">Send Money</button>
        </form>
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

</body>
</html>
