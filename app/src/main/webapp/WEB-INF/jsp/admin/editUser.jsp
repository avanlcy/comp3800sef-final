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
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css">
</head>
<body>

<%@ include file="../fragments/header.jsp" %>

<div class="page-header">
    <div class="container-lg">
        <h1><spring:message code="admin.editUser"/></h1>
        <p class="mb-0 text-muted">Edit user account: <c:out value="${editUser.username}"/></p>
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
