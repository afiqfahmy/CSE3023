<%-- 
    Document   : login.jsp
    Created on : Apr 5, 2026, 11:19:33 AM
    Author     : azmyl
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #121212; color: #e0e0e0; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
        .login-card { background: #1e1e1e; padding: 2rem; border-radius: 8px; box-shadow: 0 4px 15px rgba(0,0,0,0.5); width: 300px; }
        h2 { text-align: center; color: #bb86fc; }
        input { width: 100%; padding: 10px; margin: 10px 0; border-radius: 4px; border: 1px solid #333; background: #2c2c2c; color: white; box-sizing: border-box; }
        button { width: 100%; padding: 10px; background: #bb86fc; border: none; border-radius: 4px; color: #121212; font-weight: bold; cursor: pointer; }
        button:hover { background: #9965f4; }
        .error { color: #cf6679; font-size: 0.9rem; text-align: center; }
    </style>
</head>
<body>
    <div class="login-card">
        <h2>System Login</h2>
        <form action="login" method="POST">
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit">Log In</button>
        </form>
        <p class="error">${errorMessage}</p>
    </div>
</body>
</html>
