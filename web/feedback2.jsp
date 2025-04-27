<%-- 
    Document   : feedback2
    Created on : Jun 30, 2024, 12:04:14 AM
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
            .actionBtn {
                background-color: yellowgreen;
                color: white;
                border: 0px;
                border-radius: 10px;
                padding: 8px 5px;
                font-size: 15px;
                cursor: pointer;
                text-decoration: none; /* Ensures no underline */
                display: inline-block; /* Ensures it behaves like a button */
                text-align: center;
                width: 60px; /* Adjust width as needed */
            }
            .actionBtn:hover {
                opacity: 0.8;
            }
            .actionBtn a {
                color: white;
                text-decoration: none;
                display: inline-block;
                width: 100%; /* Ensures the link covers the entire button */
            }
            .deleteBtn {
                background-color: red;
                color: white;
                border: 0px;
                border-radius: 10px;
                padding: 8px 5px;
                font-size: 15px;
                cursor: pointer;
                text-decoration: none; /* Ensures no underline */
                display: inline-block; /* Ensures it behaves like a button */
                text-align: center;
                width: 60px; /* Adjust width as needed */
            }
            .deleteBtn:hover {
                opacity: 0.8;
            }
            .deleteBtn a {
                color: white;
                text-decoration: none;
                display: inline-block;
                width: 100%; /* Ensures the link covers the entire button */
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
                        <a href="javascript:void(0)" class="dropbtn"><i class="far fa-envelope"></i></a>
                        <div class="dropdown-content">
                            <a href="feedback2.jsp">Review</a> 
                            <a href="DisplayFeedback.jsp">Reply</a> 
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
        <h1 id="manageFeedback">Feedback</h1>
        
        <div class="table-container">
            <table id="details">
                <tr>
                    <th>No</th>
                    <th>Feedback ID</th>
                    <th>Customer ID</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Message</th>
                    <th>Rating</th>
                    <th>Action</th>
                </tr>
                <%
                    
                    if (list != null) {
                     int counter = 1;
                        for (Feedback feedback : list) {
                %>
                    <tr>
                        <td><%= counter++ %></td>
                        <td><%= feedback.getFeedback_id() %></td>
                        <td><%= feedback.getCustomer_id() %></td>
                        <td><%= feedback.getUsername() %></td>
                        <td><%= feedback.getCustomer_email() %></td>
                        <td><%= feedback.getMessage() %></td>
                        <td><%= feedback.getRating() %></td>
                        
                        <td>
                            <button class="actionBtn"><a href="reply.jsp?id=<%=feedback.getFeedback_id()%>">Reply</a></button>
                           <button type="button" class="deleteBtn" onclick="deleteFeedback('<%= feedback.getFeedback_id() %>', this.closest('tr'))">Delete</button>
                        </td>
                        
                    </tr>
                <%
                        }
                    }
                %>
            </table>
        </div>
    </main>
            <script>
        function deleteFeedback(feedbackId, row) {
            if (confirm('Are you sure you want to delete this feedback?')) {
                fetch('DeleteFeedback2Servlet', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    body: 'feedback_id=' + encodeURIComponent(feedbackId)
                })
                .then(response => response.text())
                .then(data => {
                    if (data.trim() === 'success') {
                        row.remove(); // Remove the row if deletion was successful
                    } else {
                        alert('Failed to delete feedback');
                    }
                })
                .catch(error => console.error('Error:', error));
            }
        }
    </script>

            

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
