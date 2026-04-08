<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><spring:message code="admin.userManagement"/> - <spring:message code="app.name"/></title>
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
        <div class="d-flex justify-content-between align-items-center">
            <div>
                <h1><spring:message code="admin.userManagement"/></h1>
                <p class="mb-0 text-muted">Manage all user accounts</p>
            </div>
            <a href="${pageContext.request.contextPath}/admin/users/add" class="btn btn-primary">
                <spring:message code="admin.addUser"/>
            </a>
        </div>
    </div>
</div>

<div class="container-lg mb-5">
    <c:if test="${not empty success}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <c:out value="${success}"/>
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </c:if>
    <c:if test="${not empty error}">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <c:out value="${error}"/>
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </c:if>

    <div class="table-card">
        <table class="table table-hover mb-0">
            <thead>
                <tr>
                    <th>ID</th>
                    <th><spring:message code="user.username"/></th>
                    <th><spring:message code="user.fullName"/></th>
                    <th><spring:message code="user.email"/></th>
                    <th><spring:message code="user.phone"/></th>
                    <th><spring:message code="user.role"/></th>
                    <th><spring:message code="admin.actions"/></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="u" items="${users}">
                    <tr>
                        <td>${u.id}</td>
                        <td><strong><c:out value="${u.username}"/></strong></td>
                        <td><c:out value="${u.fullName}"/></td>
                        <td><c:out value="${u.email}"/></td>
                        <td><c:out value="${u.phone}"/></td>
                        <td>
                            <c:choose>
                                <c:when test="${u.role == 'ROLE_TEACHER'}">
                                    <span class="badge bg-light text-dark border"><spring:message code="role.teacher"/></span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge bg-light text-dark border"><spring:message code="role.student"/></span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/admin/users/${u.id}/edit"
                               class="btn btn-edit btn-sm me-1">
                                <spring:message code="action.edit"/>
                            </a>
                            <form action="${pageContext.request.contextPath}/admin/users/${u.id}/delete"
                                  method="post" class="d-inline"
                                  onsubmit="return confirm('Are you sure you want to delete this user? All their votes and comments will also be deleted.')">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <button type="submit" class="btn btn-danger btn-sm">
                                    <spring:message code="action.delete"/>
                                </button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <c:if test="${empty users}">
            <p class="text-center text-muted mt-3">No users found.</p>
        </c:if>
    </div>
</div>

<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>
</html>
