<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Success</title>
     <link rel="icon" href="images\newLogo.JPG" type="image/jpg">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .message-container {
            text-align: center;
            background-color: #ffffff;
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .message-container h2 {
            color: green;
        }
        .message-container p {
            color: #555;
        }
        .message-container a {
            text-decoration: none;
            color: white;
            background-color: #121314;
            padding: 10px 20px;
            border-radius: 5px;
        }
         .message-container a:hover{
         	color: black;
            background-color: white;
            border:2px solid black;
         }
    </style>
</head>
<body>

    <div class="message-container">
        <h2>Update Successful!</h2>
        <p>${message}</p>
        <a href="UserLogin.jsp">Go back to login</a>
    </div>

</body>
</html>
