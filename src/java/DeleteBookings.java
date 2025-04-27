import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteBookings")
public class DeleteBookings extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] bookingIds = request.getParameterValues("bookingIds");

        if (bookingIds == null || bookingIds.length == 0) {
            response.sendRedirect("ViewBookings.jsp");
            return;
        }

        // Database connection parameters (replace with your actual credentials)
        String dbURL = "jdbc:mysql://localhost/marmoris";
        String dbUser = "root";
        String dbPass = "admin";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            // Prepare SQL statement to delete bookings
            String sql = "DELETE FROM bookinghotel WHERE id=?";
            pstmt = conn.prepareStatement(sql);

            for (String id : bookingIds) {
                pstmt.setInt(1, Integer.parseInt(id));
                pstmt.executeUpdate();
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }

        response.sendRedirect("ViewBookings.jsp");
    }
}
