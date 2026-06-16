<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.lab6.Author"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Process Author</title>
    </head>
    <body>

        <h1>Lab 6 - Task 2 - Perform creating and retrieving records via JSP page</h1>

        <jsp:useBean id="myAuthor" class="com.lab6.Author" scope="request"/>

        <%
            myAuthor.setAuthno(request.getParameter("authno"));
            myAuthor.setName(request.getParameter("name"));
            myAuthor.setAddress(request.getParameter("address"));
            myAuthor.setCity(request.getParameter("city"));
            myAuthor.setState(request.getParameter("state"));
            myAuthor.setZip(request.getParameter("zip"));

            int result = 0;

            try {

                // Load driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Database connection
                String myURL = "jdbc:mysql://localhost:3306/cse3023";
                    Connection myConnection
                            = DriverManager.getConnection(myURL, "root", "toor");

                // SQL query
                String sqlInsert
                        = "INSERT INTO author(authno,name,address,city,state,zip) VALUES(?,?,?,?,?,?)";

                PreparedStatement myPS
                        = myConnection.prepareStatement(sqlInsert);

                myPS.setString(1, myAuthor.getAuthno());
                myPS.setString(2, myAuthor.getName());
                myPS.setString(3, myAuthor.getAddress());
                myPS.setString(4, myAuthor.getCity());
                myPS.setString(5, myAuthor.getState());
                myPS.setString(6, myAuthor.getZip());

                result = myPS.executeUpdate();

                if (result > 0) {
        %>

        <h3>Record successfully inserted into Author table.</h3>

        <p><b>Author No:</b> <%= myAuthor.getAuthno()%></p>
        <p><b>Name:</b> <%= myAuthor.getName()%></p>
        <p><b>Address:</b> <%= myAuthor.getAddress()%></p>
        <p><b>City:</b> <%= myAuthor.getCity()%></p>
        <p><b>State:</b> <%= myAuthor.getState()%></p>
        <p><b>Zip:</b> <%= myAuthor.getZip()%></p>

        <%
                }

                myPS.close();
                myConnection.close();

            } catch (Exception e) {
                out.println("<p style='color:red;'>Error: "
                        + e.getMessage() + "</p>");
            }
        %>

    </body>
</html>