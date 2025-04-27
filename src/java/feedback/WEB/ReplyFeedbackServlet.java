/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package feedback.WEB;

import feedback.DAO.FeedbackDAO;
import feedback.Model.Feedback;
import feedback.Model.Reply;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Aqiilah Mohd Noor
 */
@WebServlet(name = "ReplyFeedbackServlet", urlPatterns = {"/ReplyFeedbackServlet"})
public class ReplyFeedbackServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String feedbackIdStr = request.getParameter("feedback_id");
        String reply = request.getParameter("reply");

        if (feedbackIdStr != null && !feedbackIdStr.isEmpty() && reply != null && !reply.isEmpty()) {
            int feedbackId = Integer.parseInt(feedbackIdStr);
            // Retrieve necessary information from database based on feedbackId
            Feedback feedback = FeedbackDAO.getFeedbackById(feedbackId);

            if (feedback != null) {
                Reply replyFeedback = new Reply();
                replyFeedback.setFeedback_id(feedback.getFeedback_id());
                replyFeedback.setCustomer_id(feedback.getCustomer_id());
                replyFeedback.setUsername(feedback.getUsername());
                replyFeedback.setCustomer_email(feedback.getCustomer_email());
                replyFeedback.setMessage(feedback.getMessage());
                replyFeedback.setRating(feedback.getRating());
                replyFeedback.setReply(reply);

                int result = FeedbackDAO.saveReply(replyFeedback);

                if (result > 0) {
                    // Successful reply submission
                    response.sendRedirect("success.jsp"); // Redirect to success page
                } else {
                    // Handle failure
                    response.sendRedirect("error.jsp"); // Redirect to error page
                }
            } else {
                // Handle feedback not found
                response.sendRedirect("error.jsp"); // Redirect to error page
            }
        } else {
            // Handle empty or missing parameters
            response.sendRedirect("error.jsp"); // Redirect to error page
        }
    }
}