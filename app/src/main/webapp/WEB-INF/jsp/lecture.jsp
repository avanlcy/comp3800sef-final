<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lecture Materials - LMS</title>
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
        .breadcrumb-section {
            background-color: white;
            padding: 20px 0;
            border-bottom: 1px solid #e0e0e0;
            margin-bottom: 30px;
        }
        .lecture-header {
            background-color: #667eea;
            color: white;
            padding: 30px 0;
            margin-bottom: 30px;
        }
        .lecture-title {
            font-size: 2rem;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .lecture-meta {
            font-size: 0.95rem;
            opacity: 0.9;
        }
        .section-title {
            font-size: 1.5rem;
            font-weight: bold;
            color: #2c3e50;
            margin-top: 30px;
            margin-bottom: 20px;
            border-bottom: 2px solid #667eea;
            padding-bottom: 10px;
        }
        .lecture-notes {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
            border-left: 4px solid #667eea;
        }
        .note-item {
            display: flex;
            align-items: center;
            padding: 12px;
            background-color: #f8f9fa;
            border-radius: 4px;
            margin-bottom: 10px;
            text-decoration: none;
            color: #333;
            transition: background-color 0.3s;
        }
        .note-item:hover {
            background-color: #e9ecef;
            text-decoration: none;
            color: #333;
        }
        .note-icon {
            font-size: 1.5rem;
            margin-right: 15px;
            color: #667eea;
        }
        .note-content {
            flex: 1;
        }
        .note-filename {
            font-weight: bold;
            color: #2c3e50;
        }
        .note-size {
            color: #999;
            font-size: 0.85rem;
        }
        .summary-content {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
            border-left: 4px solid #27ae60;
            line-height: 1.6;
        }
        .comments-section {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
            border-left: 4px solid #e74c3c;
        }
        .comment-item {
            padding: 15px;
            border-bottom: 1px solid #e0e0e0;
            margin-bottom: 15px;
        }
        .comment-item:last-child {
            border-bottom: none;
            margin-bottom: 0;
        }
        .comment-author {
            font-weight: bold;
            color: #2c3e50;
            margin-bottom: 5px;
        }
        .comment-date {
            color: #999;
            font-size: 0.85rem;
            margin-bottom: 10px;
        }
        .comment-text {
            color: #555;
            line-height: 1.5;
        }
        .comment-form {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
        }
        .form-control:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
        }
        .btn-primary-custom {
            background-color: #667eea;
            border-color: #667eea;
            color: white;
        }
        .btn-primary-custom:hover {
            background-color: #5568d3;
            border-color: #5568d3;
            color: white;
        }
        .auth-alert {
            background-color: #fff3cd;
            border: 1px solid #ffc107;
            padding: 15px;
            border-radius: 4px;
            margin-bottom: 20px;
        }
        .auth-alert a {
            color: #0c5460;
            font-weight: bold;
        }
    </style>
</head>
<body>
<!-- Nav -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container-lg">
        <a class="navbar-brand" href="/">LMS</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/">Home</a>
                </li>
            </ul>
        </div>
    </div>
</nav>


<div class="breadcrumb-section">
    <div class="container-lg">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb mb-0">
                <li class="breadcrumb-item"><a href="/">Home</a></li>
                <li class="breadcrumb-item active">Lecture Materials</li>
            </ol>
        </nav>
    </div>
</div>


<div class="lecture-header">
    <div class="container-lg">
        <div class="lecture-title" id="lectureTitle">Lecture 1: Introduction to Web Development</div>
        <div class="lecture-meta" id="lectureMeta">
            &#128197; Published on Nov 1, 2024 | &#9201;&#65039; Duration: 90 minutes | &#128205; Week 1
        </div>
    </div>
</div>

