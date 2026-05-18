<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>User Login</title>
    </head>
    <body>

        <h1>User Login</h1>

        <%
            String error = request.getParameter("error");

            if (error != null) {
        %>
        <p style="color:red;">Invalid username or password..!</p>
        <%
            }
        %>

        <form action="doLogin.jsp" method="post">
            Username:
            <input type="text" name="username" required><br><br>

            Password:
            <input type="password" name="password" required><br><br>

            <input type="submit" value="Login">
            <input type="reset" value="Cancel">
        </form>

        <br>
        <a href="insertUser.html">Register New User</a>

    </body>
</html>