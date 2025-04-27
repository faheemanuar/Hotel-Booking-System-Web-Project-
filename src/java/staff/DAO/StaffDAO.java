/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package staff.DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import staff.Model.Staff;

public class StaffDAO {
    
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

    public static int save(Staff staff) {
        int status = 0;
        String query = "INSERT INTO staff(staff_name, username, password, staff_email, staff_phoneNo, role) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection con = StaffDAO.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, staff.getName());
            ps.setString(2, staff.getUsername());
            ps.setString(3, staff.getPassword());
            ps.setString(4, staff.getEmail());
            ps.setString(5, staff.getPhoneNo());
            ps.setString(6, staff.getRole());
            status = ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }

    public static int update(Staff staff) {
        int status = 0;
        String query = "UPDATE staff SET staff_name = ?, username = ?, password = ?, staff_email = ?, staff_phoneNo = ?, role = ? WHERE staff_id = ?";
        try (Connection con = StaffDAO.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, staff.getName());
            ps.setString(2, staff.getUsername());
            ps.setString(3, staff.getPassword());
            ps.setString(4, staff.getEmail());
            ps.setString(5, staff.getPhoneNo());
            ps.setString(6, staff.getRole());
            ps.setInt(7, staff.getID());
            status = ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }

    public static int delete(int staffID) {
        int status = 0;
        String query = "DELETE FROM staff WHERE staff_id=?";
        try (Connection con = StaffDAO.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, staffID);
            status = ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }

    public static Staff getStaffById(int id) {
        //Staff staff = new Staff();
        Staff staff = null;
        String query = "SELECT * FROM staff WHERE staff_id=?";
        try (Connection con = StaffDAO.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    staff = new Staff();
                    staff.setID(rs.getInt("staff_id"));
                    staff.setName(rs.getString("staff_name"));
                    staff.setUsername(rs.getString("username"));
                    staff.setPassword(rs.getString("password"));
                    staff.setEmail(rs.getString("staff_email"));
                    staff.setPhoneNo(rs.getString("staff_phoneNo"));
                    staff.setRole(rs.getString("role"));
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return staff;
    }

    public static List<Staff> getAllStaff() {
        List<Staff> list = new ArrayList<>();
        String query = "SELECT * FROM staff";
        try (Connection con = StaffDAO.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Staff staff = new Staff();
                staff.setID(rs.getInt("staff_id"));
                staff.setName(rs.getString("staff_name"));
                staff.setUsername(rs.getString("username"));
                staff.setPassword(rs.getString("password"));
                staff.setEmail(rs.getString("staff_email"));
                staff.setPhoneNo(rs.getString("staff_phoneNo"));
                staff.setRole(rs.getString("role"));
                list.add(staff);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    
}
