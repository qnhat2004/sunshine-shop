package com.sunshine_shop.service.interfaceService;

import jakarta.annotation.Resource;
import org.springframework.web.multipart.MultipartFile;

import java.nio.file.Path;
import java.util.stream.Stream;

public interface IFilesStorageService {
    public void init();     // Initialize the storage
    public void save(MultipartFile file);   // Save the file
    public Resource load(String filename);  // Load the file: trong các phương thức resource là một đối tượng đại diện cho một tài nguyên (ví dụ: file, URL, ảnh, ...)
    public void deleteAll();    // Delete all files
    public Stream<Path> loadAll();
}
