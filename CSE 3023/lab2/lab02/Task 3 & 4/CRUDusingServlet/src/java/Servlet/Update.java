package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet for retrieving user data and displaying an update form.
 *
 * @author azmyl
 */
@WebServlet("/Update")
public class Update extends HttpServlet { // Must extend HttpServlet

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String id = request.getParameter("id");

        // Basic validation for the ID parameter
        if (id == null || id.isEmpty()) {
            out.println("Error: User ID is missing.");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Note: Removed the extra space in the URL string
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/CSE3023", "root", "admin2128");

            String sql = "SELECT * FROM users WHERE id=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(id));
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                String currentRole = rs.getString("roles");

                out.println("<html><body>");
                out.println("<h2>Update User</h2>");
                out.println("<form action='UpdateServlet' method='POST'>");

                // Hidden ID
                out.println("<input type='hidden' name='id' value='" + rs.getInt("id") + "'>");

                // Username field
                out.println("Username: <input type='text' name='username' value='"
                        + rs.getString("username") + "' required><br><br>");

                // Password field (Fixed the broken string from original code)
                out.println("Password: <input type='text' name='password' value='"
                        + rs.getString("password") + "' required><br><br>");

                // Role Dropdown
                out.println("Role: <select name='roles'>");
                out.println("<option value='Admin' " + ("Admin".equals(currentRole) ? "selected" : "") + ">Admin</option>");
                out.println("<option value='Staff' " + ("Staff".equals(currentRole) ? "selected" : "") + ">Staff</option>");
                out.println("<option value='Student' " + ("Student".equals(currentRole) ? "selected" : "") + ">Student</option>");
                out.println("</select><br><br>");

                out.println("<input type='submit' value='Update User'>");
                out.println("</form>");
                out.println("</body></html>");

            } else {
                out.println("User not found.");
            }

            rs.close();
            pstmt.close();
            conn.close();

        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
