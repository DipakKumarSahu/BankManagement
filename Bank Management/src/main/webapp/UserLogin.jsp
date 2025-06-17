<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
     <link rel="icon" href="images\newLogo.JPG" type="image/jpg">
    <link rel="stylesheet" href="navBaarFooter.css">
    <style>
        /* Basic reset for margin and padding */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #a6ecef3b;
            color: #333;
            line-height: 1.6;
        }


        /* Main Form Styling */
        .login-container {
            display: flex;
            justify-content: space-evenly;
            align-items: center;
            height: 80vh;
            padding: 20px;

        }

        .login-box {
            background-color: white;
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            width: 400px;
            /* text-align: center; */
        }

        .login-box h2 {
            margin-bottom: 20px;
            font-size: 40px;
            color: #0000005e;
            font-family: Verdana, Geneva, Tahoma, sans-serif;
            text-align: center;
        }

        .login-box label {
            font-size: 12px;
            margin-bottom: 10px;
            display: block;
        }

        .login-box input {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 7px;
            font-size: 12px;
        }

        .login-box button {
            background-color: #272525;
            color: rgb(196, 196, 196);
            border: 2px solid rgb(54, 53, 53);
            cursor: pointer;
            font-size: 12px;
            border-radius: 20px;
            width: 85px;
            margin-left: 10vw;
            height: 6vh;
        }

        .head2 {
            background-color: white;
            padding: 10px 0;
            text-align: center;
            position: relative;
            display: flex;
            justify-content: flex-end;
            gap: 40px;
            padding-right: 5%;
            height: 14vh;
            z-index: 20;
        }

        .head2 a {
            color: black;
            text-decoration: none;
            font-size: 18px;
            padding: 10px 15px;
            position: relative;
            margin-left: 20px;
            height: 8vh;
        }

        .footer {
            height: 82px;
        }
    </style>
</head>

<body>

    <div class="head2">
        <img src="images\ourlogo.svg" class="logo" alt="Logo">
        <a href="index.html" class="active">Home</a>
        <a href="createAc.jsp">Create Account</a>
        <a href="netBanking.html">Join Net Banking</a>
    </div>
    <!-- Login Form Container -->
    <div class="login-container">
        <img src="images/logingirl.svg" alt="Her">
        <div class="login-box">
            <h2>Login Here</h2>
            <form action="myServlet" method="post">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required>

                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>

                <!-- Updated Button -->
                <button type="submit">Login</button>

                <!-- Display Error Message -->
                <p class="error-message">${error}</p>
            </form>
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

</body>

</html> <!-- done -->