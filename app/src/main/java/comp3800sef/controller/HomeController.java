package comp3800sef.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String home(Model model) {
        return "index";
    }

    @GetMapping("/lecture")
    public String lecture(Model model) {
        return "lecture";
    }

    @GetMapping("/poll")
    public String poll(Model model) {
        return "poll";
    }
}
