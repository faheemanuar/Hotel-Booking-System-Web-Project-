/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package staff.Model;

/**
 *
 * @author Aqiilah Mohd Noor
 */
public class Staff {
    private int staff_id;
    private String staff_name;
    private String username;
    private String password;
    private String staff_email;
    private String staff_phoneNo;
    private String role;
    
    /**
     * @return the id
     */
    public int getID() {
        return staff_id;
    }

    /**
     * @param id the id to set
     */
    public void setID(int staff_id) {
        this.staff_id = staff_id;
    }

    /**
     * @return the staff_name
     */
    public String getName() {
        return staff_name;
    }

    /**
     * @param staff_name the staff_name to set
     */
    public void setName(String staff_name) {
        this.staff_name = staff_name;
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
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the staff_email
     */
    public String getEmail() {
        return staff_email;
    }

    /**
     * @param staff_email the staff_email to set
     */
    public void setEmail(String staff_email) {
        this.staff_email = staff_email;
    }

    /**
     * @return the staff_phoneNo
     */
    public String getPhoneNo() {
        return staff_phoneNo;
    }

    /**
     * @param staff_phoneNo the staff_phoneNo to set
     */
    public void setPhoneNo(String staff_phoneNo) {
        this.staff_phoneNo = staff_phoneNo;
    }

    /**
     * @return the role
     */
    public String getRole() {
        return role;
    }

    /**
     * @param role the role to set
     */
    public void setRole(String role) {
        this.role = role;
    }
    
}
