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
        .table-card { background-color: white; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); padding: 20px; overflow-x: auto; }
        .btn-add { background-color: #27ae60; border-color: #27ae60; color: white; }
        .btn-add:hover { background-color: #219a52; border-color: #219a52; color: white; }
        .btn-edit { background-color: #667eea; border-color: #667eea; color: white; }
        .btn-edit:hover { background-color: #5568d3; border-color: #5568d3; color: white; }
        .table th { background-color: #2c3e50; color: white; border: none; }
        .table td { vertical-align: middle; }
    </style>
</head>
<body>

<%@ include file="../fragments/header.jsp" %>

<div class="page-header">
    <div class="container-lg">
        <div class="d-flex justify-content-between align-items-center">
            <div>
                <h1>&#128101; <spring:message code="admin.userManagement"/></h1>
                <p class="mb-0" style="opacity: 0.9;">Manage all user accounts</p>
            </div>
            <a href="${pageContext.request.contextPath}/admin/users/add" class="btn btn-light btn-lg">
                + <spring:message code="admin.addUser"/>
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
                                    <span class="badge bg-warning text-dark"><spring:message code="role.teacher"/></span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge bg-info"><spring:message code="role.student"/></span>
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
