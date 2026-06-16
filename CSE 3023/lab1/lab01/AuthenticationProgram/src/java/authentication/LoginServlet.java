/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package authentication;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

/**
 *
 * @author azmyl
 */
import java.io.IOException;
import java.util.Hashtable;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    // Simulating a database with a Hashtable (Key: Username, Value: Password)
    private static final Hashtable<String, String> userDatabase = new Hashtable<>();

    @Override
    public void init() throws ServletException {
        // Pre-populating dummy data
        userDatabase.put("admin", "password123");
        userDatabase.put("student_user", "cse3023");
        userDatabase.put("developer", "java8");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String user = request.getParameter("username");
        String pass = request.getParameter("password");

        // Validate against the Hashtable
        if (userDatabase.containsKey(user) && userDatabase.get(user).equals(pass)) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            
            response.sendRedirect("welcome.jsp");
        } else {
            request.setAttribute("errorMessage", "Invalid Username or Password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
