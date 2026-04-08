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
            &#128197; Published on Nov 1, 2026 | &#9201;&#65039; Duration: 90 minutes | &#128205; Week 1
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
        <p class="text-muted">&copy; 2026 Learning Management System. All rights reserved.</p>
    </footer>
</div>

<script src="/js/bootstrap.bundle.min.js"></script>
<script>
    const lectureData = ${lectureDataJson};

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
