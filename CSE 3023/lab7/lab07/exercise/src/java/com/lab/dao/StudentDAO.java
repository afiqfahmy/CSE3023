package com.lab.dao;

import com.lab.bean.StudentBean;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.*;
import java.util.Base64;

public class StudentDAO {

    private Connection getConnection() throws Exception {

        Class.forName("com.mysql.cj.jdbc.Driver");

        return DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/lab7_db",
                "root",
                "toor"
        );
    }

    // REGISTER
    public boolean registerStudent(StudentBean student, InputStream imageStream) {

        try (Connection conn = getConnection()) {

            String sql = "INSERT INTO students "
                    + "(matric_no, password, fullname, profile_image) "
                    + "VALUES (?, ?, ?, ?)";

            PreparedStatement pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, student.getMatricNo());
            pstmt.setString(2, student.getPassword());
            pstmt.setString(3, student.getFullname());

            if (imageStream != null) {
                pstmt.setBlob(4, imageStream);
            } else {
                pstmt.setNull(4, java.sql.Types.BLOB);
            }

            return pstmt.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // LOGIN
    public StudentBean loginStudent(String matricNo, String password) {

        StudentBean student = null;

        try (Connection conn = getConnection()) {

            String sql = "SELECT * FROM students "
                    + "WHERE matric_no = ? AND password = ?";

            PreparedStatement pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, matricNo);
            pstmt.setString(2, password);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {

                student = new StudentBean();

                student.setMatricNo(rs.getString("matric_no"));
                student.setFullname(rs.getString("fullname"));

                Blob blob = rs.getBlob("profile_image");

                if (blob != null) {

                    InputStream inputStream = blob.getBinaryStream();

                    ByteArrayOutputStream outputStream
                            = new ByteArrayOutputStream();

                    byte[] buffer = new byte[4096];
                    int bytesRead;

                    while ((bytesRead = inputStream.read(buffer)) != -1) {
                        outputStream.write(buffer, 0, bytesRead);
                    }

                    byte[] imageBytes = outputStream.toByteArray();

                    student.setBase64Image(
                            Base64.getEncoder().encodeToString(imageBytes)
                    );
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return student;
    }

    // DELETE ACCOUNT
    public boolean deleteStudent(String matricNo) {

        try (Connection conn = getConnection()) {

            String sql = "DELETE FROM students WHERE matric_no = ?";

            PreparedStatement pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, matricNo);

            return pstmt.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
