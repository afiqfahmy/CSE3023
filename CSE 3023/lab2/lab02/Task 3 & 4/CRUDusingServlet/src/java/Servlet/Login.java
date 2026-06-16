package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Login extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("id");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String roles = request.getParameter("roles");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306 / CSE3023", "root", "admin");
            String sql = "UPDATE users SET username=?, password=?, roles=?WHERE id =  ?";

            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            pstmt.setString(3, roles);
            pstmt.setInt(4, Integer.parseInt(id));
            pstmt.executeUpdate();

            pstmt.close();
            conn.close();

            response.sendRedirect("ViewServlet");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
