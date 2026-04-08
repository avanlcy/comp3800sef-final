<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<nav class="navbar navbar-expand-lg navbar-dark">
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
                        <span class="nav-link text-light">
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
                        <a class="btn btn-auth btn-sm mt-1 me-2" href="${pageContext.request.contextPath}/login">
                            <spring:message code="nav.login"/>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="btn btn-auth btn-sm mt-1" href="${pageContext.request.contextPath}/register">
                            <spring:message code="nav.register"/>
                        </a>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>
