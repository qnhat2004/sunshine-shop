package com.sunshine_shop.service;

import com.sunshine_shop.auth.PasswordService;
import com.sunshine_shop.dtos.UserDTO;
import com.sunshine_shop.entity.User;
import com.sunshine_shop.mapper.UserMapper;
import com.sunshine_shop.repository.UserRepository;
import com.sunshine_shop.service.interfaceService.IUserService;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class UserService implements IUserService {
    private final UserRepository userRepository;
    private final PasswordService passwordService;

    @Override
    public List<UserDTO> getAllUsers() {
        return userRepository.findAll()
                .stream()
                .map(UserMapper::toDTO)
                .collect(Collectors.toList());
    }

    @Override
    public UserDTO getUserById(Long id) {
        User user = userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("User not found"));
        return UserMapper.toDTO(user);
    }

    @Transactional
    @Override
    public UserDTO createUser(UserDTO userDTO, String rawPassword) {
        User user = UserMapper.toEntity(userDTO);
        String encodedPassword = passwordService.encodePassword(rawPassword);
        user.setPassword(encodedPassword);
        User savedUser = userRepository.save(user);
        return UserMapper.toDTO(savedUser);
    }

    // User update profile (include change password)
    @Transactional
    @Override
    public User updateUser(Long id, User user) {
        User currentUser = userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("User not found"));
        currentUser.setUsername(user.getUsername());
        currentUser.setEmail(user.getEmail());
        currentUser.setPassword(user.getPassword());
        currentUser.setRole(user.getRole());
        currentUser.setStatus(user.getStatus());
        currentUser.setFullname(user.getFullname());
        currentUser.setAddress(user.getAddress());
        currentUser.setPhone(user.getPhone());
        currentUser.setToken(user.getToken());
        currentUser.setUpdated_at(user.getUpdated_at());
        User updatedUser = userRepository.save(currentUser);
        return updatedUser;
    }

    @Transactional
    public UserDTO editUser(Long id, UserDTO userDTO) {
        User currentUser = userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("User not found"));
        currentUser.setUsername(userDTO.getUsername());
        currentUser.setEmail(userDTO.getEmail());
        currentUser.setRole(userDTO.getRole());
        currentUser.setStatus(userDTO.getStatus());
        currentUser.setFullname(userDTO.getFullname());
        currentUser.setAddress(userDTO.getAddress());
        currentUser.setPhone(userDTO.getPhone());
        currentUser.setToken(userDTO.getToken());
        currentUser.setUpdated_at(userDTO.getUpdatedAt());
        User updatedUser = userRepository.save(currentUser);
        return UserMapper.toDTO(updatedUser);
    }

    @Override
    @Transactional
    public void deleteUser(Long id) {
        userRepository.deleteById(id);
    }

}