<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Employee Management Application</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato">
                <div><a href="" class="navbar-brand"> Employee Management App </a></div>
                <ul class="navbar-nav">
                    <li><a href="<%=request.getContextPath()%>/list" class="nav-link">Employees</a></li>
                </ul>
            </nav>
        </header>
        <br>
        <div class="container col-md-5">
            <div class="card">
                <div class="card-body">
                    <form action="${employee != null ? 'update' : 'insert'}" method="post">
                        <h2>${employee != null ? 'Edit Employee' : 'Add New Employee'}</h2>

                        <c:if test="${employee != null}">
                            <input type="hidden" name="id" value="${employee.id}" />
                        </c:if>

                        <fieldset class="form-group">
                            <label>Employee Name</label>
                            <input type="text" value="${employee.name}" class="form-control" name="name" required="required">
                        </fieldset>

                        <fieldset class="form-group">
                            <label>Employee Email</label>
                            <input type="email" value="${employee.email}" class="form-control" name="email" required="required">
                        </fieldset>

                        <fieldset class="form-group">
                            <label>Employee Position</label>
                            <input type="text" value="${employee.position}" class="form-control" name="position" required="required">
                        </fieldset>

                        <button type="submit" class="btn btn-success">Save</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>