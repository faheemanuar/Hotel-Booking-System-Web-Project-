package models;



/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author USER
 */
public class Room {
    private int roomid;
    private String roomNumber;
    private String roomType;
    private String facilities;
    private Boolean status;

    // Constructor
    public Room(int roomid, String roomNumber, String roomType, String facilities, Boolean status) {
        this.roomid = roomid;
        this.roomNumber = roomNumber;
        this.roomType = roomType;
        this.facilities = facilities;
        this.status = status;
    }

    // Default Constructor
    public Room() {}

    public String getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(String roomNumber) {
        this.roomNumber = roomNumber;
    }

    public int getRoomid() {
        return roomid;
    }

    public void setRoomid(int roomid) {
        this.roomid = roomid;
    }

    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }

    public String getFacilities() {
        return facilities;
    }

    public void setFacilities(String facilities) {
        this.facilities = facilities;
    }

    public Boolean isStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Room{" +
                "roomid=" + roomid +
                ", roomNumber='" + roomNumber + '\'' +
                ", roomType='" + roomType + '\'' +
                ", facilities='" + facilities + '\'' +
                ", status=" + status +
                '}';
    }
}
