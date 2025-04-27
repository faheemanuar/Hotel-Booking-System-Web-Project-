<%-- 
    Document   : HomepageStaff
    Created on : May 31, 2024, 2:58:33 AM
    Author     : Aqiilah Mohd Noor
--%>

<%@page import="models.Room"%>
<%@page import="dao.RoomDAO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Marmoris Hotel</title>

        <link rel="stylesheet" href="headerfooter.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="slideshow.css"/>
        <link rel="stylesheet" href="opening.css"/>
        <link rel="stylesheet" href="listing.css"/>


        <script src="slideshow.js" defer></script> 
        <script src="listingimage.js" defer></script> 

        <style>
            .equipment-container {
                display: flex;
                justify-content: space-between;
                margin-top: 20px;
            }

            .equipment {
                width: 23%; /* Adjust width as needed */
                margin-bottom: 20px;
                position: relative;
                overflow: hidden;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                transition: transform 0.3s ease;
                margin-bottom: 70px; /*make a space between equipment part and footer*/
            }

            .equipment:hover {
                transform: translateY(-5px);
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            }

            .equipment img {
                width: 100%;
                height: auto;
                display: block;
            }

            .equipment-content {
                padding: 15px;
                background-color: white;
                text-align: left; /* Change to left */
            }

            .equipment-title {
                font-size: 1.5em;
                font-weight: bold;
                margin-bottom: 10px;
                color: #333;
            }

            .equipment-description {
                font-size: 13px;
                line-height: 1.5;
                color: #555;
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
            <div class="slideshow-container">
                <div class="mySlides fade">
                    <div class="numbertext"></div>
                    <img src="marmoris5.jpg" style="width:100%">
                    <div class="text">Caption Text</div>
                </div>

                <div class="mySlides fade">
                    <div class="numbertext"></div>
                    <img src="marmoris2.png" style="width:100%">
                    <div class="text">Caption Two</div>
                </div>

                <div class="mySlides fade">
                    <div class="numbertext"></div>
                    <img src="marmoris6.jpg" style="width:100%">
                    <div class="text">Caption Three</div>
                </div>

                <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                <a class="next" onclick="plusSlides(1)">&#10095;</a>
            </div>

            <div class="Opening" style="text-align: center">
                <h1>Welcome to Marmoris House</h1>
                <h3>Your convenience is our happiness</h3>
            </div>

            <div class="Description">
                <p>
                    Surpassing a typical hotel stay, Marmoris Hotel in UMT prioritizes exceptional service.<br> 
                    From personalized greetings to thoughtful surprises and attentive staff anticipating your every need, <br>
                    Marmoris Hotel promises an experience where you feel like royalty.
                </p>
            </div>
            <%
                // Fetch the list of all rooms from the database
                List<Room> rooms = RoomDAO.getAllRooms();
            %>
            <div class="listing">
                <h2>List Of Available Room</h2>

                <%
                    // Loop through each room and display its details
                    for (Room room : rooms) {
                        if (!room.isStatus()) {
                            continue; // Skip rooms that are not available
                        }

                        String roomType = room.getRoomType();
                        String price = "RM100 only!"; // Default price if not matched

                        // Set price based on room type
                        if (roomType.equals("Deluxe Twin")) {
                            price = "RM80 per night";
                        } else if (roomType.equals("Deluxe Queen")) {
                            price = "RM80 per night";
                        } else if (roomType.equals("Deluxe Triple")) {
                            price = "RM80 per night";
                        }
                %>
                <div class="room">
                    <div class="room-images">
                        <!-- Assuming you have images per room type, adjust src attribute as per your naming convention -->
                        <img class="slide" src="<%= roomType.replaceAll(" ", "")%>.png" alt="<%= roomType%> Room">
                        <div class="info">
                            <h3><%= roomType%> <span class="price"><%= price%></span></h3>
                            <p>Facilities: <%= room.getFacilities()%></p>
                            <p>Status: Available</p> <!-- Since we are only showing available rooms -->
<!--                            <a href="booking.jsp" class="button">Book Now!</a>-->
                        </div>
                    </div>
                </div>
                <br>
                <%
                    }
                %>
            </div>
        </main>
        <div class="equipment-container">
            <div class="equipment">
                <img src="img1.jpg" alt="Pantry">
                <div class="equipment-content">
                    <h2 class="equipment-title">Pantry</h2>
                    <p class="equipment-description">

                    </p>
                </div>
            </div>

            <div class="equipment">
                <img src="img2.jpg" alt="counter">
                <div class="equipment-content">
                    <h2 class="equipment-title">Check In Counter</h2>
                    <p class="equipment-description">

                    </p>
                </div>
            </div>

            <div class="equipment">
                <img src="img3.jpg" alt="Room">
                <div class="equipment-content">
                    <h2 class="equipment-title">Room</h2>
                    <p class="equipment-description">

                    </p>
                </div>
            </div>

            <div class="equipment">
                <img src="img4.jpg" alt="Living room">
                <div class="equipment-content">
                    <h2 class="equipment-title">Relax Zone</h2>
                    <p class="equipment-description">

                    </p>
                </div>
            </div>

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
                    <img src="bxl-whatsapp.svg" alt="Instagram"/>
                </a>
            </div>
        </div>
    </footer>
</body>
</html>
