<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <title>Payment Success</title>
    <link rel="icon" href="images/newLogo.JPG" type="image/jpg">
    <link rel="stylesheet" href="navBaarFooter.css">
    <style>
        body {
                font-family: Arial, sans-serif;
                background-color: #e0f7fa;
            }

            .loader {
                border: 4px solid #f3f3f3;
                border-top: 4px solid rgb(11, 206, 92);
                border-radius: 50%;
                width: 50px;
                height: 50px;
                animation: spin 1s linear infinite;
                margin: 20px auto;
            }

            @keyframes spin {
                0% {
                    transform: rotate(0deg);
                }

                100% {
                    transform: rotate(360deg);
                }
            }

            .success {
                display: none;
                text-align: center;
            }

            .success img {
                width: 80px;
                height: 80px;
            }

            .success h2 {
                color: rgb(11, 206, 98);
                margin-top: 10px;
                padding: 10px;
            }

            .success a {
                background-color: black;
                color: white;
                padding: 10px;
                position: relative;
                bottom: -30px;
                text-decoration: none;
                border-radius: 5px;
            }

            .success a:hover {
                background-color: white;
                color: black;
                border: 2px solid black;
            }

            .container {
                text-align: center;
                background: white;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                width: 40%;
                margin-left: 30%;
                margin-top: 3%;
                height: 39vh;
            }

            .head2 {
                height: 11vh;
            }

            .head2 a {
                height: 5vh;
            }
    </style>
</head>

<body>

	<div class="head2">
            <img src="images/ourlogo.svg" class="logo" alt="Logo">
            <a href="index.html" class="active">Home</a>
            <a href="netBanking.html">Net Banking</a>
            <a href="login.html">Login</a>
            <a href="AboutUs.html">About Us</a>
        </div>
    <div class="container">
    <div class="loader"></div>
    <div class="success">
    <img src="images/checkmark.png" alt="Success">
        <h2>Transaction Successful!</h2>

        <%
            // Session se values fetch kar rahe hain
            Object amountObj = session.getAttribute("amount");
            Object receiverAcnoObj = session.getAttribute("receiverAcno");

            // Agar null hai toh "N/A" show karein
            String amount = (amountObj != null) ? amountObj.toString() : "N/A";
            String receiverAcno = (receiverAcnoObj != null) ? receiverAcnoObj.toString() : "N/A";
        %>

        <p>Amount: <%= amount %> transferred successfully.</p>
        <p>To Account: <%= receiverAcno %></p>

        <p><a href="UserPayment.jsp">Back</a></p>
        </div>

        <%
            // ✅ Session attributes remove kar rahe hain taaki refresh pe purane details na dikhein
            session.removeAttribute("amount");
            session.removeAttribute("receiverAcno");
        %>
    </div>
    <footer>
            <div class="footer">
                <p>&copy; 2025 FinTrust Bank. All Rights Reserved.</p>
                <div class="contact-info">
                    <div>
                        <i class="email"><img src="images/mailIconeWhite.svg" alt="Email"></i>
                        <span>fintrustbank@gmail.com</span>
                    </div>
                    <div>
                        <i class="phone"><img src="images/PhoneIconWhite.svg" alt="Phone"></i>
                        <span>1800-1234-556</span>
                    </div>
                    <div>
                        <i class="location"><img src="images/location_onIconWhite.svg" alt="Location"></i>
                        <span>India, Bengaluru</span>
                    </div>
                </div>
            </div>
            </footer>
            <script>
                setTimeout(() => {
                    document.querySelector(".loader").style.display = "none";
                    document.querySelector(".success").style.display = "block";
                }, 1500);
            </script>
</body>

</html>
