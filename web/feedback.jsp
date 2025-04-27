<%-- 
    Document   : feedback
    Created on : Jun 27, 2024, 11:53:28 PM
    Author     : Aqiilah Mohd Noor
--%>

<%@page import="feedback.DAO.FeedbackDAO"%>
<%@page import="feedback.Model.Feedback"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Feedback> list = FeedbackDAO.getAllFeedback();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Marmoris Hotel</title>
        
        <link rel="stylesheet" href="headerfooter.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
      
        <style>
            
            * {
                font-family: "Times New Roman", Times, serif;
            }
            
            #manageFeedback {
                
                text-align: left;
                font-size: 40px;
                margin: 20px;
                margin-left: 50px;
                text-shadow:
                    2.5px 2.5px 0px #1fb1c4,
                    5px 5px 2px rgba(255, 255, 255);
            }
            table {
                width: 95%;
                border-collapse: collapse;
                margin: 20px auto;
            }
            table, th, td {
                border: 1.5px solid #1fb1c4;
            }
            th, td {
                padding: 10px;
                text-align: left;
                font-size: 15px;
            }
            th {
                background-color: #2A629A;
                text-align: center;
                font-size: 15px;
            }
            tr:nth-child(even) {
                background-color: white;
            }
            tr:nth-child(odd) {
                background-color: whitesmoke;
            }
            tr:hover {
                background-color: #ddd;
            }
            .addBtn{
                background-color: #2A629A;
                color: white;
                border: 0px;
                border-radius: 10px;
                padding: 8px 5px;
                font-size: 15px;
                margin-bottom: 20px;
                width: 10%;
                text-align: center;
                cursor: pointer;
            }
            .addBtn:hover {
                opacity: 0.8;
            }
            #section {
                margin-bottom: 30px;
            }
            .alert {
                width: 95%;
                margin: 20px auto;
                padding: 10px;
                border: 1px solid #1fb1c4;
                background-color: #c8f4f7;
                text-align: center;
                font-size: 15px;
                color: #1fb1c4;
            }
            .table-container {
                width: 95%;
                margin: 20px auto;
                display: flex;
                flex-direction: column;
            }
            .button-container {
                display: flex;
                justify-content: flex-end;
                margin-top: 10px;
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
                    <a href="javascript:void(0)" class="dropbtn"><i class="far fa-envelope"></i></a>
                    <div class="dropdown-content">
                        <a href="feedback.jsp">Review</a>  
                        <a href="DisplayFeedback.jsp">Reply</a> 
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
    
    <main>
        <h1 id="manageFeedback">Feedback</h1>
        
        <div class="table-container">
            <table id="details">
                <tr>
                    <th>No</th>
<!--                    <th>Feedback ID</th>
                    <th>Customer ID</th>-->
                    <th>Username</th>
                    <th>Email</th>
                    <th>Message</th>
                    <th>Rating</th>
                </tr>
                <%
                    
                    if (list != null) {
                     int counter = 1;
                        for (Feedback feedback : list) {
                %>
                    <tr>
                        <td><%= counter++ %></td>
<!--                        <td><%= feedback.getFeedback_id() %></td>
                        <td><%= feedback.getCustomer_id() %></td>-->
                        <td><%= feedback.getUsername() %></td>
                        <td><%= feedback.getCustomer_email() %></td>
                        <td><%= feedback.getMessage() %></td>
                        <td><%= feedback.getRating() %></td>
                    </tr>
                <%
                        }
                    }
                %>
            </table>
            <div class="button-container">
                    <button class="addBtn" type="button" onclick="window.location.href = 'addFeedbackCust.jsp';">Add Feedback</button>
                </div>
        </div>
    </main>

    <footer>
        <div class="footer">
            <div class="about">
                <a href="about.jsp">ABOUT US</a>
            </div>
            <div class="copyright">
                Marmoris Hotel &copy; <script>document.write(new Date().getFullYear());</script>
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