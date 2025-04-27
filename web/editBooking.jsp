<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Edit Booking</title>
    <link rel="stylesheet" href="booking.css"/>
</head>
<body>
    <div class="background">
        <div class="booking-form">
            <h2>Edit Booking</h2>
            <%
                // Retrieve booking ID from request
                int bookingId = Integer.parseInt(request.getParameter("bookingId"));

                // Database connection variables
                String url = "jdbc:mysql://localhost:3306/marmoris";
                String dbUser = "root";
                String dbPassword = "admin";
                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;

                String name = "";
                String email = "";
                String phoneNo = "";
                String roomNum = "";
                String checkinDate = "";
                String checkoutDate = "";

                List<String> availableRooms = new ArrayList<>();

                try {
                    // Load the JDBC driver
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    // Establish the connection
                    conn = DriverManager.getConnection(url, dbUser, dbPassword);

                    // Prepare the SQL statement to retrieve the booking details
                    String sql = "SELECT name, email, phoneNo, roomNum, CheckIn, CheckOut FROM bookinghotel WHERE booking_id = ?";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setInt(1, bookingId);

                    // Execute the statement and retrieve the result set
                    rs = pstmt.executeQuery();

                    if (rs.next()) {
                        name = rs.getString("name");
                        email = rs.getString("email");
                        phoneNo = rs.getString("phoneNo");
                        roomNum = rs.getString("roomNum");
                        checkinDate = rs.getString("CheckIn");
                        checkoutDate = rs.getString("CheckOut");
                    }

                    // Close the result set and statement for booking details
                    rs.close();
                    pstmt.close();

                    // Prepare the SQL statement to retrieve the available rooms
                    String availableRoomsSql = "SELECT room_number FROM rooms WHERE status=1";
                    pstmt = conn.prepareStatement(availableRoomsSql);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        availableRooms.add(rs.getString("room_number"));
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<p>There was an error: " + e.getMessage() + "</p>");
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (pstmt != null) pstmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>
            <form action="updateBooking.jsp" method="post">
                <input type="hidden" name="bookingId" value="<%= bookingId %>">
                <label for="name">Name</label> 
                <input type="text" name="name" id="name" value="<%= name %>" required readonly>

                <label for="email">Email</label> 
                <input type="email" name="email" id="email" value="<%= email %>" required>

                <label for="phoneNo">Handphone Number</label> 
                <input type="text" name="phoneNo" id="phoneNo" value="<%= phoneNo %>" required>

                <label for="roomNum">Choose Room Number That is available:</label>
                <select id="roomNum" name="roomNum" required>
                    <% for (String room : availableRooms) { %>
                        <option value="<%= room %>" <%= room.equals(roomNum) ? "selected" : "" %>><%= room %></option>
                    <% } %>
                </select>

                <label for="CheckIn">Check in Date:</label> 
                <input type="date" name="CheckIn" id="CheckIn" value="<%= checkinDate %>" required>

                <label for="CheckOut">Check out Date:</label> 
                <input type="date" name="CheckOut" id="CheckOut" value="<%= checkoutDate %>" required>

                <button type="submit">Update Booking</button>
            </form>
        </div>
    </div>
</body>
</html>
