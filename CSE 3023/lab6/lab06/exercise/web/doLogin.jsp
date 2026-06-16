<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    boolean isValid = false;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        String myURL = "jdbc:mysql://localhost:3306/cse3023";
        Connection myConnection
                = DriverManager.getConnection(myURL, "root", "toor");

        String sql = "SELECT * FROM userprofile WHERE username=? AND password=?";

        PreparedStatement ps = myConnection.prepareStatement(sql);
        ps.setString(1, username);
        ps.setString(2, password);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            isValid = true;

            session.setAttribute("username", rs.getString("username"));
            session.setAttribute("firstname", rs.getString("firstname"));
            session.setAttribute("lastname", rs.getString("lastname"));
        }

        rs.close();
        ps.close();
        myConnection.close();

        if (isValid) {
            response.sendRedirect("main.jsp");
        } else {
            response.sendRedirect("login.jsp?error=1");
        }

    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>