<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><c:out value="${lecture.title}"/> - <spring:message code="app.name"/></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <style>
        body { background-color: #f8f9fa; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        .navbar { background-color: #2c3e50; box-shadow: 0 2px 4px rgba(0,0,0,0.1); }
        .navbar-brand { font-weight: bold; font-size: 1.5rem; }
        .btn-auth { background-color: #667eea; color: white; border: none; padding: 8px 16px; border-radius: 4px; text-decoration: none; cursor: pointer; transition: background-color 0.3s; }
        .btn-auth:hover { background-color: #5568d3; text-decoration: none; color: white; }
        .btn-logout { background-color: #e74c3c; color: white; border: none; padding: 8px 16px; border-radius: 4px; text-decoration: none; transition: background-color 0.3s; }
        .btn-logout:hover { background-color: #c0392b; text-decoration: none; color: white; }
        .breadcrumb-section { background-color: white; padding: 20px 0; border-bottom: 1px solid #e0e0e0; margin-bottom: 30px; }
        .lecture-header { background-color: #667eea; color: white; padding: 30px 0; margin-bottom: 30px; }
        .lecture-title { font-size: 2rem; font-weight: bold; margin-bottom: 10px; }
        .section-title { font-size: 1.5rem; font-weight: bold; color: #2c3e50; margin-top: 30px; margin-bottom: 20px; border-bottom: 2px solid #667eea; padding-bottom: 10px; }
        .lecture-notes { background-color: white; padding: 20px; border-radius: 8px; margin-bottom: 20px; border-left: 4px solid #667eea; }
        .note-item { display: flex; align-items: center; padding: 12px; background-color: #f8f9fa; border-radius: 4px; margin-bottom: 10px; text-decoration: none; color: #333; transition: background-color 0.3s; }
        .note-item:hover { background-color: #e9ecef; text-decoration: none; color: #333; }
        .note-icon { font-size: 1.5rem; margin-right: 15px; color: #667eea; }
        .note-content { flex: 1; }
        .note-filename { font-weight: bold; color: #2c3e50; }
        .summary-content { background-color: white; padding: 20px; border-radius: 8px; margin-bottom: 20px; border-left: 4px solid #27ae60; line-height: 1.6; }
        .comments-section { background-color: white; padding: 20px; border-radius: 8px; margin-bottom: 20px; border-left: 4px solid #e74c3c; }
        .comment-item { padding: 15px; border-bottom: 1px solid #e0e0e0; margin-bottom: 15px; }
        .comment-item:last-child { border-bottom: none; margin-bottom: 0; }
        .comment-author { font-weight: bold; color: #2c3e50; margin-bottom: 5px; }
        .comment-date { color: #999; font-size: 0.85rem; margin-bottom: 10px; }
        .comment-text { color: #555; line-height: 1.5; }
        .comment-form { background-color: #f8f9fa; padding: 20px; border-radius: 8px; margin-bottom: 20px; }
        .form-control:focus { border-color: #667eea; box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25); }
        .btn-primary-custom { background-color: #667eea; border-color: #667eea; color: white; }
        .btn-primary-custom:hover { background-color: #5568d3; border-color: #5568d3; color: white; }
        .btn-delete-material { font-size: 0.8rem; }
    </style>
</head>
<body>

<%@ include file="fragments/header.jsp" %>

<div class="breadcrumb-section">
    <div class="container-lg">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb mb-0">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/"><spring:message code="nav.home"/></a></li>
                <li class="breadcrumb-item active"><spring:message code="lecture.materials"/></li>
            </ol>
        </nav>
    </div>
</div>

<div class="lecture-header">
    <div class="container-lg">
        <div class="d-flex justify-content-between align-items-start">
            <div class="lecture-title"><c:out value="${lecture.title}"/></div>
            <c:if test="${pageContext.request.isUserInRole('ROLE_TEACHER')}">
                <form action="${pageContext.request.contextPath}/lectures/${lecture.id}/delete" method="post"
                      class="d-inline" onsubmit="return confirm('Are you sure you want to delete this lecture?')">
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
        <div class="col-lg-8">
            <!-- Download Materials -->
            <div class="section-title">&#128229; <spring:message code="lecture.materials"/></div>
            <div class="lecture-notes">
                <c:if test="${not empty lecture.materials}">
                    <c:forEach var="material" items="${lecture.materials}">
                        <div class="note-item">
                            <span class="note-icon">&#128196;</span>
                            <div class="note-content">
                                <a href="${pageContext.request.contextPath}/files/${material.id}" class="note-filename">
                                    <c:out value="${material.fileName}"/>
                                </a>
                            </div>
                            <c:if test="${pageContext.request.isUserInRole('ROLE_TEACHER')}">
                                <form action="${pageContext.request.contextPath}/lectures/${lecture.id}/materials/${material.id}/delete"
                                      method="post" class="d-inline ms-2" onsubmit="return confirm('Are you sure?')">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    <button type="submit" class="btn btn-danger btn-sm btn-delete-material"><spring:message code="action.delete"/></button>
                                </form>
                            </c:if>
                        </div>
                    </c:forEach>
                </c:if>
                <c:if test="${empty lecture.materials}">
                    <p class="text-muted"><spring:message code="lecture.noMaterials"/></p>
                </c:if>
            </div>

            <!-- Upload Materials (Teacher only) -->
            <c:if test="${pageContext.request.isUserInRole('ROLE_TEACHER')}">
                <div class="comment-form">
                    <h5><spring:message code="lecture.uploadMaterials"/></h5>
                    <form action="${pageContext.request.contextPath}/lectures/${lecture.id}/materials/upload"
                          method="post" enctype="multipart/form-data">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <div class="mb-3">
                            <input type="file" class="form-control" name="files" multiple required>
                            <small class="text-muted"><spring:message code="lecture.batchUploadHint"/></small>
                        </div>
                        <button type="submit" class="btn btn-primary-custom"><spring:message code="action.upload"/></button>
                    </form>
                </div>
            </c:if>

            <!-- Summary -->
            <div class="section-title">&#128214; <spring:message code="lecture.summary"/></div>
            <div class="summary-content">
                <c:out value="${lecture.summary}"/>
            </div>

            <!-- Comments -->
            <div class="section-title">&#128172; <spring:message code="comments.title"/></div>

            <!-- Comment Form -->
            <div class="comment-form">
                <div class="form-group mb-3">
                    <label for="commentText" class="form-label"><strong><spring:message code="comments.addComment"/></strong></label>
                    <form action="${pageContext.request.contextPath}/lectures/${lecture.id}/comments/add" method="post">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <textarea class="form-control mb-3" id="commentText" name="content" rows="4"
                                  placeholder="Share your thoughts about this lecture..." required></textarea>
                        <button type="submit" class="btn btn-primary-custom"><spring:message code="comments.submit"/></button>
                    </form>
                </div>
            </div>

            <!-- Existing Comments -->
            <div class="comments-section">
                <c:forEach var="comment" items="${lecture.comments}">
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
                                <form action="${pageContext.request.contextPath}/lectures/${lecture.id}/comments/${comment.id}/delete"
                                      method="post" class="d-inline" onsubmit="return confirm('Are you sure?')">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    <button type="submit" class="btn btn-danger btn-sm"><spring:message code="action.delete"/></button>
                                </form>
                            </c:if>
                        </div>
                        <div class="comment-text"><c:out value="${comment.content}"/></div>
                    </div>
                </c:forEach>
                <c:if test="${empty lecture.comments}">
                    <p class="text-muted"><spring:message code="comments.noComments"/></p>
                </c:if>
            </div>
        </div>

        <div class="col-lg-4">
            <div class="card mb-3 border-0 shadow-sm">
                <div class="card-header bg-light">
                    <strong>Lecture Information</strong>
                </div>
                <div class="card-body">
                    <p class="mb-2"><strong>Lecture:</strong> <c:out value="${lecture.title}"/></p>
                    <p class="mb-2"><strong>Materials:</strong> ${lecture.materials.size()} files</p>
                    <p class="mb-0"><strong>Comments:</strong> ${lecture.comments.size()}</p>
                </div>
            </div>
            <a href="${pageContext.request.contextPath}/" class="btn btn-secondary w-100">
                <spring:message code="action.backToHome"/>
            </a>
        </div>
    </div>

    <footer class="text-center py-4 mt-5 border-top">
        <p class="text-muted">&copy; 2026 Learning Management System. All rights reserved.</p>
    </footer>
</div>

<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>
</html>
