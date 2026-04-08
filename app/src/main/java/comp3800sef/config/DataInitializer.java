package comp3800sef.config;

import comp3800sef.model.*;
import comp3800sef.repository.*;
import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class DataInitializer implements CommandLineRunner {

    private final UserRepository userRepository;
    private final LectureRepository lectureRepository;
    private final PollRepository pollRepository;
    private final PollOptionRepository pollOptionRepository;
    private final CommentRepository commentRepository;
    private final PasswordEncoder passwordEncoder;

    public DataInitializer(UserRepository userRepository,
                           LectureRepository lectureRepository,
                           PollRepository pollRepository,
                           PollOptionRepository pollOptionRepository,
                           CommentRepository commentRepository,
                           PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.lectureRepository = lectureRepository;
        this.pollRepository = pollRepository;
        this.pollOptionRepository = pollOptionRepository;
        this.commentRepository = commentRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public void run(String... args) {
        if (userRepository.count() > 0) {
            return;
        }

        User teacher1 = new User();
        teacher1.setUsername("teacher1");
        teacher1.setPassword(passwordEncoder.encode("password"));
        teacher1.setFullName("John Smith");
        teacher1.setEmail("john.smith@example.com");
        teacher1.setPhone("12345678");
        teacher1.setRole("ROLE_TEACHER");
        userRepository.save(teacher1);

        User teacher2 = new User();
        teacher2.setUsername("teacher2");
        teacher2.setPassword(passwordEncoder.encode("password"));
        teacher2.setFullName("Peter Johnson");
        teacher2.setEmail("peter.johnson@example.com");
        teacher2.setPhone("87654321");
        teacher2.setRole("ROLE_TEACHER");
        userRepository.save(teacher2);

        User student1 = new User();
        student1.setUsername("student1");
        student1.setPassword(passwordEncoder.encode("password"));
        student1.setFullName("Alice Wong");
        student1.setEmail("alice.wong@example.com");
        student1.setPhone("11112222");
        student1.setRole("ROLE_STUDENT");
        userRepository.save(student1);

        User student2 = new User();
        student2.setUsername("student2");
        student2.setPassword(passwordEncoder.encode("password"));
        student2.setFullName("Ben Chen");
        student2.setEmail("ben.chen@example.com");
        student2.setPhone("33334444");
        student2.setRole("ROLE_STUDENT");
        userRepository.save(student2);

        User student3 = new User();
        student3.setUsername("student3");
        student3.setPassword(passwordEncoder.encode("password"));
        student3.setFullName("Mike Lee");
        student3.setEmail("mike.lee@example.com");
        student3.setPhone("55556666");
        student3.setRole("ROLE_STUDENT");
        userRepository.save(student3);

        Lecture lecture1 = new Lecture();
        lecture1.setTitle("Lecture 1: Introduction to Web Development");
        lecture1.setSummary("This lecture provides a comprehensive introduction to web development, covering the fundamental concepts and technologies that power modern web applications.");
        lectureRepository.save(lecture1);

        Lecture lecture2 = new Lecture();
        lecture2.setTitle("Lecture 2: Jakarta EE Fundamentals");
        lecture2.setSummary("This lecture introduces the fundamentals of Jakarta Enterprise Edition (formerly Java EE), which is the industry standard for building enterprise-grade web applications in Java.");
        lectureRepository.save(lecture2);

        Lecture lecture3 = new Lecture();
        lecture3.setTitle("Lecture 3: Spring Framework Basics");
        lecture3.setSummary("This lecture introduces the Spring Framework, one of the most popular and widely-used frameworks for building Java applications. Learn about dependency injection, aspect-oriented programming, and the Spring MVC architecture.");
        lectureRepository.save(lecture3);

        Lecture lecture4 = new Lecture();
        lecture4.setTitle("Lecture 4: Spring Boot Development");
        lecture4.setSummary("This lecture covers Spring Boot, which simplifies Spring application development by providing sensible defaults and auto-configuration. Learn how to build production-ready applications with minimal configuration.");
        lectureRepository.save(lecture4);

        Comment c1 = new Comment();
        c1.setContent("Great introduction! Very helpful for beginners.");
        c1.setUser(student1);
        c1.setLecture(lecture1);
        commentRepository.save(c1);

        Comment c2 = new Comment();
        c2.setContent("The MVC pattern explanation was very clear. Thank you!");
        c2.setUser(student2);
        c2.setLecture(lecture2);
        commentRepository.save(c2);

        Comment c3teacher = new Comment();
        c3teacher.setContent("Thank you for the feedback! Feel free to ask any questions.");
        c3teacher.setUser(teacher1);
        c3teacher.setLecture(lecture1);
        commentRepository.save(c3teacher);

        Poll poll1 = new Poll();
        poll1.setQuestion("Which topic should be introduced in the next class?");
        poll1 = pollRepository.save(poll1);

        String[] options1 = {"Advanced Spring Cloud & Microservices", "RESTful API Design Best Practices", "Database Design & Optimization", "Frontend Frameworks (React/Vue)", "Cloud Deployment & DevOps"};
        for (String opt : options1) {
            PollOption option = new PollOption();
            option.setOptionText(opt);
            option.setPoll(poll1);
            pollOptionRepository.save(option);
        }

        Poll poll2 = new Poll();
        poll2.setQuestion("Preferred pace of the course?");
        poll2 = pollRepository.save(poll2);

        String[] options2 = {"Current pace is perfect", "Slightly faster", "Much faster", "Slightly slower", "Much slower"};
        for (String opt : options2) {
            PollOption option = new PollOption();
            option.setOptionText(opt);
            option.setPoll(poll2);
            pollOptionRepository.save(option);
        }

        Poll poll3 = new Poll();
        poll3.setQuestion("Best time for optional review sessions?");
        poll3 = pollRepository.save(poll3);

        String[] options3 = {"Wednesday 2:00 PM", "Friday 10:00 AM", "Saturday 11:00 AM", "Sunday 3:00 PM", "Recorded sessions only"};
        for (String opt : options3) {
            PollOption option = new PollOption();
            option.setOptionText(opt);
            option.setPoll(poll3);
            pollOptionRepository.save(option);
        }

        Poll poll4 = new Poll();
        poll4.setQuestion("Preferred assignment format?");
        poll4 = pollRepository.save(poll4);

        String[] options4 = {"Code projects", "Written assignments", "Group projects", "Mix of all formats", "No preference"};
        for (String opt : options4) {
            PollOption option = new PollOption();
            option.setOptionText(opt);
            option.setPoll(poll4);
            pollOptionRepository.save(option);
        }

        Poll poll5 = new Poll();
        poll5.setQuestion("Would you like more practical projects?");
        poll5 = pollRepository.save(poll5);

        String[] options5 = {"Definitely, more projects!", "Current amount is fine", "Fewer projects", "Much fewer projects", "No projects"};
        for (String opt : options5) {
            PollOption option = new PollOption();
            option.setOptionText(opt);
            option.setPoll(poll5);
            pollOptionRepository.save(option);
        }

        Comment c3 = new Comment();
        c3.setContent("I think microservices is the way to go in modern web development!");
        c3.setUser(student3);
        c3.setPoll(poll1);
        commentRepository.save(c3);

        Comment c4 = new Comment();
        c4.setContent("The current pace works well for me. I can keep up and have time to practice.");
        c4.setUser(student1);
        c4.setPoll(poll2);
        commentRepository.save(c4);
    }
}
