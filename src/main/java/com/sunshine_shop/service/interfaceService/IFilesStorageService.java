package com.sunshine_shop.service.interfaceService;

import org.springframework.core.io.Resource;
import org.springframework.web.multipart.MultipartFile;

import java.nio.file.Path;
import java.util.stream.Stream;

public interface IFilesStorageService {
    void init();     // Initialize the storage
    String save(MultipartFile file);   // Save the file
    Resource load(String filename);  // Load the file: trong các phương thức resource là một đối tượng đại diện cho một tài nguyên (ví dụ: file, URL, ảnh, ...)
    void deleteAll();    // Delete all files
    Stream<Path> loadAll();
    String getFileName(MultipartFile file);
}