<div class="container-lg">
    <div class="row">

        <div class="col-lg-8">
            <!-- Download Materials -->
            <div>
                <div class="section-title">&#128229; Download Lecture Notes</div>
                <div class="lecture-notes" id="lectureNotes">
                    <!-- Content loaded dynamically -->
                </div>
            </div>

            <!-- Summary -->
            <div>
                <div class="section-title">&#128214; Lecture Summary</div>
                <div class="summary-content" id="lectureSummary">
                    <!-- Content loaded dynamically -->
                </div>
            </div>

            <!-- Comment-->
            <div>
                <div class="section-title">&#128172; Comments</div>

                <!-- Authentication Alert (for unregistered users) -->
                <div class="auth-alert" id="authAlert" style="display: none;">
                    <strong>&#9888;&#65039; Please Log In</strong><br>
                    You need to be logged in to write comments. <a href="javascript:void(0);" onclick="openLoginModal()">Click here to login</a> or <a href="javascript:void(0);" onclick="openRegisterModal()">register</a> if you don't have an account.
                </div>

                <!-- Comment Form  (only to registered users) -->
                <div class="comment-form" id="commentForm">
                    <div class="form-group mb-3">
                        <label for="commentText" class="form-label"><strong>Write a Comment</strong></label>
                        <textarea class="form-control" id="commentText" rows="4" placeholder="Share your thoughts about this lecture..."></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary-custom">Post Comment</button>
                </div>

                <!-- Existing Comments -->
                <div class="comments-section" id="commentsSection">

                </div>
            </div>
        </div>


        <div class="col-lg-4">
            <div class="card mb-3 border-0 shadow-sm">
                <div class="card-header bg-light">
                    <strong>Lecture Information</strong>
                </div>
                <div class="card-body">
                    <p class="mb-2"><strong>Lecture:</strong> <span id="lectureNumber">#1</span></p>
                    <p class="mb-2"><strong>Week:</strong> <span id="lectureWeek">Week 1</span></p>
                    <p class="mb-2"><strong>Duration:</strong> <span id="lectureDuration">90 minutes</span></p>
                    <p class="mb-0"><strong>Difficulty:</strong> <span id="lectureDifficulty" class="badge bg-success">Beginner</span></p>
                </div>
            </div>
        </div>
    </div>


    <footer class="text-center py-4 mt-5 border-top">
        <p class="text-muted">&copy; 2024 Learning Management System. All rights reserved.</p>
    </footer>
</div>

