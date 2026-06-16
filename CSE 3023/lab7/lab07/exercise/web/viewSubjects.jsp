<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.lab.bean.StudentBean"%>
<%@page import="com.lab.bean.SubjectBean"%>

<%
    StudentBean user = (StudentBean) session.getAttribute("loggedUser");

    if (user == null) {
        response.sendRedirect("../login.html");
        return;
    }

    List<SubjectBean> subjectList
            = (List<SubjectBean>) request.getAttribute("subjectList");
%>

<!DOCTYPE html>
<html>
    <head>
        <title>My Registered Subjects</title>
    </head>
    <body>

        <h2>My Registered Subjects</h2>

        <p>Matric No: <%= user.getMatricNo()%></p>

        <a href="registerSubject.jsp">Register New Subject</a>
        <br><br>

        <table border="1" cellpadding="8" cellspacing="0">
            <tr>
                <th>No.</th>
                <th>Subject Code</th>
                <th>Subject Name</th>
                <th>Action</th>
            </tr>

            <%
                int no = 1;

                if (subjectList != null && !subjectList.isEmpty()) {
                    for (SubjectBean subject : subjectList) {
            %>

            <tr>
                <td><%= no++%></td>
                <td><%= subject.getSubjectCode()%></td>
                <td><%= subject.getSubjectName()%></td>
                <td>
                    <a href="SubjectServlet?action=edit&id=<%= subject.getId()%>">
                        Edit
                    </a>
                    |
                    <a href="SubjectServlet?action=delete&id=<%= subject.getId()%>"
                       onclick="return confirm('Are you sure you want to delete this subject?');">
                        Delete
                    </a>
                </td>
            </tr>

            <%
                }
            } else {
            %>

            <tr>
                <td colspan="4">No subject registered yet.</td>
            </tr>

            <%
                }
            %>

        </table>

        <br>

        <a href="dashboard.jsp">Back to Dashboard</a>

    </body>
</html>