<%-- 
    Document   : reply
    Created on : Jun 30, 2024, 8:15:10 PM
    Author     : Aqiilah Mohd Noor
--%>

<%@page import="feedback.DAO.FeedbackDAO"%>
<%@page import="feedback.Model.Feedback"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Marmoris Hotel</title>
    <link rel="stylesheet" href="headerfooter.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        * {
            box-sizing: border-box;  
            font-size: 15px; 
            font-family: "Times New Roman", Times, serif;
        }
        main {
            width: 50%;
            margin: 30px auto;
            display: flex;
            flex-direction: column;
            align-items: center;    
            border-radius: 45px;
            background-color: #2a629d;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            padding: 20px; /* Adjusted padding */
        }

        .title {
            text-align: center;
            font-size: 25px;
            margin-bottom: 20px;
        }

        .section {
            margin: 20px 0;
        }

        label {
            display: block;
            margin-bottom: 10px;
        }

        input[type="text"], input[type="email"], textarea {
            width: 100%;
            padding: 15px;
            margin: 5px 0 22px 0;
            border: none;
            background: #f1f1f1;
        }

        input[type="text"]:focus, input[type="email"]:focus, textarea:focus {
            background-color: #ddd;
            outline: none;
        }

        .button-container {
            display: flex;
            justify-content: space-between; /* Space buttons evenly */
            width: 100%;
        }

        .submitBtn {
            background-color: rgb(0, 0, 0);
            color: white;
            padding: 16px 20px;
            border: none;
            cursor: pointer;
            width: 48%; /* Adjust button width as needed */
            border-radius: 20px;
        }

        .submitBtn:hover {
            opacity: 0.7;
        }

        .rating {
            display: inline-block;
        }

        .rating input {
            display: none;
        }

        .rating label {
            float: right;
            cursor: pointer;
            color: #fff;
            transition: color 0.3s;
        }

        .rating label:before {
            content: '\2605';
            font-size: 30px;
        }

        .rating input:checked ~ label,
        .rating label:hover,
        .rating label:hover ~ label {
            color: orange;
            transition: color 0.3s;
        }
    </style>
</head>
<body>
<header>
    <div class="logo">
        <img src="marmorislogo.png" width="125px">
    </div>
</header>
<main>
    <%
    int id = Integer.parseInt(request.getParameter("id"));
    Feedback feedback = FeedbackDAO.getFeedbackById(id);
    %>
    <h1 class="title">Feedback Details</h1>
    
    <p>ID: <%= feedback.getFeedback_id() %></p>
    <p>Customer ID: <%= feedback.getCustomer_id() %></p>
    <p>Username: <%= feedback.getUsername() %></p>
    <p>Email: <%= feedback.getCustomer_email() %></p>
    <p>Message: <%= feedback.getMessage() %></p>
    <p>Rating: <%= feedback.getRating() %></p>
    
    <h2>Reply to Feedback</h2>
    <form action="saveReplyServlet" method="post">
        <input type="hidden" name="feedback_id" value="<%= feedback.getFeedback_id() %>">
        <input type="hidden" name="customer_id" value="<%= feedback.getCustomer_id() %>">
        <input type="hidden" name="username" value="<%= feedback.getUsername() %>">
        <input type="hidden" name="email" value="<%= feedback.getCustomer_email() %>">
        <input type="hidden" name="message" value="<%= feedback.getMessage() %>">
        <input type="hidden" name="rating" value="<%= feedback.getRating() %>">
        <div class="section">
            <label for="reply">Reply:</label>
            <textarea id="reply" name="reply" required></textarea>
        </div>
        <div class="button-container">
            <button type="reset" class="submitBtn" onclick="window.location.href='feedback.jsp'">CANCEL</button>
            <button type="submit" class="submitBtn">SUBMIT</button>
        </div>
    </form>
</main>
<footer>
    <div class="footer">
        <div class="about">
            <a href="about.jsp">ABOUT US</a>
        </div>
        <div class="copyright">
            Marmoris Hotel &copy;
            <script>document.write(new Date().getFullYear());</script>
        </div>
        <div class="social-media">
            <a href="https://www.facebook.com/icreateumtofficial">
                <img src="bxl-facebook.svg" alt="Facebook"/>
            </a>
            <a href="https://x.com/IcreateUmt?s=09">
                <img src="bxl-twitter.svg" alt="Twitter"/>
            </a>
            <a href="https://www.instagram.com/icreateumt/?r=nametag">
                <img src="bxl-instagram.svg" alt="Instagram"/>
            </a>
            <a href="https://api.whatsapp.com/send/?phone=601158623277&text&type=phone_number&app_absent=0">
                <img src="bxl-whatsapp.svg" alt="WhatsApp"/>
            </a>
        </div>
    </div>
</footer>
</body>
</html>
