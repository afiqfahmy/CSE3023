<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Lab 6 - Task 4</title>

        <style>
            table {
                border-collapse: collapse;
                width: 60%;
            }

            th, td {
                border: 1px solid #999;
                padding: 8px;
                text-align: left;
            }

            th {
                background-color: gold;
            }
        </style>
    </head>
    <body>

        <h1>Lab 6 - Task 4: Retrieving record via JSP Page</h1>

        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");

                String myURL = "jdbc:mysql://localhost:3306/cse3023";
                Connection myConnection
                        = DriverManager.getConnection(myURL, "root", "toor");

                Statement myStatement = myConnection.createStatement();

                String myQuery = "SELECT * FROM student";
                ResultSet myResultSet = myStatement.executeQuery(myQuery);
        %>

        <table>
            <tr>
                <th>ISBNNo</th>
                <th>Author</th>
                <th>Title</th>
            </tr>

            <%
                while (myResultSet.next()) {
            %>
            <tr>
                <td><%= myResultSet.getString("stuid")%></td>
                <td><%= myResultSet.getString("stuname")%></td>
                <td><%= myResultSet.getString("stuprogram")%></td>
            </tr>
            <%
                    }

                    myResultSet.close();
                    myStatement.close();
                    myConnection.close();

                } catch (Exception e) {
                    out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
                }
            %>

        </table>

    </body>
</html>