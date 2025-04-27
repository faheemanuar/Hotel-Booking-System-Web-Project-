<%-- 
    Document   : error
    Created on : May 30, 2024, 1:41:26 AM
    Author     : Aqiilah Mohd Noor
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .error-box {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .error-box h1 {
            color: #d9534f;
        }

        .error-box p {
            color: #333;
        }

        .error-box a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #5bc0de;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .error-box a:hover {
            background-color: #31b0d5;
        }
    </style>
</head>
<body>
    <div class="error-box">
        <h1>Error</h1>
        <p>There was an error processing your request. Please try again later.</p>
        <a href="RegisterCust.jsp">Back to Registration</a>
    </div>
</body>
</html>

