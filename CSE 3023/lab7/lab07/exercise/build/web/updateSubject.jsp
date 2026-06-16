<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.lab.bean.StudentBean"%>
<%@page import="com.lab.bean.SubjectBean"%>

<%
    StudentBean user = (StudentBean) session.getAttribute("loggedUser");

    if (user == null) {
        response.sendRedirect("../login.html");
        return;
    }

    SubjectBean subject = (SubjectBean) request.getAttribute("subject");

    if (subject == null) {
        response.sendRedirect("../SubjectServlet?action=view");
        return;
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Update Subject</title>
    </head>
    <body>

        <h2>Update Subject</h2>

        <form action="SubjectServlet" method="POST">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="<%= subject.getId()%>">

            Subject Code:
            <input type="text" name="subjectCode"
                   value="<%= subject.getSubjectCode()%>" required>
            <br><br>

            Subject Name:
            <input type="text" name="subjectName"
                   value="<%= subject.getSubjectName()%>" required>
            <br><br>

            <input type="submit" value="Update Subject">
        </form>

        <br>

        <a href="../SubjectServlet?action=view">Back to Subject List</a>

    </body>
</html>