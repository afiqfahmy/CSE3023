<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String username = (String) session.getAttribute("username");
    String firstname = (String) session.getAttribute("firstname");
    String lastname = (String) session.getAttribute("lastname");

    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Main Page</title>
    </head>
    <body>

        <h1>Welcome to Main Page</h1>

        <p><b>Username:</b> <%= username%></p>
        <p><b>First Name:</b> <%= firstname%></p>
        <p><b>Last Name:</b> <%= lastname%></p>

        <a href="logout.jsp">Logout</a>

    </body>
</html>