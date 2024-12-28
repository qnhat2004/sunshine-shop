package com.sunshine_shop.service;

import com.sunshine_shop.detail.UserDetails;
import com.sunshine_shop.detail.UserDetailsImpl;
import com.sunshine_shop.entity.User;
import com.sunshine_shop.repository.UserRepository;
import com.sunshine_shop.service.interfaceService.IUserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class UserDetailService implements IUserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findByUsername(username);
        return new UserDetailsImpl(user);
    }
}
