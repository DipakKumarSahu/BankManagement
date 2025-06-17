<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Request</title>
     <link rel="icon" href="images\newLogo.JPG" type="image/jpg">
       <link rel="stylesheet" href="navBaarFooter.css">
    <style>
        body {
            font-family: Arial, sans-serif;
             background-image: url('images/Auto Layout Horizontal.svg');
      		background-size: cover;
        	background-position: center;
        	background-repeat: no-repeat;
        	background-attachment: fixed;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container3 {
            background: #ffffff00;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            width: 400px;
            margin-top:100px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        label {
            font-weight: bold;
            display: block;
            margin: 10px 0 5px;
        }
        select, input, textarea {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #00000085;
            border-radius: 7px;
        }
        input[type="submit"] {
    		background-color: #000000;
    		color: white;
   		    border: none;
    		cursor: pointer;
    		padding: 10px;
    		font-size: 16px;
   		    width: 40%;
   		    margin:5% 0 0 30%;
		}
        input[type="submit"]:hover {
            background-color: white;
            color:black;
            border:2px solid black;
        }
        .hidden {
            display: none;
        }
        .box3{
                width: 100vw;
    			display: flex;
   				justify-content: space-around;	
   				
          }
          
         .box3 img{
          	height:70vh;
         } 
         .head2{
         	position:fixed;
         	width:100vw;
         	top:0;
         	height:11vh;
         }
         .head2 a{
         height:5vh;
         }
    </style>
    <script>
        function showField() {
            var selectedOption = document.getElementById("updateField").value;

            // Hide all fields initially
            var fields = ["fname", "lname", "email", "phone", "dob", "gender", "aadharno", "city", "state", "zipcode"];
            fields.forEach(field => {
                document.getElementById(field + "Field").classList.add("hidden");
            });

            // Show selected field
            if (selectedOption) {
                document.getElementById(selectedOption + "Field").classList.remove("hidden");
            }
        }
    </script>
</head>
<body>
    <div class="head2">
        <img src="images\ourlogo.svg" class="logo" alt="Logo">
        <a href="UserWelcome.jsp">Back</a>
        <a href="index.html" class="active">Home</a>
        <a href="createAc.jsp">Create Account</a>
     </div>
   <div class="box3">
    <div class="container3">
        <h2>Request for Account Update</h2>
        <form action="updateRequestServlet" method="POST">
            <label for="updateField">Select Field to Update:</label>
            <select id="updateField" name="updateField" onchange="showField()" required>
                <option value="">-- Select an Option --</option>
                <option value="fname">First Name</option>
                <option value="lname">Last Name</option>
                <option value="email">Email</option>
                <option value="phone">Phone</option>
                <option value="dob">Date of Birth</option>
                <option value="gender">Gender</option>
                <option value="aadharno">Aadhar No</option>
                <option value="city">City</option>
                <option value="state">State</option>
                <option value="zipcode">Zipcode</option>
            </select>

            <div id="fnameField" class="hidden">
                <label for="fname">New First Name:</label>
                <input type="text" name="fname">
            </div>

            <div id="lnameField" class="hidden">
                <label for="lname">New Last Name:</label>
                <input type="text" name="lname">
            </div>

            <div id="emailField" class="hidden">
                <label for="email">New Email:</label>
                <input type="email" name="email">
            </div>

            <div id="phoneField" class="hidden">
                <label for="phone">New Phone:</label>
                <input type="text" name="phone">
            </div>

            <div id="dobField" class="hidden">
                <label for="dob">New Date of Birth:</label>
                <input type="date" name="dob">
            </div>

            <div id="genderField" class="hidden">
                <label for="gender">New Gender:</label>
                <select name="gender">
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select>
            </div>

            <div id="aadharnoField" class="hidden">
                <label for="aadharno">New Aadhar No:</label>
                <input type="text" name="aadharno">
            </div>

            <div id="cityField" class="hidden">
                <label for="city">New City:</label>
                <input type="text" name="city">
            </div>

            <div id="stateField" class="hidden">
                <label for="state">New State:</label>
                <input type="text" name="state">
            </div>

            <div id="zipcodeField" class="hidden">
                <label for="zipcode">New Zipcode:</label>
                <input type="text" name="zipcode">
            </div>

            <input type="submit" value="Request Update">
        </form>
    </div>
    <img  src="images/DataUpdateImage.svg" alt="photo">
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
