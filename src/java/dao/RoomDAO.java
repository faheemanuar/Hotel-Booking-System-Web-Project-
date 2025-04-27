package dao;



/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author USER
 */
import models.Room;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import connect.DBConnection;

public class RoomDAO {
    public static List<Room> getAllRooms() {
        List<Room> rooms = new ArrayList<>();
        String sql = "SELECT * FROM rooms";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Room room = new Room();
                room.setRoomid(rs.getInt("room_id"));
                room.setRoomNumber(rs.getString("room_number"));
                room.setRoomType(rs.getString("room_type"));
                room.setFacilities(rs.getString("facilities"));
                room.setStatus(rs.getBoolean("status"));
                rooms.add(room);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rooms;
    }

    public static void addRoom(Room room) {
        String sql = "INSERT INTO rooms (room_number, room_type, facilities, status) VALUES (?, ?, ?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, room.getRoomNumber());
            ps.setString(2, room.getRoomType());
            ps.setString(3, room.getFacilities());
            ps.setBoolean(4, room.isStatus());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void updateRoom(Room room) {
        String sql = "UPDATE rooms SET room_type = ?, facilities = ?, status = ? WHERE room_id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, room.getRoomType());
            ps.setString(2, room.getFacilities());
            ps.setBoolean(3, room.isStatus());
            ps.setInt(4, room.getRoomid());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

        public static void deleteRoomByNumber(String roomNumber) {
        String sql = "DELETE FROM rooms WHERE room_number = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, roomNumber);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Room getRoomByNumber(String roomNumber) {
        Room room = null;
        String sql = "SELECT * FROM rooms WHERE room_number = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, roomNumber);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    room = new Room();
                    room.setRoomid(rs.getInt("room_id"));
                    room.setRoomNumber(rs.getString("room_number"));
                    room.setRoomType(rs.getString("room_type"));
                    room.setFacilities(rs.getString("facilities"));
                    room.setStatus(rs.getBoolean("status"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return room;
    }
}