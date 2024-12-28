package com.sunshine_shop;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.sunshine_shop.service.FilesStorageService;

import jakarta.annotation.Resource;

@SpringBootApplication
public class SunshineShopApplication implements CommandLineRunner {

    @Resource
    FilesStorageService storageService;

    public static void main(String[] args) {
        SpringApplication.run(SunshineShopApplication.class, args);
    }

    @Override
    public void run(String... arg) throws Exception {
        // storageService.deleteAll();
        storageService.init();
    }
}
