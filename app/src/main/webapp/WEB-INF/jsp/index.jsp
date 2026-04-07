<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><spring:message code="app.name"/></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <%@ include file="fragments/header.jsp" %>

    <div class="container mt-4">
        <c:if test="${not empty success}">
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <c:out value="${success}"/>
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        </c:if>

        <!-- Course Info -->
        <div class="card mb-4">
            <div class="card-body">
                <h1 class="card-title"><spring:message code="course.name"/></h1>
                <p class="card-text lead"><spring:message code="course.description"/></p>
            </div>
        </div>

        <!-- Lectures Section -->
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h2><spring:message code="index.lectures"/></h2>
            <c:if test="${pageContext.request.isUserInRole('ROLE_TEACHER')}">
                <a href="${pageContext.request.contextPath}/lectures/add" class="btn btn-success">
                    <spring:message code="index.addLecture"/>
                </a>
            </c:if>
        </div>
        <!-- more to be added -->

        <!-- Polls Section -->
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h2><spring:message code="index.polls"/></h2>
            <c:if test="${pageContext.request.isUserInRole('ROLE_TEACHER')}">
                <a href="${pageContext.request.contextPath}/polls/add" class="btn btn-success">
                    <spring:message code="index.addPoll"/>
                </a>
            </c:if>
        </div>
        <!-- more to be added -->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
