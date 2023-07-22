package com.cnjava.SpringBootProject.Controller;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cnjava.SpringBootProject.Model.Product;
import com.cnjava.SpringBootProject.Model.User;
import com.cnjava.SpringBootProject.Service.MailService;
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
	
	@Autowired
	private MailService mailService;
	
	@GetMapping(value = {"/", "/home"})
	public String index() {
		return "index.html";
	}
	
	@GetMapping(value = {"/login","/sendOTP","/updatePassword"})
	public String showLoginForm() {
		return "login";
	}
	
	@GetMapping(value = {"/forgetPassword"})
	public String showForgetPasswordForm() {
		return "forgetpassword";
	}
	
	@GetMapping(value = {"/newPassword"})
	public String showNewPasswordForm() {
		return "newpassword";
	}
	
	@GetMapping(value = {"/message"})
	public String showMessageForm() {
		return "message";
	}
	
	@GetMapping(value = {"/register"})
	public String showRegisterForm(Model model) {
		model.addAttribute("User", new User());
		return "register";
	}
	
	@PostMapping(value = {"/addUser"})
	public String addUser(@ModelAttribute User user,RedirectAttributes attributes ) {

		User usertmp = userService.getUserByEmail(user.getEmail());
		
		if(usertmp != null) {
			 attributes.addFlashAttribute("error","Email đã tồn tại");
			return "redirect:/register";
		}
		
		userService.save(user);

		return "redirect:/login";
	}
	
	public String generateOTP(int length) {
		String numbers = "0123456789";  
	    Random rndm_method = new Random();  
	    char[] otp = new char[length];  
	    for (int i = 0; i < length; i++) {  
	        otp[i] = numbers.charAt(rndm_method.nextInt(numbers.length()));  
	    }  
	    return new String(otp);  
	}
	
	
	
	
	@PostMapping(value = {"/sendOTP"})
	public String sendOTP(@RequestParam String email, HttpSession session,RedirectAttributes attributes) {
		
		
		User userTmp = userService.getUserByEmail(email);
		
		if(userTmp == null) {
			 attributes.addFlashAttribute("error","Tài khoản không tồn tại");
			 return "redirect:/forgetPassword";
		}
		
		 String otp = generateOTP(6);
		
		 mailService.sendMail(email, otp);
		 

		 LocalDateTime now = LocalDateTime.now(); 
		 DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		 String formattedDateTime = now.format(dateTimeFormatter);
		 userService.updateOtp(otp, formattedDateTime, email);
		
		 session.setAttribute("emailFG", email);
		
		 return "redirect:/newPassword";
	}
	
	@PostMapping(value = {"/updatePassword"})
	public String newPassword(@RequestParam String otp,@RequestParam String password, HttpSession session,RedirectAttributes attributes) {
		
		
		String email = (String) session.getAttribute("emailFG");
		
		String getOtp = userService.getOTP(email);
		String getTime = userService.getTime(email);
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		LocalDateTime dateTime = LocalDateTime.parse(getTime, formatter);
		
		LocalDateTime now = LocalDateTime.now();
		
		Duration duration = Duration.between(dateTime, now);

		long minutes = duration.toMinutes();
		
		if(!getOtp.equals(otp)) {
			attributes.addFlashAttribute("error","Sai mã xác thực");
			return "redirect:/newPassword";
		}
		else {
			if(minutes > 5) {
				attributes.addFlashAttribute("error","Mã xác thực đã hết hiệu lực");
				return "redirect:/newPassword";
			}
		}
		
		userService.updatePassword(password, email);
		attributes.addFlashAttribute("message","Bạn đã thay đổi mật khẩu thành công");
		
		session.removeAttribute("emailFG");
		
		return "redirect:/message";
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
