<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course - Learning Management System</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .navbar {
            background-color: #2c3e50;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .navbar-brand {
            font-weight: bold;
            font-size: 1.5rem;
        }
        .hero-section {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 60px 0;
            margin-bottom: 40px;
        }
        .course-title {
            font-size: 2.5rem;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .course-description {
            font-size: 1.1rem;
            margin-bottom: 30px;
        }
        .section-title {
            font-size: 2rem;
            font-weight: bold;
            color: #2c3e50;
            margin-top: 40px;
            margin-bottom: 30px;
            border-bottom: 3px solid #667eea;
            padding-bottom: 10px;
        }
        .lecture-card {
            background: white;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            transition: transform 0.2s, box-shadow 0.2s;
            cursor: pointer;
        }
        .lecture-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        .lecture-title {
            font-size: 1.3rem;
            font-weight: bold;
            color: #2c3e50;
            margin-bottom: 10px;
        }
        .lecture-preview {
            color: #666;
            font-size: 0.95rem;
            margin-bottom: 15px;
        }
        .poll-card {
            background: white;
            border-left: 4px solid #f39c12;
            border-radius: 4px;
            padding: 20px;
            margin-bottom: 20px;
            transition: transform 0.2s, box-shadow 0.2s;
            cursor: pointer;
        }
        .poll-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        .poll-question {
            font-size: 1.2rem;
            font-weight: bold;
            color: #2c3e50;
            margin-bottom: 10px;
        }
        .poll-info {
            color: #999;
            font-size: 0.9rem;
        }
        .btn-view {
            background-color: #667eea;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            text-decoration: none;
            transition: background-color 0.3s;
        }
        .btn-view:hover {
            background-color: #5568d3;
            text-decoration: none;
            color: white;
        }
        .auth-buttons {
            gap: 10px;
        }
        .btn-auth {
            background-color: #667eea;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            text-decoration: none;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .btn-auth:hover {
            background-color: #5568d3;
            text-decoration: none;
            color: white;
        }
        .btn-logout {
            background-color: #e74c3c;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            text-decoration: none;
            transition: background-color 0.3s;
        }
        .btn-logout:hover {
            background-color: #c0392b;
            text-decoration: none;
            color: white;
        }
        .modal-header {
            background-color: #667eea;
            color: white;
            border-bottom: none;
        }
        .modal-title {
            font-weight: bold;
        }
        .btn-close-white {
            filter: brightness(0) invert(1);
        }
        .form-control:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
        }
        .btn-primary-modal {
            background-color: #667eea;
            border-color: #667eea;
        }
        .btn-primary-modal:hover {
            background-color: #5568d3;
            border-color: #5568d3;
        }
        .nav-tabs .nav-link {
            color: #667eea;
            border: none;
            border-bottom: 2px solid transparent;
        }
        .nav-tabs .nav-link.active {
            color: #667eea;
            background-color: transparent;
            border-bottom: 2px solid #667eea;
        }
        .form-check-input:checked {
            background-color: #667eea;
            border-color: #667eea;
        }
        .toggle-password {
            cursor: pointer;
            position: absolute;
            right: 10px;
            top: 38px;
        }
        .password-input-group {
            position: relative;
        }
    </style>
</head>
<body>
<!-- navbar -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container-lg">
        <a class="navbar-brand" href="/">Online Learning Platform</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto auth-buttons">
                <li class="nav-item" id="authButtons">
                    <button class="btn btn-auth" data-bs-toggle="modal" data-bs-target="#authModal" onclick="showLoginTab()">Login</button>
                </li>
                <li class="nav-item">
                    <button class="btn btn-auth" data-bs-toggle="modal" data-bs-target="#authModal" onclick="showRegisterTab()">Register</button>
                </li>
                <li class="nav-item" id="profileButton" style="display: none;">
                    <a class="nav-link" href="/profile">Profile</a>
                </li>
                <li class="nav-item" id="logoutButton" style="display: none;">
                    <form method="POST" action="/logout" style="display: inline;">
                        <button type="submit" class="btn btn-logout">Logout</button>
                    </form>
                </li>
            </ul>
        </div>
    </div>
</nav>


<div class="hero-section">
    <div class="container-lg">
        <div class="course-title">Web Application Development</div>
        <div class="course-description">
            Learn the fundamentals of building modern web applications using Jakarta EE, Spring Boot, and front-end technologies.
        </div>
        <div>
            <span class="badge bg-light text-dark">4 Lectures</span>
            <span class="badge bg-light text-dark">5 Polls</span>
        </div>
    </div>
</div>

<div class="container-lg">
    <!-- Lectures Section -->
    <div class="section-title">&#128218; Course Materials</div>
    <div class="row">
        <div class="col-md-8">
            <c:forEach var="lec" items="${lectureList}">
                <a href="/lecture?id=${lec.id}" class="text-decoration-none">
                    <div class="lecture-card">
                        <div class="lecture-title"><c:out value="${lec.title}"/></div>
                        <div class="lecture-preview">
                            <c:out value="${lec.preview}"/>
                        </div>
                        <span class="btn-view">View Materials</span>
                    </div>
                </a>
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

    <!-- poll -->
    <div class="section-title">&#128499;&#65039; Community Polls</div>
    <div class="row">
        <div class="col-md-8">
            <c:forEach var="p" items="${pollList}">
                <a href="/poll?id=${p.id}" class="text-decoration-none">
                    <div class="poll-card">
                        <div class="poll-question"><c:out value="${p.title}"/></div>
                        <div class="poll-info">Total votes: <c:out value="${p.votes}"/> &bull; Active until <c:out value="${p.deadline}"/></div>
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
                        <li><button class="btn btn-link text-decoration-none p-0" data-bs-toggle="modal" data-bs-target="#authModal" onclick="showLoginTab()">&#128221; Login</button></li>
                        <li><button class="btn btn-link text-decoration-none p-0" data-bs-toggle="modal" data-bs-target="#authModal" onclick="showRegisterTab()">&#128203; Register</button></li>
                        <li><a href="#" class="text-decoration-none">&#128231; Contact Instructor</a></li>
                        <li><a href="#" class="text-decoration-none">&#10067; FAQ</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>


    <footer class="text-center py-4 mt-5 border-top">
        <p class="text-muted">&copy; 2026 Learning Management System. All rights reserved.</p>
    </footer>
