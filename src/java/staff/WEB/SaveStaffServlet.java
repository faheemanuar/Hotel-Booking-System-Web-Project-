/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package staff.WEB;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import staff.DAO.StaffDAO;
import staff.Model.Staff;

@WebServlet(name = "SaveStaffServlet", urlPatterns = {"/SaveStaffServlet"})
public class SaveStaffServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form parameters
        String name = request.getParameter("staff_name");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("staff_email");
        String phoneNo = request.getParameter("staff_phoneNo");
        String role = request.getParameter("role");

        // Create Staff object and set its properties
        Staff staff = new Staff();
        staff.setName(name);
        staff.setUsername(username);
        staff.setPassword(password);
        staff.setEmail(email);
        staff.setPhoneNo(phoneNo);
        staff.setRole(role);

        // Save staff details in the database
        int result = StaffDAO.save(staff);

        // Redirect to appropriate page based on result
        if (result > 0) {
            response.sendRedirect("staff.jsp?message=Staff+record+saved+successfully");
        } else {
            response.sendRedirect("addStaff.jsp?message=Sorry!+Unable+to+save+staff+record");
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
        return "SaveStaffServlet handles the addition of new staff records.";
    }
}
