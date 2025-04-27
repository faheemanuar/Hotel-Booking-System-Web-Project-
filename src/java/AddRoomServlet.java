/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author USER
 */

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import models.Room;
import dao.RoomDAO;

@WebServlet("/addRoomServlet")
@MultipartConfig
public class AddRoomServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String roomNumber = request.getParameter("room_number");
        String roomType = request.getParameter("room_type");
        String facilities = request.getParameter("facilities");

        Room room = new Room();
        room.setRoomNumber(roomNumber);
        room.setRoomType(roomType);
        room.setFacilities(facilities);
        room.setStatus(true); // Assuming new room is available

        RoomDAO.addRoom(room);

        response.sendRedirect("hotelroommanage.jsp");
    }

}