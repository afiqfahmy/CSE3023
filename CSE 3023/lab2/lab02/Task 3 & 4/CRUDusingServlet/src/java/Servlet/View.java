package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class View extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("<h2>User List</h2>");
        out.println("<table border='1'>");
        out.println("<tr><th>ID</th><th>Username</th><th>Password</th><th>Role</th><th>Actions</th></tr>");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/CSE3023",
                    "root",
                    "admin"
            );

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM users");

            while (rs.next()) {
                int id = rs.getInt("id");

                out.println("<tr>");
                out.println("<td>" + id + "</td>");
                out.println("<td>" + rs.getString("username") + "</td>");
                out.println("<td>" + rs.getString("password") + "</td>");
                out.println("<td>" + rs.getString("roles") + "</td>");

                out.println("<td>");
                out.println("<a href='UpdateServlet?id=" + id + "'>Edit</a> | ");
                out.println("<a href='DeleteServlet?id=" + id + "'>Delete</a>");
                out.println("</td>");

                out.println("</tr>");
            }

            out.println("</table>");
            out.println("<br><a href='index.html'>Add New User</a>");

            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
