<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Payment</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        .background {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #e9ecef;
        }

        .payment-details {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
        }

        .payment-details h2 {
            margin-bottom: 20px;
            color: #333;
        }

        .payment-details p {
            margin: 10px 0;
            color: #666;
        }

        .payment-details ul {
            list-style-type: none;
            padding: 0;
        }

        .payment-details ul li {
            margin: 10px 0;
            text-align: left;
            color: #333;
        }

        .payment-details .error {
            color: red;
            font-weight: bold;
        }

        .btn-primary, .btn-secondary {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            margin-top: 20px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-primary {
            background-color: #007bff;
            color: #fff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .btn-secondary {
            background-color: #6c757d;
            color: #fff;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
        }

        #backToHomeButton:disabled {
            background-color: #ccc;
            cursor: not-allowed;
        }
    </style>
    <script>
        function redirectToQRCode() {
            var qrCodeUrl = 'https://toyyibpay.com/MARMORIS';
            window.open(qrCodeUrl, '_blank');
            document.getElementById('submitReceiptButton').disabled = false; // Enable the Submit Receipt button
        }

        function submitReceipt() {
            var googleFormUrl = 'https://forms.gle/BLi6rVAah5a6stFU7';
            window.open(googleFormUrl, '_blank');
            // Simulate form submission by waiting for a few seconds (assuming the user has completed the form)
            setTimeout(function() {
                document.getElementById('backToHomeButton').disabled = false; // Enable the Back to Home button
            }, 5000); // Adjust the timeout duration as needed
        }
    </script>
</head>
<body>
    <div class="background">
        <div class="payment-details">
            <h2>Payment</h2>
            <%
                String bookingId = request.getParameter("bookingId");
                if (bookingId == null || bookingId.isEmpty()) {
                    out.println("<p class='error'>Error: Booking ID is missing.</p>");
                } else {
                    String url = "jdbc:mysql://localhost/marmoris";
                    String dbUser = "root";
                    String dbPassword = "admin";
                    Connection conn = null;
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;
                    String name = "", email = "", phoneNo = "", roomNum = "", checkinDate = "", checkoutDate = "";

                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        conn = DriverManager.getConnection(url, dbUser, dbPassword);
                        String sql = "SELECT * FROM bookinghotel WHERE booking_id = ?";
                        pstmt = conn.prepareStatement(sql);
                        pstmt.setInt(1, Integer.parseInt(bookingId));
                        rs = pstmt.executeQuery();

                        if (rs.next()) {
                            name = rs.getString("name");
                            email = rs.getString("email");
                            phoneNo = rs.getString("phoneNo");
                            roomNum = rs.getString("roomNum");
                            checkinDate = rs.getString("CheckIn");
                            checkoutDate = rs.getString("CheckOut");
                        } else {
                            out.println("<p class='error'>Error: Booking not found.</p>");
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                        out.println("<p class='error'>There was an error: " + e.getMessage() + "</p>");
                    } finally {
                        try {
                            if (rs != null) rs.close();
                            if (pstmt != null) pstmt.close();
                            if (conn != null) conn.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }

                    if (!name.isEmpty()) {
            %>
                        <p><strong>Booking Details:</strong></p>
                        <ul>
                            <li><strong>Name:</strong> <%= name %></li>
                            <li><strong>Email:</strong> <%= email %></li>
                            <li><strong>Phone Number:</strong> <%= phoneNo %></li>
                            <li><strong>Room Number:</strong> <%= roomNum %></li>
                            <li><strong>Check-in Date:</strong> <%= checkinDate %></li>
                            <li><strong>Check-out Date:</strong> <%= checkoutDate %></li>
                        </ul>
                        <button type="button" class="btn-primary" onclick="redirectToQRCode()">Pay Now</button>
                        <button id="submitReceiptButton" type="button" class="btn-secondary" onclick="submitReceipt()" disabled>Submit Receipt</button>
            <%
                    }
                }
            %>
            <a href="HomepageCustomer.jsp"><button id="backToHomeButton" class="btn-secondary" disabled>Back to Home</button></a>
        </div>
    </div>
</body>
</html>
