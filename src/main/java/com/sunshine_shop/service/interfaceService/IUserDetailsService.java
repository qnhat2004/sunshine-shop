package com.sunshine_shop.service.interfaceService;

import com.sunshine_shop.detail.UserDetails;

public interface IUserDetailsService {
    UserDetails loadUserByUsername(String username);
}
