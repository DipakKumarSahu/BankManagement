<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Account Creation Result</title>
     <link rel="icon" href="images\newLogo.JPG" type="image/jpg">
    <link rel="stylesheet" href="navBaarFooter.css">
</head>

<style>
    body {
        background-image: url('images/Auto Layout Horizontal.svg');
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        background-attachment: fixed;
    }

    .head2 {
        height: 13vh;
    }

    .head2 a {
        height: 6vh;
    }

    .back_button{
        background-color: black;
        color: white;
        padding: 5px;
        text-decoration: none;
        border-radius: 4px;
    }

    .back_button:hover{
        background-color: white;
        color: black;
        border: 2px solid black;
        padding: 5px;
    }



</style>

<body>

    <div class="head2">
        <img src="images/ourlogo.svg" class="logo" alt="Logo">
        <a href="index.html" class="active">Home</a>
        <a href="createAc.jsp" class="cta-button">Create Account</a>
        <a href="login.html">Login</a>
    </div>

    <h2>Result</h2>

    <% String message=(String) request.getAttribute("message"); String error=(String) request.getAttribute("error"); if
        (message !=null) { %>
        <div class="success">
            <p>
                <%= message %>
            </p>
        </div>
        <% } else if (error !=null) { %>
            <div class="error">
                <p>
                    <%= error %>
                </p>
            </div>
            <% } %>

                <a  class="back_button" href="createAc.jsp">Go back</a>

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