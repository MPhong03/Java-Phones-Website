package com.cnjava.SpringBootProject.Service;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.cnjava.SpringBootProject.Model.Admin;
import com.cnjava.SpringBootProject.Model.Role;
import com.cnjava.SpringBootProject.Repository.AdminRepository;

@Service
public class CustomAdminDetailsService implements UserDetailsService {

	private AdminRepository adminRepository;
	
	public CustomAdminDetailsService(AdminRepository adminRepository) {
		this.adminRepository = adminRepository;
	}
	
	@Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        Admin admin = adminRepository.findByEmail(email);

        if (admin != null) {
            return new org.springframework.security.core.userdetails.User(admin.getEmail(),
                    admin.getPassword(),
                    mapRolesToAuthorities(admin.getRoles()));
        }else{
            throw new UsernameNotFoundException("Invalid username or password.");
        }
    }
	
	private Collection < ? extends GrantedAuthority> mapRolesToAuthorities(Collection <Role> roles) {
        Collection < ? extends GrantedAuthority> mapRoles = roles.stream()
                .map(role -> new SimpleGrantedAuthority(role.getName()))
                .collect(Collectors.toList());
        return mapRoles;
    }
}
