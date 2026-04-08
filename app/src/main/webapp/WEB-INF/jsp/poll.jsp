<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Community Poll - LMS</title>
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
        .poll-header {
            background: linear-gradient(135deg, #f39c12 0%, #e67e22 100%);
            color: white;
            padding: 30px 0;
            margin-bottom: 30px;
        }
        .poll-title {
            font-size: 2rem;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .poll-meta {
            font-size: 0.95rem;
            opacity: 0.9;
        }
        .section-title {
            font-size: 1.5rem;
            font-weight: bold;
            color: #2c3e50;
            margin-top: 30px;
            margin-bottom: 20px;
            border-bottom: 2px solid #f39c12;
            padding-bottom: 10px;
        }
        .poll-options {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
            border-left: 4px solid #f39c12;
        }
        .poll-option {
            margin-bottom: 20px;
            padding: 15px;
            background-color: #f8f9fa;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s, box-shadow 0.3s;
        }
        .poll-option:hover {
            background-color: #e9ecef;
        }
        .poll-option.selected {
            background-color: #fff3cd;
            border: 2px solid #f39c12;
        }
        .poll-option input[type="radio"] {
            margin-right: 10px;
            cursor: pointer;
        }
        .option-label {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
            font-weight: 500;
            color: #2c3e50;
        }
        .option-stats {
            display: flex;
            align-items: center;
            margin-left: 28px;
        }
        .progress-bar-custom {
            background-color: #f39c12;
            height: 24px;
            border-radius: 4px;
            display: flex;
            align-items: center;
            justify-content: flex-end;
            padding-right: 10px;
            color: white;
            font-size: 0.85rem;
            font-weight: bold;
            min-width: 50px;
        }
        .vote-count {
            margin-left: 10px;
            color: #666;
            font-size: 0.9rem;
            min-width: 80px;
        }
        .poll-actions {
            margin-top: 20px;
            display: flex;
            gap: 10px;
        }
        .btn-vote {
            background-color: #f39c12;
            border-color: #f39c12;
            color: white;
            padding: 10px 30px;
            font-weight: bold;
        }
        .btn-vote:hover {
            background-color: #e67e22;
            border-color: #e67e22;
            color: white;
        }
        .btn-edit {
            background-color: #3498db;
            border-color: #3498db;
            color: white;
            padding: 10px 30px;
            font-weight: bold;
        }
        .btn-edit:hover {
            background-color: #2980b9;
            border-color: #2980b9;
            color: white;
        }
        .poll-info-box {
            background-color: #ecf0f1;
            padding: 15px;
            border-radius: 4px;
            margin-bottom: 20px;
            border-left: 4px solid #3498db;
        }
        .poll-info-box.voted {
            background-color: #d5f4e6;
            border-left-color: #27ae60;
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
            border-color: #f39c12;
            box-shadow: 0 0 0 0.2rem rgba(243, 156, 18, 0.25);
        }
        .btn-primary-custom {
            background-color: #f39c12;
            border-color: #f39c12;
            color: white;
        }
        .btn-primary-custom:hover {
            background-color: #e67e22;
            border-color: #e67e22;
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
                <li class="breadcrumb-item active">Community Poll</li>
            </ol>
        </nav>
    </div>
</div>


<div class="poll-header">
    <div class="container-lg">
        <div class="poll-title" id="pollTitle">&#128499;&#65039; Community Poll</div>
        <div class="poll-meta" id="pollMeta">
            Active until Mar 15, 2026 | 145 Total Votes | 87 Participants
        </div>
    </div>
</div>

<div class="container-lg">
    <div class="row">
        <div class="col-lg-12">
            <div class="section-title">Poll Question</div>
            <div class="poll-info-box" id="pollInfoBox">
                <h5 class="mb-3" id="pollQuestion">Which topic should be introduced in the next class?</h5>
                <p class="mb-0" id="pollStatus">You haven't voted yet. Please select an option below.</p>
            </div>

            <!-- Authentication Alert (for unregistered users) -->
            <div class="auth-alert" id="authAlert" style="display: none;">
                <strong>&#9888;&#65039; Please Log In</strong><br>
                You need to be logged in to vote on polls. <a href="javascript:void(0);" onclick="alert('Please login from the home page')">Click here to login</a> or <a href="javascript:void(0);" onclick="alert('Please register from the home page')">register</a> if you don't have an account.
            </div>

            <div class="section-title">Voting Options</div>
            <form id="pollForm">
                <div class="poll-options" id="pollOptions">
                </div>

                <div class="poll-actions" id="pollActions">
                    <button type="submit" class="btn btn-vote" id="submitVoteBtn">Submit Vote</button>
                    <button type="button" class="btn btn-edit" id="editVoteBtn" style="display: none;">Edit Vote</button>
                </div>
            </form>

            <div>
                <div class="section-title">&#128172; Discussion</div>

                <!-- Comment Form (visible only to registered users) -->
                <div class="comment-form" id="commentForm">
                    <div class="form-group mb-3">
                        <label for="commentText" class="form-label"><strong>Join the Discussion</strong></label>
                        <textarea class="form-control" id="commentText" rows="4" placeholder="Share your thoughts about this poll..."></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary-custom">Post Comment</button>
                </div>

                <!-- Existing Comments -->
                <div class="comments-section" id="commentsSection">
                    <!-- Comments loaded dynamically -->
                </div>
            </div>

            <!-- Poll Stat -->
            <div class="row mt-5 mb-5">
                <div class="col-md-6">
                    <div class="card border-0 shadow-sm">
                        <div class="card-header bg-light">
                            <strong>Poll Statistics</strong>
                        </div>
                        <div class="card-body">
                            <p class="mb-2">
                                <strong>Total Votes:</strong> <span class="badge bg-warning text-dark" id="totalVotes">145</span>
                            </p>
                            <p class="mb-2">
                                <strong>Participants:</strong> <span class="badge bg-info" id="participants">87</span>
                            </p>
                            <p class="mb-2">
                                <strong>Status:</strong> <span class="badge bg-success" id="pollStatus2">Active</span>
                            </p>
                            <p class="mb-0">
                                <strong>Closes:</strong> <span id="closeDate">Mar 15, 2026</span>
                            </p>
                        </div>
                    </div>
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
    const pollData = ${pollDataJson};

    function loadPoll() {
        const params = new URLSearchParams(window.location.search);
        const pollId = params.get('id') || 1;
        const poll = pollData[pollId];

        if (!poll) {
            window.location.href = '/';
            return;
        }

        document.getElementById('pollQuestion').textContent = poll.title;
        document.getElementById('pollMeta').textContent = 'Active until ' + poll.closeDate + ' | ' + poll.totalVotes + ' Total Votes | ' + poll.participants + ' Participants';
        document.getElementById('totalVotes').textContent = poll.totalVotes;
        document.getElementById('participants').textContent = poll.participants;
        document.getElementById('closeDate').textContent = poll.closeDate;
        document.getElementById('pollStatus2').textContent = poll.status;

        var optionsHTML = '';
        poll.options.forEach(function(option, index) {
            optionsHTML += '<div class="poll-option" onclick="selectOption(' + (index + 1) + ')">' +
                '<div class="option-label">' +
                    '<input type="radio" id="option' + (index + 1) + '" name="poll_option" value="' + (index + 1) + '">' +
                    '<label for="option' + (index + 1) + '" class="mb-0">' + option.label + '</label>' +
                '</div>' +
                '<div class="option-stats">' +
                    '<div class="progress-bar-custom" style="width: ' + option.percentage + '%;">' + option.percentage + '%</div>' +
                    '<span class="vote-count">' + option.votes + ' votes</span>' +
                '</div>' +
            '</div>';
        });
        document.getElementById('pollOptions').innerHTML = optionsHTML;

        var commentsHTML = '';
        poll.comments.forEach(function(comment) {
            commentsHTML += '<div class="comment-item">' +
                '<div class="comment-author">' + comment.author + '</div>' +
                '<div class="comment-date">' + comment.date + '</div>' +
                '<div class="comment-text">' + comment.text + '</div>' +
            '</div>';
        });
        document.getElementById('commentsSection').innerHTML = commentsHTML;
    }

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

    function checkAuthStatus() {
        var isLoggedIn = localStorage.getItem('currentUser');
        if (!isLoggedIn) {
            document.getElementById('pollForm').style.display = 'none';
            document.getElementById('commentForm').style.display = 'none';
            document.getElementById('authAlert').style.display = 'block';
        }
    }

    document.getElementById('pollForm').addEventListener('submit', function(e) {
        e.preventDefault();
        var selectedOption = document.querySelector('input[name="poll_option"]:checked');
        if (selectedOption) {
            var optionText = document.querySelector('label[for="option' + selectedOption.value + '"]').textContent;
            alert('Your vote for "' + optionText + '" has been recorded!');
            document.getElementById('pollInfoBox').classList.add('voted');
            document.getElementById('pollStatus').textContent = '\u2713 You voted for: ' + optionText;
            document.getElementById('submitVoteBtn').style.display = 'none';
            document.getElementById('editVoteBtn').style.display = 'inline-block';
        }
    });

    document.getElementById('editVoteBtn').addEventListener('click', function() {
        document.getElementById('submitVoteBtn').style.display = 'inline-block';
        document.getElementById('editVoteBtn').style.display = 'none';
        document.getElementById('pollInfoBox').classList.remove('voted');
        document.getElementById('pollStatus').textContent = 'You haven\'t voted yet. Please select an option below.';
    });

    document.getElementById('commentForm').addEventListener('submit', function(e) {
        e.preventDefault();
        var commentText = document.getElementById('commentText').value;
        if (commentText.trim()) {
            alert('Your comment has been posted!');
            document.getElementById('commentText').value = '';
        }
    });

    document.addEventListener('DOMContentLoaded', function() {
        loadPoll();
        checkAuthStatus();
    });
</script>
</body>
</html>
