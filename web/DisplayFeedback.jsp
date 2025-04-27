<%-- 
    Document   : DisplayFeedback
    Created on : Jun 30, 2024, 8:16:52 PM
    Author     : Aqiilah Mohd Noor
--%>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="feedback.DAO.FeedbackDAO"%>
<%@page import="feedback.Model.Feedback"%>
<%@page import="feedback.Model.FeedbackWithReply" %>
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
            .feedback-item {
                width: 100%;
                background-color: #fff;
                padding: 15px;
                margin-bottom: 20px;
                border-radius: 10px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }
            .feedback-item p {
                margin: 10px 0;
            }
            hr {
                width: 100%;
                border: 0;
                border-top: 1px solid #ccc;
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
                    <li class="dropdown">
                        <button class="dropbtn">ROOM</button>
                        <div class="dropdown-content">
                            <a href="viewAllBooking.jsp">Booking</a>
                            <!--                            <a href="">Order</a>-->
                        </div>
                    </li>

                    <li class="dropdown">

                        <a href="javascript:void(0)" class="dropbtn"><i class="fas fa-user-alt"></i></a>
                        <div class="dropdown-content">
                            <!--<a href="manageprofile.html">Manage Profile</a>-->
                            <a href="Homepage.jsp">Logout</a>
                        </div>
                    </li>

                </ul>   
            </nav>
        </header>
        <main>
            <h1 class="title">All Feedback and Reply</h1>
            <%
                List<FeedbackWithReply> feedbackList = FeedbackDAO.getAllFeedbackWithReplies();
                if (feedbackList != null && !feedbackList.isEmpty()) {
                    for (FeedbackWithReply fwr : feedbackList) {
                        Feedback feedback = fwr.getFeedback();
                        String reply = fwr.getReply();
            %>
            <div class="feedback-item">
                <p>Username: <%= feedback.getUsername()%></p>
                <p>Message: <%= feedback.getMessage()%></p>
                <%
                    if (reply != null) {
                %>
                <p>Reply: <%= reply%></p>
                <%
                } else {
                %>
                <p>No reply yet.</p>
                <%
                    }
                %>
            </div>
            <hr>
            <%
                    }
                } else {
                    out.println("<p>No feedback available.</p>");
                }
            %>
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
