package com.cnjava.SpringBootProject.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cnjava.SpringBootProject.Model.User;
import com.cnjava.SpringBootProject.Service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@GetMapping(value = {"/", "/home"})
	public String index() {
		return "index.html";
	}
	
	@GetMapping(value = {"/login"})
	public String showLoginForm() {
		return "login";
	}
	
	@GetMapping(value = {"/register"})
	public String showRegisterForm(Model model) {
		model.addAttribute("User", new User());
		return "register";
	}
	
	@PostMapping(value = {"/addUser"})
	public String addUser(@ModelAttribute User user) {
		userService.save(user);
		return "redirect:/login";
	}
	
	@PostMapping(value = {"/signUp"})
	public String login(@RequestParam String email, @RequestParam String password, Model model) {
		List<User> list = userService.getAllUser();

		boolean userExists = false;

	    for (User user : list) {
	        if (user.getEmail().equals(email) && user.getPassword().equals(password)) {
	            userExists = true;
	            break;
	        }
	    }

	    if (userExists) {
	    	
	        return "redirect:/home";
	    } else {
	    	model.addAttribute("error", "Invalid email or password.");
            return "login";
	    }
	}
}
