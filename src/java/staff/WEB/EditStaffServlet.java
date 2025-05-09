/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package staff.WEB;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import staff.DAO.StaffDAO;
import staff.Model.Staff;

@WebServlet(name = "EditStaffServlet", urlPatterns = {"/EditStaffServlet"})
public class EditStaffServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        // Add logging to check the staff ID parameter
        String staffId = request.getParameter("staff_id");
        System.out.println("Staff ID: " + staffId);
        
        try {
            int id = Integer.parseInt(staffId);
            Staff staff = StaffDAO.getStaffById(id);
            
            if (staff == null) {
                // Handle case where staff is not found
                out.println("<script>alert('Staff not found!'); window.location.href='staff.jsp';</script>");
                return;
            }
            
            // Output the HTML form with the retrieved staff details
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>");
            out.println("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
            out.println("<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Stardos Stencil'>");
            out.println("<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>");
            out.println("<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css'>");
            out.println("<link rel='stylesheet' href='css/general.css'>");
            out.println("<link rel='stylesheet' href='css/form.css'>");
            out.println("<title>Update Staff</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<form method='post' action='EditStaffServlet2'>");
            out.println("<h1 class='title'>Update Staff Details</h1>");
            out.println("<table>");
            out.println("<tr class='section'>");
            out.println("<td class='div'><label for='staff_id'>Staff ID:</label><br><input type='number' name='staff_id' value='" + staff.getID() + "' readonly></td>");
            out.println("<td class='div'><label for='staff_name'>Name:</label><br><input type='text' name='staff_name' value='" + staff.getName() + "' required></td>");
            out.println("</tr>");
            out.println("<tr class='section'>");
            out.println("<td class='div'><label for='username'>Username:</label><br><input type='text' name='username' value='" + staff.getUsername() + "' required></td>");
            out.println("<td class='div'><label for='password'>Password:</label><br><input type='password' name='password' value='" + staff.getPassword() + "' required></td>");
            out.println("</tr>");
            out.println("<tr class='section'>");
            out.println("<td class='div'><label for='staff_email'>Email:</label><br><input type='email' name='staff_email' value='" + staff.getEmail() + "' required></td>");
            out.println("<td class='div'><label for='staff_phoneNo'>Phone Number:</label><br><input type='text' name='staff_phoneNo' value='" + staff.getPhoneNo() + "' required></td>");
            out.println("</tr>");
            out.println("<tr class='section'>");
            out.println("<td class='div'><label for='role'>Role:</label><br>");
            out.println("<select name='role'>");
            out.println("<option value ='manager'>Manager</option>");
            out.println("<option value ='staff'>Staff</option>");
            out.println("</select>");
            out.println("</td>");
            out.println("</tr>");
            out.println("</table><br>");
            out.println("<div class='button-container'>");
            out.println("<button id='cancelBtn' type='reset' class='submitBtn' onclick=\"window.location.href='staff.jsp'\" style='background-color: grey;'>CANCEL</button>");
            out.println("<button id='submitBtn' type='submit' class='submitBtn'>SAVE</button>");
            out.println("</div>");
            out.println("</form>");
            out.println("</body>");
            out.println("</html>");
        } catch (NumberFormatException e) {
            e.printStackTrace();
            out.println("<script>alert('Invalid staff ID!'); window.location.href='staff.jsp';</script>");
        } finally {
            out.close();
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
