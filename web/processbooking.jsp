<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Booking Confirmation</title>
    <link rel="stylesheet" href="confirmation.css"/>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .background {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-image: url('background.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }
        .confirmation {
            background: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            text-align: center;
            max-width: 500px;
            width: 100%;
        }
        .confirmation h2 {
            margin-top: 0;
            color: #333;
            font-size: 24px;
        }
        .confirmation ul {
            list-style: none;
            padding: 0;
            margin: 20px 0;
        }
        .confirmation ul li {
            margin: 10px 0;
            font-size: 18px;
            color: #555;
        }
        .confirmation a, .confirmation button {
            display: inline-block;
            margin: 10px 0;
            padding: 10px 25px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            font-size: 16px;
        }
        .confirmation a:hover, .confirmation button:hover {
            background-color: #0056b3;
        }
        .confirmation button {
            border: none;
            cursor: pointer;
        }
        p {
            margin: 10px 0;
            color: #555;
        }
    </style>
    <script>
        function confirmProceedToPayment(bookingId) {
            var confirmMessage = "Once you proceed to payment, you will not be able to make any changes to your booking. Do you want to continue?";
            if (confirm(confirmMessage)) {
                window.location.href = 'payment.jsp?bookingId=' + bookingId;
            }
        }
    </script>
</head>
<body>
    <div class="background">
        <div class="confirmation">
            <h2>Booking Confirmation</h2>
            <%
                // Retrieve form parameters
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String phoneNo = request.getParameter("phoneNo");
                String roomNum = request.getParameter("roomNum");
                String checkinDate = request.getParameter("Checkin-date");
                String checkoutDate = request.getParameter("Checkout-date");
                

                // Create a session and store attributes if necessary
                session.setAttribute("customer_name", name);

                // Database connection variables
                String url = "jdbc:mysql://localhost/marmoris";
                String dbUser = "root";
                String dbPassword = "admin";
                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;
                int bookingId = -1;

                try {
                    // Load the JDBC driver
                    Class.forName("com.mysql.jdbc.Driver");

                    // Establish the connection
                    conn = DriverManager.getConnection(url, dbUser, dbPassword);

                    // Prepare the SQL statement
                    String sql = "INSERT INTO bookinghotel (name, email, phoneNo, roomNum, CheckIn, CheckOut) VALUES (?, ?, ?, ?, ?, ?)";
                    pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                    pstmt.setString(1, name);
                    pstmt.setString(2, email);
                    pstmt.setString(3, phoneNo);
                    pstmt.setString(4, roomNum);
                    pstmt.setString(5, checkinDate);
                    pstmt.setString(6, checkoutDate);

                    // Execute the statement
                    int rows = pstmt.executeUpdate();

                    if (rows > 0) {
                        rs = pstmt.getGeneratedKeys();
                        if (rs.next()) {
                            bookingId = rs.getInt(1);
                        }
                        session.setAttribute("booking_id", bookingId);
            %>
                        <p>Booking successful! Thank you, <%= name %>.</p>
                        <p><strong>Confirm your Booking Details:</strong></p>
                        <ul>
                            <li>Name: <%= name %></li>
                            <li>Email: <%= email %></li>
                            <li>Phone Number: <%= phoneNo %></li>
                            <li>Room Number: <%= roomNum %></li>
                            <li>Check-in Date: <%= checkinDate %></li>
                            <li>Check-out Date: <%= checkoutDate %></li>
                        </ul>
                        <p><strong>Please double check your details!</strong></p>
                        <p><a href='editBooking.jsp?bookingId=<%= bookingId %>'>Edit Booking</a></p>
                        <p><a href="#" onclick="confirmProceedToPayment(<%= bookingId %>); return false;">Proceed to Payment</a></p>
            <%
                    } else {
            %>
                        <p>There was an error processing your booking. Please try again.</p>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
            %>
                    <p>There was an error: <%= e.getMessage() %></p>
            <%
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
<!--            <a href="HomepageCustomer.jsp">Back to Home</a>-->
        </div>
    </div>
</body>
</html>
