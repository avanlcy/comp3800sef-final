package comp3800sef.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import comp3800sef.config.DataInitializer;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    private final DataInitializer dataInitializer;
    private final ObjectMapper objectMapper;

    public HomeController(DataInitializer dataInitializer, ObjectMapper objectMapper) {
        this.dataInitializer = dataInitializer;
        this.objectMapper = objectMapper;
    }

    @GetMapping("/")
    public String home(Model model) {
        model.addAttribute("lectureList", dataInitializer.getLectureListData());
        model.addAttribute("pollList", dataInitializer.getPollListData());
        return "index";
    }

    @GetMapping("/lecture")
    public String lecture(Model model) throws JsonProcessingException {
        model.addAttribute("lectureDataJson", objectMapper.writeValueAsString(dataInitializer.getLectureData()));
        return "lecture";
    }

    @GetMapping("/poll")
    public String poll(Model model) throws JsonProcessingException {
        model.addAttribute("pollDataJson", objectMapper.writeValueAsString(dataInitializer.getPollData()));
        return "poll";
    }
}
