<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><spring:message code="register.title"/> - <spring:message code="app.name"/></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <style>
        body { background-color: #f8f9fa; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        .navbar { background-color: #2c3e50; box-shadow: 0 2px 4px rgba(0,0,0,0.1); }
        .navbar-brand { font-weight: bold; font-size: 1.5rem; }
        .btn-auth { background-color: #667eea; color: white; border: none; padding: 8px 16px; border-radius: 4px; text-decoration: none; cursor: pointer; transition: background-color 0.3s; }
        .btn-auth:hover { background-color: #5568d3; text-decoration: none; color: white; }
        .btn-logout { background-color: #e74c3c; color: white; border: none; padding: 8px 16px; border-radius: 4px; text-decoration: none; transition: background-color 0.3s; }
        .btn-logout:hover { background-color: #c0392b; text-decoration: none; color: white; }
        .register-card { margin-top: 40px; }
        .card-header-custom { background-color: #667eea; color: white; border-bottom: none; }
        .form-control:focus { border-color: #667eea; box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25); }
        .btn-primary-custom { background-color: #667eea; border-color: #667eea; }
        .btn-primary-custom:hover { background-color: #5568d3; border-color: #5568d3; }
        .form-check-input:checked { background-color: #667eea; border-color: #667eea; }
        .password-input-group { position: relative; }
        .toggle-password { cursor: pointer; position: absolute; right: 10px; top: 50%; transform: translateY(-50%); }
    </style>
</head>
<body>

<%@ include file="fragments/header.jsp" %>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6 register-card">
            <div class="card shadow">
                <div class="card-header card-header-custom">
                    <h4 class="mb-0"><spring:message code="register.title"/></h4>
                </div>
                <div class="card-body">
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger">
                            <c:out value="${error}"/>
                        </div>
                    </c:if>

                    <form action="${pageContext.request.contextPath}/register" method="post">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <div class="mb-3">
                            <label for="role" class="form-label"><spring:message code="user.role"/></label>
                            <select class="form-select" id="role" name="role" required>
                                <option value="">Select user type</option>
                                <option value="STUDENT"><spring:message code="role.student"/></option>
                                <option value="TEACHER"><spring:message code="role.teacher"/></option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="username" class="form-label"><spring:message code="user.username"/></label>
                            <input type="text" class="form-control" id="username" name="username" placeholder="Create a username" required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label"><spring:message code="user.password"/></label>
                            <div class="password-input-group">
                                <input type="password" class="form-control" id="password" name="password" placeholder="Create a password" required>
                                <span class="toggle-password" onclick="togglePassword('password')">&#128065;</span>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="fullName" class="form-label"><spring:message code="user.fullName"/></label>
                            <input type="text" class="form-control" id="fullName" name="fullName" placeholder="Enter your full name" required>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label"><spring:message code="user.email"/></label>
                            <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email address" required>
                        </div>
                        <div class="mb-3">
                            <label for="phone" class="form-label"><spring:message code="user.phone"/></label>
                            <input type="tel" class="form-control" id="phone" name="phone" placeholder="Enter your phone number" required>
                        </div>
                        <button type="submit" class="btn btn-primary-custom btn-primary w-100">
                            <spring:message code="register.submit"/>
                        </button>
                    </form>
                    <hr>
                    <div class="text-center">
                        <a href="${pageContext.request.contextPath}/login">
                            <spring:message code="register.loginLink"/>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<script>
    function togglePassword(fieldId) {
        const field = document.getElementById(fieldId);
        field.type = field.type === 'password' ? 'text' : 'password';
    }
</script>
</body>
</html>
