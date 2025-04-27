/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cust.Model;

/**
 *
 * @author Aqiilah Mohd Noor
 */
public class Cust {
    private int customer_id;
    private String customer_name;
    private String username;
    private String password;
    private String customer_email;
    private String customer_phoneNo;

    
   
    public int getID() {
        return customer_id;
    }

   
    public void setID(int customer_id) {
        this.customer_id = customer_id;
    }

    
    public String getName() {
        return customer_name;
    }

    
    public void setName(String customer_name) {
        this.customer_name = customer_name;
    }

   
    public String getUsername() {
        return username;
    }

    
    public void setUsername(String username) {
        this.username = username;
    }

    
    public String getPassword() {
        return password;
    }

    
    public void setPassword(String password) {
        this.password = password;
    }

   
    public String getEmail() {
        return customer_email;
    }

   
    public void setEmail(String customer_email) {
        this.customer_email = customer_email;
    }

   
    public String getPhoneNo() {
        return customer_phoneNo;
    }

   
    public void setPhoneNo(String customer_phoneNo) {
        this.customer_phoneNo = customer_phoneNo;
    }

    
}

