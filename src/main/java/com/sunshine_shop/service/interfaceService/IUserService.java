package com.sunshine_shop.service.interfaceService;

import com.sunshine_shop.dtos.UserDTO;
import com.sunshine_shop.entity.User;
import jakarta.transaction.Transactional;

import java.util.List;

public interface IUserService {
    List<UserDTO> getAllUsers();
    UserDTO getUserById(Long id);
    UserDTO createUser(UserDTO userDTO, String rawPassword);
    UserDTO updateUser(Long id, UserDTO userDTO, String rawPassword);    // User edit profile
    void deleteUser(Long id);
    UserDTO editUser(Long id, UserDTO user);    // Admin edit user
}