<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Delete Booking</title>
</head>
<body>
    <%
        // Database connection parameters (replace with your actual credentials)
        String dbURL = "jdbc:mysql://localhost/marmoris";
        String dbUser = "root";
        String dbPass = "admin";

        Connection conn = null;
        PreparedStatement pstmt = null;

        int bookingId = Integer.parseInt(request.getParameter("booking_id"));

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            // Prepare SQL statement to delete booking by ID
            String sql = "DELETE FROM bookinghotel WHERE booking_id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, bookingId);

            // Execute update
            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                out.println("<p>Booking deleted successfully. <a href='ViewBookings.jsp'>Return to View Bookings</a></p>");
            } else {
                out.println("<p>Error deleting booking. <a href='ViewBookings.jsp'>Return to View Bookings</a></p>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p>Error deleting booking. Please try again later. <a href='ViewBookings.jsp'>Return to View Bookings</a></p>");
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    %>
</body>
</html>
