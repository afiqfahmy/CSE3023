<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Employee Payroll Display System</title>
    </head>
    <body>
        <h2>Employee Payroll Display System</h2>

        <table border="1" cellpadding="8">
            <thead>
                <tr style="background-color: lightgray;">
                    <th>No.</th>
                    <th>Employee ID</th>
                    <th>Name</th>
                    <th>Department</th>
                    <th>Basic Salary</th>
                    <th>Status</th>
                </tr>
            </thead>

            <tbody>
            <c:forEach var="employee" items="${employeeList}" varStatus="status">
                <tr>
                    <td>${status.count}</td>
                    <td><c:out value="${employee.empId}" /></td>
                <td><c:out value="${employee.name}" /></td>
                <td><c:out value="${employee.department}" /></td>
                <td>RM <c:out value="${employee.basicSalary}" /></td>
                <td>
                <c:choose>
                    <c:when test="${employee.basicSalary >= 3000}">
                        Senior
                    </c:when>
                    <c:otherwise>
                        Junior
                    </c:otherwise>
                </c:choose>
                </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>