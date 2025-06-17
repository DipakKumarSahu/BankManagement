<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error</title>
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
        .container {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 400px;
        }
        h2 {
            color: #dc3545;
        }
        p {
            color: #333;
        }
        a {
            display: inline-block;
            margin-top: 15px;
            padding: 10px 20px;
            text-decoration: none;
            color: white;
            background-color: black;
            border-radius: 5px;
        }
        a:hover {
            background-color: white;
            color:black;
            border:2px solid black;
            border-radius:7px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Error Occurred</h2>
        <p>Sorry, something went wrong while processing your request. Please try again later.</p>
        <a href="UserDataUpdate.jsp">Try Again</a>
    </div>
</body>
</html>
