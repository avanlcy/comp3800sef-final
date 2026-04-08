<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><spring:message code="poll.addPoll"/> - <spring:message code="app.name"/></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <style>
        body { background-color: #f8f9fa; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        .navbar { background-color: #2c3e50; box-shadow: 0 2px 4px rgba(0,0,0,0.1); }
        .navbar-brand { font-weight: bold; font-size: 1.5rem; }
        .btn-auth { background-color: #667eea; color: white; border: none; padding: 8px 16px; border-radius: 4px; text-decoration: none; cursor: pointer; transition: background-color 0.3s; }
        .btn-auth:hover { background-color: #5568d3; text-decoration: none; color: white; }
        .btn-logout { background-color: #e74c3c; color: white; border: none; padding: 8px 16px; border-radius: 4px; text-decoration: none; transition: background-color 0.3s; }
        .btn-logout:hover { background-color: #c0392b; text-decoration: none; color: white; }
        .page-header { background: linear-gradient(135deg, #f39c12 0%, #e67e22 100%); color: white; padding: 40px 0; margin-bottom: 30px; }
        .page-header h1 { font-size: 2rem; font-weight: bold; }
        .form-card { background-color: white; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); padding: 30px; }
        .form-control:focus { border-color: #f39c12; box-shadow: 0 0 0 0.2rem rgba(243, 156, 18, 0.25); }
        .btn-submit { background-color: #f39c12; border-color: #f39c12; color: white; padding: 10px 30px; }
        .btn-submit:hover { background-color: #e67e22; border-color: #e67e22; color: white; }
        .option-group { background-color: #f8f9fa; padding: 20px; border-radius: 8px; margin-bottom: 20px; border-left: 4px solid #f39c12; }
    </style>
</head>
<body>

<%@ include file="../fragments/header.jsp" %>

<div class="page-header">
    <div class="container-lg">
        <h1><spring:message code="poll.addPoll"/></h1>
        <p class="mb-0" style="opacity: 0.9;">Create a new poll with options</p>
    </div>
</div>

<div class="container-lg mb-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="form-card">
                <form action="${pageContext.request.contextPath}/polls/add" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                    <div class="mb-4">
                        <label for="question" class="form-label"><spring:message code="poll.question"/></label>
                        <input type="text" class="form-control" id="question" name="question"
                               placeholder="Enter your poll question..." required>
                    </div>

                    <div class="option-group">
                        <h5 class="mb-3"><spring:message code="poll.options"/></h5>
                        <div class="mb-3">
                            <label for="option1" class="form-label">Option 1</label>
                            <input type="text" class="form-control" id="option1" name="option1" required>
                        </div>
                        <div class="mb-3">
                            <label for="option2" class="form-label">Option 2</label>
                            <input type="text" class="form-control" id="option2" name="option2" required>
                        </div>
                        <div class="mb-3">
                            <label for="option3" class="form-label">Option 3</label>
                            <input type="text" class="form-control" id="option3" name="option3" required>
                        </div>
                        <div class="mb-3">
                            <label for="option4" class="form-label">Option 4</label>
                            <input type="text" class="form-control" id="option4" name="option4" required>
                        </div>
                        <div class="mb-3">
                            <label for="option5" class="form-label">Option 5</label>
                            <input type="text" class="form-control" id="option5" name="option5" required>
                        </div>
                    </div>

                    <div class="d-flex justify-content-between align-items-center mt-4">
                        <a href="${pageContext.request.contextPath}/" class="btn btn-secondary">
                            <spring:message code="action.backToHome"/>
                        </a>
                        <button type="submit" class="btn btn-submit"><spring:message code="action.save"/></button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>
</html>
