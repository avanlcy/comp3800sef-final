package comp3800sef.repository;

import comp3800sef.model.Poll;
import comp3800sef.model.User;
import comp3800sef.model.Vote;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface VoteRepository extends JpaRepository<Vote, Long> {
    Optional<Vote> findByUserAndPoll(User user, Poll poll);
    void deleteByUser(User user);
}
