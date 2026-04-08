package comp3800sef.repository;

import comp3800sef.model.Comment;
import comp3800sef.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CommentRepository extends JpaRepository<Comment, Long> {
    void deleteByUser(User user);
}
