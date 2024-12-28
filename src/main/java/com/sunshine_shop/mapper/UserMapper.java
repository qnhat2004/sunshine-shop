package com.sunshine_shop.mapper;

import com.sunshine_shop.dtos.UserDTO;
import com.sunshine_shop.entity.User;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public class UserMapper {
    public static UserDTO toDTO(User user) {
        return new UserDTO(
                user.getId(),
                user.getEmail(),
                user.getUsername(),
                user.getFullname(),
                user.getAddress(),
                user.getPhone(),
                user.getRole(),
                user.getStatus(),
                user.getToken(),
                user.getCreated_at(),
                user.getUpdated_at()
        );
    }
    public static User toEntity(UserDTO userDTO) {
        User user = new User();
        user.setUsername(userDTO.getUsername());
        user.setEmail(userDTO.getEmail());
        user.setRole(userDTO.getRole());
        user.setStatus(userDTO.getStatus());
        user.setFullname(userDTO.getFullname());
        user.setAddress(userDTO.getAddress());
        user.setPhone(userDTO.getPhone());
        user.setToken(userDTO.getToken());
        user.setUpdated_at(userDTO.getUpdatedAt());
        return user;
    }
}
