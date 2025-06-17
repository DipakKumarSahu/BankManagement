<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account</title>
     <link rel="icon" href="images\newLogo.JPG" type="image/jpg">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

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
            background-color: white;
   			 padding: 10px 0;
    		text-align: center;
    		position: relative;
   			 display: flex;
    		justify-content: flex-end;
    		gap: 40px;
    		padding-right: 5%;
    		height: 14vh;
   			 z-index:20;
   			 
        }

        .head2 img {
            position: absolute;
            left: 20px;
            width: 83px;
            height: 72px;
            top: -5px;
           
        }

        .head2 a {
            color: black;
            text-decoration: none;
            font-size: 18px;
            padding: 10px 15px;
            position: relative;
            margin-left: 20px;
            height:9vh;
        }

        /* Underline center se expand hone ke liye */
        .head2 a::after {
            content: "";
            position: absolute;
            bottom: -2px;
            left: 50%;
            width: 0;
            height: 2px;
            background-color: black;
            transition: width 0.3s ease, left 0.3s ease;
        }

        .head2 a:hover::after {
            width: 100%;
            left: 0;
        }

        .form-container {
            display: flex;
            justify-content: flex-start;
            /* Form left mein aayega */
            align-items: center;
            padding: 50px;
        }

        .form-box {
            background-color: rgba(255, 255, 255, 0);
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            width: 100%;
            margin-left: 160px;
        }

        .form-box h2 {
            color: #000000;
            margin-bottom: 20px;
            font-size: 28px;
            text-align: center;
        }

        .form-row {
            display: flex;
            gap: 15px;
        }

        .form-group {
            flex: 1;
        }

        .form-box label {
            display: block;
            margin-bottom: 5px;
            font-size: 13px;
        }

        .form-box input,
        .form-box textarea,
        .form-box select {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 12px;
        }

        .form-box input[type="submit"] {
            background-color: #000000;
            color: #fff;
            font-size: 14px;
            cursor: pointer;
            border: none;
            padding: 10px 15px;
            border-radius: 4px;
            transition: background-color 0.3s;
            width: 10vw;
            height: 7vh;
            border-radius: 50px;
            margin-left: 15vw;
            margin-top:15px;
        }


        .form-box input[type="submit"]:hover {
            background-color: #fff1f1;
            color: black;
            border: 2px solid black;
            font-weight: bold;
        }

        input {
            height: 30px;
        }

        .form-container img {
            width: 150px;
            height: 150px;
            margin-left: 40px;
            /* Image form ke right mein rahegi */
        }
        h1{
            text-align: center;
            font-size: 50px;
            color: #0000005e;
            font-family:Verdana, Geneva, Tahoma, sans-serif;
        }
        input, select, textarea{
            background-color: #00000013;
        }
        .form-container img{
            height: 70vh;
            width: 60vw;
        }
        
        footer {
		background-color: #333;
		color: white;
		padding: 20px 0;
		text-align: center;
		position: absolute;
		top: 133%;
		width: 100%;
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
		
		.logo{
    	 width: 80px;
		height: 80px;
		border-radius: 50%;
		object-fit: cover;
		margin-top:8px;
    }

 .logo img{
    height: 77px;
    
    
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
    </div>
    <h1>Create Your Account</h1>
    <div class="form-container">
        <div class="form-box">
            <h2>Fill your data here</h2>
            <form action="createAc" method="POST">
                <div class="form-row">
                    <div class="form-group">
                        <label for="fname">First Name:</label>
                        <input type="text" id="fname" name="fname" required>
                    </div>
                    <div class="form-group">
                        <label for="lname">Last Name:</label>
                        <input type="text" id="lname" name="lname" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" id="email" name="email" required>
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone:</label>
                        <input type="text" id="phone" name="phone" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label for="dob">Date of Birth:</label>
                        <input type="date" id="dob" name="dob" required>
                    </div>
                    <div class="form-group">
                        <label for="gender">Gender:</label>
                        <select id="gender" name="gender" required>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                            <option value="Other">Other</option>
                        </select>
                    </div>
                </div>
                <label for="aadharno">Aadhar No:</label>
              <input type="text" id="aadharno" name="aadharno" required>
                <label for="address">Address:</label>

                <textarea id="address" name="address" required></textarea>
                <div class="form-row">
                    <div class="form-group">
                        <label for="city">City:</label>
                        <input type="text" id="city" name="city" required>
                    </div>
                    <div class="form-group">
                        <label for="state">State:</label>
                        <input type="text" id="state" name="state" required>
                    </div>
                    <div class="form-group">
                        <label for="zipcode">Zipcode:</label>
                        <input type="text" id="zipcode" name="zipcode" required>
                    </div>
                </div>
                <label for="balance">Balance (Min 500):</label>
                <input type="number" id="balance" name="balance" min="500" required>
                <input type="submit" value="Create Account">
            </form>
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

</html><!-- done -->