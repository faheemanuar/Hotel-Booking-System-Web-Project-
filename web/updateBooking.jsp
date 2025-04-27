<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update Booking</title>
    <link rel="stylesheet" href="admin.css"/>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .background {
            padding: 20px;
        }
        .update-booking {
            max-width: 600px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #333;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin: 10px 0 5px;
        }
        input, select {
            padding: 10px;
            font-size: 16px;
            margin-bottom: 20px;
        }
        button {
            padding: 10px;
            font-size: 16px;
            background-color: #3498db;
            color: #fff;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: #2980b9;
        }
        .back-button {
            display: block;
            width: fit-content;
            margin: 20px auto;
            padding: 10px 20px;
            background-color: #3498db;
            color: #fff;
            text-align: center;
            text-decoration: none;
            border-radius: 5px;
        }
        .back-button:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <div class="background">
        <div class="update-booking">
            <h2>Update Booking</h2>
            <%
                String url = "jdbc:mysql://localhost/marmoris";
                String dbUser = "root";
                String dbPassword = "admin";
                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;
                int bookingId = Integer.parseInt(request.getParameter("bookingId"));

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection(url, dbUser, dbPassword);
                    String sql = "SELECT * FROM bookinghotel WHERE booking_id = ?";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setInt(1, bookingId);
                    rs = pstmt.executeQuery();

                    if (rs.next()) {
                        String name = rs.getString("name");
                        String email = rs.getString("email");
                        String phoneNo = rs.getString("phoneNo");
                        String roomNum = rs.getString("roomNum");
                        String checkinDate = rs.getString("CheckIn");
                        String checkoutDate = rs.getString("CheckOut");
            %>
            <form method="POST" action="UpdateBookingServlet">
                <input type="hidden" name="bookingId" value="<%= bookingId %>">
                <label for="name">Name:</label>
                <input type="text" name="name" id="name" value="<%= name %>" required>
                <label for="email">Email:</label>
                <input type="email" name="email" id="email" value="<%= email %>" required>
                <label for="phoneNo">Phone Number:</label>
                <input type="text" name="phoneNo" id="phoneNo" value="<%= phoneNo %>" required>
                <label for="roomNum">Room Number:</label>
                <input type="text" name="roomNum" id="roomNum" value="<%= roomNum %>" required>
                <label for="checkinDate">Check-in Date:</label>
                <input type="date" name="checkinDate" id="checkinDate" value="<%= checkinDate %>" required>
                <label for="checkoutDate">Check-out Date:</label>
                <input type="date" name="checkoutDate" id="checkoutDate" value="<%= checkoutDate %>" required>
                <button type="submit">Update Booking</button>
            </form>
            <%
                    } else {
                        out.println("<p>Booking not found!</p>");
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
        </div>
    </div>
</body>
</html>
