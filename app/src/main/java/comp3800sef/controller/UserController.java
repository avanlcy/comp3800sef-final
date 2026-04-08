package comp3800sef.controller;

import comp3800sef.model.User;
import comp3800sef.repository.CommentRepository;
import comp3800sef.repository.UserRepository;
import comp3800sef.repository.VoteRepository;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.security.Principal;

@Controller
public class UserController {

    private final UserRepository userRepository;
    private final VoteRepository voteRepository;
    private final CommentRepository commentRepository;
    private final PasswordEncoder passwordEncoder;

    public UserController(UserRepository userRepository,
                          VoteRepository voteRepository,
                          CommentRepository commentRepository,
                          PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.voteRepository = voteRepository;
        this.commentRepository = commentRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/profile")
    public String showProfile(Model model, Principal principal) {
        User user = userRepository.findByUsername(principal.getName())
                .orElseThrow(() -> new IllegalArgumentException("User not found"));
        model.addAttribute("user", user);
        return "profile";
    }

    @PostMapping("/profile/update")
    public String updateProfile(@RequestParam(required = false) String password,
                                @RequestParam String fullName,
                                @RequestParam String email,
                                @RequestParam String phone,
                                Principal principal,
                                RedirectAttributes redirectAttributes) {
        User user = userRepository.findByUsername(principal.getName())
                .orElseThrow(() -> new IllegalArgumentException("User not found"));

        if (password != null && !password.isEmpty()) {
            user.setPassword(passwordEncoder.encode(password));
        }
        user.setFullName(fullName);
        user.setEmail(email);
        user.setPhone(phone);
        userRepository.save(user);

        redirectAttributes.addFlashAttribute("success", "Profile updated successfully");
        return "redirect:/profile";
    }

    @GetMapping("/admin/users")
    public String listUsers(Model model) {
        model.addAttribute("users", userRepository.findAll());
        return "admin/users";
    }

    @GetMapping("/admin/users/add")
    public String showAddUserForm() {
        return "admin/addUser";
    }

    @PostMapping("/admin/users/add")
    public String addUser(@RequestParam String username,
                          @RequestParam String password,
                          @RequestParam String fullName,
                          @RequestParam String email,
                          @RequestParam String phone,
                          @RequestParam String role,
                          RedirectAttributes redirectAttributes) {
        if (userRepository.existsByUsername(username)) {
            redirectAttributes.addFlashAttribute("error", "Username already exists");
            return "redirect:/admin/users/add";
        }

        User user = new User();
        user.setUsername(username);
        user.setPassword(passwordEncoder.encode(password));
        user.setFullName(fullName);
        user.setEmail(email);
        user.setPhone(phone);
        user.setRole("ROLE_" + role.toUpperCase());
        userRepository.save(user);

        redirectAttributes.addFlashAttribute("success", "User added successfully");
        return "redirect:/admin/users";
    }

    @GetMapping("/admin/users/{id}/edit")
    public String showEditUserForm(@PathVariable Long id, Model model) {
        User user = userRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("User not found"));
        model.addAttribute("editUser", user);
        return "admin/editUser";
    }

    @PostMapping("/admin/users/{id}/edit")
    public String editUser(@PathVariable Long id,
                           @RequestParam(required = false) String password,
                           @RequestParam String fullName,
                           @RequestParam String email,
                           @RequestParam String phone,
                           @RequestParam String role,
                           RedirectAttributes redirectAttributes) {
        User user = userRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("User not found"));

        if (password != null && !password.isEmpty()) {
            user.setPassword(passwordEncoder.encode(password));
        }
        user.setFullName(fullName);
        user.setEmail(email);
        user.setPhone(phone);
        user.setRole("ROLE_" + role.toUpperCase());
        userRepository.save(user);

        redirectAttributes.addFlashAttribute("success", "User updated successfully");
        return "redirect:/admin/users";
    }

    @PostMapping("/admin/users/{id}/delete")
    @Transactional
    public String deleteUser(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        User user = userRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("User not found"));
        voteRepository.deleteByUser(user);
        commentRepository.deleteByUser(user);
        userRepository.delete(user);

        redirectAttributes.addFlashAttribute("success", "User deleted successfully");
        return "redirect:/admin/users";
    }
}
