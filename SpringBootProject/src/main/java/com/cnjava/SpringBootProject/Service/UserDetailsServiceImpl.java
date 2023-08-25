package com.cnjava.SpringBootProject.Service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.security.core.userdetails.User;

import com.cnjava.SpringBootProject.Model.AppUser;
import com.cnjava.SpringBootProject.Repository.UserRoleRepository;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

	 @Autowired
	 private UserService userService;
	 
	 @Autowired
	 private UserRoleRepository userRoleRes;
	 
	 @Override
	 public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		 	AppUser user = userService.getUserByEmail(email);
		 	
		 	 if (user == null) {
	             System.out.println("User not found! " + email);
	             throw new UsernameNotFoundException("User with email  " + email + " was not found in the database");
	         }
		 	 
		 	 System.out.println("Found User: " + user);
		 	 
		 	 List<String> roleNames = userRoleRes.getRoleNames(user.getUserID());
		 	 
		 	 List<GrantedAuthority> grantList = new ArrayList<GrantedAuthority>();
		 	 
		 	if (roleNames != null) {
	             for (String role : roleNames) {
	                 // ROLE_USER, ROLE_ADMIN,..
	                 GrantedAuthority authority = new SimpleGrantedAuthority(role);
	                 grantList.add(authority);
	             }
	         }
	    	 
		 	 UserDetails userDetails = (UserDetails) new User(user.getEmail(), //
	                 user.getPassword(), grantList);
	    	 
	    	  return userDetails;
 	 
		 	
	 }
}
