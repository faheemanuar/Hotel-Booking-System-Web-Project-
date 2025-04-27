import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateBookingServlet")
public class UpdateBookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "jdbc:mysql://localhost/marmoris";
        String dbUser = "root";
        String dbPassword = "admin";
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, dbUser, dbPassword);

            int bookingId = Integer.parseInt(request.getParameter("bookingId"));
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phoneNo = request.getParameter("phoneNo");
            String roomNum = request.getParameter("roomNum");
            String checkinDate = request.getParameter("checkinDate");
            String checkoutDate = request.getParameter("checkoutDate");

            String sql = "UPDATE bookinghotel SET name = ?, email = ?, phoneNo = ?, roomNum = ?, CheckIn = ?, CheckOut = ? WHERE booking_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, phoneNo);
            pstmt.setString(4, roomNum);
            pstmt.setString(5, checkinDate);
            pstmt.setString(6, checkoutDate);
            pstmt.setInt(7, bookingId);

            pstmt.executeUpdate();

            response.sendRedirect("viewBookings.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<p>There was an error: " + e.getMessage() + "</p>");
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
