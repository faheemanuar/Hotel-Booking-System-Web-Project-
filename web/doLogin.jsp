<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.HttpSession"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <%
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/marmoris", "root", "admin");
                out.println("Connected to the database.<br>");

                // Check for staff/admin
                PreparedStatement employeePS = con.prepareStatement("SELECT staff_id, staff_name, role FROM staff WHERE username=? AND password=?");
                employeePS.setString(1, username);
                employeePS.setString(2, password);
                ResultSet employeeRS = employeePS.executeQuery();
                out.println("Executed staff query.<br>");


                if (employeeRS.next()) {
                    String id = employeeRS.getString("staff_id");
                    String name = employeeRS.getString("staff_name");
                    String role = employeeRS.getString("role");

                    session.setAttribute("userRole", role);
                    session.setAttribute("staff_name", name);
                    session.setAttribute("staff_id", id);

                    out.println("Staff login successful. Role: " + role + "<br>");

                    if ("manager".equalsIgnoreCase(role)) {
                        response.sendRedirect("HomepageAdmin.jsp");
                    } else if ("staff".equalsIgnoreCase(role)) {
                        response.sendRedirect("HomepageStaff.jsp");
                    }
                } else {
                    // Check for customer
                    PreparedStatement customerPS = con.prepareStatement("SELECT customer_id, customer_name FROM customer WHERE username=? AND password=?");
                    customerPS.setString(1, username);
                    customerPS.setString(2, password);
                    ResultSet customerRS = customerPS.executeQuery();
                    out.println("Executed customer query.<br>");

                    if (customerRS.next()) {
                        String id = customerRS.getString("customer_id");
                        String name = customerRS.getString("customer_name");

                        session.setAttribute("userRole", "customer");
                        session.setAttribute("customer_name", name);
                        session.setAttribute("customer_id", id);

                        out.println("Customer login successful.<br>");
                        response.sendRedirect("HomepageCustomer.jsp");
                    } else {
                        out.println("<script>alert(\"Invalid username or password.\"); window.location.href='LoginUser.jsp';</script>");
                    }
                }
                con.close();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
                out.println("<script>alert(\"Database driver not found.\"); window.location.href='LoginUser.jsp';</script>");
            } catch (SQLException e) {
                e.printStackTrace();
                out.println("<script>alert(\"Database error occurred: " + e.getMessage() + "\"); window.location.href='LoginUser.jsp';</script>");
            }
        %>
    </body>
</html>
