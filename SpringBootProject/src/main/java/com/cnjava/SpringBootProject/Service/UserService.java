package com.cnjava.SpringBootProject.Service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cnjava.SpringBootProject.Model.AppUser;
import com.cnjava.SpringBootProject.Repository.UserRepository;

@Service
public class UserService {
	@Autowired
	private UserRepository userRepository;
	
	public void save(AppUser b) {
		userRepository.save(b);
	}
	
	public List<AppUser> getAllUser(){
		return userRepository.findAll();
	}
	
	public AppUser getUserById(int id) {
		return userRepository.findById(id).get();
	}
	public AppUser getUserByEmail(String email) {
		return userRepository.findByEmail(email);
	}
	public void deleteById(int id) {
		userRepository.deleteById(id);
	}
	
	public int updateOtp(String otp, String date, String email) {
		return userRepository.updateOtp(otp, date, email);
	}
	
	
	public String getOTP(String email) {
		return userRepository.getOTP(email);
	}
	
	public String getTime(String email) {
		return userRepository.getTime(email);
	}
	
	public int updatePassword(String password, String email) {
		return userRepository.updatePassword(password, email);
	}
	
	public int updateUser(String username, String address, String phone, String email) {
		return userRepository.updateUser(username, address, phone, email);
	}
	
	public List<AppUser> getLimit(int page, int n){
		return userRepository.getLimitUser(page, n);
	}
	
	
	public long countUser() {
		return userRepository.countUser();
	}
	
}
