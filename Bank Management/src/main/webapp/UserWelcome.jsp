<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome</title>
    <link rel="icon" href="images\newLogo.JPG" type="image/jpg">
    <link rel="stylesheet" href="navBaarFooter.css">
     <style>
        /* Global Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f9;
            color: #333;
            overflow-y: scroll;
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

        /* Navbar */

        .nav-right {
            text-align: center;
            margin-top: 10px;
        }

        .nav-right .username {
            font-size: 18px;
            font-weight: bold;
        }

        .logout-btn {
            background-color: #e74c3c;
            color: white;
            border: none;
            padding: 8px 15px;
            cursor: pointer;
            border-radius: 5px;
            font-size: 16px;
            margin-top: 10px;
        }

        /* Main Container */
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
            padding: 50px 20px;
            gap: 20px;
        }

        /* Cards */
        .card {
            background-color: #50857d3d;
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            text-align: center;
            width: 250px;
            transition: transform 0.3s;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .balance {
            font-size: 2em;
            font-weight: bold;
            color: #27ae60;
        }

        .btn {
            display: block;
            width: 100%;
            padding: 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
            color: white;
            margin-top: 10px;
        }

        .transaction-btn {
            background-color: #3498db;
        }

        .history-btn {
            background-color: #9b59b6;
        }

        .btn:hover {
            opacity: 0.8;
        }

        /* Footer */
        .footer {
            background-color: #333;
            color: white;
            padding: 20px;
            text-align: center;
            margin-top: 20px;
            position: relative;
            top: 22vh;
        }

        .head2 a {
            height: 8vh;
        }

        .one {
            text-decoration: none;
            color: white;
            /* background-color: #1ab30e; */
            padding: 12px;
            border-radius: 5px;
            position: relative;
            top: 10px;


        }

        .two {
            margin-top: 10px;
            text-decoration: none;
            color: white;
            /* background-color: #c305bf; */
            padding: 12px;
            border-radius: 5px;
            position: relative;
            top: 40px;

        }
        .another{
            height: 29.2vh;
          
        }
 
        .another a{
            background-color: rgba(0, 0, 0, 0.432);
          
        }
       
        .another a:hover{
            background-color: rgba(248, 248, 248, 0.432);
            color: black;
            border: 2px solid black;
          
        }
        
     
    </style>
</head>

<body>

    <div class="head2">
        <img src="images\ourlogo.svg" class="logo" alt="Logo">
        <a href="index.html" class="active">Home</a>
        <a href="netBanking.html">Net Banking</a>
        <a href="IdPassChange.html">Change id & pass</a>
        <a href="UserWelcomeServlet">Data Show</a>
        <a href="UserDataUpdate.jsp">Update Data</a>
    </div>

    <!-- Navbar -->
    <div class="nav-right">
        <span class="username">Welcome, ${sessionScope.username}!</span>
        <form action="UserLogout" method="post" style="display:inline;">
            <button type="submit" class="logout-btn">Logout</button>
        </form>
    </div>

    <!-- Main Container -->
    <div class="container">
        <div class="card">
            <h2>Your Balance</h2>
            <p class="balance">₹<%= session.getAttribute("balance") != null ? session.getAttribute("balance") : "0.0" %></p>
        </div>
        <div class="card another">
            <a href="UserPayment.jsp" class="one">Send Money</a><br> <br>
            <a href="TransactionHistory.jsp" class="two">Transactions</a>
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

</html>
