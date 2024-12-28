package com.sunshine_shop.detail;

import org.springframework.security.core.GrantedAuthority;

import java.util.Collection;

public interface UserDetails {
    String getUsername();
    String getPassword();
    Collection<? extends GrantedAuthority> getAuthorities();
    boolean isAccountNonExpired();
    boolean isAccountNonLocked();
    boolean isCredentialsNonExpired();      // Thong tin xac thuc cua nguoi dung da het han chua
    boolean isEnabled();
}
