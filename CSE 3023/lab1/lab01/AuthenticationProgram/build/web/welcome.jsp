<%-- 
    Document   : welcome
    Created on : Apr 5, 2026, 11:21:35 AM
    Author     : azmyl
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <style>
        body { font-family: 'Segoe UI', sans-serif; background-color: #121212; color: #e0e0e0; margin: 0; }
        .navbar { background: #1e1e1e; padding: 1rem; display: flex; justify-content: space-between; align-items: center; border-bottom: 1px solid #333; }
        .container { padding: 2rem; text-align: center; }
        .welcome-box { background: #1e1e1e; display: inline-block; padding: 3rem; border-radius: 12px; border: 1px solid #333; }
        h1 { color: #03dac6; }
        .logout-btn { color: #cf6679; text-decoration: none; border: 1px solid #cf6679; padding: 5px 15px; border-radius: 4px; }
        .logout-btn:hover { background: #cf6679; color: #121212; }
    </style>
</head>
<body>
    <div class="navbar">
        <strong>DevSystem v1.0</strong>
        <a href="logout" class="logout-btn">Logout</a>
    </div>
    <div class="container">
        <div class="welcome-box">
            <h1>Welcome, ${user}!</h1>
            <p>You are now authenticated in the local environment.</p>
        </div>
    </div>
</body>
</html>
