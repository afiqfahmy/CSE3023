<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Car Shop Management</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-md navbar-dark" style="background-color: #2c3e50">
            <div><a href="" class="navbar-brand"> Car Shop Admin Panel </a></div>
            <ul class="navbar-nav">
                <li><a href="<%=request.getContextPath()%>/ " class="nav-link">Showroom Fleet</a></li>
                <li><a href="<%=request.getContextPath()%>/new" class="nav-link">Add New Car</a></li>
            </ul>
        </nav>
    </header>
    <br>
    <div class="row">
        <div class="container">
            <h3 class="text-center">Car Inventory Showroom</h3>
            <hr>
            <div class="container text-left">
                <a href="<%=request.getContextPath()%>/new" class="btn btn-success">Add New Vehicle</a>
            </div>
            <br>
            <table class="table table-bordered table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th>ID</th>
                        <th>Vehicle Model</th>
                        <th>Brand Manufacturer</th>
                        <th>Retail Price (RM)</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="car" items="${listCar}">
                        <tr>
                            <td><c:out value="${car.id}" /></td>
                            <td><c:out value="${car.model}" /></td>
                            <td><c:out value="${car.brand}" /></td>
                            <td><c:out value="${car.price}" /></td>
                            <td>
                                <a href="edit?id=<c:out value='${car.id}' />" class="btn btn-primary btn-sm">Edit</a>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="delete?id=<c:out value='${car.id}' />" class="btn btn-danger btn-sm" onclick="return confirm('Delete this vehicle?')">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>