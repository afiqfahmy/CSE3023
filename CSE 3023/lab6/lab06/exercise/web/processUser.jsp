<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Process User</title>
    </head>
    <body>

        <h1>Process User Registration</h1>

        <%
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String firstname = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");

                String myURL = "jdbc:mysql://localhost:3306/cse3023";
                Connection myConnection
                        = DriverManager.getConnection(myURL, "root", "toor");

                String sql = "INSERT INTO userprofile(username, password, firstname, lastname) VALUES(?,?,?,?)";

                PreparedStatement ps = myConnection.prepareStatement(sql);
                ps.setString(1, username);
                ps.setString(2, password);
                ps.setString(3, firstname);
                ps.setString(4, lastname);

                int result = ps.executeUpdate();

                if (result > 0) {
        %>

        <p style="color:green;">User successfully registered!</p>
        <a href="login.jsp">Click here to login</a>

        <%
                }

                ps.close();
                myConnection.close();

            } catch (Exception e) {
                out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
            }
        %>

    </body>
</html>