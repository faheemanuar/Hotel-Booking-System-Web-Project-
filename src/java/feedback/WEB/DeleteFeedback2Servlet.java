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
import java.io.PrintWriter;

@WebServlet(name = "DeleteFeedback2Servlet", urlPatterns = {"/DeleteFeedback2Servlet"})
public class DeleteFeedback2Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    

    public DeleteFeedback2Servlet() {
        super();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int feedbackId = Integer.parseInt(request.getParameter("feedback_id"));
        int result = FeedbackDAO.delete(feedbackId);
        
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        
        if (result > 0) {
            out.print("success");
        } else {
            out.print("fail");
        }
    }
}


