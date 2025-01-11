package com.sunshine_shop;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.sunshine_shop.service.FilesStorageService;

import jakarta.annotation.Resource;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication(scanBasePackages = "com.sunshine_shop")
public class SunshineShopApplication implements CommandLineRunner {

    @Resource
    FilesStorageService storageService;

    public static void main(String[] args) {
        SpringApplication.run(SunshineShopApplication.class, args);
    }

    @Override
    public void run(String... arg) throws Exception {
        try {
            // storageService.deleteAll();
            storageService.init();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
