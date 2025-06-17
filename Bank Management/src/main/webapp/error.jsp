<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">
    <!-- Net Banking Creation Error -->

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Error</title>
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
                background-color: #f8f9fa;
                color: #333;
                line-height: 1.6;
            }

            header {
                background-color: #007bff;
                padding: 15px 0;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
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


           
            .error-box a {
                background-color: black;
                color: white;
                text-decoration: none;
                padding: 8px;
                border-radius: 5px;
                position: relative;
                top:13px;
            }

            .error-box a:hover {
                background-color: #ffffff;
                color: black;
                border: 2px solid black;
                transform: translateY(-2px);
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
                height: 57vh;
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
        </style>
    </head>

    <body>

        <div class="head2">
            <img src="images\ourlogo.svg" class="logo" alt="Logo">
            <a href="index.html" class="active">Home</a>
            <a href="netBanking.html">Net Banking</a>
            <a href="login.html">Login</a>
        </div>

        <div class="container">
            <div class="loader"></div>
            <div class="error">
                <img src="images/redCross.svg" alt="Error">
                <div class="error-container">
                    <div class="error-box">
                        <h2>Error: ${param.message}</h2>
                        <p>You may entered a wrong acno or Something went wrong. Please try again later or contact
                            support if
                            the issue persists.</p>
                        <a href="index.html">Go to Home</a>
                    </div>
                </div>
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

    </html> <!-- done -->