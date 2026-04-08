<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><spring:message code="app.name"/></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css">
</head>
<body>

<%@ include file="fragments/header.jsp" %>

<div class="hero-section">
    <div class="container-lg">
        <div class="course-title"><spring:message code="course.name"/></div>
        <div class="course-description">
            <spring:message code="course.description"/>
        </div>
        <div>
            <span class="badge bg-light text-dark border">${fn:length(lectures)} <spring:message code="index.lectures"/></span>
            <span class="badge bg-light text-dark border">${fn:length(polls)} <spring:message code="index.polls"/></span>
        </div>
    </div>
</div>

<div class="container-lg">
    <c:if test="${not empty success}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <c:out value="${success}"/>
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </c:if>

    <!-- Lectures Section -->
    <div class="d-flex justify-content-between align-items-center">
        <div class="section-title" style="flex-grow:1;"><spring:message code="index.lectures"/></div>
        <c:if test="${pageContext.request.isUserInRole('ROLE_TEACHER')}">
            <a href="${pageContext.request.contextPath}/lectures/add" class="btn btn-add ms-3">
                <spring:message code="index.addLecture"/>
            </a>
        </c:if>
    </div>
    <div class="row">
        <div class="col-md-8">
            <c:forEach var="lecture" items="${lectures}">
                <div class="lecture-card">
                    <div class="lecture-title"><c:out value="${lecture.title}"/></div>
                    <div class="lecture-preview">
                        <c:out value="${lecture.summary}"/>
                    </div>
                    <c:if test="${pageContext.request.userPrincipal != null}">
                        <a href="${pageContext.request.contextPath}/lectures/${lecture.id}" class="btn btn-primary btn-sm">
                            <spring:message code="index.viewLecture"/>
                        </a>
                    </c:if>
                    <c:if test="${pageContext.request.userPrincipal == null}">
                        <a href="#" class="btn btn-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#authModal" onclick="showAuthTab('login')">
                            <spring:message code="index.loginToView"/>
                        </a>
                    </c:if>
                </div>
            </c:forEach>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-header">Course Statistics</div>
                <div class="card-body">
                    <p class="mb-2"><strong>Instructor:</strong> Dr. John Smith</p>
                    <p class="mb-2"><strong>Duration:</strong> 8 weeks</p>
                    <p class="mb-2"><strong>Level:</strong> Intermediate</p>
                    <p class="mb-0"><strong>Credits:</strong> 3</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Polls Section -->
    <div class="d-flex justify-content-between align-items-center">
        <div class="section-title" style="flex-grow:1;"><spring:message code="index.polls"/></div>
        <c:if test="${pageContext.request.isUserInRole('ROLE_TEACHER')}">
            <a href="${pageContext.request.contextPath}/polls/add" class="btn btn-add ms-3">
                <spring:message code="index.addPoll"/>
            </a>
        </c:if>
    </div>
    <div class="row">
        <div class="col-md-8">
            <c:forEach var="poll" items="${polls}">
                <c:if test="${pageContext.request.userPrincipal != null}">
                    <a href="${pageContext.request.contextPath}/polls/${poll.id}" class="text-decoration-none">
                </c:if>
                <c:if test="${pageContext.request.userPrincipal == null}">
                    <a href="#" class="text-decoration-none" data-bs-toggle="modal" data-bs-target="#authModal" onclick="showAuthTab('login')">
                </c:if>
                    <div class="poll-card">
                        <div class="poll-question"><c:out value="${poll.question}"/></div>
                        <div class="poll-info">
                            <c:set var="totalVotes" value="0"/>
                            <c:forEach var="option" items="${poll.options}">
                                <c:set var="totalVotes" value="${totalVotes + option.voteCount}"/>
                            </c:forEach>
                            Total votes: ${totalVotes}
                        </div>
                    </div>
                </a>
            </c:forEach>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-header">Quick Links</div>
                <div class="card-body">
                    <ul class="list-unstyled">
                        <c:if test="${pageContext.request.userPrincipal == null}">
                            <li><a href="#" class="text-decoration-none" data-bs-toggle="modal" data-bs-target="#authModal" onclick="showAuthTab('login')"><spring:message code="nav.login"/></a></li>
                            <li><a href="#" class="text-decoration-none" data-bs-toggle="modal" data-bs-target="#authModal" onclick="showAuthTab('register')"><spring:message code="nav.register"/></a></li>
                        </c:if>
                        <c:if test="${pageContext.request.userPrincipal != null}">
                            <li><a href="${pageContext.request.contextPath}/profile" class="text-decoration-none"><spring:message code="nav.profile"/></a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <footer class="text-center py-4 mt-5 border-top">
        <p class="text-muted">&copy; 2026 Learning Management System. All rights reserved.</p>
    </footer>
</div>

<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>
</html>
