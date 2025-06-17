<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Request Sent</title>
    <link rel="icon" href="images\newLogo.JPG" type="image/jpg">
    <style>
        /* Your existing styles */
        body {
            background-image: url('images/Auto Layout Horizontal.svg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            z-index: 10;
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

        .error h2 {
            color: rgb(11, 206, 98);
            margin-top: 10px;
            padding-bottom: 10px;
        }

        .footer {
            background-color: #333;
            color: white;
            padding: 20px 0;
            text-align: center;
            position: absolute;
            bottom: 0;
            width: 100%;
        }
    </style>
    <link rel="stylesheet" href="navBaarFooter.css">
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
            <img src="images/checkmark.png" alt="Success">
            <h2>Request Sent Successfully</h2>
            <p>Your account creation request has been sent successfully. Your account request will be approved within 3 hours. Please try again after that time.</p>

            <!-- Display the account number -->
            <p><strong>Account Number: </strong><%= request.getAttribute("acno") %></p>
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
</html>
