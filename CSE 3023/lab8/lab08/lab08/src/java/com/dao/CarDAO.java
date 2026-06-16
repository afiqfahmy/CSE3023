package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.Model.Car;

public class CarDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/carshop?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
    private String jdbcUsername = "root";
    private String jdbcPassword = "toor"; // Check your local XAMPP root password

    private static final String INSERT_CAR_SQL = "INSERT INTO car (model, brand, price) VALUES (?, ?, ?);";
    private static final String SELECT_CAR_BY_ID = "SELECT id, model, brand, price FROM car WHERE id = ?;";
    private static final String SELECT_ALL_CARS = "SELECT * FROM car;";
    private static final String DELETE_CAR_SQL = "DELETE FROM car WHERE id = ?;";
    private static final String UPDATE_CAR_SQL = "UPDATE car SET model = ?, brand = ?, price = ? WHERE id = ?;";

    protected Connection getConnection() throws SQLException {
        Connection connection = null;
        try {
            // Force the runtime environment to explicitly discover the driver class
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException ex) {
                System.err.println("MySQL Driver JAR Missing from Libraries!");
            }
        }
        
        // Use the default XAMPP credentials: Username 'root' and NO password ""
        String url = "jdbc:mysql://localhost:3306/carshop?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
        String username = "root";
        String password = "toor"; // Leave this completely blank with no spaces
        
        connection = DriverManager.getConnection(url, username, password);
        return connection;
    }

    public void insertCar(Car car) throws SQLException {
        try (Connection connection = getConnection(); 
             PreparedStatement statement = connection.prepareStatement(INSERT_CAR_SQL)) {
            statement.setString(1, car.getModel());
            statement.setString(2, car.getBrand());
            statement.setDouble(3, car.getPrice());
            statement.executeUpdate();
        }
    }

    public Car selectCar(int id) {
        Car car = null;
        try (Connection connection = getConnection(); 
             PreparedStatement statement = connection.prepareStatement(SELECT_CAR_BY_ID)) {
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                String model = rs.getString("model");
                String brand = rs.getString("brand");
                double price = rs.getDouble("price");
                car = new Car(id, model, brand, price);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return car;
    }

    public List<Car> selectAllCars() {
        List<Car> cars = new ArrayList<>();
        try (Connection connection = getConnection(); 
             PreparedStatement statement = connection.prepareStatement(SELECT_ALL_CARS)) {
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String model = rs.getString("model");
                String brand = rs.getString("brand");
                double price = rs.getDouble("price");
                cars.add(new Car(id, model, brand, price));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cars;
    }

    public boolean deleteCar(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); 
             PreparedStatement statement = connection.prepareStatement(DELETE_CAR_SQL)) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateCar(Car car) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); 
             PreparedStatement statement = connection.prepareStatement(UPDATE_CAR_SQL)) {
            statement.setString(1, car.getModel());
            statement.setString(2, car.getBrand());
            statement.setDouble(3, car.getPrice());
            statement.setInt(4, car.getId());
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }
}