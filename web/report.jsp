<%-- 
    Document   : newjsp
    Created on : 30 Jun 2024, 7:44:10 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="models.*" %>
<%@page import="dao.*" %>
<!DOCTYPE html>
<html>
    <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Marmoris Hotel</title>
        
        <link rel="stylesheet" href="headerfooter.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
    display: flex;
    flex-direction: column;
    min-height: 100vh;
    font-family: 'Times New Roman', Times, serif; /* Add this line */
}

.container {
    flex: 1;
    display: flex;
    justify-content: center;
    align-items: center;
}

.report-box {
    border: 2px solid #ccc;
    padding: 20px;
    border-radius: 10px;
    text-align: center;
    background-color: #f9f9f9;
    font-family: 'Times New Roman', Times, serif; /* Add this line */
}

.report-box button {
    display: block;
    width: 200px;
    margin: 20px auto;
    padding: 15px;
    font-size: 20px;
    cursor: pointer;
    background-color: #2A629A;
    color: white;
    border: none;
    border-radius: 5px;
    transition: background-color 0.3s;
    font-family: 'Times New Roman', Times, serif; /* Add this line */
}

.report-box button:hover {
    background-color: #1d4b78;
}

    </style>
</head>
<body>
    <header>
        <div class="logo">
            <img src="marmorislogo.png" width="125px">
        </div>
        <nav>
            <ul>
                <li><a href="report.jsp">REPORT</a></li>
                <li><a href="hotelroommanage.jsp">MANAGE ROOM</a></li>
                <li class="dropdown">
                    <button class="dropbtn">HOME</button>
                    <div class="dropdown-content">
                        <a href="HomepageCustomer.jsp">Homepage</a>
                        </div>
                    </li>
                <li class="dropdown">
                    <a href="javascript:void(0)" class="dropbtn"><i class="far fa-envelope"></i></a>
                    <div class="dropdown-content">
                        <a href="feedback.jsp">Review</a>    
                    </div>
                </li>
                <li class="dropdown">
                    <a href="javascript:void(0)" class="dropbtn"><i class="fas fa-user-alt"></i></a>
                    <div class="dropdown-content">
                        <a href="Homepage.jsp">Logout</a>
                    </div>
                </li>
            </ul>   
        </nav>
    </header>

    <div class="container">
        <div class="report-box">
            <button onclick="location.href='viewAllBooking.jsp'">Bookings</button>
            <button onclick="location.href='reportfeedback.jsp'">Feedback</button>
        </div>
    </div>

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
