package comp3800sef.config;

import org.springframework.stereotype.Component;

import java.util.*;

@Component
public class DataInitializer {

    public Map<Integer, Map<String, Object>> getLectureData() {
        Map<Integer, Map<String, Object>> lectures = new LinkedHashMap<>();
        lectures.put(1, createLecture(
            "Lecture 1: Introduction to Web Development", "#1", "Week 1", "90 minutes", "Beginner", "Feb 3, 2026",
            List.of(
                Map.of("icon", "\uD83D\uDCC4", "name", "Lecture_1_Introduction_to_Web_Development.pdf", "size", "1.8 MB \u2022 PDF"),
                Map.of("icon", "\uD83C\uDFA5", "name", "Lecture_1_Recording.mp4", "size", "142 MB \u2022 Video"),
                Map.of("icon", "\uD83D\uDCBE", "name", "Code_Examples.zip", "size", "0.9 MB \u2022 ZIP")
            ),
            "<h5>Overview</h5>"
                + "<p>This lecture provides a comprehensive introduction to web development, covering the fundamental concepts and technologies that power modern web applications.</p>"
                + "<h5 class=\"mt-4\">Key Topics Covered:</h5>"
                + "<ul>"
                + "<li><strong>Web Basics:</strong> Understanding HTTP, URLs, and the client-server model</li>"
                + "<li><strong>HTML Fundamentals:</strong> Structure and semantics of web pages</li>"
                + "<li><strong>CSS Styling:</strong> Visual design and responsive layouts</li>"
                + "<li><strong>JavaScript Basics:</strong> Introduction to client-side scripting</li>"
                + "<li><strong>Web Browsers:</strong> How browsers render and execute web pages</li>"
                + "<li><strong>Development Tools:</strong> Setting up your development environment</li>"
                + "</ul>"
                + "<h5 class=\"mt-4\">Learning Outcomes:</h5>"
                + "<p>After completing this lecture, you should be able to:</p>"
                + "<ul>"
                + "<li>Understand the fundamentals of web technologies</li>"
                + "<li>Create basic HTML structures</li>"
                + "<li>Style web pages with CSS</li>"
                + "<li>Write simple JavaScript code</li>"
                + "<li>Understand client-server communication</li>"
                + "</ul>"
                + "<h5 class=\"mt-4\">Recommended Reading:</h5>"
                + "<ul>"
                + "<li>MDN Web Docs: <a href=\"#\">https://developer.mozilla.org</a></li>"
                + "<li>HTML Standard Specification</li>"
                + "<li>CSS Flexbox and Grid Guide</li>"
                + "</ul>",
            List.of(
                Map.of("author", "\uD83D\uDC64 Alice Brown (Student)", "date", "Feb 5, 2026 at 1:15 PM", "text", "Great starting point for web development! The examples were very clear and easy to follow."),
                Map.of("author", "\uD83D\uDC68\u200D\uD83C\uDFEB Dr. John Smith (Instructor)", "date", "Feb 6, 2026 at 9:30 AM", "text", "Thank you, Alice! I'm glad you found the content helpful. Feel free to ask if you have any questions.")
            )
        ));

        lectures.put(2, createLecture(
            "Lecture 2: Jakarta EE Fundamentals", "#2", "Week 2", "90 minutes", "Intermediate", "Feb 10, 2026",
            List.of(
                Map.of("icon", "\uD83D\uDCC4", "name", "Lecture_2_Jakarta_EE_Fundamentals.pdf", "size", "2.4 MB \u2022 PDF"),
                Map.of("icon", "\uD83C\uDFA5", "name", "Lecture_2_Recording.mp4", "size", "156 MB \u2022 Video"),
                Map.of("icon", "\uD83D\uDCBE", "name", "Code_Examples.zip", "size", "1.2 MB \u2022 ZIP")
            ),
            "<h5>Overview</h5>"
                + "<p>This lecture introduces the fundamentals of Jakarta Enterprise Edition (formerly Java EE), which is the industry standard for building enterprise-grade web applications in Java.</p>"
                + "<h5 class=\"mt-4\">Key Topics Covered:</h5>"
                + "<ul>"
                + "<li><strong>Jakarta EE Architecture:</strong> Understanding the multi-tier architecture and components</li>"
                + "<li><strong>Servlets:</strong> Building HTTP request handlers and understanding the servlet lifecycle</li>"
                + "<li><strong>JSP (JavaServer Pages):</strong> Creating dynamic web pages with server-side processing</li>"
                + "<li><strong>Expression Language (EL):</strong> Simplifying data access and method invocation in JSP</li>"
                + "<li><strong>JSTL (JSP Standard Tag Library):</strong> Reusable tag components for common operations</li>"
                + "<li><strong>Web Containers:</strong> How application servers manage servlet and JSP execution</li>"
                + "</ul>"
                + "<h5 class=\"mt-4\">Learning Outcomes:</h5>"
                + "<p>After completing this lecture, you should be able to:</p>"
                + "<ul>"
                + "<li>Understand the structure and components of Jakarta EE</li>"
                + "<li>Create and deploy servlets to handle HTTP requests</li>"
                + "<li>Develop JSP pages with dynamic content generation</li>"
                + "<li>Use EL and JSTL to simplify JSP development</li>"
                + "<li>Understand the lifecycle of servlets and JSP pages</li>"
                + "<li>Configure web applications using web.xml</li>"
                + "</ul>"
                + "<h5 class=\"mt-4\">Recommended Reading:</h5>"
                + "<ul>"
                + "<li>Jakarta EE Official Documentation: <a href=\"#\">https://jakarta.ee</a></li>"
                + "<li>Servlet Specification (Chapter 1-3)</li>"
                + "<li>JSP and JSTL Best Practices Guide</li>"
                + "</ul>",
            List.of(
                Map.of("author", "\uD83D\uDC64 John Doe (Student)", "date", "Feb 13, 2026 at 2:30 PM", "text", "Great explanation of servlets! The examples were really helpful. Could you provide more details on session management in the next lecture?"),
                Map.of("author", "\uD83D\uDC68\u200D\uD83C\uDFEB Dr. Jane Smith (Instructor)", "date", "Feb 14, 2026 at 10:15 AM", "text", "Great question, John! Session management will be covered in the next lecture along with HTTP state management techniques.")
            )
        ));

        lectures.put(3, createLecture(
            "Lecture 3: Spring Framework Basics", "#3", "Week 3", "120 minutes", "Intermediate", "Feb 17, 2026",
            List.of(
                Map.of("icon", "\uD83D\uDCC4", "name", "Lecture_3_Spring_Framework_Basics.pdf", "size", "2.8 MB \u2022 PDF"),
                Map.of("icon", "\uD83C\uDFA5", "name", "Lecture_3_Recording.mp4", "size", "165 MB \u2022 Video"),
                Map.of("icon", "\uD83D\uDCBE", "name", "Spring_Project_Template.zip", "size", "2.5 MB \u2022 ZIP")
            ),
            "<h5>Overview</h5>"
                + "<p>This lecture introduces the Spring Framework, one of the most popular and widely-used frameworks for building Java applications. Learn about dependency injection, aspect-oriented programming, and the Spring MVC architecture.</p>"
                + "<h5 class=\"mt-4\">Key Topics Covered:</h5>"
                + "<ul>"
                + "<li><strong>Spring Framework Overview:</strong> Understanding the core concepts and architecture</li>"
                + "<li><strong>Dependency Injection:</strong> IoC containers and bean management</li>"
                + "<li><strong>Spring MVC:</strong> Building web applications with Model-View-Controller pattern</li>"
                + "<li><strong>Aspect-Oriented Programming:</strong> Cross-cutting concerns and annotations</li>"
                + "<li><strong>Data Access:</strong> Working with databases using Spring Data</li>"
                + "<li><strong>Configuration:</strong> Java-based and XML-based configuration</li>"
                + "</ul>"
                + "<h5 class=\"mt-4\">Learning Outcomes:</h5>"
                + "<p>After completing this lecture, you should be able to:</p>"
                + "<ul>"
                + "<li>Understand Spring Framework concepts and architecture</li>"
                + "<li>Implement dependency injection in applications</li>"
                + "<li>Build web applications using Spring MVC</li>"
                + "<li>Work with aspect-oriented programming</li>"
                + "<li>Access and manipulate database data</li>"
                + "<li>Configure Spring applications</li>"
                + "</ul>"
                + "<h5 class=\"mt-4\">Recommended Reading:</h5>"
                + "<ul>"
                + "<li>Spring Framework Documentation: <a href=\"#\">https://spring.io</a></li>"
                + "<li>Spring MVC Reference Guide</li>"
                + "<li>Dependency Injection Best Practices</li>"
                + "</ul>",
            List.of(
                Map.of("author", "\uD83D\uDC64 Sarah Johnson (Student)", "date", "Feb 22, 2026 at 3:00 PM", "text", "The dependency injection explanation was very clear. Looking forward to the Spring Boot lecture!"),
                Map.of("author", "\uD83D\uDC64 Mike Chen (Student)", "date", "Feb 20, 2026 at 10:45 AM", "text", "I found the MVC pattern explanation helpful. Can we get more practice problems on this topic?")
            )
        ));

        lectures.put(4, createLecture(
            "Lecture 4: Spring Boot Development", "#4", "Week 4", "120 minutes", "Intermediate", "Feb 24, 2026",
            List.of(
                Map.of("icon", "\uD83D\uDCC4", "name", "Lecture_4_Spring_Boot_Development.pdf", "size", "3.1 MB \u2022 PDF"),
                Map.of("icon", "\uD83C\uDFA5", "name", "Lecture_4_Recording.mp4", "size", "172 MB \u2022 Video"),
                Map.of("icon", "\uD83D\uDCBE", "name", "Spring_Boot_Project_Examples.zip", "size", "3.8 MB \u2022 ZIP")
            ),
            "<h5>Overview</h5>"
                + "<p>This lecture covers Spring Boot, which simplifies Spring application development by providing sensible defaults and auto-configuration. Learn how to build production-ready applications with minimal configuration.</p>"
                + "<h5 class=\"mt-4\">Key Topics Covered:</h5>"
                + "<ul>"
                + "<li><strong>Spring Boot Basics:</strong> Understanding auto-configuration and starters</li>"
                + "<li><strong>Embedded Servers:</strong> Running applications without external servers</li>"
                + "<li><strong>RESTful APIs:</strong> Building REST endpoints with Spring Boot</li>"
                + "<li><strong>Database Integration:</strong> Spring Data JPA with Spring Boot</li>"
                + "<li><strong>Configuration Management:</strong> application.properties and profiles</li>"
                + "<li><strong>Testing:</strong> Unit and integration testing in Spring Boot</li>"
                + "<li><strong>Deployment:</strong> Packaging and deploying Spring Boot applications</li>"
                + "</ul>"
                + "<h5 class=\"mt-4\">Learning Outcomes:</h5>"
                + "<p>After completing this lecture, you should be able to:</p>"
                + "<ul>"
                + "<li>Set up and configure Spring Boot applications</li>"
                + "<li>Build RESTful web services</li>"
                + "<li>Integrate databases with Spring Data JPA</li>"
                + "<li>Implement application configuration strategies</li>"
                + "<li>Write unit and integration tests</li>"
                + "<li>Deploy Spring Boot applications to production</li>"
                + "</ul>"
                + "<h5 class=\"mt-4\">Recommended Reading:</h5>"
                + "<ul>"
                + "<li>Spring Boot Official Guide: <a href=\"#\">https://spring.io/projects/spring-boot</a></li>"
                + "<li>Building REST APIs with Spring Boot</li>"
                + "<li>Spring Boot Testing Guide</li>"
                + "</ul>",
            List.of(
                Map.of("author", "\uD83D\uDC64 Emma Wilson (Student)", "date", "Feb 26, 2026 at 4:20 PM", "text", "Spring Boot makes development so much faster! The embedded server feature is brilliant."),
                Map.of("author", "\uD83D\uDC68\u200D\uD83C\uDFEB Dr. John Smith (Instructor)", "date", "Feb 27, 2026 at 11:00 AM", "text", "Exactly! Spring Boot is perfect for modern microservices development. Great observation, Emma!"),
                Map.of("author", "\uD83D\uDC64 David Lee (Student)", "date", "Feb 27, 2026 at 2:15 PM", "text", "Can we have more examples on deploying to cloud platforms like AWS or Azure?")
            )
        ));

        return lectures;
    }

