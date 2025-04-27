/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package feedback.WEB;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import feedback.DAO.FeedbackDAO;
import feedback.Model.Feedback;
import java.util.List;
import javax.servlet.RequestDispatcher;

@WebServlet(name = "SaveFeedbackServlet", urlPatterns = {"/SaveFeedbackServlet"})
public class SaveFeedbackServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String email = request.getParameter("customer_email");
        String message = request.getParameter("message");
        int rating = Integer.parseInt(request.getParameter("rating"));

        
        Feedback feedback = new Feedback();
        feedback.setUsername(username);
        feedback.setCustomer_email(email);
        feedback.setMessage(message);
        feedback.setRating(rating);
        
        int status = FeedbackDAO.save(feedback);
       if (status > 0) {
            // Use PRG pattern to prevent form resubmission on page refresh
            response.sendRedirect("feedback.jsp");
        } else {
            response.getWriter().println("Failed to submit feedback.");
        }
    }

        
//        if (status > 0) {
//            List<Feedback> list = FeedbackDAO.getAllFeedback();
//            request.setAttribute("list", list);
//            RequestDispatcher rd = request.getRequestDispatcher("feedback.jsp");
//            rd.forward(request, response);
//        } else {
//            response.getWriter().println("Failed to submit feedback.");
//        }
//    }
    
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
        return "SaveFeedbackServlet handles the addition of new feedback records.";
    }
}
