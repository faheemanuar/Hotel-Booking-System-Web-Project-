/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package feedback.DAO;

import feedback.Model.Feedback;
import feedback.Model.FeedbackWithReply;
import feedback.Model.Reply;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FeedbackDAO {
  
    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/marmoris", "root", "admin");
            System.out.println("Database connection successful.");
        } catch (Exception e) {
            System.out.println("Failed to connect to the database: " + e.getMessage());
            e.printStackTrace();
        }
        return con;
    }
    
    public static int save(Feedback feedback) {
        int status = 0;
        String query = "INSERT INTO feedback(customer_id, username, customer_email, message, rating) "
                     + "SELECT customer_id, ?, ?, ?, ? FROM customer WHERE username = ?";
        try (Connection con = FeedbackDAO.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, feedback.getUsername());
            ps.setString(2, feedback.getCustomer_email());
            ps.setString(3, feedback.getMessage());
            ps.setInt(4, feedback.getRating());
            ps.setString(5, feedback.getUsername());
            status = ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }
     
    public static Feedback getFeedbackById(int id) {
        
        Feedback feedback = null;
        String query = "SELECT * FROM feedback WHERE feedback_id=?";
        try (Connection con = FeedbackDAO.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    feedback = new Feedback();
                    feedback.setFeedback_id(rs.getInt("feedback_id"));
                    feedback.setCustomer_id(rs.getInt("customer_id"));
                    feedback.setUsername(rs.getString("username"));
                    feedback.setCustomer_email(rs.getString("customer_email"));
                    feedback.setMessage(rs.getString("message"));
                    feedback.setRating(rs.getInt("rating"));
                    
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return feedback;
    }

    public static List<Feedback> getAllFeedback() {
        List<Feedback> list = new ArrayList<>();
        String query = "SELECT * FROM feedback";
        try (Connection con = FeedbackDAO.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Feedback feedback = new Feedback();
                feedback.setFeedback_id(rs.getInt("feedback_id"));
                    feedback.setCustomer_id(rs.getInt("customer_id"));
                    feedback.setUsername(rs.getString("username"));
                    feedback.setCustomer_email(rs.getString("customer_email"));
                    feedback.setMessage(rs.getString("message"));
                    feedback.setRating(rs.getInt("rating"));
                
                list.add(feedback);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    

    
    public static int delete(int feedbackID) {
    int status = 0;
    String deleteRepliesQuery = "DELETE FROM reply_feedback WHERE feedback_id=?";
    String deleteFeedbackQuery = "DELETE FROM feedback WHERE feedback_id=?";
    
    try (Connection con = FeedbackDAO.getConnection();
         PreparedStatement psReplies = con.prepareStatement(deleteRepliesQuery);
         PreparedStatement psFeedback = con.prepareStatement(deleteFeedbackQuery)) {
         
        // Delete related replies first
        psReplies.setInt(1, feedbackID);
        psReplies.executeUpdate();

        // Delete the feedback entry
        psFeedback.setInt(1, feedbackID);
        status = psFeedback.executeUpdate();

    } catch (SQLException ex) {
        ex.printStackTrace();
    }
    return status;
}

    

public static int saveReply(Reply reply) {
        int status = 0;
        String query = "INSERT INTO reply_feedback(feedback_id, customer_id, username, customer_email, message, rating, reply) "
                     + "SELECT feedback_id, customer_id, username, customer_email, message, rating, ? "
                     + "FROM feedback WHERE feedback_id = ?";
        try (Connection con = FeedbackDAO.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, reply.getReply());
            ps.setInt(2, reply.getFeedback_id());
            status = ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }

public static void saveReply1(int feedbackId, int customerId, String username, String email, String message, int rating, String reply) {
        String query = "INSERT INTO reply_feedback (feedback_id, customer_id, username, email, message, rating, reply) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, feedbackId);
            ps.setInt(2, customerId);
            ps.setString(3, username);
            ps.setString(4, email);
            ps.setString(5, message);
            ps.setInt(6, rating);
            ps.setString(7, reply);
            ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        String updateQuery = "UPDATE reply_feedback SET reply = ? WHERE feedback_id = ?";
    try (Connection con = getConnection();
         PreparedStatement ps = con.prepareStatement(updateQuery)) {
        ps.setString(1, reply);
        ps.setInt(2, feedbackId);
        ps.executeUpdate();
    } catch (SQLException ex) {
        ex.printStackTrace();
    }
    }
     
     public static List<FeedbackWithReply> getAllFeedbackWithReplies() {
        List<FeedbackWithReply> feedbackList = new ArrayList<>();
        String query = "SELECT f.feedback_id, f.customer_id, f.username, f.customer_email, f.message, f.rating, r.reply " +
                       "FROM feedback f LEFT JOIN reply_feedback r ON f.feedback_id = r.feedback_id";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Feedback feedback = new Feedback();
                feedback.setFeedback_id(rs.getInt("feedback_id"));
                feedback.setCustomer_id(rs.getInt("customer_id"));
                feedback.setUsername(rs.getString("username"));
                feedback.setCustomer_email(rs.getString("customer_email"));
                feedback.setMessage(rs.getString("message"));
                feedback.setRating(rs.getInt("rating"));

                String reply = rs.getString("reply");

                feedbackList.add(new FeedbackWithReply(feedback, reply));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return feedbackList;
    }
}



