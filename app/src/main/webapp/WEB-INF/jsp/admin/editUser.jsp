<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><spring:message code="admin.editUser"/> - <spring:message code="app.name"/></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <style>
        body { background-color: #f8f9fa; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        .navbar { background-color: #2c3e50; box-shadow: 0 2px 4px rgba(0,0,0,0.1); }
        .navbar-brand { font-weight: bold; font-size: 1.5rem; }
        .btn-auth { background-color: #667eea; color: white; border: none; padding: 8px 16px; border-radius: 4px; text-decoration: none; cursor: pointer; transition: background-color 0.3s; }
        .btn-auth:hover { background-color: #5568d3; text-decoration: none; color: white; }
        .btn-logout { background-color: #e74c3c; color: white; border: none; padding: 8px 16px; border-radius: 4px; text-decoration: none; transition: background-color 0.3s; }
        .btn-logout:hover { background-color: #c0392b; text-decoration: none; color: white; }
        .page-header { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; padding: 40px 0; margin-bottom: 30px; }
        .page-header h1 { font-size: 2rem; font-weight: bold; }
        .form-card { background-color: white; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); padding: 30px; }
        .form-control:focus, .form-select:focus { border-color: #667eea; box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25); }
        .btn-submit { background-color: #667eea; border-color: #667eea; color: white; padding: 10px 30px; }
        .btn-submit:hover { background-color: #5568d3; border-color: #5568d3; color: white; }
    </style>
</head>
<body>

<%@ include file="../fragments/header.jsp" %>

<div class="page-header">
    <div class="container-lg">
        <h1>&#9999; <spring:message code="admin.editUser"/></h1>
        <p class="mb-0" style="opacity: 0.9;">Edit user account: <c:out value="${editUser.username}"/></p>
    </div>
</div>

<div class="container-lg mb-5">
    <c:if test="${not empty error}">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <c:out value="${error}"/>
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </c:if>

    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="form-card">
                <form action="${pageContext.request.contextPath}/admin/users/${editUser.id}/edit" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                    <div class="mb-3">
                        <label for="username" class="form-label"><spring:message code="user.username"/></label>
                        <input type="text" class="form-control" id="username" value="${editUser.username}" disabled>
                        <div class="form-text">Username cannot be changed.</div>
                    </div>

                    <div class="mb-3">
                        <label for="password" class="form-label"><spring:message code="user.password"/></label>
                        <input type="password" class="form-control" id="password" name="password"
                               placeholder="Leave blank to keep current password">
                        <div class="form-text">Only fill in if you want to change the password.</div>
                    </div>

                    <div class="mb-3">
                        <label for="fullName" class="form-label"><spring:message code="user.fullName"/></label>
                        <input type="text" class="form-control" id="fullName" name="fullName"
                               value="${editUser.fullName}" required>
                    </div>

                    <div class="mb-3">
                        <label for="email" class="form-label"><spring:message code="user.email"/></label>
                        <input type="email" class="form-control" id="email" name="email"
                               value="${editUser.email}" required>
                    </div>

                    <div class="mb-3">
                        <label for="phone" class="form-label"><spring:message code="user.phone"/></label>
                        <input type="text" class="form-control" id="phone" name="phone"
                               value="${editUser.phone}" required>
                    </div>

                    <div class="mb-3">
                        <label for="role" class="form-label"><spring:message code="user.role"/></label>
                        <select class="form-select" id="role" name="role" required>
                            <option value="STUDENT" <c:if test="${editUser.role == 'ROLE_STUDENT'}">selected</c:if>>
                                <spring:message code="role.student"/>
                            </option>
                            <option value="TEACHER" <c:if test="${editUser.role == 'ROLE_TEACHER'}">selected</c:if>>
                                <spring:message code="role.teacher"/>
                            </option>
                        </select>
                    </div>

                    <div class="d-flex justify-content-between align-items-center mt-4">
                        <a href="${pageContext.request.contextPath}/admin/users" class="btn btn-secondary">
                            <spring:message code="action.cancel"/>
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
