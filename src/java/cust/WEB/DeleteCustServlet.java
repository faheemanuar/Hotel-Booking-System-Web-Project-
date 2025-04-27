/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package cust.WEB;


import cust.WEB.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import cust.DAO.CustDAO;

@WebServlet(name = "DeleteCustServlet", urlPatterns = {"/DeleteCustServlet"})
public class DeleteCustServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DeleteCustServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String custId = request.getParameter("customer_id");
        
        try {
            if (custId != null && !custId.isEmpty()) {
                int id = Integer.parseInt(custId);
                int result = CustDAO.delete(id);
                
                if (result > 0) {
                    response.getWriter().write("success");
                } else {
                    response.getWriter().write("fail");
                }
            } else {
                response.getWriter().write("fail");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("fail");
        }
    }
}
