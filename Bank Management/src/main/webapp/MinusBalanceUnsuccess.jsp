<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Balance Deduction Failed</title>
    <link rel="icon" href="images\newLogo.JPG" type="image/jpg">
    <link rel="stylesheet" href="navBaarFooter.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e0f7fa;
        }

        h1 {
            color: red;
            text-align: center;
        }

        .message {
            padding: 20px;
            background-color: #f44336;
            color: white;
            border-radius: 5px;
            text-align: center;

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
        height: 35vh;
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

    .error {
        display: none;
        text-align: center;
    }

    .error img {
        width: 80px;
        height: 80px;
    }

    .error a{
        background-color: black;
        color: white;
        padding: 10px;
        position: relative;
        bottom: -20px;
        text-decoration: none;
        border-radius: 5px;
    }

    .error a:hover{
        background-color: white;
        color: black;
        border: 2px solid black;
    }

    </style>
</head>

<body>
    <div class="head2">
        <img src="images/ourlogo.svg" class="logo" alt="Logo">
        <a href="index.html" class="active">Home</a>
        <a href="createAc.jsp" class="cta-button">Create Account</a>
        <a href="login.html">Login</a>
    </div>
    <h1>Transaction Failed</h1>
    <div class="container">
        <div class="loader"></div>
        <div class="error">
            <img src="images/redCross.svg" alt="Error">
            <div class="message">
                <h3>Something went wrong!</h3>
                <p>Your transaction could not be completed. Please check your account and try again.</p>
            </div>
            <a href="MinusBalance.jsp">Go Back</a>
        </div>
    </div>
    
    <div class="footer">
        <p>&copy; 2025 FinTrust Bank. All Rights Reserved.</p>
        <div class="contact-info">
            <div>
                <i class="email"><img src="images\mailIconeWhite.svg" alt="Email"></i>
                <span>fintrustbank@gmail.com</span>
            </div>
            <div>

                <i class="phone"><img src="images\PhoneIconWhite.svg" alt="Phone"></i>
                <span>1800-1234-556</span>
            </div>
            <div>
                <i class="location"><img src="images\location_onIconWhite.svg" alt="Location"></i>
                <span>India, Bengaluru</span>
            </div>
        </div>
    </div>
    <script>
        setTimeout(() => {
            document.querySelector(".loader").style.display = "none";
            document.querySelector(".error").style.display = "block";
        }, 1500);
    </script>
</body>

</html> <!--done-->