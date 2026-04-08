<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><c:out value="${poll.question}"/> - <spring:message code="app.name"/></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css">
</head>
<body>

<%@ include file="fragments/header.jsp" %>

<div class="breadcrumb-section">
    <div class="container-lg">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb mb-0">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/"><spring:message code="nav.home"/></a></li>
                <li class="breadcrumb-item active"><spring:message code="index.polls"/></li>
            </ol>
        </nav>
    </div>
</div>

<div class="poll-header">
    <div class="container-lg">
        <div class="d-flex justify-content-between align-items-start">
            <div>
                <div class="poll-title"><c:out value="${poll.question}"/></div>
                <div class="text-muted" style="font-size: 0.9rem;">
                    <c:set var="totalVotes" value="0"/>
                    <c:forEach var="option" items="${poll.options}">
                        <c:set var="totalVotes" value="${totalVotes + option.voteCount}"/>
                    </c:forEach>
                    ${totalVotes} Total Votes
                </div>
            </div>
            <c:if test="${pageContext.request.isUserInRole('ROLE_TEACHER')}">
                <form action="${pageContext.request.contextPath}/polls/${poll.id}/delete" method="post"
                      class="d-inline" onsubmit="return confirm('Are you sure you want to delete this poll?')">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <button type="submit" class="btn btn-danger btn-sm"><spring:message code="action.delete"/></button>
                </form>
            </c:if>
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

    <div class="row">
        <div class="col-lg-12">
            <div class="section-title"><spring:message code="poll.question"/></div>
            <div class="poll-info-box <c:if test='${not empty userVoteOptionId}'>voted</c:if>">
                <h5 class="mb-3"><c:out value="${poll.question}"/></h5>
                <p class="mb-0">
                    <c:choose>
                        <c:when test="${not empty userVoteOptionId}">
                            You have voted on this poll. You can update your vote below.
                        </c:when>
                        <c:otherwise>
                            You haven't voted yet. Please select an option below.
                        </c:otherwise>
                    </c:choose>
                </p>
            </div>

            <div class="section-title">Voting Options</div>
            <form action="${pageContext.request.contextPath}/polls/${poll.id}/vote" method="post">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <div class="poll-options">
                    <c:forEach var="option" items="${poll.options}" varStatus="status">
                        <div class="poll-option <c:if test='${option.id == userVoteOptionId}'>selected</c:if>"
                             onclick="selectOption(${status.index + 1})">
                            <div class="option-label">
                                <input type="radio" id="option${status.index + 1}" name="optionId"
                                       value="${option.id}" required
                                       <c:if test="${option.id == userVoteOptionId}">checked</c:if>>
                                <label for="option${status.index + 1}" class="mb-0">
                                    <c:out value="${option.optionText}"/>
                                </label>
                            </div>
                            <div class="option-stats">
                                <c:set var="percentage" value="${totalVotes > 0 ? Math.round(option.voteCount * 100.0 / totalVotes) : 0}"/>
                                <div class="progress-bar-custom" style="width: ${percentage > 0 ? percentage : 5}%;">
                                    ${percentage}%
                                </div>
                                <span class="vote-count">${option.voteCount} <spring:message code="poll.votes"/></span>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <div class="mt-3 mb-4">
                    <button type="submit" class="btn btn-vote">
                        <c:choose>
                            <c:when test="${not empty userVoteOptionId}">
                                <spring:message code="poll.updateVote"/>
                            </c:when>
                            <c:otherwise>
                                <spring:message code="poll.submitVote"/>
                            </c:otherwise>
                        </c:choose>
                    </button>
                </div>
            </form>

            <!-- Comments -->
            <div class="section-title"><spring:message code="comments.title"/></div>

            <!-- Comment Form -->
            <div class="comment-form">
                <div class="form-group mb-3">
                    <label for="commentText" class="form-label"><strong><spring:message code="comments.addComment"/></strong></label>
                    <form action="${pageContext.request.contextPath}/polls/${poll.id}/comments/add" method="post">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <textarea class="form-control mb-3" id="commentText" name="content" rows="4"
                                  placeholder="Share your thoughts about this poll..." required></textarea>
                        <button type="submit" class="btn btn-primary-custom"><spring:message code="comments.submit"/></button>
                    </form>
                </div>
            </div>

            <!-- Existing Comments -->
            <div class="comments-section">
                <c:forEach var="comment" items="${poll.comments}">
                    <div class="comment-item">
                        <div class="d-flex justify-content-between align-items-start">
                            <div>
                                <div class="comment-author">
                                    <c:out value="${comment.user.fullName}"/>
                                    <small class="text-muted">(<c:out value="${comment.user.username}"/>)</small>
                                </div>
                                <div class="comment-date">${comment.createdAt}</div>
                            </div>
                            <c:if test="${pageContext.request.isUserInRole('ROLE_TEACHER')}">
                                <form action="${pageContext.request.contextPath}/polls/${poll.id}/comments/${comment.id}/delete"
                                      method="post" class="d-inline" onsubmit="return confirm('Are you sure?')">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    <button type="submit" class="btn btn-danger btn-sm"><spring:message code="action.delete"/></button>
                                </form>
                            </c:if>
                        </div>
                        <div class="comment-text"><c:out value="${comment.content}"/></div>
                    </div>
                </c:forEach>
                <c:if test="${empty poll.comments}">
                    <p class="text-muted"><spring:message code="comments.noComments"/></p>
                </c:if>
            </div>

            <!-- Poll Statistics -->
            <div class="row mt-4 mb-5">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header">Poll Statistics</div>
                        <div class="card-body">
                            <p class="mb-2"><strong>Total Votes:</strong> ${totalVotes}</p>
                            <p class="mb-2"><strong>Options:</strong> ${poll.options.size()}</p>
                            <p class="mb-0"><strong>Comments:</strong> ${poll.comments.size()}</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 d-flex align-items-end">
                    <a href="${pageContext.request.contextPath}/" class="btn btn-secondary w-100">
                        <spring:message code="action.backToHome"/>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <footer class="text-center py-4 mt-5 border-top">
        <p class="text-muted">&copy; 2026 Learning Management System. All rights reserved.</p>
    </footer>
</div>

<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<script>
    function selectOption(optionNumber) {
        var radioButton = document.getElementById('option' + optionNumber);
        radioButton.checked = true;
        document.querySelectorAll('.poll-option').forEach(function(option, index) {
            if (index === optionNumber - 1) {
                option.classList.add('selected');
            } else {
                option.classList.remove('selected');
            }
        });
    }
</script>
</body>
</html>
