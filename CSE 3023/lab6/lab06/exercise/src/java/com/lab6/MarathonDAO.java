package com.lab6;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MarathonDAO {

    private Connection connection;
    private int result = 0;

    public MarathonDAO() throws ClassNotFoundException {
        connection = new Database().getConnection();
    }

    public int addDetails(Marathon marathon) {
        try {
            String sql = "INSERT INTO marathon(icno, name, category) VALUES(?,?,?)";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, marathon.getIcno());
            ps.setString(2, marathon.getName());
            ps.setString(3, marathon.getCategory());

            result = ps.executeUpdate();

            ps.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }
}
