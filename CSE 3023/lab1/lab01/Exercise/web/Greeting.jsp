<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%-- Auto-refresh every 5 seconds --%>
        <meta http-equiv="refresh" content="5">
        <title>Greeting Page</title>
    </head>
    <body>
        <%-- Retrieve the attribute set by the Servlet --%>
        <h1>Hello, ${userName}!</h1>

        <p>The current date and time is: <b><%= new Date()%></b></p>

        <p><small>This page refreshes automatically every 5 seconds.</small></p>
    </body>
</html>