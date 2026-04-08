<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><spring:message code="lecture.addLecture"/> - <spring:message code="app.name"/></title>
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
        <h1><spring:message code="lecture.addLecture"/></h1>
        <p class="mb-0 text-muted">Create a new lecture with materials</p>
    </div>
</div>

<div class="container-lg mb-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="form-card">
                <form action="${pageContext.request.contextPath}/lectures/add" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                    <div class="mb-3">
                        <label for="title" class="form-label"><spring:message code="lecture.title"/></label>
                        <input type="text" class="form-control" id="title" name="title" required>
                    </div>

                    <div class="mb-3">
                        <label for="summary" class="form-label"><spring:message code="lecture.summary"/></label>
                        <textarea class="form-control" id="summary" name="summary" rows="5" required></textarea>
                    </div>

                    <div class="mb-3">
                        <label for="files" class="form-label"><spring:message code="lecture.materials"/></label>
                        <input type="file" class="form-control" id="files" name="files" multiple>
                        <div class="form-text">You can select multiple files to upload (max 50MB each).</div>
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
