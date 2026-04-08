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
    <style>
        body { background-color: #f8f9fa; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        .navbar { background-color: #2c3e50; box-shadow: 0 2px 4px rgba(0,0,0,0.1); }
        .navbar-brand { font-weight: bold; font-size: 1.5rem; }
        .hero-section { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; padding: 60px 0; margin-bottom: 40px; }
        .course-title { font-size: 2.5rem; font-weight: bold; margin-bottom: 20px; }
        .course-description { font-size: 1.1rem; margin-bottom: 30px; }
        .section-title { font-size: 2rem; font-weight: bold; color: #2c3e50; margin-top: 40px; margin-bottom: 30px; border-bottom: 3px solid #667eea; padding-bottom: 10px; }
        .lecture-card { background: white; border: 1px solid #e0e0e0; border-radius: 8px; padding: 20px; margin-bottom: 20px; transition: transform 0.2s, box-shadow 0.2s; }
        .lecture-card:hover { transform: translateY(-5px); box-shadow: 0 5px 15px rgba(0,0,0,0.1); }
        .lecture-title { font-size: 1.3rem; font-weight: bold; color: #2c3e50; margin-bottom: 10px; }
        .lecture-preview { color: #666; font-size: 0.95rem; margin-bottom: 15px; }
        .poll-card { background: white; border-left: 4px solid #f39c12; border-radius: 4px; padding: 20px; margin-bottom: 20px; transition: transform 0.2s, box-shadow 0.2s; }
        .poll-card:hover { transform: translateY(-5px); box-shadow: 0 5px 15px rgba(0,0,0,0.1); }
        .poll-question { font-size: 1.2rem; font-weight: bold; color: #2c3e50; margin-bottom: 10px; }
        .poll-info { color: #999; font-size: 0.9rem; }
        .btn-view { background-color: #667eea; color: white; border: none; padding: 8px 16px; border-radius: 4px; text-decoration: none; transition: background-color 0.3s; }
        .btn-view:hover { background-color: #5568d3; text-decoration: none; color: white; }
        .btn-auth { background-color: #667eea; color: white; border: none; padding: 8px 16px; border-radius: 4px; text-decoration: none; cursor: pointer; transition: background-color 0.3s; }
        .btn-auth:hover { background-color: #5568d3; text-decoration: none; color: white; }
        .btn-logout { background-color: #e74c3c; color: white; border: none; padding: 8px 16px; border-radius: 4px; text-decoration: none; transition: background-color 0.3s; }
        .btn-logout:hover { background-color: #c0392b; text-decoration: none; color: white; }
        .btn-add { background-color: #27ae60; color: white; border: none; padding: 8px 16px; border-radius: 4px; text-decoration: none; transition: background-color 0.3s; }
        .btn-add:hover { background-color: #219a52; text-decoration: none; color: white; }
    </style>
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
            <span class="badge bg-light text-dark">${fn:length(lectures)} <spring:message code="index.lectures"/></span>
            <span class="badge bg-light text-dark">${fn:length(polls)} <spring:message code="index.polls"/></span>
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
        <div class="section-title" style="flex-grow:1;">&#128218; <spring:message code="index.lectures"/></div>
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
                        <a href="${pageContext.request.contextPath}/lectures/${lecture.id}" class="btn-view">
                            <spring:message code="index.viewLecture"/>
                        </a>
                    </c:if>
                    <c:if test="${pageContext.request.userPrincipal == null}">
                        <a href="${pageContext.request.contextPath}/login" class="btn-view" style="background-color: #95a5a6;">
                            <spring:message code="index.loginToView"/>
                        </a>
                    </c:if>
                </div>
            </c:forEach>
        </div>
        <div class="col-md-4">
            <div class="card border-info">
                <div class="card-header bg-info text-white">
                    <strong>Course Statistics</strong>
                </div>
                <div class="card-body">
                    <p><strong>Instructor:</strong> Dr. John Smith</p>
                    <p><strong>Duration:</strong> 8 weeks</p>
                    <p><strong>Level:</strong> Intermediate</p>
                    <p><strong>Credits:</strong> 3</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Polls Section -->
    <div class="d-flex justify-content-between align-items-center">
        <div class="section-title" style="flex-grow:1;">&#128499; <spring:message code="index.polls"/></div>
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
                    <a href="${pageContext.request.contextPath}/login" class="text-decoration-none">
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
            <div class="card border-warning">
                <div class="card-header bg-warning text-dark">
                    <strong>Quick Links</strong>
                </div>
                <div class="card-body">
                    <ul class="list-unstyled">
                        <c:if test="${pageContext.request.userPrincipal == null}">
                            <li><a href="${pageContext.request.contextPath}/login" class="text-decoration-none">&#128221; <spring:message code="nav.login"/></a></li>
                            <li><a href="${pageContext.request.contextPath}/register" class="text-decoration-none">&#128203; <spring:message code="nav.register"/></a></li>
                        </c:if>
                        <c:if test="${pageContext.request.userPrincipal != null}">
                            <li><a href="${pageContext.request.contextPath}/profile" class="text-decoration-none">&#128100; <spring:message code="nav.profile"/></a></li>
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