<script src="/js/bootstrap.bundle.min.js"></script>
<script>
    // Fake lecture data
    const lectureData = {
        1: {
            title: "Lecture 1: Introduction to Web Development",
            number: "#1",
            week: "Week 1",
            duration: "90 minutes",
            difficulty: "Beginner",
            date: "Nov 1, 2024",
            notes: [
                { icon: "\u{1F4C4}", name: "Lecture_1_Introduction_to_Web_Development.pdf", size: "1.8 MB \u2022 PDF" },
                { icon: "\u{1F3A5}", name: "Lecture_1_Recording.mp4", size: "142 MB \u2022 Video" },
                { icon: "\u{1F4BE}", name: "Code_Examples.zip", size: "0.9 MB \u2022 ZIP" }
            ],
            summary: '<h5>Overview</h5>' +
                '<p>This lecture provides a comprehensive introduction to web development, covering the fundamental concepts and technologies that power modern web applications.</p>' +
                '<h5 class="mt-4">Key Topics Covered:</h5>' +
                '<ul>' +
                '<li><strong>Web Basics:</strong> Understanding HTTP, URLs, and the client-server model</li>' +
                '<li><strong>HTML Fundamentals:</strong> Structure and semantics of web pages</li>' +
                '<li><strong>CSS Styling:</strong> Visual design and responsive layouts</li>' +
                '<li><strong>JavaScript Basics:</strong> Introduction to client-side scripting</li>' +
                '<li><strong>Web Browsers:</strong> How browsers render and execute web pages</li>' +
                '<li><strong>Development Tools:</strong> Setting up your development environment</li>' +
                '</ul>' +
                '<h5 class="mt-4">Learning Outcomes:</h5>' +
                '<p>After completing this lecture, you should be able to:</p>' +
                '<ul>' +
                '<li>Understand the fundamentals of web technologies</li>' +
                '<li>Create basic HTML structures</li>' +
                '<li>Style web pages with CSS</li>' +
                '<li>Write simple JavaScript code</li>' +
                '<li>Understand client-server communication</li>' +
                '</ul>' +
                '<h5 class="mt-4">Recommended Reading:</h5>' +
                '<ul>' +
                '<li>MDN Web Docs: <a href="#">https://developer.mozilla.org</a></li>' +
                '<li>HTML Standard Specification</li>' +
                '<li>CSS Flexbox and Grid Guide</li>' +
                '</ul>',
            comments: [
                {
                    author: "\u{1F464} Alice Brown (Student)",
                    date: "Nov 5, 2024 at 1:15 PM",
                    text: "Great starting point for web development! The examples were very clear and easy to follow."
                },
                {
                    author: "\u{1F468}\u200D\u{1F3EB} Dr. John Smith (Instructor)",
                    date: "Nov 6, 2024 at 9:30 AM",
                    text: "Thank you, Alice! I'm glad you found the content helpful. Feel free to ask if you have any questions."
                }
            ]
        },
        2: {
            title: "Lecture 2: Jakarta EE Fundamentals",
            number: "#2",
            week: "Week 2",
            duration: "90 minutes",
            difficulty: "Intermediate",
            date: "Nov 15, 2024",
            notes: [
                { icon: "\u{1F4C4}", name: "Lecture_2_Jakarta_EE_Fundamentals.pdf", size: "2.4 MB \u2022 PDF" },
                { icon: "\u{1F3A5}", name: "Lecture_2_Recording.mp4", size: "156 MB \u2022 Video" },
                { icon: "\u{1F4BE}", name: "Code_Examples.zip", size: "1.2 MB \u2022 ZIP" }
            ],
            summary: '<h5>Overview</h5>' +
                '<p>This lecture introduces the fundamentals of Jakarta Enterprise Edition (formerly Java EE), which is the industry standard for building enterprise-grade web applications in Java.</p>' +
                '<h5 class="mt-4">Key Topics Covered:</h5>' +
                '<ul>' +
                '<li><strong>Jakarta EE Architecture:</strong> Understanding the multi-tier architecture and components</li>' +
                '<li><strong>Servlets:</strong> Building HTTP request handlers and understanding the servlet lifecycle</li>' +
                '<li><strong>JSP (JavaServer Pages):</strong> Creating dynamic web pages with server-side processing</li>' +
                '<li><strong>Expression Language (EL):</strong> Simplifying data access and method invocation in JSP</li>' +
                '<li><strong>JSTL (JSP Standard Tag Library):</strong> Reusable tag components for common operations</li>' +
                '<li><strong>Web Containers:</strong> How application servers manage servlet and JSP execution</li>' +
                '</ul>' +
                '<h5 class="mt-4">Learning Outcomes:</h5>' +
                '<p>After completing this lecture, you should be able to:</p>' +
                '<ul>' +
                '<li>Understand the structure and components of Jakarta EE</li>' +
                '<li>Create and deploy servlets to handle HTTP requests</li>' +
                '<li>Develop JSP pages with dynamic content generation</li>' +
                '<li>Use EL and JSTL to simplify JSP development</li>' +
                '<li>Understand the lifecycle of servlets and JSP pages</li>' +
                '<li>Configure web applications using web.xml</li>' +
                '</ul>' +
                '<h5 class="mt-4">Recommended Reading:</h5>' +
                '<ul>' +
                '<li>Jakarta EE Official Documentation: <a href="#">https://jakarta.ee</a></li>' +
                '<li>Servlet Specification (Chapter 1-3)</li>' +
                '<li>JSP and JSTL Best Practices Guide</li>' +
                '</ul>',
            comments: [
                {
                    author: "\u{1F464} John Doe (Student)",
                    date: "Nov 18, 2024 at 2:30 PM",
                    text: "Great explanation of servlets! The examples were really helpful. Could you provide more details on session management in the next lecture?"
                },
                {
                    author: "\u{1F468}\u200D\u{1F3EB} Dr. Jane Smith (Instructor)",
                    date: "Nov 19, 2024 at 10:15 AM",
                    text: "Great question, John! Session management will be covered in the next lecture along with HTTP state management techniques."
                }
            ]
        },
        3: {
            title: "Lecture 3: Spring Framework Basics",
            number: "#3",
            week: "Week 3",
            duration: "120 minutes",
            difficulty: "Intermediate",
            date: "Nov 22, 2024",
            notes: [
                { icon: "\u{1F4C4}", name: "Lecture_3_Spring_Framework_Basics.pdf", size: "2.8 MB \u2022 PDF" },
                { icon: "\u{1F3A5}", name: "Lecture_3_Recording.mp4", size: "165 MB \u2022 Video" },
                { icon: "\u{1F4BE}", name: "Spring_Project_Template.zip", size: "2.5 MB \u2022 ZIP" }
            ],
            summary: '<h5>Overview</h5>' +
                '<p>This lecture introduces the Spring Framework, one of the most popular and widely-used frameworks for building Java applications. Learn about dependency injection, aspect-oriented programming, and the Spring MVC architecture.</p>' +
                '<h5 class="mt-4">Key Topics Covered:</h5>' +
                '<ul>' +
                '<li><strong>Spring Framework Overview:</strong> Understanding the core concepts and architecture</li>' +
                '<li><strong>Dependency Injection:</strong> IoC containers and bean management</li>' +
                '<li><strong>Spring MVC:</strong> Building web applications with Model-View-Controller pattern</li>' +
                '<li><strong>Aspect-Oriented Programming:</strong> Cross-cutting concerns and annotations</li>' +
                '<li><strong>Data Access:</strong> Working with databases using Spring Data</li>' +
                '<li><strong>Configuration:</strong> Java-based and XML-based configuration</li>' +
                '</ul>' +
                '<h5 class="mt-4">Learning Outcomes:</h5>' +
                '<p>After completing this lecture, you should be able to:</p>' +
                '<ul>' +
                '<li>Understand Spring Framework concepts and architecture</li>' +
                '<li>Implement dependency injection in applications</li>' +
                '<li>Build web applications using Spring MVC</li>' +
                '<li>Work with aspect-oriented programming</li>' +
                '<li>Access and manipulate database data</li>' +
                '<li>Configure Spring applications</li>' +
                '</ul>' +
                '<h5 class="mt-4">Recommended Reading:</h5>' +
                '<ul>' +
                '<li>Spring Framework Documentation: <a href="#">https://spring.io</a></li>' +
                '<li>Spring MVC Reference Guide</li>' +
                '<li>Dependency Injection Best Practices</li>' +
                '</ul>',
            comments: [
                {
                    author: "\u{1F464} Sarah Johnson (Student)",
                    date: "Nov 24, 2024 at 3:00 PM",
                    text: "The dependency injection explanation was very clear. Looking forward to the Spring Boot lecture!"
                },
                {
                    author: "\u{1F464} Mike Chen (Student)",
                    date: "Nov 25, 2024 at 10:45 AM",
                    text: "I found the MVC pattern explanation helpful. Can we get more practice problems on this topic?"
                }
            ]
        },
        4: {
            title: "Lecture 4: Spring Boot Development",
            number: "#4",
            week: "Week 4",
            duration: "120 minutes",
            difficulty: "Intermediate",
            date: "Nov 29, 2024",
            notes: [
                { icon: "\u{1F4C4}", name: "Lecture_4_Spring_Boot_Development.pdf", size: "3.1 MB \u2022 PDF" },
                { icon: "\u{1F3A5}", name: "Lecture_4_Recording.mp4", size: "172 MB \u2022 Video" },
                { icon: "\u{1F4BE}", name: "Spring_Boot_Project_Examples.zip", size: "3.8 MB \u2022 ZIP" }
            ],
            summary: '<h5>Overview</h5>' +
                '<p>This lecture covers Spring Boot, which simplifies Spring application development by providing sensible defaults and auto-configuration. Learn how to build production-ready applications with minimal configuration.</p>' +
                '<h5 class="mt-4">Key Topics Covered:</h5>' +
                '<ul>' +
                '<li><strong>Spring Boot Basics:</strong> Understanding auto-configuration and starters</li>' +
                '<li><strong>Embedded Servers:</strong> Running applications without external servers</li>' +
                '<li><strong>RESTful APIs:</strong> Building REST endpoints with Spring Boot</li>' +
                '<li><strong>Database Integration:</strong> Spring Data JPA with Spring Boot</li>' +
                '<li><strong>Configuration Management:</strong> application.properties and profiles</li>' +
                '<li><strong>Testing:</strong> Unit and integration testing in Spring Boot</li>' +
                '<li><strong>Deployment:</strong> Packaging and deploying Spring Boot applications</li>' +
                '</ul>' +
                '<h5 class="mt-4">Learning Outcomes:</h5>' +
                '<p>After completing this lecture, you should be able to:</p>' +
                '<ul>' +
                '<li>Set up and configure Spring Boot applications</li>' +
                '<li>Build RESTful web services</li>' +
                '<li>Integrate databases with Spring Data JPA</li>' +
                '<li>Implement application configuration strategies</li>' +
                '<li>Write unit and integration tests</li>' +
                '<li>Deploy Spring Boot applications to production</li>' +
                '</ul>' +
                '<h5 class="mt-4">Recommended Reading:</h5>' +
                '<ul>' +
                '<li>Spring Boot Official Guide: <a href="#">https://spring.io/projects/spring-boot</a></li>' +
                '<li>Building REST APIs with Spring Boot</li>' +
                '<li>Spring Boot Testing Guide</li>' +
                '</ul>',
            comments: [
                {
                    author: "\u{1F464} Emma Wilson (Student)",
                    date: "Dec 2, 2024 at 4:20 PM",
                    text: "Spring Boot makes development so much faster! The embedded server feature is brilliant."
                },
                {
                    author: "\u{1F468}\u200D\u{1F3EB} Dr. John Smith (Instructor)",
                    date: "Dec 3, 2024 at 11:00 AM",
                    text: "Exactly! Spring Boot is perfect for modern microservices development. Great observation, Emma!"
                },
                {
                    author: "\u{1F464} David Lee (Student)",
                    date: "Dec 3, 2024 at 2:15 PM",
                    text: "Can we have more examples on deploying to cloud platforms like AWS or Azure?"
                }
            ]
        }
    };


    function loadLecture() {
        const params = new URLSearchParams(window.location.search);
        const lectureId = params.get('id') || 1;
        const lecture = lectureData[lectureId];

        if (!lecture) {
            window.location.href = '/';
            return;
        }


        document.getElementById('lectureTitle').textContent = lecture.title;
        document.getElementById('lectureMeta').textContent = '\u{1F4C5} Published on ' + lecture.date + ' | \u23F1\uFE0F Duration: ' + lecture.duration + ' | \u{1F4CD} ' + lecture.week;


        document.getElementById('lectureNumber').textContent = lecture.number;
        document.getElementById('lectureWeek').textContent = lecture.week;
        document.getElementById('lectureDuration').textContent = lecture.duration;
        document.getElementById('lectureDifficulty').textContent = lecture.difficulty;


        const notesHTML = lecture.notes.map(note =>
            '<a href="#" class="note-item">' +
                '<span class="note-icon">' + note.icon + '</span>' +
                '<div class="note-content">' +
                    '<div class="note-filename">' + note.name + '</div>' +
                    '<div class="note-size">' + note.size + '</div>' +
                '</div>' +
            '</a>'
        ).join('');
        document.getElementById('lectureNotes').innerHTML = notesHTML;


        document.getElementById('lectureSummary').innerHTML = lecture.summary;


        const commentsHTML = lecture.comments.map(comment =>
            '<div class="comment-item">' +
                '<div class="comment-author">' + comment.author + '</div>' +
                '<div class="comment-date">' + comment.date + '</div>' +
                '<div class="comment-text">' + comment.text + '</div>' +
            '</div>'
        ).join('');
        document.getElementById('commentsSection').innerHTML = commentsHTML;
    }


    function checkAuthStatus() {
        const isLoggedIn = localStorage.getItem('currentUser');
        if (!isLoggedIn) {
            document.getElementById('commentForm').style.display = 'none';
            document.getElementById('authAlert').style.display = 'block';
        }
    }


    function openLoginModal() {
        alert('Please use the home page to login');
    }

    function openRegisterModal() {
        alert('Please use the home page to register');
    }


    document.addEventListener('DOMContentLoaded', function() {
        loadLecture();
        checkAuthStatus();
    });
</script>
</body>
</html>
