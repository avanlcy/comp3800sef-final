<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<nav class="navbar navbar-expand-lg">
    <div class="container-lg">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">
            <spring:message code="app.name"/>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/">
                        <spring:message code="nav.home"/>
                    </a>
                </li>
                <c:if test="${pageContext.request.userPrincipal != null}">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/profile">
                            <spring:message code="nav.profile"/>
                        </a>
                    </li>
                </c:if>
                <c:if test="${pageContext.request.isUserInRole('ROLE_TEACHER')}">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin/users">
                            <spring:message code="nav.manageUsers"/>
                        </a>
                    </li>
                </c:if>
            </ul>
            <ul class="navbar-nav">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="langDropdown" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        <spring:message code="nav.language"/>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="langDropdown">
                        <li><a class="dropdown-item" href="?lang=en">English</a></li>
                        <li><a class="dropdown-item" href="?lang=zh_TW">繁體中文</a></li>
                    </ul>
                </li>
                <c:if test="${pageContext.request.userPrincipal != null}">
                    <li class="nav-item">
                        <span class="nav-link">
                            <c:out value="${pageContext.request.userPrincipal.name}"/>
                        </span>
                    </li>
                    <li class="nav-item">
                        <form action="${pageContext.request.contextPath}/logout" method="post" class="d-inline">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <button type="submit" class="btn btn-logout btn-sm mt-1">
                                <spring:message code="nav.logout"/>
                            </button>
                        </form>
                    </li>
                </c:if>
                <c:if test="${pageContext.request.userPrincipal == null}">
                    <li class="nav-item">
                        <a class="btn btn-auth btn-sm mt-1 me-2" href="#" data-bs-toggle="modal" data-bs-target="#authModal" onclick="showAuthTab('login')">
                            <spring:message code="nav.login"/>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="btn btn-auth btn-sm mt-1" href="#" data-bs-toggle="modal" data-bs-target="#authModal" onclick="showAuthTab('register')">
                            <spring:message code="nav.register"/>
                        </a>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>

<%-- Authentication Modal --%>
<c:if test="${pageContext.request.userPrincipal == null}">
<div class="modal fade" id="authModal" tabindex="-1" aria-labelledby="authModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="authModalLabel">Authentication</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <ul class="nav nav-tabs mb-3" id="authTabs" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="login-tab" data-bs-toggle="tab" data-bs-target="#login-pane" type="button" role="tab">
                            <spring:message code="nav.login"/>
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="register-tab" data-bs-toggle="tab" data-bs-target="#register-pane" type="button" role="tab">
                            <spring:message code="nav.register"/>
                        </button>
                    </li>
                </ul>

                <div class="tab-content" id="authTabContent">
                    <%-- Login Tab --%>
                    <div class="tab-pane fade show active" id="login-pane" role="tabpanel">
                        <c:if test="${param.error != null}">
                            <div class="alert alert-danger"><spring:message code="login.error"/></div>
                        </c:if>
                        <c:if test="${not empty success}">
                            <div class="alert alert-success"><c:out value="${success}"/></div>
                        </c:if>

                        <form action="${pageContext.request.contextPath}/login" method="post">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <div class="mb-3">
                                <label for="loginUsername" class="form-label"><spring:message code="user.username"/></label>
                                <input type="text" class="form-control" id="loginUsername" name="username" placeholder="Enter your username" required>
                            </div>
                            <div class="mb-3">
                                <label for="loginPassword" class="form-label"><spring:message code="user.password"/></label>
                                <div class="position-relative">
                                    <input type="password" class="form-control" id="loginPassword" name="password" placeholder="Enter your password" required>
                                    <span style="cursor:pointer;position:absolute;right:10px;top:50%;transform:translateY(-50%);font-size:0.85rem;" onclick="togglePassword('loginPassword')">Show</span>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary w-100">
                                <spring:message code="login.submit"/>
                            </button>
                        </form>
                    </div>

                    <%-- Register Tab --%>
                    <div class="tab-pane fade" id="register-pane" role="tabpanel">
                        <c:if test="${not empty error}">
                            <div class="alert alert-danger"><c:out value="${error}"/></div>
                        </c:if>

                        <form action="${pageContext.request.contextPath}/register" method="post">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <div class="mb-3">
                                <label for="role" class="form-label"><spring:message code="user.role"/></label>
                                <select class="form-select" id="role" name="role" required>
                                    <option value="">Select user type</option>
                                    <option value="STUDENT"><spring:message code="role.student"/></option>
                                    <option value="TEACHER"><spring:message code="role.teacher"/></option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="regUsername" class="form-label"><spring:message code="user.username"/></label>
                                <input type="text" class="form-control" id="regUsername" name="username" placeholder="Create a username" required>
                            </div>
                            <div class="mb-3">
                                <label for="regPassword" class="form-label"><spring:message code="user.password"/></label>
                                <div class="position-relative">
                                    <input type="password" class="form-control" id="regPassword" name="password" placeholder="Create a password" required>
                                    <span style="cursor:pointer;position:absolute;right:10px;top:50%;transform:translateY(-50%);font-size:0.85rem;" onclick="togglePassword('regPassword')">Show</span>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="fullName" class="form-label"><spring:message code="user.fullName"/></label>
                                <input type="text" class="form-control" id="fullName" name="fullName" placeholder="Enter your full name" required>
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label"><spring:message code="user.email"/></label>
                                <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email address" required>
                            </div>
                            <div class="mb-3">
                                <label for="phone" class="form-label"><spring:message code="user.phone"/></label>
                                <input type="tel" class="form-control" id="phone" name="phone" placeholder="Enter your phone number" required>
                            </div>
                            <button type="submit" class="btn btn-primary w-100">
                                <spring:message code="register.submit"/>
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function showAuthTab(tab) {
        var loginTab = document.getElementById('login-tab');
        var registerTab = document.getElementById('register-tab');
        if (tab === 'register') {
            new bootstrap.Tab(registerTab).show();
        } else {
            new bootstrap.Tab(loginTab).show();
        }
    }
    function togglePassword(fieldId) {
        var field = document.getElementById(fieldId);
        field.type = field.type === 'password' ? 'text' : 'password';
    }
    // Auto-open modal if redirected with error/success
    document.addEventListener('DOMContentLoaded', function() {
        var params = new URLSearchParams(window.location.search);
        if (params.has('error') || params.has('authError') || params.has('authSuccess')) {
            var modal = new bootstrap.Modal(document.getElementById('authModal'));
            modal.show();
            if (params.has('authError')) {
                showAuthTab('register');
            }
        }
    });
</script>
</c:if>
