package com.cnjava.SpringBootProject.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cnjava.SpringBootProject.Model.Product;
import com.cnjava.SpringBootProject.Model.User;
import com.cnjava.SpringBootProject.Service.ProductService;
import com.cnjava.SpringBootProject.Service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private ProductService productService;
	
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
	public String login(@RequestParam String email, @RequestParam String password, Model model, HttpSession session) {
		/*
		 * List<User> list = userService.getAllUser();
		 * 
		 * boolean userExists = false;
		 * 
		 * for (User user : list) { if (user.getEmail().equals(email) &&
		 * user.getPassword().equals(password)) { userExists = true; break; } }
		 * 
		 * if (userExists) {
		 * 
		 * return "redirect:/home"; } else { model.addAttribute("error",
		 * "Invalid email or password."); return "login"; }
		 */
		User user = userService.getUserByEmail(email);

	    if (user != null && user.getPassword().equals(password)) {
	    	// Tạo phiên bằng session
	    	session.setAttribute("email", email);
	    	session.setAttribute("username", user.getUserName());
	    	
	        return "redirect:/home";
	    } else {
	        model.addAttribute("error", "Invalid email or password.");
	        return "login";
	    }
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession(false); // Lấy phiên hiện tại, nếu không tồn tại thì không tạo mới

        if (session != null) {
            session.invalidate(); // Kết thúc phiên (invalidate session)
        }

        return "redirect:/login"; // Chuyển hướng về trang đăng nhập sau khi logout
    }
	
	@GetMapping("/products")
	public String getProductsPage(@RequestParam(defaultValue = "0") int page, Model model) {
        Page<Product> productPage = productService.getProductsPage(page);

        // Set model attributes
        model.addAttribute("products", productPage.getContent());
        model.addAttribute("currentPage", productPage.getNumber());
        model.addAttribute("totalPages", productPage.getTotalPages());

        return "user/products";
    }
}
