package com.cnjava.SpringBootProject.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cnjava.SpringBootProject.Model.User;
import com.cnjava.SpringBootProject.Repository.UserRepository;

@Service
public class UserService {
	@Autowired
	private UserRepository userRepository;
	
	public void save(User b) {
		userRepository.save(b);
	}
	
	public List<User> getAllUser(){
		return userRepository.findAll();
	}
	
	public User getUserById(int id) {
		return userRepository.findById(id).get();
	}
	public User getUserByEmail(String email) {
		return userRepository.findByEmail(email);
	}
	public void deleteById(int id) {
		userRepository.deleteById(id);
	}
	
}