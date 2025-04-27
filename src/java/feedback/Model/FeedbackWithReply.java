/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package feedback.Model;

/**
 *
 * @author Aqiilah Mohd Noor
 */
public class FeedbackWithReply {
    private Feedback feedback;
    private String reply;

    public FeedbackWithReply(Feedback feedback, String reply) {
        this.feedback = feedback;
        this.reply = reply;
    }

    public Feedback getFeedback() {
        return feedback;
    }

    public void setFeedback(Feedback feedback) {
        this.feedback = feedback;
    }

    public String getReply() {
        return reply;
    }

    public void setReply(String reply) {
        this.reply = reply;
    }
}
