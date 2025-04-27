/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package feedback.Model;

/**
 *
 * @author Aqiilah Mohd Noor
 */
public class Reply {
    
    private int reply_id;
    private int feedback_id;
    private int customer_id;
    private String username;
    private String customer_email;
    private String message;
    private int rating;
    private String reply;

    /**
     * @return the reply
     */
    public String getReply() {
        return reply;
    }

    /**
     * @param reply the reply to set
     */
    public void setReply(String reply) {
        this.reply = reply;
    }

    /**
     * @return the reply_id
     */
    public int getReply_id() {
        return reply_id;
    }

    /**
     * @param reply_id the reply_id to set
     */
    public void setReply_id(int reply_id) {
        this.reply_id = reply_id;
    }

    /**
     * @return the feedback_id
     */
    public int getFeedback_id() {
        return feedback_id;
    }

    /**
     * @param feedback_id the feedback_id to set
     */
    public void setFeedback_id(int feedback_id) {
        this.feedback_id = feedback_id;
    }

    /**
     * @return the customer_id
     */
    public int getCustomer_id() {
        return customer_id;
    }

    /**
     * @param customer_id the customer_id to set
     */
    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the customer_email
     */
    public String getCustomer_email() {
        return customer_email;
    }

    /**
     * @param customer_email the customer_email to set
     */
    public void setCustomer_email(String customer_email) {
        this.customer_email = customer_email;
    }

    /**
     * @return the message
     */
    public String getMessage() {
        return message;
    }

    /**
     * @param message the message to set
     */
    public void setMessage(String message) {
        this.message = message;
    }

    /**
     * @return the rating
     */
    public int getRating() {
        return rating;
    }

    /**
     * @param rating the rating to set
     */
    public void setRating(int rating) {
        this.rating = rating;
    }
    
}
