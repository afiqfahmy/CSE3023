<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Error Student</title>
    </head>
    <body>

        <h1>Lab 6 - Task 3 - Error Page</h1>

        <p style="color:red;">
            <%= exception.getMessage()%>
        </p>

        <a href="insertStudent.jsp">Back to Student Registration</a>

    </body>
</html>