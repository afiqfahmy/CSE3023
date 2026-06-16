<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.lab.bean.StudentBean"%>

<%
    StudentBean user = (StudentBean) session.getAttribute("loggedUser");

    if (user == null) {
        response.sendRedirect("../login.html");
        return;
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Register Subject</title>
    </head>
    <body>

        <h2>Register New Subject</h2>

        <p>Logged in as: <%= user.getMatricNo()%></p>

        <form action="SubjectServlet" method="POST">
            <input type="hidden" name="action" value="add">

            Subject Code:
            <input type="text" name="subjectCode" required>
            <br><br>

            Subject Name:
            <input type="text" name="subjectName" required>
            <br><br>

            <input type="submit" value="Register Subject">
        </form>

        <br>

        <a href="SubjectServlet?action=view">Back to Subject List</a>
        <br>
        <a href="dashboard.jsp">Back to Dashboard</a>

    </body>
</html>