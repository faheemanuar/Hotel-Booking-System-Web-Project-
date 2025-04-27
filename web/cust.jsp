<%-- 
    Document   : cust
    Created on : Jun 21, 2024, 2:26:14 AM
    Author     : Aqiilah Mohd Noor
--%>

<%@page import="cust.DAO.CustDAO"%>
<%@page import="cust.Model.Cust"%>
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
                font-family: "Times New Roman", Times, serif;
            }
            #manageCust {
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
            .edit-btn{
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
            .delete-btn{
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
        </style>
    </head>

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
    
    <body>
        <main>
            <h1 id="manageCust">Customer</h1>
            
            <%
                // Retrieve message from URL parameter if available
                String message = request.getParameter("message");
                if (message != null && !message.isEmpty()) {
            %>
                <div class="alert" id="alertMessage">
                    <%= message %>
                </div>
            <%
                }
            %>

            <div class="table-container">
                <table id="details">
                    <tr>
                        <th>No</th>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Username</th>
                        <th>Password</th>
                        <th>Email</th>
                        <th>Phone No</th>
                        <th>Action</th>
                    </tr>
                    <%
                        List<Cust> list = CustDAO.getAllCust();
                        int rowNumber = 1;
                        for (Cust e : list) {
                    %>
                    <tr class="editable-row cust-row" data-cust-id="<%= e.getID()%>" data-cust-id ="<%= e.getID()%>">
                        <td><%= rowNumber++ %></td>
                        <td><%= e.getID()%></td>
                        <td><%= e.getName()%></td>
                        <td><%= e.getUsername()%></td>
                        <td><%= e.getPassword()%></td>
                        <td><%= e.getEmail()%></td>
                        <td><%= e.getPhoneNo()%></td>
                        
                        <td>
                            <button class="edit-btn" onclick="editCust('<%= e.getID() %>')">Edit</button>
                            <button class="delete-btn" onclick="deleteCust('<%= e.getID() %>')">Delete</button>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </table>
<!--                <div class="button-container">
                    <button class="addBtn" type="button" onclick="window.location.href = 'addCust.jsp';">Add Customer</button>
                </div>-->
            </div>
        </main>
        
        <script>
            function editCust(custId) {
                window.location.href = 'EditCustServlet?customer_id=' + custId;
            }

            function deleteCust(custId) {
                if (confirm("Are you sure you want to delete this customer?")) {
                    var xhr = new XMLHttpRequest();
                    xhr.open("POST", "DeleteCustServlet", true);
                    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                    xhr.onreadystatechange = function () {
                        if (xhr.readyState === 4 && xhr.status === 200) {
                            if (xhr.responseText === "success") {
                                alert("Customer deleted successfully.");
                                location.reload();
                            } else {
                                alert("Failed to delete customer.");
                            }
                        }
                    };
                    xhr.send("customer_id=" + custId);
                }
            }

            // Clear URL parameters after displaying message
            window.onload = function() {
                if (window.location.search.indexOf('message=') !== -1) {
                    history.replaceState(null, '', window.location.pathname);
                }

                // Hide alert message after a few seconds
                var alertMessage = document.getElementById('alertMessage');
                if (alertMessage) {
                    setTimeout(function() {
                        alertMessage.style.display = 'none';
                    }, 1000); // Hide after 1 seconds
                }
            }
        </script>
    

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

