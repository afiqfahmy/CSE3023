package com.lab.controller;

import com.lab.bean.StudentBean;
import com.lab.bean.SubjectBean;
import com.lab.dao.SubjectDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class SubjectServlet extends HttpServlet {

    private SubjectDAO subjectDAO = new SubjectDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("loggedUser") == null) {
            response.sendRedirect(request.getContextPath() + "/login.html");
            return;
        }

        StudentBean loggedUser = (StudentBean) session.getAttribute("loggedUser");
        String matricNo = loggedUser.getMatricNo();

        String action = request.getParameter("action");

        if (action == null) {
            action = "view";
        }

        if ("add".equals(action)) {
            SubjectBean subject = new SubjectBean();
            subject.setMatricNo(matricNo);
            subject.setSubjectCode(request.getParameter("subjectCode"));
            subject.setSubjectName(request.getParameter("subjectName"));

            subjectDAO.addSubject(subject);
            response.sendRedirect("SubjectServlet?action=view");

        } else if ("view".equals(action)) {
            List<SubjectBean> subjectList = subjectDAO.getSubjectsByMatricNo(matricNo);
            request.setAttribute("subjectList", subjectList);
            request.getRequestDispatcher("viewSubjects.jsp").forward(request, response);

        } else if ("edit".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            SubjectBean subject = subjectDAO.getSubjectById(id, matricNo);

            request.setAttribute("subject", subject);
            request.getRequestDispatcher("updateSubject.jsp").forward(request, response);

        } else if ("update".equals(action)) {
            SubjectBean subject = new SubjectBean();
            subject.setId(Integer.parseInt(request.getParameter("id")));
            subject.setMatricNo(matricNo);
            subject.setSubjectCode(request.getParameter("subjectCode"));
            subject.setSubjectName(request.getParameter("subjectName"));

            subjectDAO.updateSubject(subject);
            response.sendRedirect("SubjectServlet?action=view");

        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));

            subjectDAO.deleteSubject(id, matricNo);
            response.sendRedirect("SubjectServlet?action=view");

        } else {
            response.sendRedirect("SubjectServlet?action=view");
        }
    }
}
