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
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css">
    <style>
        .register-card { margin-top: var(--s-5); }
        .password-input-group { position: relative; }
        .toggle-password { cursor: pointer; position: absolute; right: var(--s-3); top: 50%; transform: translateY(-50%); font-size: 0.85rem; color: var(--color-text-muted); }
    </style>
</head>
<body>

<%@ include file="fragments/header.jsp" %>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6 register-card">
            <div class="card">
                <div class="card-header"><spring:message code="register.title"/></div>
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
                                <span class="toggle-password" onclick="togglePassword('password')">Show</span>
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
                        <button type="submit" class="btn btn-primary w-100">
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
