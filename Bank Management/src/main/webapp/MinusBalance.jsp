<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Balance Deduction</title>
    <link rel="icon" href="images/newLogo.JPG" type="image/jpg">
    <link rel="stylesheet" href="navBaarFooter.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #ffffff;
            color: #333;
            overflow-x: hidden;
            background-image: url('images/Auto Layout Horizontal.svg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }

        .form-container {
            margin-top: 50px;
            width: 20vw;
            padding: 20px;
            border-radius: 10px;
            background-color: #30bfbd0f;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            height: 40vh;
        }

        .form-container input {
            margin: 13px 0;
            padding: 8px;
            width: 70%;
            background-color: #ebdada4f;
        }

        .form-container button {
            padding: 10px 20px;
            background-color: black;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin: 5% 0 0 30%;
        }

        .form-container button:hover {
            background-color: white;
            color: black;
            border: 2px solid black;
        }
    
        .box {
            display: flex;
            justify-content: space-around;
        }

        .box img {
            height: 65vh;
        }

        .head2 {
            height: 12vh;
        }

        h1 {
            text-align: center;
            font-size: 45px;
            color:#00000046;
        }

    </style>
</head>

<body>

    <div class="head2">
        <img src="images/ourlogo.svg" class="logo" alt="Logo">
        <a href="admin.jsp">Back</a>
        <a href="index.html" class="active">Home</a>
        <a href="netBanking.html">Net Banking</a>
        <a href="login.html">Login</a>  
    </div>

    <h1>Balance Deduction</h1>
    <div class="box">
        <div class="form-container">
            <form action="MinusBalance" method="post">
                <label for="acno">Account Number:</label>
                <input type="text" id="acno" name="acno" required><br>

                <label for="amount">Amount to Deduct:</label>
                <input type="number" id="amount" name="amount" required>

                <!-- Hidden input for receiver account (default to "Bank") -->
                <input type="hidden" name="receiver_acno" value="Bank">

                <button type="submit">Submit</button>
            </form>
        </div>
        <img src="images/ManWithLotOfMoney.svg" alt="image">
    </div>

    <div class="footer">
        <p>&copy; 2025 FinTrust Bank. All Rights Reserved.</p>
        <div class="contact-info">
            <div>
                <img src="images/mailIconeWhite.svg" alt="Email">
                <span>fintrustbank@gmail.com</span>
            </div>
            <div>
                <img src="images/PhoneIconWhite.svg" alt="Phone">
                <span>1800-1234-556</span>
            </div>
            <div>
                <img src="images/location_onIconWhite.svg" alt="Location">
                <span>India, Bengaluru</span>
            </div>
        </div>
    </div>
</body>
</html>
