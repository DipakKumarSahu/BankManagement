<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Data</title>
    <link rel="icon" href="images\newLogo.JPG" type="image/jpg">
    <link rel="stylesheet" href="navBaarFooter.css">
    <style>
        body {
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

        .head2 {
            height: 10vh;
        }

        .head2 a {
            height: 5vh;
        }

        .user-info {
            display: flex;
            justify-content: space-around;
        }

        .footer {
            bottom: -78px;
        }

        h1 {
            text-align: center;
            font-size: 45px;
            color: #0000005e;
            font-family: Verdana, Geneva, Tahoma, sans-serif;
        }
        
        h2 {
            text-align: center;
        }

        .form-box {
            background-color: rgba(255, 255, 255, 0);
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 525px;
            width: 70%;
            margin-left: 160px;
            height:60vh;
        }

        /* Styling for the rows where we want to display multiple columns in a single line */
        .info-row {
            display: flex;
            justify-content: space-between;
            padding: 8px 0;
        }

        .info-row th, .info-row td {
            padding: 5px;
        }

        .info-row td {
            width: 55%;
            border: 1px solid #ccc;
            border-radius:4px;
            background-color: #00000013;
            height:17px;
        }

        .info-row th {
            width: 35%;
            margin-bottom: 10px;
        }
        table{
        	width:100%;
        }
    </style>
</head>

<body>

    <div class="head2">
        <img src="images/ourlogo.svg" class="logo" alt="Logo">
        <a href="UserWelcome.jsp">back</a>
        <a href="index.html" class="active">Home</a>
        <a href="netBanking.html">Net Banking</a>
        <a href="login.html">Logout</a>
    </div>

    <h1>Welcome, <%= request.getAttribute("fname") %>
        <%= request.getAttribute("lname") %>!</h1>

    <div class="user-info">
        <div class="form-box">
            <h2>Your Account Information</h2>
            <table>
                <tr class="info-row">
                    <th>First Name</th>
                    <td><%= request.getAttribute("fname") %></td>
                    <th>Last Name</th>
                    <td><%= request.getAttribute("lname") %></td>
                </tr>
                <tr class="info-row">
                    <th>Email</th>
                    <td><%= request.getAttribute("email") %></td>
                    <th>Phone</th>
                    <td><%= request.getAttribute("phone") %></td>
                </tr>
                <tr class="info-row">
                    <th>Date of Birth</th>
                    <td><%= request.getAttribute("dob") %></td>
                    <th>Gender</th>
                    <td><%= request.getAttribute("gender") %></td>
                </tr>
                <tr class="info-row">
                    <th>Aadhar No.</th>
                    <td><%= request.getAttribute("aadharno") %></td>
                    <th>Acount No.</th>
                    <td><%= request.getAttribute("acno") %></td>
                </tr>
                <tr class="info-row">
                    <th style="width:13%">Address</th>
                    <td style="width:78%"><%= request.getAttribute("address") %></td>
                </tr>
                <tr class="info-row">
                    <th>City</th>
                    <td><%= request.getAttribute("city") %></td>
                    <th>State</th>
                    <td><%= request.getAttribute("state") %></td>
                    <th>Zipcode</th>
                    <td><%= request.getAttribute("zipcode") %></td>
                </tr>
                <tr class="info-row">
                </tr>
                <tr style="position:relative; top:-20px;" class="info-row">
                    <th>Balance</th>
                    <td style="width:33%; position:relative; right:30%"><%= request.getAttribute("balance") %></td>
                </tr>
            </table>
        </div>
        <img src="images/Left_hand.svg" alt="Example Image">
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