</div>

<!--login-->
<div class="modal fade" id="authModal" tabindex="-1" aria-labelledby="authModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="authModalLabel">Authentication</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- Tab Navigation -->
                <ul class="nav nav-tabs mb-4" id="authTabs" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="login-tab" data-bs-toggle="tab" data-bs-target="#login" type="button" role="tab" aria-controls="login" aria-selected="true">Login</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="register-tab" data-bs-toggle="tab" data-bs-target="#register" type="button" role="tab" aria-controls="register" aria-selected="false">Register</button>
                    </li>
                </ul>

                <!-- Tab Content -->
                <div class="tab-content" id="authTabContent">
                    <!-- Login Tab -->
                    <div class="tab-pane fade show active" id="login" role="tabpanel" aria-labelledby="login-tab">
                        <form id="loginForm">
                            <div class="mb-3">
                                <label for="loginUsername" class="form-label">Username</label>
                                <input type="text" class="form-control" id="loginUsername" placeholder="Enter your username" required>
                            </div>
                            <div class="mb-3">
                                <label for="loginPassword" class="form-label">Password</label>
                                <div class="password-input-group">
                                    <input type="password" class="form-control" id="loginPassword" placeholder="Enter your password" required>
                                    <span class="toggle-password" onclick="togglePassword('loginPassword')">&#128065;&#65039;</span>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary-modal btn-primary w-100">Login</button>
                        </form>
                    </div>

                    <!-- register -->
                    <div class="tab-pane fade" id="register" role="tabpanel" aria-labelledby="register-tab">
                        <form id="registerForm">
                            <div class="mb-3">
                                <label for="userType" class="form-label">Register as</label>
                                <select class="form-select" id="userType" required>
                                    <option value="">Select user type</option>
                                    <option value="student">Student</option>
                                    <option value="teacher">Teacher</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="registerUsername" class="form-label">Username</label>
                                <input type="text" class="form-control" id="registerUsername" placeholder="Create a username" required>
                            </div>
                            <div class="mb-3">
                                <label for="registerPassword" class="form-label">Password</label>
                                <div class="password-input-group">
                                    <input type="password" class="form-control" id="registerPassword" placeholder="Create a password" required>
                                    <span class="toggle-password" onclick="togglePassword('registerPassword')">&#128065;&#65039;</span>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="fullName" class="form-label">Full Name</label>
                                <input type="text" class="form-control" id="fullName" placeholder="Enter your full name" required>
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Email Address</label>
                                <input type="email" class="form-control" id="email" placeholder="Enter your email address" required>
                            </div>
                            <div class="mb-3">
                                <label for="phone" class="form-label">Phone Number</label>
                                <input type="tel" class="form-control" id="phone" placeholder="Enter your phone number" required>
                            </div>
                            <button type="submit" class="btn btn-primary-modal btn-primary w-100">Register</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="/js/bootstrap.bundle.min.js"></script>
<script>

    function showLoginTab() {
        const loginTab = new bootstrap.Tab(document.getElementById('login-tab'));
        loginTab.show();
    }


    function showRegisterTab() {
        const registerTab = new bootstrap.Tab(document.getElementById('register-tab'));
        registerTab.show();
    }


    function togglePassword(fieldId) {
        const field = document.getElementById(fieldId);
        if (field.type === 'password') {
            field.type = 'text';
        } else {
            field.type = 'password';
        }
    }


    document.getElementById('loginForm').addEventListener('submit', function(e) {
        e.preventDefault();
        const username = document.getElementById('loginUsername').value;
        const password = document.getElementById('loginPassword').value;

        // send login req to backend
        console.log('Login attempt:', { username, password });


        simulateLogin(username);
    });


    document.getElementById('registerForm').addEventListener('submit', function(e) {
        e.preventDefault();
        const userType = document.getElementById('userType').value;
        const username = document.getElementById('registerUsername').value;
        const password = document.getElementById('registerPassword').value;
        const fullName = document.getElementById('fullName').value;
        const email = document.getElementById('email').value;
        const phone = document.getElementById('phone').value;

       // sned register req to backend
        console.log('Registration attempt:', { userType, username, password, fullName, email, phone });


        simulateLogin(username);
    });

    // Sim successful login
    function simulateLogin(username) {

        localStorage.setItem('currentUser', username);


        const modal = bootstrap.Modal.getInstance(document.getElementById('authModal'));
        modal.hide();


        updateNavbarAuthState();


        document.getElementById('loginForm').reset();
        document.getElementById('registerForm').reset();
    }


    function updateNavbarAuthState() {
        const currentUser = localStorage.getItem('currentUser');
        const authButtons = document.getElementById('authButtons');
        const profileButton = document.getElementById('profileButton');
        const logoutButton = document.getElementById('logoutButton');

        if (currentUser) {
            authButtons.style.display = 'none';
            profileButton.style.display = 'block';
            logoutButton.style.display = 'block';
        } else {
            authButtons.style.display = 'block';
            profileButton.style.display = 'none';
            logoutButton.style.display = 'none';
        }
    }


    document.addEventListener('DOMContentLoaded', function() {
        updateNavbarAuthState();
    });
</script>
</body>
</html>
