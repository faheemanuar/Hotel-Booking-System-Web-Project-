<%-- 
    Document   : UpdateRoom
    Created on : 28 May 2024, 6:58:45 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.*" %>
<%@page import="dao.RoomDAO" %>
<%@page import="models.Room" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Room</title>
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
        .action-buttons form {
            display: inline;
        }
        .form-container {
            width: 100%;
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-container label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }
        .form-container input {
            width: 100%;
            padding: 5px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .form-container button {
            width: 100%;
            padding: 10px;
            background-color: #2A629A;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .form-container button:hover {
            background-color: #1d4b78;
        }
        .footer-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
            padding: 10px 20px;
        }
        .footer-content div {
            display: flex;
            align-items: center;
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
    <main>
    <h2>Update Room</h2>
    <%
        String roomNumber = request.getParameter("room_number");
        Room room = RoomDAO.getRoomByNumber(roomNumber);
        String status = room.isStatus() ? "available" : "unavailable";
    %>
    <div class="form-container">
        <form action="updateRoomServlet" method="post">
            <input type="hidden" name="room_id" value="<%= room.getRoomid() %>">
            <label for="room_type">Room Type:</label>
            <select id="room_type" name="room_type" required>
                <option value="Deluxe Twin" <%= room.getRoomType() %>>Deluxe Twin</option>
                <option value="Deluxe Queen" <%= room.getRoomType() %>>Deluxe Queen</option>
                <option value="Deluxe Triple" <%= room.getRoomType() %>>Deluxe Triple</option>
            </select><br><br>
            <label for="facilities">Facilities:</label>
            <input type="text" id="facilities" name="facilities" value="<%= room.getFacilities() %>">
            <label for="status">Status:</label>
            <select id="status" name="status" required>
                <option value="available" <%= "available".equals(status) ? "selected" : "" %>>Available</option>
                <option value="unavailable" <%= "unavailable".equals(status) ? "selected" : "" %>>Unavailable</option>
            </select>
            <button type="submit">Update</button>
        </form>
    </div>
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
