/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cust.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import cust.Model.Cust;
import java.sql.SQLException;

/**
 *
 * @author Aqiilah Mohd Noor
 */
public class CustDAO {
    
    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/marmoris", "root", "admin");
            System.out.println("Database connection successful.");
        } catch (Exception e) {
            System.out.println("Failed to connect to the database: " + e.getMessage());
            e.printStackTrace();
        }
        return con;
    }

    public static int save(Cust cust) {
        int status = 0;
        String query = "INSERT INTO customer(customer_name, username, password, customer_email, customer_phoneNo) VALUES (?, ?, ?, ?, ?)";
        try (Connection con = CustDAO.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, cust.getName());
            ps.setString(2, cust.getUsername());
            ps.setString(3, cust.getPassword());
            ps.setString(4, cust.getEmail());
            ps.setString(5, cust.getPhoneNo());
            status = ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }

    public static int update(Cust cust) {
        int status = 0;
        String query = "UPDATE customer SET customer_name = ?, username = ?, password = ?, customer_email = ?, customer_phoneNo = ? WHERE customer_id = ?";
        try (Connection con = CustDAO.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, cust.getName());
            ps.setString(2, cust.getUsername());
            ps.setString(3, cust.getPassword());
            ps.setString(4, cust.getEmail());
            ps.setString(5, cust.getPhoneNo());
            ps.setInt(6, cust.getID());
            status = ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }

    public static int delete(int custID) {
        int status = 0;
        String query = "DELETE FROM customer WHERE customer_id=?";
        try (Connection con = CustDAO.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, custID);
            status = ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }

    public static Cust getCustById(int id) {
        //Staff staff = new Staff();
        Cust cust = null;
        String query = "SELECT * FROM customer WHERE customer_id=?";
        try (Connection con = CustDAO.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    cust = new Cust();
                    cust.setID(rs.getInt("customer_id"));
                    cust.setName(rs.getString("customer_name"));
                    cust.setUsername(rs.getString("username"));
                    cust.setPassword(rs.getString("password"));
                    cust.setEmail(rs.getString("customer_email"));
                    cust.setPhoneNo(rs.getString("customer_phoneNo"));
                    
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return cust;
    }

    public static List<Cust> getAllCust() {
        List<Cust> list = new ArrayList<>();
        String query = "SELECT * FROM customer";
        try (Connection con = CustDAO.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Cust cust = new Cust();
                cust.setID(rs.getInt("customer_id"));
                cust.setName(rs.getString("customer_name"));
                cust.setUsername(rs.getString("username"));
                cust.setPassword(rs.getString("password"));
                cust.setEmail(rs.getString("customer_email"));
                cust.setPhoneNo(rs.getString("customer_phoneNo"));
                
                list.add(cust);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public static boolean usernameExists(String username) {
        boolean exists = false;
        String query = "SELECT COUNT(*) FROM customer WHERE username = ?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, username);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    int count = rs.getInt(1);
                    exists = (count > 0);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return exists;
    }
    
}

