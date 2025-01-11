package com.sunshine_shop.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/upload")
public class UploadController {

    @GetMapping
    public ResponseEntity<?> test() {
        return ResponseEntity.ok("Upload controller");
    }

    @PostMapping("/image")
    public ResponseEntity<?> uploadImage(@RequestParam("file") MultipartFile file) {
        try {
            // Lưu file vào thư mục tạm của hệ thống, trả về url của ảnh
            String fileName = saveFile(file);
            return ResponseEntity.ok(fileName);
        } catch (IOException e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Could not upload the file: " + file.getOriginalFilename() + "!");
        }
    }

    // Trả về danh sách các ảnh đã upload
    @GetMapping("/images")
    public ResponseEntity<List<String>> getImages() {
        File folder = new File("src/main/resources/static/images");
        File[] files = folder.listFiles();

        List<String> imageUrls = Arrays.stream(files)
                .filter(File::isFile)
                .map(file -> "http://localhost:8080/uploads/" + file.getName())
                .collect(Collectors.toList());
        return ResponseEntity.ok(imageUrls);
    }

    // Lưu file vào thư mục tạm của hệ thống
    private String saveFile(MultipartFile file) throws IOException {
        // Đường dẫn lưu file
        final String uploadDir = "src/main/resources/static/images";
        File uploadFolder = new File(uploadDir);
        if (!uploadFolder.exists()) {
           uploadFolder.mkdirs();   // Nếu thư mục chưa tồn tại thì tạo thư mục mới
        }

        String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
        Path filePath = Paths.get(uploadDir + fileName);
        Files.write(filePath, file.getBytes());     // Lưu file vào thư mục
        return fileName;
    }
}
