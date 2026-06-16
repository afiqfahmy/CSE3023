package com.lab.dao;

import com.lab.bean.SubjectBean;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SubjectDAO {

    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/lab7_db",
                "root",
                "toor"
        );
    }

    public boolean addSubject(SubjectBean subject) {
        String sql = "INSERT INTO registered_subjects (matric_no, subject_code, subject_name) VALUES (?, ?, ?)";

        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, subject.getMatricNo());
            ps.setString(2, subject.getSubjectCode());
            ps.setString(3, subject.getSubjectName());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<SubjectBean> getSubjectsByMatricNo(String matricNo) {
        List<SubjectBean> list = new ArrayList<>();

        String sql = "SELECT * FROM registered_subjects WHERE matric_no = ?";

        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, matricNo);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                SubjectBean subject = new SubjectBean();
                subject.setId(rs.getInt("id"));
                subject.setMatricNo(rs.getString("matric_no"));
                subject.setSubjectCode(rs.getString("subject_code"));
                subject.setSubjectName(rs.getString("subject_name"));

                list.add(subject);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public SubjectBean getSubjectById(int id, String matricNo) {
        SubjectBean subject = null;

        String sql = "SELECT * FROM registered_subjects WHERE id = ? AND matric_no = ?";

        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ps.setString(2, matricNo);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                subject = new SubjectBean();
                subject.setId(rs.getInt("id"));
                subject.setMatricNo(rs.getString("matric_no"));
                subject.setSubjectCode(rs.getString("subject_code"));
                subject.setSubjectName(rs.getString("subject_name"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return subject;
    }

    public boolean updateSubject(SubjectBean subject) {
        String sql = "UPDATE registered_subjects SET subject_code = ?, subject_name = ? WHERE id = ? AND matric_no = ?";

        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, subject.getSubjectCode());
            ps.setString(2, subject.getSubjectName());
            ps.setInt(3, subject.getId());
            ps.setString(4, subject.getMatricNo());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteSubject(int id, String matricNo) {
        String sql = "DELETE FROM registered_subjects WHERE id = ? AND matric_no = ?";

        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ps.setString(2, matricNo);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
