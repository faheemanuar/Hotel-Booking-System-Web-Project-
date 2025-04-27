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

@WebServlet("/updateRoomServlet")
public class UpdateRoomServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int roomId = Integer.parseInt(request.getParameter("room_id"));
        String roomType = request.getParameter("room_type");
        String facilities = request.getParameter("facilities");
        boolean status = "available".equals(request.getParameter("status"));

        Room room = new Room();
        room.setRoomid(roomId);
        room.setRoomType(roomType);
        room.setFacilities(facilities);
        room.setStatus(status);

        RoomDAO.updateRoom(room);

        response.sendRedirect("hotelroommanage.jsp");
    }
}