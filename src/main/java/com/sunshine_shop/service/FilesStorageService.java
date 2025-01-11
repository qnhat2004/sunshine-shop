package com.sunshine_shop.service;

import com.sunshine_shop.service.interfaceService.IFilesStorageService;
import org.springframework.core.io.Resource;

import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Service;
import org.springframework.util.FileSystemUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.FileAlreadyExistsException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.stream.Stream;

@Service
public class FilesStorageService implements IFilesStorageService {
    private final Path root = Paths.get("uploads"); // Relative path to the root folder where the files will be stored,
                                                    // in this case it's the folder "./uploads"

    @Override
    public void init() {
        try {
            Files.createDirectories(root);
        } catch (IOException e) {
            throw new RuntimeException("Could not initialize folder for upload!");
        }
    }

    // Luu ảnh vào thư mục uploads, trả về url của ảnh
    @Override
    public String save(MultipartFile file) {
        try {
            String fileName = getFileName(file); // Lấy tên file mới
            Files.copy(file.getInputStream(), this.root.resolve(fileName));   // Đầu tiên, lấy InputStream từ file được upload, sau đó copy vào file có đường dẫn là root/filename
            return "http://localhost:8080/files/" + fileName; // Trả về url của ảnh, thì khi muốn lấy ảnh này thì chỉ cần truy cập vào url này
        } catch (Exception e) {
            if (e instanceof FileAlreadyExistsException) {
                throw new RuntimeException("A file of that name already exists.");
            }

            throw new RuntimeException(e.getMessage());
        }
    }

    @Override
    public Resource load(String filename) {
        try {
            Path file = root.resolve(filename); // Tạo đường dẫn đến file cần load
            // UrlResource: Đọc file từ URL
            UrlResource resource = new UrlResource(file.toUri());   // file.toUri(): Chuyển đường dẫn (Path) thành một đối tượng URI (Uniform Resource Identifier). Ví dụ: Đường dẫn uploads/example.txt sẽ được chuyển thành URI: file:///path/to/uploads/example.txt., UrlResource: Đọc file từ URL
                        
            if (resource.exists() || resource.isReadable()) {
                return (Resource) resource;
            } else {
                throw new RuntimeException("Could not read the file!");
            }
        } catch (MalformedURLException e) {
            throw new RuntimeException("Error: " + e.getMessage());
        }
    }

    @Override
    public void deleteAll() {
        FileSystemUtils.deleteRecursively(root.toFile());
    }

    @Override
    public Stream<Path> loadAll() {
        try {
            return Files.walk(this.root, 1).filter(path -> !path.equals(this.root)).map(this.root::relativize);
        } catch (IOException e) {
            throw new RuntimeException("Could not load the files!");
        }
    }

    @Override
    public String getFileName(MultipartFile file) {
        return System.currentTimeMillis() + "_" + file.getOriginalFilename(); // Tạo tên file mới bằng cách thêm timestamp vào trước tên file
    }
}
