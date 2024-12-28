package com.sunshine_shop.controller;

import com.sunshine_shop.entity.User;
import com.sunshine_shop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/api/auth")
@CrossOrigin(origins = "http://localhost:5173")
public class AuthController {

    @Autowired
    private UserService userService;

    @PostMapping("/login")
    public ResponseEntity<User> login(@RequestBody User user) {
//        Optional<User> optionalUser = Optional.ofNullable(userService.findByEmailAndPassword(user.getEmail(), user.getPassword()));
//        if (optionalUser.isPresent()) {
//            return ResponseEntity.ok(optionalUser.get());
//        } else {
//            return ResponseEntity.status(401).build();
//        }
        return null;
    }
}
