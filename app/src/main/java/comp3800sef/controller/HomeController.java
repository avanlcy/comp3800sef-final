package comp3800sef.controller;

import comp3800sef.repository.LectureRepository;
import comp3800sef.repository.PollRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    private final LectureRepository lectureRepository;
    private final PollRepository pollRepository;

    public HomeController(LectureRepository lectureRepository, PollRepository pollRepository) {
        this.lectureRepository = lectureRepository;
        this.pollRepository = pollRepository;
    }

    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("lectures", lectureRepository.findAll());
        model.addAttribute("polls", pollRepository.findAll());
        return "index";
    }
}
