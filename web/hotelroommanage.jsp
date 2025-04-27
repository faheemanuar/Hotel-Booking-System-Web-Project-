<%-- 
    Document   : index
    Created on : 28 May 2024, 7:00:05 PM
    Author     : USER
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="models.*" %>
<%@page import="dao.RoomDAO" %>
<%@page import="models.Room" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Marmoris Hotel</title>

        <link rel="stylesheet" href="headerfooter.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <style>
            body, html {
                height: 100%;
                margin: 0;
                display: flex;
                flex-direction: column;
            }
            header {
                flex-shrink: 0;
            }
            main {
                flex: 1;
                padding: 20px;
            }
            footer {
                flex-shrink: 0;
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
            .action-buttons form {
                display: inline;
            }
            .action-buttons button {
                padding: 10px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 14px;
                margin-right: 5px;
            }
            .action-buttons .update-button {
                background-color: #4CAF50; /* Blue */
                color: white;
                transition: background-color 0.3s;
            }
            .action-buttons .update-button:hover {
                background-color: #45a049;
            }
            .action-buttons .delete-button {
                background-color: #f44336; /* Red */
                color: white;
                transition: background-color 0.3s;
            }
            .action-buttons .delete-button:hover {
                background-color: #e53935;
            }
            .add-room-container {
                display: flex;
                justify-content: center;
                gap: 20px;
                margin: 20px 0;
                padding: 20px;
            }
            .add-room-button {
                padding: 15px 30px;
                background-color: #008CBA; /* Blue */
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
                transition: background-color 0.3s;
                text-decoration: none;
            }
            .add-room-button:hover {
                background-color: #007bb5;
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
                        <button class="dropbtn">Manage ROOM</button>
                        <div class="dropdown-content">
                            <a href="hotelroommanage.jsp">Room</a>
                        </div>
                    </li>
                    <li class="dropdown">
                        <button class="dropbtn">USER</button>
                        <div class="dropdown-content">
                            <a href="staff.jsp">Staff</a>
                            <a href="cust.jsp">Customer</a>

                        </div>
                    <li class="dropdown">
                        <button class="dropbtn"><a href="viewAllBooking.jsp">Booking</a></button>

                    </li>
                    </li>

                    <li class="dropdown">
                        <a href="javascript:void(0)" class="dropbtn"><i class="far fa-envelope"></i></a>
                        <div class="dropdown-content">
                            <a href="DisplayFeedback.jsp">Review</a>    
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
            <h2>Manage Rooms</h2>
            <div class="add-room-container">
                <a href="HomepageAdmin.jsp"class="add-room-button">Back to homepage</a>
                <a href="addRoom.jsp" class="add-room-button">Add New Room</a>

            </div>

            <table>
                <thead>
                    <tr>
                        <th>Room ID</th>
                        <th>Room Number</th>
                        <th>Room Type</th>
                        <th>Facilities</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Room> rooms = RoomDAO.getAllRooms();
                        for (Room room : rooms) {
                    %>
                    <tr>
                        <td><%= room.getRoomid()%></td>
                        <td><%= room.getRoomNumber()%></td>
                        <td><%= room.getRoomType()%></td>
                        <td><%= room.getFacilities()%></td>
                        <td><%= room.isStatus() ? "Available" : "Unavailable"%></td>
                        <td class="action-buttons">
                            <form action="updateRoom.jsp" method="post">
                                <input type="hidden" name="room_number" value="<%= room.getRoomNumber()%>">
                                <button type="submit" class="update-button">Update</button>
                            </form>
                            <form action="deleteRoomServlet" method="post" onsubmit="return confirm('Are you sure you want to delete this room?');">
                                <input type="hidden" name="room_number" value="<%= room.getRoomNumber()%>">
                                <button type="submit" class="delete-button">Delete</button>
                            </form>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>

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
