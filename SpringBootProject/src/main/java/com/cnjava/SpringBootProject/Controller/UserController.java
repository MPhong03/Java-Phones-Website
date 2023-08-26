package com.cnjava.SpringBootProject.Controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cnjava.SpringBootProject.Model.Brand;
import com.cnjava.SpringBootProject.Model.Cart;
import com.cnjava.SpringBootProject.Model.Category;
import com.cnjava.SpringBootProject.Model.Code;
import com.cnjava.SpringBootProject.Model.Comment;
import com.cnjava.SpringBootProject.Model.Message;
import com.cnjava.SpringBootProject.Model.News;
import com.cnjava.SpringBootProject.Model.Order;
import com.cnjava.SpringBootProject.Model.OrderDetail;
import com.cnjava.SpringBootProject.Model.Product;
import com.cnjava.SpringBootProject.Model.UserRole;
import com.cnjava.SpringBootProject.Repository.CommentRepository;
import com.cnjava.SpringBootProject.Repository.MessageRepository;
import com.cnjava.SpringBootProject.Repository.NewsRepository;
import com.cnjava.SpringBootProject.Repository.RoleRepository;
import com.cnjava.SpringBootProject.Repository.UserRoleRepository;
import com.cnjava.SpringBootProject.Model.AppUser;
import com.cnjava.SpringBootProject.Service.BrandService;
import com.cnjava.SpringBootProject.Service.CartService;
import com.cnjava.SpringBootProject.Service.CategoryService;
import com.cnjava.SpringBootProject.Service.CodeService;
import com.cnjava.SpringBootProject.Service.MailService;
import com.cnjava.SpringBootProject.Service.OrderDetailService;
import com.cnjava.SpringBootProject.Service.OrderService;
import com.cnjava.SpringBootProject.Service.ProductService;
import com.cnjava.SpringBootProject.Service.UserService;
import com.cnjava.SpringBootProject.Config.AppConfig;

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
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private CodeService codeService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private OrderDetailService orderDetailService;
	
	@Autowired
	private MessageRepository messageRepository;
	
	@Autowired
	private NewsRepository newsRepository;
	
	@Autowired
	private UserRoleRepository userRoleRepository;
	
	@Autowired
	private RoleRepository roleRepository;
	
	@Autowired
	private CommentRepository commentRepository;
	
	@GetMapping(value = {"/login","/sendOTP","/updatePassword","/updateUser"})
	public String showLoginForm(Principal principal) {
		
//		if(principal != null) {
//			return "redirect:/";
//		}
		
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
		model.addAttribute("User", new AppUser());
		return "register";
	}
	
	@PostMapping(value = {"/addUser"})
	public String addUser(@ModelAttribute AppUser user,RedirectAttributes attributes ) {
		
		 AppConfig appConfig = new AppConfig();
		 PasswordEncoder passwordEncoder = appConfig.passwordEncoder();

		AppUser usertmp = userService.getUserByEmail(user.getEmail());
		
		if(usertmp != null) {
			 attributes.addFlashAttribute("error","Email đã tồn tại");
			return "redirect:/register";
		}
		
		String pass = user.getPassword();
		
		String encode = passwordEncoder.encode(pass);
		
		user.setPassword(encode);
		user.setEnable(true);
		
		userService.save(user);
		
		UserRole us = new UserRole();
		us.setUser(userService.getUserByEmail(user.getEmail()));
		us.setAppRole(roleRepository.findByName("ROLE_USER"));
		
		userRoleRepository.save(us);
		
		
		
		return "redirect:/login?success";
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
		
		
		AppUser userTmp = userService.getUserByEmail(email);
		
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
		
		 AppConfig appConfig = new AppConfig();
		 PasswordEncoder passwordEncoder = appConfig.passwordEncoder();
		 
		 String encode = passwordEncoder.encode(password);
		
		userService.updatePassword(encode, email);
		attributes.addFlashAttribute("message","Bạn đã thay đổi mật khẩu thành công");
		
		session.removeAttribute("emailFG");
		
		return "redirect:/message";
	}
	
	@GetMapping(value = {"/userinfo"})
	public String userInfo( HttpSession session, RedirectAttributes attributes, Model model) {
		String email = (String) session.getAttribute("email");
		
		if(email == null) {
			attributes.addFlashAttribute("message", "Vui lòng đăng nhập để xem thông tin tài khoản");
			return "redirect:/message";
		}
		
		AppUser user = userService.getUserByEmail(email);
		
		model.addAttribute("username", user.getUserName());
		model.addAttribute("email", user.getEmail());
		model.addAttribute("address", user.getAddress());
		model.addAttribute("phone", user.getPhoneNumber());
		
		model.addAttribute("user", new AppUser());
	
		return "userinfo";
	}
	
	
	@PostMapping(value= {"/updateUser"})
	public String updateUser(@RequestParam String username,@RequestParam String address, @RequestParam String phone,  HttpSession session ) {
		String email = (String) session.getAttribute("email");
		
		userService.updateUser(username, address, phone, email);
		session.setAttribute("username", username);
		
		return "redirect:/userinfo";
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
		AppUser user = userService.getUserByEmail(email);

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
	
//	@GetMapping("/logout")
//	public String logout(HttpServletRequest request) {
//		
//        HttpSession session = request.getSession(false); // Lấy phiên hiện tại, nếu không tồn tại thì không tạo mới
//
//        if (session != null) {
//            session.invalidate(); // Kết thúc phiên (invalidate session)
//        }
//
//        return "redirect:/login"; // Chuyển hướng về trang đăng nhập sau khi logout
//    }
	
	@GetMapping(value={"/logoutSuccessful"})
	public String logout(Model model, Principal principal,HttpServletRequest request) {
		
		 if(  principal == null) {
			 return "redirect:/";
		 }
		
	      HttpSession session = request.getSession(false); // Lấy phiên hiện tại, nếu không tồn tại thì không tạo mới
	
	      if (session != null) {
	          session.invalidate(); // Kết thúc phiên (invalidate session)
	      }
	      return "redirect:/login"; // Chuyển hướng về trang đăng nhập sau khi logout
	}
	
	
	@GetMapping("/payment")  //doi sau
	public String showPayment() {
		return "payment";
	}
	
	
	@GetMapping("/order")
	public String showOrders(HttpServletRequest request, Model model, @RequestParam("page") int page) {
		
         HttpSession session = request.getSession(false);
		 
		 if(session == null) {
			 return "redirect:/login"; 
		 }
		 
		 int n = 10;
		 
		 int offset = page*n-n;
		
		 String email = (String) session.getAttribute("email");
		 AppUser user = userService.getUserByEmail(email);
		 
		 List<Order> list = orderService.getListOrder(user.getUserID(), offset, n);
		 
		 if(list.size() == 0) {
			 model.addAttribute("message", "Không còn đơn hàng");
			 return "message";
		 }
		 
		 model.addAttribute("list", list);
		 model.addAttribute("pre", page - 1);
		 model.addAttribute("counter", new Counter());
		 
		 
		 return "order";
	}
	
	@GetMapping("/cart")  
	public String showCart(HttpServletRequest request, Model model) {
		
		
		 HttpSession session = request.getSession(false);
		 
		 if(session == null) {
			 return "redirect:/login"; 
		 }
		 
		
		 
		 String email = (String) session.getAttribute("email");
		 
		 AppUser user = userService.getUserByEmail(email);
		 
		 List< Cart> list = cartService.getCartByEmail(email);
		 
		 if(list.size() == 0) {
			 model.addAttribute("message", "Không có sản phẩm trong giỏ hàng");
			 return "message";
		 }
		 
		 model.addAttribute("list", list);
		 model.addAttribute("counter", new Counter());
		 
		 int total = 0;
		 
		 for(Cart c: list) {
			 total = total + c.getPrice();
		 }
		
		 
		 model.addAttribute("total", total);
		 
		 return "cart";
	}
	
	@RequestMapping(value = "/cart/{id}", method = RequestMethod.POST)
	
	public String addtoCart(HttpServletRequest request,@PathVariable("id") int idproduct) {
		Product p = productService.getProductById(idproduct);
		HttpSession session = request.getSession(false);
		 
		 if(session == null) {
			 return "redirect:/login"; 
		 }
		 
		
		 
		 String email = (String) session.getAttribute("email");
		 
		 AppUser user = userService.getUserByEmail(email);
		 
		 Cart cart = new Cart();
		 cart.setProductid(p);
		 cart.setPrice(p.getPrice());
		 cart.setUserid(user);
		 cart.setQuantity(1);
		 cartService.saveCart(cart);
		return "redirect:/cart";
	}
	@PostMapping("/updatequantity")
	public String updateQuantity(@RequestParam("quantity") int quantity, @RequestParam("idcart") int idcart) {
		
		Cart cart = cartService.getById(idcart);
		
		Product product = cart.getProductid();
		
		cart.setPrice(quantity * product.getPrice());
		
		cart.setQuantity(quantity);
		
		cartService.saveCart(cart);
		
		
		return "redirect:/cart";
		
	}
	
	@PostMapping("/getCode")
	public String getCode(@RequestParam("code") String  code,  RedirectAttributes redirectAttributes) {
		
		
		System.out.println(code);
		
		Code getCode = codeService.getCodeByText(code);
		
		
		if(getCode == null) {
			redirectAttributes.addFlashAttribute("error","Mã giảm giá không đúng");
			return "redirect:/cart";
		}
		
		if(getCode.getStatus() == 1) {
			redirectAttributes.addFlashAttribute("error","Mã giảm giá đã được sử dụng");
			return "redirect:/cart";
		}
		
		
		redirectAttributes.addFlashAttribute("discount", getCode.getPrice());
		redirectAttributes.addFlashAttribute("code", code);
		
		return "redirect:/cart";
	}
	
	
	@GetMapping("/deletecart/{id}")
	public String deleteCart(@PathVariable("id") int cartID) {
		
		cartService.deleteCart(cartID);
		
		return "redirect:/cart";
	}

	@PostMapping("/checkout")
	public String showPayment(@RequestParam("discount") String codediscount, Model model, HttpServletRequest request) {
		
		
		 HttpSession session = request.getSession(false);
		 
	     String email = (String) session.getAttribute("email");
		 
		 AppUser user = userService.getUserByEmail(email);
		 
		 List< Cart> list = cartService.getCartByEmail(email);
		
		 int total = 0;
		 
		 for(Cart c: list) {
			 total = total + c.getPrice();
		 }
		
		 
		 model.addAttribute("total", total);
		 
		 
		 if(!codediscount.equals("notdiscount")) {
			 	Code code = codeService.getCodeByText(codediscount);
		
			 	model.addAttribute("textcode",codediscount);
		
			 	model.addAttribute("value", code.getPrice());
			
		 }
		 else {
			 	 model.addAttribute("value", 0);
		 }
		 
	
		
		return "payment";
	}
	
	
	@GetMapping("/orderdetail")
	public String showOrderDdetail(@RequestParam("id")int id, Model model,  HttpServletRequest request) {
		
		 HttpSession session = request.getSession(false);
		
		 if(session == null) {
			 return "redirect:/login"; 
		 }
		 
		 String email = (String) session.getAttribute("email");
		
		Order or = orderService.getOrderIdMail(email, id);
		
		List<OrderDetail> list = orderDetailService.getList(id);
		
		Code code = codeService.getCodeByText(or.getDiscount());
		
		if(code == null) {
			model.addAttribute("discount", 0);
		}
		else {
			model.addAttribute("discount", code.getPrice());
		}
		
	    model.addAttribute("list", list);
		model.addAttribute("or", or);
		model.addAttribute("code", code);
		model.addAttribute("counter", new Counter());
		
		return "orderdetail";
	}
	
	@PostMapping("/searchorder")
	public String searchOrder(@RequestParam("search") String key, Model model) {
		
		Order or = orderService.getOrderByCode(key);
		
		if(or == null) {
			model.addAttribute("message", "Không tìm thấy đơn hàng phù hợp");
			return "message";
		}
		
		return "redirect:/orderdetail?id=" + or.getOrderid();
	}
	
	
	@PostMapping("/editorder")
	public String editOrder(@RequestParam("ordercode") String ordercode,@RequestParam("fullname")String fullname,@RequestParam("email") String email,@RequestParam("phone") String phone, @RequestParam("country-state") String area, @RequestParam("address") String address  ) {
		
		Order or = orderService.getOrderByCode(ordercode);
		
		or.setFullname(fullname);
		or.setEmail(email);
		or.setPhonenumber(phone);
		or.setProvince(area);
		or.setAddress(address);
		
		orderService.saveOrder(or);
		
		return "redirect:/orderdetail?id=" + or.getOrderid();
	}
	
	@GetMapping("/warranty")
	public String showWarranty() {
		return "warranty";
	}
	

	@GetMapping("/security")
	public String showSecurity() {
		return "security";
	}
	
	@GetMapping("/delivery")
	public String showDelivery() {
		return "delivery";
	}
	
	@GetMapping("/pay")
	public String showPay() {
		return "pay";
	}
	

	@GetMapping("/tragop")
	public String showTraGop() {
		return "tragop";
	}
	
	
	@GetMapping(value={"/loginfail"})
	public String errorLogin(Model model, Principal principal) {
		
		
		if(principal != null) {
			return "redirect:/";
		}
		
		model.addAttribute("error", "Sai username hoặc password");	
		return "login";
	}
	
	@PostMapping("/addcart/{id}")
	public String addCart(@PathVariable("id") int id, @RequestParam("color") String color,   RedirectAttributes redirectAttributes,HttpServletRequest request) {
	
		
		HttpSession session = request.getSession(false);
		
		String email = (String) session.getAttribute("email");
		
		AppUser user = userService.getUserByEmail(email);
		
		Cart c = cartService.getCart(email, id,color);
		
		if(c != null) {
			int old = c.getQuantity();
			c.setQuantity(old + 1);
			
			c.setPrice(c.getProductid().getPrice() * (old + 1));
			
			cartService.saveCart(c);
			
			redirectAttributes.addFlashAttribute("message", c.getProductid().getProductName() +" đã được thêm vào giỏ hàng");
			return "redirect:/product/"+id;
		}
		
		Product pro = productService.getProductById(id);
		
		Cart newCart = new Cart();
		newCart.setUserid(user);
		newCart.setColor(color);
		newCart.setQuantity(1);
		newCart.setProductid(pro);
		newCart.setPrice(pro.getPrice());
		
		cartService.saveCart(newCart);
		
		redirectAttributes.addFlashAttribute("message", newCart.getProductid().getProductName() +" đã được thêm vào giỏ hàng");
		return "redirect:/product/"+id;
	}
	
	
	@PostMapping("/buynow/{id}")
public String buyNow(@PathVariable("id") int id, @RequestParam("color") String color,   RedirectAttributes redirectAttributes,HttpServletRequest request) {
	
		
		HttpSession session = request.getSession(false);
		
		String email = (String) session.getAttribute("email");
		
		AppUser user = userService.getUserByEmail(email);
		
		Cart c = cartService.getCart(email, id,color);
		
		if(c != null) {
			int old = c.getQuantity();
			c.setQuantity(old + 1);
			
			c.setPrice(c.getProductid().getPrice() * (old + 1));
			
			cartService.saveCart(c);
		
			return "redirect:/cart";
		}
		
		Product pro = productService.getProductById(id);
		
		Cart newCart = new Cart();
		newCart.setUserid(user);
		newCart.setColor(color);
		newCart.setQuantity(1);
		newCart.setProductid(pro);
		newCart.setPrice(pro.getPrice());
		
		cartService.saveCart(newCart);
	
		return "redirect:/cart";
	}
	
	@GetMapping("/thucudoimoi")
	public String thuCuDoiMoi() {
		return "thucu";
	}
	
	@GetMapping("/lienhe")
	public String lienHe() {
		return "lienhe";
	}
	
	@GetMapping("/cuahang")
	public String cuaHang() {
		return "cuahang";
	}
	
	@PostMapping("/savemes")
	public String saveMes(@RequestParam("name") String name,@RequestParam("email") String email, @RequestParam("title") String title,@RequestParam("message") String message,RedirectAttributes redirectAttributes ) {
		
		Message mes = new Message();
		
		Date date = new Date();  
		SimpleDateFormat formatter = new SimpleDateFormat("dd-M-yyyy hh:mm:ss a");  
		String strDate = formatter.format(date);
		
		mes.setName(name);
		mes.setEmail(email);
		mes.setTitle(title);
		mes.setText(message);
		mes.setDate(strDate);
		
		messageRepository.save(mes);
		
		redirectAttributes.addFlashAttribute("mes","Đã gửi tin nhắn");
		
		return "redirect:/lienhe";
		
	}
	
	@GetMapping("/tintuc")
	public String showTinTuc(@RequestParam("page") int page, Model model) {
		
		List<News> list = newsRepository.getList(page*5 - 5,5);
		
		if(list.size() == 0) {
			model.addAttribute("message", "Không còn tin tức");
			return "message";
		}
		
		model.addAttribute("list", list);
		model.addAttribute("pre", page - 1);
		
		return "tintuc";
	}
	
	
	@GetMapping("/tintuc/{title}")
	public String showNoiDung(@PathVariable("title") String filename, Model model) {
		
		News n = newsRepository.getByFileName(filename);
		
		model.addAttribute("title", n.getTitle());
		model.addAttribute("name", n.getUserid().getUserName());
		model.addAttribute("date", n.getDate());
		
		return filename;
	}
	
	@GetMapping("/error")
	public String showError(Model model) {
		
	
		model.addAttribute("message","Đã xảy ra lỗi");
		
		return "message";
	}
	
	@PostMapping("/deletecomment")
	public String deleteComment(@RequestParam("commentid") int id,@RequestParam("productid") int proid,HttpServletRequest request) {
	    HttpSession session = request.getSession(false);
		
		String email = (String) session.getAttribute("email");
		
		AppUser user = userService.getUserByEmail(email);
		
		Comment tmpcmt = commentRepository.checkComment(id, email);
		
		if(tmpcmt != null) {
			commentRepository.deleteById(id);
			return "redirect:/product/" + proid;
		}
		else {
			boolean isadmin = false;
			
			List<String> role = userRoleRepository.getRoleNames(user.getUserID());
			
			for(String s : role) {
				if(s.equals("ROLE_ADMIN")) {
					isadmin = true;
				}
			}
			
			if(isadmin == true) {
				commentRepository.deleteById(id);
				return "redirect:/product/" + proid;
			}
			
		}
		
		
		return "redirect:/product/" + proid;
	}
	
}
