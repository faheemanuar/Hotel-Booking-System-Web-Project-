<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Booking</title>
    <link rel="stylesheet" href="booking.css"/>
</head>
<body>
<%
    // Retrieve attributes from the session
//    HttpSession session = request.getSession();
    String name = (String) session.getAttribute("customer_name");

    // Handle cases where the attributes might not be set (e.g., if session is null)
    if (name == null) {
        name = "";
    }

    // Database connection setup
    String url = "jdbc:mysql://localhost/marmoris";
    String dbUser = "root";
    String dbPassword = "admin";
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    List<String> availableRooms = new ArrayList<>();

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(url, dbUser, dbPassword);
        String sql = "SELECT room_number FROM rooms WHERE status=1";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();

        while (rs.next()) {
            availableRooms.add(rs.getString("room_number"));
        }
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
<div class="background">
    <div class="booking-form">
        <h2>Booking Hotel Form</h2>
        <form action="processbooking.jsp" method="post">
            <label for="name">Name</label> 
            <input type="text" name="name" id="name" value="<%= name %>" required readonly>

            <label for="email">Email</label> 
            <input type="email" name="email" id="email" required>

            <label for="phoneNo">Handphone Number</label> 
            <input type="text" name="phoneNo" id="phoneNo" required>

            <label for="roomNum">Choose Room Number That is available:</label>
            <select id="roomNum" name="roomNum" required>
                <% for (String room : availableRooms) { %>
                    <option value="<%= room %>"><%= room %></option>
                <% } %>
            </select>

            <label for="Checkin-date">Check in Date:</label> 
            <input type="date" name="Checkin-date" id="Checkin-date" required>

            <label for="Checkout-date">Check out Date:</label> 
            <input type="date" name="Checkout-date" id="Checkout-date" required>
            
<!--            <label for="Checkout-date">Check out Date:</label> 
            <input type="date" name="Checkout-date" id="Checkout-date" required>-->

            <button type="submit">Book Now</button>
        </form>
    </div>
</div>
</body>
</html>
