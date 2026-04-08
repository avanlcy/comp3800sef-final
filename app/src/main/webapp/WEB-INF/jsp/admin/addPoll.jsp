<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><spring:message code="poll.addPoll"/> - <spring:message code="app.name"/></title>
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
        <h1><spring:message code="poll.addPoll"/></h1>
        <p class="mb-0 text-muted">Create a new poll with options</p>
    </div>
</div>

<div class="container-lg mb-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="form-card">
                <form action="${pageContext.request.contextPath}/polls/add" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                    <div class="mb-4">
                        <label for="question" class="form-label"><spring:message code="poll.question"/></label>
                        <input type="text" class="form-control" id="question" name="question"
                               placeholder="Enter your poll question..." required>
                    </div>

                    <div class="option-group">
                        <h5 class="mb-3"><spring:message code="poll.options"/></h5>
                        <div class="mb-3">
                            <label for="option1" class="form-label">Option 1</label>
                            <input type="text" class="form-control" id="option1" name="option1" required>
                        </div>
                        <div class="mb-3">
                            <label for="option2" class="form-label">Option 2</label>
                            <input type="text" class="form-control" id="option2" name="option2" required>
                        </div>
                        <div class="mb-3">
                            <label for="option3" class="form-label">Option 3</label>
                            <input type="text" class="form-control" id="option3" name="option3" required>
                        </div>
                        <div class="mb-3">
                            <label for="option4" class="form-label">Option 4</label>
                            <input type="text" class="form-control" id="option4" name="option4" required>
                        </div>
                        <div class="mb-3">
                            <label for="option5" class="form-label">Option 5</label>
                            <input type="text" class="form-control" id="option5" name="option5" required>
                        </div>
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
