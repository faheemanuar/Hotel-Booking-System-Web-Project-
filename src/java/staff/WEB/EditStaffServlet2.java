package staff.WEB;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import staff.DAO.StaffDAO;
import staff.Model.Staff;

@WebServlet(name = "EditStaffServlet2", urlPatterns = {"/EditStaffServlet2"})
public class EditStaffServlet2 extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Retrieve form parameters
        int staff_id = Integer.parseInt(request.getParameter("staff_id"));
        String staff_name = request.getParameter("staff_name");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String staff_email = request.getParameter("staff_email");
        String staff_phoneNo = request.getParameter("staff_phoneNo");
        String role = request.getParameter("role");

        // Debugging statements
        System.out.println("Updating staff with ID: " + staff_id);
        
        // Create Customer object and set its properties
        Staff staff = new Staff();
        staff.setID(staff_id);
        staff.setName(staff_name);
        staff.setUsername(username);
        staff.setPassword(password);
        staff.setEmail(staff_email);
        staff.setPhoneNo(staff_phoneNo);
        staff.setRole(role);

        // Update customer details in the database
        int status = StaffDAO.update(staff);
        if (status > 0) {
            // Redirect with success message
            response.sendRedirect("staff.jsp?message=Record updated successfully!");
        } else {
            // Redirect with error message
            response.sendRedirect("editStaff.jsp?message=Unable to update record.");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