    public Map<Integer, Map<String, Object>> getPollData() {
        Map<Integer, Map<String, Object>> polls = new LinkedHashMap<>();

        polls.put(1, createPoll(
            "Which topic should be introduced in the next class?", 145, 87, "Mar 15, 2026", "Active",
            List.of(
                Map.of("label", "Advanced Spring Cloud & Microservices", "votes", 51, "percentage", 35),
                Map.of("label", "RESTful API Design Best Practices", "votes", 40, "percentage", 28),
                Map.of("label", "Database Design & Optimization", "votes", 32, "percentage", 22),
                Map.of("label", "Frontend Frameworks (React/Vue)", "votes", 14, "percentage", 10),
                Map.of("label", "Cloud Deployment & DevOps", "votes", 8, "percentage", 5)
            ),
            List.of(
                Map.of("author", "\uD83D\uDC64 Alex Thompson (Student)", "date", "Feb 18, 2026 at 1:15 PM", "text", "I think microservices is the way to go in modern web development. Looking forward to this topic!"),
                Map.of("author", "\uD83D\uDC64 Emma Wilson (Student)", "date", "Feb 18, 2026 at 3:30 PM", "text", "Database optimization is crucial for our project. Hope we can dive deep into indexing and query performance."),
                Map.of("author", "\uD83D\uDC68\u200D\uD83C\uDFEB Dr. John Smith (Instructor)", "date", "Feb 19, 2026 at 9:00 AM", "text", "Great discussion everyone! Based on the poll results, it looks like microservices will be the next topic. Make sure to review the prerequisite materials before the next class.")
            )
        ));

        polls.put(2, createPoll(
            "Preferred pace of the course?", 98, 64, "Mar 20, 2026", "Active",
            List.of(
                Map.of("label", "Current pace is perfect", "votes", 42, "percentage", 43),
                Map.of("label", "Slightly faster", "votes", 28, "percentage", 29),
                Map.of("label", "Much faster", "votes", 10, "percentage", 10),
                Map.of("label", "Slightly slower", "votes", 14, "percentage", 14),
                Map.of("label", "Much slower", "votes", 4, "percentage", 4)
            ),
            List.of(
                Map.of("author", "\uD83D\uDC64 Sarah Johnson (Student)", "date", "Feb 20, 2026 at 2:00 PM", "text", "The current pace works well for me. I can keep up and have time to practice."),
                Map.of("author", "\uD83D\uDC64 Mike Chen (Student)", "date", "Feb 20, 2026 at 4:30 PM", "text", "I'd prefer a slightly faster pace. I feel like I'm getting bored with the depth of coverage."),
                Map.of("author", "\uD83D\uDC68\u200D\uD83C\uDFEB Dr. Jane Smith (Instructor)", "date", "Feb 21, 2026 at 10:00 AM", "text", "Thank you for your feedback! We'll try to balance depth and pace moving forward.")
            )
        ));

        polls.put(3, createPoll(
            "Best time for optional review sessions?", 67, 52, "Mar 22, 2026", "Active",
            List.of(
                Map.of("label", "Wednesday 2:00 PM", "votes", 28, "percentage", 42),
                Map.of("label", "Friday 10:00 AM", "votes", 18, "percentage", 27),
                Map.of("label", "Saturday 11:00 AM", "votes", 14, "percentage", 21),
                Map.of("label", "Sunday 3:00 PM", "votes", 5, "percentage", 7),
                Map.of("label", "Recorded sessions only", "votes", 2, "percentage", 3)
            ),
            List.of(
                Map.of("author", "\uD83D\uDC64 Lisa Park (Student)", "date", "Feb 21, 2026 at 1:45 PM", "text", "Wednesday afternoon works best for my schedule. Thank you for offering review sessions!"),
                Map.of("author", "\uD83D\uDC64 David Lee (Student)", "date", "Feb 21, 2026 at 5:15 PM", "text", "I prefer Friday mornings. It helps me prepare for the upcoming week."),
                Map.of("author", "\uD83D\uDC68\u200D\uD83C\uDFEB Dr. John Smith (Instructor)", "date", "Feb 22, 2026 at 11:30 AM", "text", "Wednesday 2:00 PM seems to be the winner! We'll schedule the review sessions then."),
                Map.of("author", "\uD83D\uDC64 Rachel Adams (Student)", "date", "Feb 22, 2026 at 2:20 PM", "text", "Great! Will these sessions be recorded for those who can't attend?")
            )
        ));

        polls.put(4, createPoll(
            "Preferred assignment format?", 112, 73, "Mar 25, 2026", "Active",
            List.of(
                Map.of("label", "Code projects", "votes", 48, "percentage", 43),
                Map.of("label", "Written assignments", "votes", 20, "percentage", 18),
                Map.of("label", "Group projects", "votes", 25, "percentage", 22),
                Map.of("label", "Mix of all formats", "votes", 15, "percentage", 13),
                Map.of("label", "No preference", "votes", 4, "percentage", 4)
            ),
            List.of(
                Map.of("author", "\uD83D\uDC64 James Wilson (Student)", "date", "Feb 22, 2026 at 3:00 PM", "text", "Code projects are the best way to learn. I feel more confident when I can apply concepts directly."),
                Map.of("author", "\uD83D\uDC64 Nina Patel (Student)", "date", "Feb 22, 2026 at 6:30 PM", "text", "I'd love to do more group projects to improve collaboration skills."),
                Map.of("author", "\uD83D\uDC68\u200D\uD83C\uDFEB Dr. Jane Smith (Instructor)", "date", "Feb 23, 2026 at 9:00 AM", "text", "Code projects are indeed effective! We'll continue with hands-on assignments.")
            )
        ));

        polls.put(5, createPoll(
            "Would you like more practical projects?", 156, 94, "Mar 28, 2026", "Active",
            List.of(
                Map.of("label", "Definitely, more projects!", "votes", 118, "percentage", 76),
                Map.of("label", "Current amount is fine", "votes", 28, "percentage", 18),
                Map.of("label", "Fewer projects", "votes", 6, "percentage", 4),
                Map.of("label", "Much fewer projects", "votes", 3, "percentage", 2),
                Map.of("label", "No projects", "votes", 1, "percentage", 1)
            ),
            List.of(
                Map.of("author", "\uD83D\uDC64 Christopher Lee (Student)", "date", "Feb 23, 2026 at 1:30 PM", "text", "Yes! More projects would really help solidify the concepts. Theory is good, but practice is essential."),
                Map.of("author", "\uD83D\uDC64 Victoria Brown (Student)", "date", "Feb 23, 2026 at 4:00 PM", "text", "Practical projects make learning much more engaging and enjoyable."),
                Map.of("author", "\uD83D\uDC68\u200D\uD83C\uDFEB Dr. John Smith (Instructor)", "date", "Feb 24, 2026 at 10:00 AM", "text", "Excellent feedback! We're planning to introduce more capstone projects starting next semester. Stay tuned!"),
                Map.of("author", "\uD83D\uDC64 Marcus Johnson (Student)", "date", "Feb 24, 2026 at 2:45 PM", "text", "Great! Can the projects be portfolio-worthy? I'd like to showcase them to potential employers."),
                Map.of("author", "\uD83D\uDC68\u200D\uD83C\uDFEB Dr. John Smith (Instructor)", "date", "Feb 24, 2026 at 3:30 PM", "text", "That's a great idea, Marcus! We'll definitely focus on creating portfolio-quality projects.")
            )
        ));

        return polls;
    }

