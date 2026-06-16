package com.lab6;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Database {

    private Connection myConnection = null;

    public Connection getConnection() throws ClassNotFoundException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            String myURL = "jdbc:mysql://localhost:3306/cse3023";
            myConnection = DriverManager.getConnection(myURL, "root", "toor");

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return myConnection;
    }

    public void closeConnection() throws ClassNotFoundException {
        try {
            if (myConnection != null) {
                myConnection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
