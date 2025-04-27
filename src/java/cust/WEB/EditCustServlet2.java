package cust.WEB;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import cust.DAO.CustDAO;
import cust.Model.Cust;

@WebServlet(name = "EditCustServlet2", urlPatterns = {"/EditCustServlet2"})
public class EditCustServlet2 extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Retrieve form parameters
        int customer_id = Integer.parseInt(request.getParameter("customer_id"));
        String customer_name = request.getParameter("customer_name");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String customer_email = request.getParameter("customer_email");
        String customer_phoneNo = request.getParameter("customer_phoneNo");
        
        // Debugging statements
        System.out.println("Updating customer with ID: " + customer_id);
        
        // Create Customer object and set its properties
        Cust cust = new Cust();
        cust.setID(customer_id);
        cust.setName(customer_name);
        cust.setUsername(username);
        cust.setPassword(password);
        cust.setEmail(customer_email);
        cust.setPhoneNo(customer_phoneNo);
        

        // Update customer details in the database
        int status = CustDAO.update(cust);
        if (status > 0) {
            // Redirect with success message
            response.sendRedirect("cust.jsp?message=Record updated successfully!");
        } else {
            // Redirect with error message
            response.sendRedirect("editCust.jsp?message=Unable to update record.");
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
