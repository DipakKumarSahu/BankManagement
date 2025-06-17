<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Request Failed</title>
     <link rel="icon" href="images\newLogo.JPG" type="image/jpg">
    <link rel="stylesheet" href="navBaarFooter.css">
    <style>
        * {
            padding: 0;
            margin: 0;
        }

        /* Ensure full height for body and html */
        html,
        body {
            height: 17%;
            margin: 0;
            display: flex;
            flex-direction: column;

        }

        body {
            background-image: url('images/Auto Layout Horizontal.svg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
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
            height: 45vh;
            /* Increased height */
        }



        .loader {
            border: 4px solid #f3f3f3;
            border-top: 4px solid rgb(18, 180, 45);
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

        .error h2 {
            color: red;
            margin-top: 10px;
        }

        .logo {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            object-fit: cover;
        }

        .logo img {
            height: 77px;

        }
        .container2 a {
            text-decoration: none;
            background: black;
            color: white;
            padding: 10px;
            border: 2px solid black;
            border-radius: 55px;
            margin-top: 20px;
            /* Adjusted spacing */
            display: inline-block;
        }


        .container2 a:hover {
            border: 2px solid black;
            background-color: #fff;
            color: black;
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
        <div class="error">
            <img src="images/redCross.svg" alt="Error">
            <div class="container2">
                <h2>Error</h2>
                <p>${error}</p>
                <a href="balance_add.html">Go Back</a>
            </div>
        </div>
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

    <script>
        setTimeout(() => {
            document.querySelector(".loader").style.display = "none";
            document.querySelector(".error").style.display = "block";
        }, 1500);
    </script>
</body>

</html>	<!-- done -->