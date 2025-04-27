/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package cust.WEB;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import cust.DAO.CustDAO;
import cust.Model.Cust;

@WebServlet(name = "SaveCustServlet", urlPatterns = {"/SaveCustServlet"})
public class SaveCustServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form parameters
        String name = request.getParameter("customer_name");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("customer_email");
        String phoneNo = request.getParameter("customer_phoneNo");
//        String role = request.getParameter("role");

        
        Cust cust = new Cust();
        cust.setName(name);
        cust.setUsername(username);
        cust.setPassword(password);
        cust.setEmail(email);
        cust.setPhoneNo(phoneNo);
        //cust.setRole(role);

       
        int result = CustDAO.save(cust);

        // Redirect to appropriate page based on result
        if (result > 0) {
            response.sendRedirect("HomepageAdmin.jsp?message=Customer+record+saved+successfully");
        } else {
            response.sendRedirect("addCust.jsp?message=Sorry!+Unable+to+save+customer+record");
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
        return "SaveCustServlet handles the addition of new customer records.";
    }
}
