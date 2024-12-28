package com.sunshine_shop.dtos;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UserDTO {
    private Long id;
    private String email;
    private String username;
    private String fullname;
    private String address;
    private String phone;
    private String role;
    private String status;
    private String token;
    private Date createdAt;
    private Date updatedAt;
}