    public List<Map<String, String>> getLectureListData() {
        List<Map<String, String>> lectures = new ArrayList<>();
        lectures.add(Map.of("id", "1", "title", "Lecture 1: Introduction to Web Development", "preview", "Overview of web technologies, client-server architecture, and the evolution of web frameworks."));
        lectures.add(Map.of("id", "2", "title", "Lecture 2: Jakarta EE Fundamentals", "preview", "Understanding Jakarta EE components, servlet technology, JSP pages, and enterprise applications."));
        lectures.add(Map.of("id", "3", "title", "Lecture 3: Spring Framework Basics", "preview", "Introduction to Spring Framework, dependency injection, and the Spring MVC architecture."));
        lectures.add(Map.of("id", "4", "title", "Lecture 4: Spring Boot Development", "preview", "Building applications with Spring Boot, auto-configuration, and embedded servers."));
        return lectures;
    }

    public List<Map<String, String>> getPollListData() {
        List<Map<String, String>> polls = new ArrayList<>();
        polls.add(Map.of("id", "1", "title", "Which topic should be introduced in the next class?", "votes", "145", "deadline", "Mar 15"));
        polls.add(Map.of("id", "2", "title", "Preferred pace of the course?", "votes", "98", "deadline", "Mar 20"));
        polls.add(Map.of("id", "3", "title", "Best time for optional review sessions?", "votes", "67", "deadline", "Mar 22"));
        polls.add(Map.of("id", "4", "title", "Preferred assignment format?", "votes", "112", "deadline", "Mar 25"));
        polls.add(Map.of("id", "5", "title", "Would you like more practical projects?", "votes", "156", "deadline", "Mar 28"));
        return polls;
    }

    private Map<String, Object> createLecture(String title, String number, String week, String duration,
                                               String difficulty, String date,
                                               List<Map<String, String>> notes, String summary,
                                               List<Map<String, String>> comments) {
        Map<String, Object> lecture = new LinkedHashMap<>();
        lecture.put("title", title);
        lecture.put("number", number);
        lecture.put("week", week);
        lecture.put("duration", duration);
        lecture.put("difficulty", difficulty);
        lecture.put("date", date);
        lecture.put("notes", notes);
        lecture.put("summary", summary);
        lecture.put("comments", comments);
        return lecture;
    }

    private Map<String, Object> createPoll(String title, int totalVotes, int participants, String closeDate,
                                            String status, List<Map<String, Object>> options,
                                            List<Map<String, String>> comments) {
        Map<String, Object> poll = new LinkedHashMap<>();
        poll.put("title", title);
        poll.put("totalVotes", totalVotes);
        poll.put("participants", participants);
        poll.put("closeDate", closeDate);
        poll.put("status", status);
        poll.put("options", options);
        poll.put("comments", comments);
        return poll;
    }
}
