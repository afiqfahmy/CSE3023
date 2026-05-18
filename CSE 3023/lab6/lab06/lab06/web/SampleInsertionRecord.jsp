<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Lab 6 - Task 1</title>
    </head>
    <body>

        <h1>Lab 6 - Task 1 - Sample Insertion records into MySQL through JSP's page</h1>

        <%
            int result = 0;

            try {
                // Step 1: Load JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                out.println("Step 1: MySQL driver loaded..!<br>");

                // Step 2: Establish database connection
                String myURL = "jdbc:mysql://localhost:3306/cse3023";
                Connection myConnection = DriverManager.getConnection(myURL, "root", "toor");
                out.println("Step 2: Database is connected..!<br>");

                // Step 3: Create PreparedStatement
                String mysqlQuery = "INSERT INTO FirstTable(name) VALUES(?)";
                PreparedStatement myPS = myConnection.prepareStatement(mysqlQuery);
                out.println("Step 3: PreparedStatement created..!<br>");

                // Step 4: Assign value
                String name = "Welcome to access MySQL database with JSP...!";
                myPS.setString(1, name);
                out.println("Step 4: Perform insertion of record..!<br>");

                // Step 5: Execute query
                result = myPS.executeUpdate();

                // Step 6: Display result
                if (result > 0) {
                    out.println("Step 5: Close database connection..!<br><br>");
                    out.println("<b>The record [ " + name + " ] is successfully created..!</b>");
                }

                myPS.close();
                myConnection.close();

            } catch (Exception e) {
                out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
            }
        %>

    </body>
</html>