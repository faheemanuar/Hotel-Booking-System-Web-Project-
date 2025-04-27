<%-- 
    Document   : deleteRoom
    Created on : 28 May 2024, 6:59:29 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@page import="javax.servlet.*" %>
<%@page import="javax.servlet.http.*" %>
<%@page import="javax.servlet.annotation.*" %>
<%@page import="models.*" %>
<%@page import="dao.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Room</title>
</head>
<body>
    <h3>Delete Room</h3>
    <form action="deleteRoomServlet" method="post">
        Room ID: <input type="text" name="room_id"><br>
        <input type="submit" value="Delete">
    </form>
</body>
</html>