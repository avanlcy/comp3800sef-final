package comp3800sef.controller;

import comp3800sef.model.*;
import comp3800sef.repository.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.security.Principal;

@Controller
@RequestMapping("/lectures")
public class LectureController {

    private final LectureRepository lectureRepository;
    private final CourseMaterialRepository courseMaterialRepository;
    private final CommentRepository commentRepository;
    private final UserRepository userRepository;

    public LectureController(LectureRepository lectureRepository,
                             CourseMaterialRepository courseMaterialRepository,
                             CommentRepository commentRepository,
                             UserRepository userRepository) {
        this.lectureRepository = lectureRepository;
        this.courseMaterialRepository = courseMaterialRepository;
        this.commentRepository = commentRepository;
        this.userRepository = userRepository;
    }

    @GetMapping("/{id}")
    public String viewLecture(@PathVariable Long id, Model model) {
        Lecture lecture = lectureRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Lecture not found"));
        model.addAttribute("lecture", lecture);
        return "lecture";
    }

    @GetMapping("/add")
    public String showAddForm() {
        return "admin/addLecture";
    }

    @PostMapping("/add")
    public String addLecture(@RequestParam String title,
                             @RequestParam String summary,
                             @RequestParam(value = "files", required = false) MultipartFile[] files,
                             RedirectAttributes redirectAttributes) throws IOException {
        Lecture lecture = new Lecture();
        lecture.setTitle(title);
        lecture.setSummary(summary);
        lecture = lectureRepository.save(lecture);

        if (files != null) {
            for (MultipartFile file : files) {
                if (!file.isEmpty()) {
                    CourseMaterial material = new CourseMaterial();
                    material.setFileName(file.getOriginalFilename());
                    material.setContentType(file.getContentType());
                    material.setFileData(file.getBytes());
                    material.setLecture(lecture);
                    courseMaterialRepository.save(material);
                }
            }
        }

        redirectAttributes.addFlashAttribute("success", "Lecture added successfully");
        return "redirect:/";
    }

    @PostMapping("/{id}/delete")
    public String deleteLecture(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        lectureRepository.deleteById(id);
        redirectAttributes.addFlashAttribute("success", "Lecture deleted successfully");
        return "redirect:/";
    }

    @PostMapping("/{id}/materials/upload")
    public String uploadMaterials(@PathVariable Long id,
                                  @RequestParam("files") MultipartFile[] files,
                                  RedirectAttributes redirectAttributes) throws IOException {
        Lecture lecture = lectureRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Lecture not found"));

        for (MultipartFile file : files) {
            if (!file.isEmpty()) {
                CourseMaterial material = new CourseMaterial();
                material.setFileName(file.getOriginalFilename());
                material.setContentType(file.getContentType());
                material.setFileData(file.getBytes());
                material.setLecture(lecture);
                courseMaterialRepository.save(material);
            }
        }

        redirectAttributes.addFlashAttribute("success", "Files uploaded successfully");
        return "redirect:/lectures/" + id;
    }

    @PostMapping("/{lectureId}/materials/{materialId}/delete")
    public String deleteMaterial(@PathVariable Long lectureId,
                                 @PathVariable Long materialId,
                                 RedirectAttributes redirectAttributes) {
        courseMaterialRepository.deleteById(materialId);
        redirectAttributes.addFlashAttribute("success", "Material deleted successfully");
        return "redirect:/lectures/" + lectureId;
    }

    @PostMapping("/{id}/comments/add")
    public String addComment(@PathVariable Long id,
                             @RequestParam String content,
                             Principal principal,
                             RedirectAttributes redirectAttributes) {
        User user = userRepository.findByUsername(principal.getName())
                .orElseThrow(() -> new IllegalArgumentException("User not found"));
        Lecture lecture = lectureRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Lecture not found"));

        Comment comment = new Comment();
        comment.setContent(content);
        comment.setUser(user);
        comment.setLecture(lecture);
        commentRepository.save(comment);

        redirectAttributes.addFlashAttribute("success", "Comment added successfully");
        return "redirect:/lectures/" + id;
    }

    @PostMapping("/{lectureId}/comments/{commentId}/delete")
    public String deleteComment(@PathVariable Long lectureId,
                                @PathVariable Long commentId,
                                RedirectAttributes redirectAttributes) {
        commentRepository.deleteById(commentId);
        redirectAttributes.addFlashAttribute("success", "Comment deleted successfully");
        return "redirect:/lectures/" + lectureId;
    }
}
