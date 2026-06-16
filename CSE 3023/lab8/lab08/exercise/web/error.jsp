<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Application Error Context</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body class="bg-light">
        <div class="container text-center mt-5">
            <div class="alert alert-danger p-5 shadow-sm">
                <h1 class="display-4">Runtime Processing Exception</h1>
                <p class="lead">An unexpected condition was encountered on the application server.</p>
                <hr>
                <div class="text-left bg-white p-3 border rounded">
                    <strong>Message Details:</strong> ${pageContext.exception.message}
                </div>
                <br>
                <a href="list" class="btn btn-primary">Return to Catalog Index</a>
            </div>
        </div>
    </body>
</html>