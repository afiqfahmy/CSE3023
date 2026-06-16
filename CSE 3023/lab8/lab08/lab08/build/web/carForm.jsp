<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Vehicle Registry Entry Form</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-md navbar-dark" style="background-color: #2c3e50">
            <div><a href="" class="navbar-brand"> Car Shop Admin Panel </a></div>
            <ul class="navbar-nav">
                <li><a href="<%=request.getContextPath()%>/ " class="nav-link">Showroom Fleet</a></li>
            </ul>
        </nav>
    </header>
    <br>
    <div class="container col-md-5">
        <div class="card shadow-sm">
            <div class="card-body">
                <form action="${car != null ? 'update' : 'insert'}" method="post">
                <h2 class="mb-4">${car != null ? 'Update Vehicle Details' : 'Register New Fleet Vehicle'}</h2>
                
                <c:if test="${car != null}">
                    <input type="hidden" name="id" value="${car.id}" />
                </c:if>

                <fieldset class="form-group">
                    <label>Vehicle Model Name</label>
                    <input type="text" value="${car.model}" class="form-control" name="model" required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>Brand Manufacturer</label>
                    <input type="text" value="${car.brand}" class="form-control" name="brand" required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>Retail Price (RM)</label>
                    <input type="number" step="0.01" value="${car.price}" class="form-control" name="price" required="required">
                </fieldset>

                <button type="submit" class="btn btn-success px-4">Save Entry</button>
                <a href="./" class="btn btn-secondary ml-2">Cancel</a>
                </form>
            </div>
        </div>
    </div>
</body>
</html>