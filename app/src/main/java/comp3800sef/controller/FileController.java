package comp3800sef.controller;

import comp3800sef.model.CourseMaterial;
import comp3800sef.repository.CourseMaterialRepository;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

@Controller
public class FileController {

    private final CourseMaterialRepository courseMaterialRepository;

    public FileController(CourseMaterialRepository courseMaterialRepository) {
        this.courseMaterialRepository = courseMaterialRepository;
    }

    @GetMapping("/files/{id}")
    public ResponseEntity<byte[]> downloadFile(@PathVariable Long id) {
        CourseMaterial material = courseMaterialRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("File not found"));

        String encodedFileName = URLEncoder.encode(material.getFileName(), StandardCharsets.UTF_8)
                .replace("+", "%20");

        return ResponseEntity.ok()
                .contentType(MediaType.parseMediaType(material.getContentType()))
                .header(HttpHeaders.CONTENT_DISPOSITION,
                        "attachment; filename*=UTF-8''" + encodedFileName)
                .body(material.getFileData());
    }
}
