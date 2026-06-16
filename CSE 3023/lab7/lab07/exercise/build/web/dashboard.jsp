<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.lab.bean.StudentBean"%>

<%
    response.setContentType("text/html;charset=UTF-8");

    StudentBean user = (StudentBean) session.getAttribute("loggedUser");

    if (user == null) {
        response.sendRedirect("login.html");
        return;
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Dashboard</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
              rel="stylesheet">

        <style>
            body {
                background: #f5f5f5;
            }

            .profile-img {
                width: 160px;
                height: 160px;
                object-fit: cover;
                border: 5px solid #198754;
            }
        </style>
    </head>

    <body>

        <div class="container d-flex justify-content-center align-items-center"
             style="min-height: 100vh;">

            <div class="card shadow-lg border-0 rounded-4 p-5 text-center"
                 style="max-width: 650px; width: 100%;">

                <div class="card-body">

                    <img src="data:image/jpeg;base64,<%= user.getBase64Image()%>"
                         class="profile-img rounded-circle shadow mb-4"
                         alt="Profile Picture">

                    <h2 class="fw-bold">
                        Welcome, <%= user.getFullname()%>!
                    </h2>

                    <p class="text-muted mb-4">
                        Matric Number:
                        <strong><%= user.getMatricNo()%></strong>
                    </p>

                    <div class="d-flex justify-content-center gap-3 flex-wrap">

                        <a href="SubjectServlet?action=view"
                           class="btn btn-success">
                            Manage Subjects
                        </a>

                        <a href="UserServlet?action=logout"
                           class="btn btn-dark">
                            Logout
                        </a>

                        <a href="UserServlet?action=delete"
                           onclick="return confirm('Delete account permanently?');"
                           class="btn btn-danger">
                            Delete Account
                        </a>

                    </div>

                </div>

            </div>

        </div>

    </body>
</html>