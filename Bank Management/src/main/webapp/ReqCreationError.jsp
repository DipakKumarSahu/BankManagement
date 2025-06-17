<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Request Failed</title>
    <link rel="icon" href="images\newLogo.JPG" type="image/jpg">
    <style>
    
     	*{
   			 padding: 0;
    		margin: 0;
			}
        /* Ensure full height for body and html */
        html, body {
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
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 30%;
            margin: auto;
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

       

	.head2 {
    background-color: white;
    padding: 10px 0;
    text-align: center;
    position: relative;
    display: flex;
    justify-content: flex-end;
    gap: 40px;
    padding-right: 5%;
    height: 15vh;
    z-index:20;
    margin-bottom:20px;
}

/* Add the image to the left side of the navbar */
.head2 img {
    position: absolute;
    left: 2%;
    width: 83px;
    height: 72px;
    top: 2px;
}

.head2 a {
    color: black;
    text-decoration: none;
    font-size: 18px;
    padding: 10px 15px;
    position: relative;
    margin-left: 20px;
    height: 5vh;
   margin-bottom:10px;
}

.head2 a::after {
    content: "";
    position: absolute;
    bottom: -2px;
    left: 50%;
    width: 0;
    height: 2px;
    background-color: black;
    transition: width 0.3s ease, left 0.3s ease;
    transform: translateX(-50%);
}

.head2 a:hover::after {
    width: 100%;
    left: 50%;
}

.logo{
    width: 80px;
height: 80px;
border-radius: 50%;
object-fit: cover;
    }

 .logo img{
    height: 77px;
    
 }   

 .footer .contact-info {
    margin-top: 10px;
    display: flex;
    justify-content: center;
    gap: 80px;
    font-size: 14px; /* Reduced font size by 30% from the default */
    align-items: center; /* Icons aur text ko ek line mein align karega */
}

.footer .contact-info div {
    display: flex;
    align-items: center; /* Icons aur text ko vertically center karega */
    gap: 5px; /* Icons aur text ke beech me gap */
}

.footer .contact-info img {
    width: 18px; /* Icons ka size */
    height: 18px;
}

.footer {
    background-color: #333;
    color: white;
    padding: 20px 0;
    text-align: center;
} 

.footer .contact-info {
    margin-top: 10px;
    display: flex;
    justify-content: center;
    gap: 20px;
    font-size: 14px; /* Reduced font size by 30% from the default */
}

.footer .contact-info i {
    font-size: 18px;
    margin-right: 10px;
}

.footer .contact-info span {
    margin-left: 10px;
    display: inline-block;
} 
.footer {
background-color: #333;
color: white;
padding: 20px 0;
text-align: center;
position: absolute;
bottom:0;
width: 100%;
}

/* Custom Stylish Scrollbar */
        ::-webkit-scrollbar {
            width: 6px;
        }

        ::-webkit-scrollbar-track {
            background: #f1f1f1;
            border-radius: 10px;
        }

        ::-webkit-scrollbar-thumb {
            background: #888;
            border-radius: 10px;
            border: 3px solid #f1f1f1;
        }

        ::-webkit-scrollbar-thumb:hover {
            background: #555;
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
            <h2>Request Failed!</h2>
            <p>Your account creation request could not be processed. Please try again later or contact support.</p>
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
