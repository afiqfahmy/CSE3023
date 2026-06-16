<%-- 
    Document   : JavaObject
    Created on : Apr 1, 2026, 9:34:21 PM
    Author     : azmyl
--%>
<%@ page import="java.util.Date" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Display current Date & perform auto refresh</h1>
        <%
            Date currentDate = new Date();
            out.println("<p>Current date and time is " + currentDate.toString() + "</p>");
        %>

        <%
            response.setIntHeader("Refresh", 5);
        %>

    </body>
</html>