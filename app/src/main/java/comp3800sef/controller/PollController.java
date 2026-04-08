package comp3800sef.controller;

import comp3800sef.model.*;
import comp3800sef.repository.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.security.Principal;
import java.util.Optional;

@Controller
@RequestMapping("/polls")
public class PollController {

    private final PollRepository pollRepository;
    private final PollOptionRepository pollOptionRepository;
    private final VoteRepository voteRepository;
    private final CommentRepository commentRepository;
    private final UserRepository userRepository;

    public PollController(PollRepository pollRepository,
                          PollOptionRepository pollOptionRepository,
                          VoteRepository voteRepository,
                          CommentRepository commentRepository,
                          UserRepository userRepository) {
        this.pollRepository = pollRepository;
        this.pollOptionRepository = pollOptionRepository;
        this.voteRepository = voteRepository;
        this.commentRepository = commentRepository;
        this.userRepository = userRepository;
    }

    @GetMapping("/{id}")
    public String viewPoll(@PathVariable Long id, Model model, Principal principal) {
        Poll poll = pollRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Poll not found"));
        model.addAttribute("poll", poll);

        if (principal != null) {
            User user = userRepository.findByUsername(principal.getName())
                    .orElseThrow(() -> new IllegalArgumentException("User not found"));
            Optional<Vote> userVote = voteRepository.findByUserAndPoll(user, poll);
            userVote.ifPresent(vote -> model.addAttribute("userVoteOptionId", vote.getPollOption().getId()));
        }

        return "poll";
    }

    @GetMapping("/add")
    public String showAddForm() {
        return "admin/addPoll";
    }

    @PostMapping("/add")
    public String addPoll(@RequestParam String question,
                          @RequestParam String option1,
                          @RequestParam String option2,
                          @RequestParam String option3,
                          @RequestParam String option4,
                          @RequestParam String option5,
                          RedirectAttributes redirectAttributes) {
        Poll poll = new Poll();
        poll.setQuestion(question);
        poll = pollRepository.save(poll);

        String[] options = {option1, option2, option3, option4, option5};
        for (String optionText : options) {
            PollOption option = new PollOption();
            option.setOptionText(optionText);
            option.setPoll(poll);
            pollOptionRepository.save(option);
        }

        redirectAttributes.addFlashAttribute("success", "Poll added successfully");
        return "redirect:/";
    }

    @PostMapping("/{id}/delete")
    public String deletePoll(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        pollRepository.deleteById(id);
        redirectAttributes.addFlashAttribute("success", "Poll deleted successfully");
        return "redirect:/";
    }

    @PostMapping("/{id}/vote")
    public String vote(@PathVariable Long id,
                       @RequestParam Long optionId,
                       Principal principal,
                       RedirectAttributes redirectAttributes) {
        User user = userRepository.findByUsername(principal.getName())
                .orElseThrow(() -> new IllegalArgumentException("User not found"));
        Poll poll = pollRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Poll not found"));
        PollOption selectedOption = pollOptionRepository.findById(optionId)
                .orElseThrow(() -> new IllegalArgumentException("Option not found"));

        Optional<Vote> existingVote = voteRepository.findByUserAndPoll(user, poll);
        if (existingVote.isPresent()) {
            Vote vote = existingVote.get();
            vote.setPollOption(selectedOption);
            voteRepository.save(vote);
        } else {
            Vote vote = new Vote();
            vote.setUser(user);
            vote.setPoll(poll);
            vote.setPollOption(selectedOption);
            voteRepository.save(vote);
        }

        redirectAttributes.addFlashAttribute("success", "Vote recorded successfully");
        return "redirect:/polls/" + id;
    }

    @PostMapping("/{id}/comments/add")
    public String addComment(@PathVariable Long id,
                             @RequestParam String content,
                             Principal principal,
                             RedirectAttributes redirectAttributes) {
        User user = userRepository.findByUsername(principal.getName())
                .orElseThrow(() -> new IllegalArgumentException("User not found"));
        Poll poll = pollRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Poll not found"));

        Comment comment = new Comment();
        comment.setContent(content);
        comment.setUser(user);
        comment.setPoll(poll);
        commentRepository.save(comment);

        redirectAttributes.addFlashAttribute("success", "Comment added successfully");
        return "redirect:/polls/" + id;
    }

    @PostMapping("/{pollId}/comments/{commentId}/delete")
    public String deleteComment(@PathVariable Long pollId,
                                @PathVariable Long commentId,
                                RedirectAttributes redirectAttributes) {
        commentRepository.deleteById(commentId);
        redirectAttributes.addFlashAttribute("success", "Comment deleted successfully");
        return "redirect:/polls/" + pollId;
    }
}
