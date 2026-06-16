<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.lab6.Student"%>
<%@page errorPage="errorStudent.jsp"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Process Student</title>
    </head>
    <body>

        <h1>Lab 6 - Task 3 - Process Student</h1>

        <jsp:useBean id="myStudent" class="com.lab6.Student" scope="request"/>
        <jsp:setProperty name="myStudent" property="*"/>

        <%
            if (myStudent.getStuno().equals("Invalid")) {
                throw new Exception("Student ID must start with 2 capital letters followed by 5 numbers. Example: UK88888");
            }

            int result = 0;

            Class.forName("com.mysql.cj.jdbc.Driver");

            String myURL = "jdbc:mysql://localhost:3306/cse3023";
            Connection myConnection
                    = DriverManager.getConnection(myURL, "root", "toor");

            String sqlInsert
                    = "INSERT INTO student(stuid, stuname, stuprogram) VALUES(?,?,?)";

            PreparedStatement myPS
                    = myConnection.prepareStatement(sqlInsert);

            myPS.setString(1, myStudent.getStuno());
            myPS.setString(2, myStudent.getName());
            myPS.setString(3, myStudent.getProgram());

            result = myPS.executeUpdate();

            if (result > 0) {
        %>

        <p style="color:blue;">
            Record with student no <%= myStudent.getStuno()%> successfully created..!
        </p>

        <p><b>Details of record are:</b></p>
        <p>Student ID: <%= myStudent.getStuno()%></p>
        <p>Name: <%= myStudent.getName()%></p>
        <p>Program: <%= myStudent.getProgram()%></p>

        <%
            }

            myPS.close();
            myConnection.close();
        %>

    </body>
</html>