<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.lab6.Database"%>
<%@page import="com.lab6.Marathon"%>
<%@page import="com.lab6.MarathonDAO"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Process Marathon</title>
    </head>
    <body>

        <h1>Lab 6 - Task 5 - Marathon Registration</h1>

        <jsp:useBean id="myMarathon" class="com.lab6.Marathon" scope="request"/>
        <jsp:setProperty name="myMarathon" property="*"/>

        <%
            int result = 0;

            try {
                MarathonDAO obj = new MarathonDAO();
                result = obj.addDetails(myMarathon);

                if (result > 0) {
        %>

        <p style="color:red;">
            Record with IC No <%= myMarathon.getIcno()%> successfully created..!
        </p>

        <p><b>Details of record are:</b></p>
        <p>IC No: <%= myMarathon.getIcno()%></p>
        <p>Name: <%= myMarathon.getName()%></p>
        <p>Category: <%= myMarathon.getCategory()%></p>

        <%
                }

            } catch (Exception e) {
                out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
            }
        %>

    </body>
</html>