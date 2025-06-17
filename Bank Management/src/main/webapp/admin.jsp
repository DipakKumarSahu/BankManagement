<!--<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> -->
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Page</title>
     <link rel="icon" href="images\newLogo.JPG" type="image/jpg">
    <link rel="stylesheet" href="navBaarFooter.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }


        body {
            /* font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; */
            font-family: Gerbil;
            background-image: url('images/BodyRectangle 665.png');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            z-index: 50;
        }
        
        /* Sidebar content styling */
        .left {
            background-color: #ffffffa6;
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            margin-right: 20px;
            width: 20%;
        }

        .left a {
            display: block;
            padding: 15px;
            background-color: #1b1b1b;
            color: white;
            text-decoration: none;
            margin: 10px 0;
            border-radius: 5px;
            transition: background-color 0.3s, transform 0.3s;

        }

        .left a:hover {
            background-color: #f8f5f5c9;
            color: black;
            border: 2px solid black;

            transform: translateY(-3px);

        }

        .flex {
            display: flex;
            justify-content: space-between;
            padding: 20px;
        }

        .right {
            flex-grow: 1;
            padding-left: 30px;
        }

        .right h1 {
            font-size: 36px;
            color: #070707;
            margin-bottom: 10px;
        }

        .right h3 {
            font-size: 22px;
            color: #6c757d;
        }

        /* Card design for better content layout */
        .card {
            background-color: white;
            padding: 20px;
            margin: 15px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.3s;
            height: 50vh;
            position: relative;
            right: -150px;
            width: 27vw;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card h3 {
            font-size: 24px;
            margin-bottom: 10px;
        }

        .card p {
            color: #6c757d;
        }

        /* Custom modal for logout confirmation */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
            z-index: 9999;
            animation: fadeIn 0.3s ease-in-out;
        }

        .modal-content {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            width: 350px;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
        }

        .modal-content h2 {
            color: #dc3545;
            margin-bottom: 20px;
            font-size: 24px;
        }

        .modal-content p {
            margin-bottom: 25px;
            font-size: 18px;
            color: #333;
        }

        .modal-buttons {
            display: flex;
            justify-content: space-evenly;
        }

        .modal-buttons button {
            background-color: #dc3545;
            color: white;
            padding: 12px 25px;
            font-size: 18px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
        }

        .modal-buttons button:hover {
            background-color: #c82333;
            transform: translateY(-3px);
        }

        .modal-buttons .cancel {
            background-color: #28a745;
        }

        .modal-buttons .cancel:hover {
            background-color: #218838;
        }

        /* Fade-in animation */
        @keyframes fadeIn {
            from {
                opacity: 0;
            }

            to {
                opacity: 1;
            }
        }

        .head2 a {
            height: 9vh;
        }

        .pack {
            display: flex;
        }

        .admin-card {
            background: #ffffffa6;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: left;
            font-family: Arial, sans-serif;
            width: 33vw;
            position: relative;
            right: -120px;
        }

       

        .admin-card h2, p{
            padding-bottom: 10px;
        }

        .stats p,
        .quick-actions ul,
        .security-notice p {
            margin: 10px 0;
        }

        .quick-actions ul {
            list-style: none;
            padding: 0;
        }

        .quick-actions li {
            background: #f5f5f5;
            padding: 8px;
            border-radius: 5px;
            margin: 5px 0;
        }

        .head2{
            background: #ffffffe3;
        }
		
		.footer{
			bottom:-152px;
		}
		
    </style>
</head>

<body>

    <div class="head2">
        <img src="images\ourlogo.svg" class="logo" alt="Logo">
        <a href="index.html" class="active">Home</a>
        <a href="createAc.jsp">Create Account</a>
        <a href="ReqHandle.jsp">All Account</a>
        <a href="login.html">Logout</a>
    </div>


    <div class="flex">
        <div class="left">
            <a href="netBanking.html">Net Banking</a>
            <a href="balance_add.html">Balance Send</a>
            <a href="MinusBalance.jsp">Balance Deduction</a>
            <a href="TransactionServlet">Transactions History</a>
            <a href="SortAcInAc.jsp">Account Request</a>
            <a href="data.jsp">All Users Data</a>
            <a href="IdPassChange.html">User's Id Pass Change</a>
            <a href="adminUpdateRequests.jsp">Users Details Update Request</a>
            
        </div>

        <div class="right">

            <h1>Hello Ankit</h1>
            <h3>Welcome to FinTrust Bank Admin Page.</h3>


            <!-- Cards for Account Overview -->
            <div class="pack">
                <img src="images\girlhandsup.svg" alt="">
                <!-- <div class="card"> -->
                    <!-- <h3>Admin page</h3>
                    <p>This page gives you all facilities like Track and Manage your transactions</p> -->
                    <div class="admin-card">
                        <h2><ul> This is FinTrust Bank Admin Panel</ul></h2>
                        <p>Manage users, activate accounts, and oversee transactions efficiently.</p>

                        <div class="quick-actions">
                            <h3>Quick Actions</h3>
                            <ul>
                                <li>✅ Activate Pending Users</li>
                                <li>📜 View Transaction Logs</li>
                                <li>⚙️ Manage Bank Policies</li>
                            </ul>
                        </div>

                        <div class="security-notice">
                            <p><strong>⚠ Security Notice:</strong> Ensure all user verifications are completed before
                                activation. Unauthorized access is strictly prohibited.</p>
                        </div>
                    </div>

                <!-- </div> -->
            </div>
        </div>
    </div>

    <!-- Custom Logout Modal -->
    <div id="logoutModal" class="modal">
        <div class="modal-content">
            <h2>Logout Confirmation</h2>
            <p>Are you sure you want to logout?</p>
            <div class="modal-buttons">
                <button onclick="logout()">Yes</button>
                <button class="cancel" onclick="closeLogoutModal()">Cancel</button>
            </div>
        </div>
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
           

    <script>
        function showLogoutModal() {
            document.getElementById('logoutModal').style.display = 'flex';
        }

        function closeLogoutModal() {
            document.getElementById('logoutModal').style.display = 'none';
        }

        function logout() {
            // Redirect to login page or handle the logout action here
            window.location.href = "login.html";
        }
        window.history.forward()
    </script>

</body>

</html><!-- done -->