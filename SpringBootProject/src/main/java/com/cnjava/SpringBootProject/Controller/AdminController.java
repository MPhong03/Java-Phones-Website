package com.cnjava.SpringBootProject.Controller;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.ResourceUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cnjava.SpringBootProject.Config.AppConfig;
import com.cnjava.SpringBootProject.Model.AppUser;
import com.cnjava.SpringBootProject.Model.Brand;
import com.cnjava.SpringBootProject.Model.Category;
import com.cnjava.SpringBootProject.Model.Message;
import com.cnjava.SpringBootProject.Model.Order;
import com.cnjava.SpringBootProject.Model.Product;
import com.cnjava.SpringBootProject.Model.UserRole;
import com.cnjava.SpringBootProject.Model.Value;
import com.cnjava.SpringBootProject.Repository.MessageRepository;
import com.cnjava.SpringBootProject.Repository.RoleRepository;
import com.cnjava.SpringBootProject.Repository.UserRoleRepository;
import com.cnjava.SpringBootProject.Service.BrandService;
import com.cnjava.SpringBootProject.Service.CategoryService;
import com.cnjava.SpringBootProject.Service.OrderService;
import com.cnjava.SpringBootProject.Service.ProductService;
import com.cnjava.SpringBootProject.Service.UserService;
import com.cnjava.SpringBootProject.Service.ValueService;

@Controller
public class AdminController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
    private BrandService brandService;

    @Autowired
    private CategoryService categoryService;
    
    @Autowired
    private ValueService valueService;
    
    @Autowired
    private UserService userService;
    
    @Autowired
    private RoleRepository roleRepository;
    
    @Autowired
    private OrderService orderService;
    
    @Autowired
    private UserRoleRepository userRoleRepository;
    
    @Autowired
    private MessageRepository mesRepository;
    
//    @Autowired
//    private AdminService adminService;
    
    private final String uploadDirectory = "static/uploads/";
    
    @GetMapping("/admin")
    public String index() {
    	
    	
    	return "admin/admin";
    }
    
//    @GetMapping("/admin/login")  su dung chung với trang login chính thức
//    public String adminLogin() {
//    	return "admin/login";
//    }
//    
    @GetMapping("/admin/register")
    public String showRegistrationForm(Model model){
        AppUser user = new AppUser();
        model.addAttribute("admin", user);
        return "admin/register";
    }
    
    @PostMapping("/admin/register/save")
    public String registration(@Validated @ModelAttribute("admin") AppUser admin, Model model){
       
    	
    	AppUser tmp = userService.getUserByEmail(admin.getEmail());
    	
    	if(tmp != null) {
    		 model.addAttribute("error","Email đã tồn tại");
    		 model.addAttribute("admin",admin);
             return "/admin/register";
    	}
    	

    	 AppConfig appConfig = new AppConfig();
		 PasswordEncoder passwordEncoder = appConfig.passwordEncoder();

		 String encode = passwordEncoder.encode(admin.getPassword());
		 
		 admin.setPassword(encode);
		 admin.setEnable(true);
		 
		 userService.save(admin);
		 
		 UserRole us = new UserRole();
		 
		 us.setUser(userService.getUserByEmail(admin.getEmail()));
		 us.setAppRole(roleRepository.findByName("ROLE_ADMIN"));
		 userRoleRepository.save(us);
        
        return "redirect:/admin/register?success";
    }
    	
	@GetMapping(value = {"/admin/products"})
	public String productsManagement(Model model) {
		model.addAttribute("products", productService.getAllProduct());
		model.addAttribute("brands", brandService.getAllBrand());
		model.addAttribute("categories", categoryService.getAllCategory());
		return "admin/adminProduct";
	}
	
	@GetMapping(value = {"/admin/brands"})
	public String brandsManagement(Model model) {
		model.addAttribute("brands", brandService.getAllBrand());
		return "admin/adminBrand";
	}
	
	@GetMapping(value = {"/admin/categories"})
	public String categoriesManagement(Model model) {
		model.addAttribute("categories", categoryService.getAllCategory());
		return "admin/adminCategory";
	}
	
	@PostMapping(value = {"/addProduct"})
	public String addProduct(
		    @RequestParam String productName,
		    @RequestParam int productPrice,
		    @RequestParam String productDescription,
		    @RequestParam("imageFiles") MultipartFile[] imageFiles,
		    @RequestParam int productBrand,
		    @RequestParam int productCategory,
		    @RequestParam("values") String values,
		    @RequestParam String productState,
		    @RequestParam String productColors,
		    @RequestParam String productSupples
		) throws Exception {
		    Brand brand = brandService.getBrandById(productBrand);
		    Category category = categoryService.getCategoryById(productCategory);
		    
		    File staticFolder = ResourceUtils.getFile("classpath:" + uploadDirectory);
		    String absolutePath = staticFolder.getAbsolutePath();

		    String imageUrls = "";
		    for (MultipartFile file : imageFiles) {
		        if (!file.isEmpty()) {
		            String originalFilename = file.getOriginalFilename();
		            String filename = originalFilename;

		            String fullPath = absolutePath + File.separator + filename;
		            Path uploadPath = Paths.get(fullPath);

		            if (Files.exists(uploadPath)) {
		                FileCopyUtils.copy(file.getBytes(), uploadPath.toFile());
		            } else {
		                Files.write(uploadPath, file.getBytes());
		            }

		            String imageUrl = "/uploads/" + filename;
		            imageUrls += imageUrl + ";";
		        }
		    }

		    Product product = new Product();
		    product.setProductName(productName);
		    product.setPrice(productPrice);
		    product.setDescription(productDescription);
		    product.setImageLink(imageUrls);
		    product.setBrand(brand);
		    product.setCategory(category);
		    product.setColors(productColors);
		    product.setState(productState);
		    product.setSupples(productSupples);
		    product.setStatus(1);

		    productService.save(product);

		    String[] nameValuePairs = values.split(";");

		    for (String nameValuePair : nameValuePairs) {
		        String[] parts = nameValuePair.split("_");
		        String valueName = parts[0];
	            String valueIndex = parts[1];

	            Value value = new Value();
	            value.setValueName(valueName);
	            value.setValueIndex(valueIndex);
	            value.setProduct(product);

	            valueService.save(value);
		    }

		    return "redirect:/admin/products";
		}
	
	@PostMapping(value = {"/deleteProduct"})
	public String deleteProduct(@RequestParam int ProductID) {
		List<Value> valuesToDelete = valueService.getValuesByProductID(ProductID);

	    for (Value value : valuesToDelete) {
	        valueService.deleteById(value.getValueID());
	    }
		productService.deleteById(ProductID);
		return "redirect:/admin/products";
	}
	
	@PostMapping(value = {"/addBrand"})
	public String addBrand(@RequestParam("brandName") String brandName) {
		Brand brand = new Brand();
		
		brand.setBrandName(brandName);
		
		brandService.save(brand);
		
		return "redirect:/admin/brands";
	}
	
	@PostMapping(value = {"/renameBrand"})
	public String renameBrand(@RequestParam("brandId") int brandId, @RequestParam("newBrandName") String newBrandName) {
		Brand brand = brandService.getBrandById(brandId);
	    if (brand != null) {
	    	brand.setBrandName(newBrandName);
	    	brandService.save(brand);
	    }
	    return "redirect:/admin/brands";
	}
	
	@PostMapping(value = {"/deleteBrand"})
	public String deleteBrand(@RequestParam int BrandID) {
		brandService.deleteById(BrandID);
		return "redirect:/admin/brands";
	}
	
	@PostMapping(value = {"/addCategory"})
	public String addCategory(@RequestParam("categoryName") String categoryName) {
		Category category = new Category();
		
		category.setCategoryName(categoryName);
		
		categoryService.save(category);
		
		return "redirect:/admin/categories";
	}
	
	@PostMapping(value = {"/renameCategory"})
	public String renameCategory(@RequestParam("categoryId") int categoryId, @RequestParam("newCategoryName") String newCategoryName) {
	    Category category = categoryService.getCategoryById(categoryId);
	    if (category != null) {
	        category.setCategoryName(newCategoryName);
	        categoryService.save(category);
	    }
	    return "redirect:/admin/categories";
	}

	
	@PostMapping(value = {"/deleteCategory"})
	public String deleteCategory(@RequestParam int CategoryID) {
		categoryService.deleteById(CategoryID);
		return "redirect:/admin/categories";
	}
	
	@PostMapping(value = {"/filteraccount"})
	public String filterAccount(@RequestParam String type) {
		
		return "redirect:/admin/listaccount?page=1&type=" + type;
	}
	
	
	@GetMapping("/admin/listaccount")
	public String showListAccount(
			@RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "type", defaultValue = "all") String type,
            Model model) {
		
		int n = 10;
		
		if(type.equals("all")) {
			List<AppUser> list = userService.getLimit(page*n-n, n);
		
			model.addAttribute("list", list);
			
			model.addAttribute("pre", page-1);
			model.addAttribute("size", list.size());
			model.addAttribute("counter", new Counter());
			model.addAttribute("title", "Tất cả tài khoản");
			return "admin/listaccount";
		}
		else {
			if(type.equals("user")) {
				List<UserRole> l = userRoleRepository.getLimitUser(page*n-n, n);
				
				List<AppUser> list = new ArrayList<>();
				
				for(UserRole r : l) {
					list.add(r.getUser());
				}
						
				model.addAttribute("list", list);
				
				model.addAttribute("pre", page-1);
				model.addAttribute("size", list.size());
				model.addAttribute("counter", new Counter());
				model.addAttribute("title", "Tài khoản User");
				return "admin/listaccount";
			}
			
			
		}
		
		List<UserRole> l = userRoleRepository.getLimitAdmin(page*n-n, n);
		
		List<AppUser> list = new ArrayList<>();
		
		for(UserRole r : l) {
			list.add(r.getUser());
		}
				
		model.addAttribute("list", list);
		
		model.addAttribute("pre", page-1);
		model.addAttribute("size", list.size());
		model.addAttribute("counter", new Counter());
		model.addAttribute("title", "Tài khoản Admin");
		
		
		return "admin/listaccount";
		
	}
	
	
	
	

	@GetMapping(value = {"/admin/orders"})
	public String ordersManagement(
			@RequestParam(name = "status", required = false) Integer status,
            @RequestParam(name = "keyword", required = false) String keyword,
            Model model) {
		
		List<Order> orders;

	    if (status != null) {
	        orders = orderService.getOrdersByStatus(status);
	    } else if (keyword != null) {
	        orders = orderService.searchOrders(keyword);
	    } else {
	        orders = orderService.getAllOrders();
	    }
	    
	    model.addAttribute("orders", orders);
		
		return "admin/ordersManagement";
	}
	
	@PostMapping("/admin/orders/update-status")
	public String updateOrderStatus(@RequestParam("orderid") int orderId,
	                                @RequestParam("status") int status) {
	    Order order = orderService.getOrderById(orderId);
	    order.setStatus(status);
	    orderService.saveOrder(order);
	    return "redirect:/admin/orders";
	}
	
	@GetMapping("/admin/accountdetail")
	public String showAccountDetail(@RequestParam("id") int id, Model model) {
		
		
		model.addAttribute("counter", new Counter());
		
		AppUser user  = userService.getUserById(id);
		
		List<UserRole> list = userRoleRepository.getRole(id);
		
		model.addAttribute("user", user);
		model.addAttribute("list", list);
		
		return "admin/accountdetail";
	}
	
	@PostMapping("/deleterole")
	public String deleteRole(@RequestParam("userid") int userid,@RequestParam("roleid") int roleid , RedirectAttributes redirectAttributes) {
		 userRoleRepository.deleteById(roleid);
		 redirectAttributes.addFlashAttribute("message", "Đã xóa role thành công");
		 return "redirect:/admin/accountdetail?id=" + userid;
	}
	
	
	@PostMapping("/addrole")
	public String addRole(@RequestParam("userid") int userid,@RequestParam("type") int type , RedirectAttributes redirectAttributes) {
		 
		UserRole tmp = userRoleRepository.check(userid, type);
		
		if(tmp != null) {
			 redirectAttributes.addFlashAttribute("message", "Role đã tồn tại");
			 return "redirect:/admin/accountdetail?id=" + userid;
		}
		
		UserRole newRole = new UserRole();
		
		newRole.setUser(userService.getUserById(userid));
		newRole.setAppRole(roleRepository.findById(type));
		
		userRoleRepository.save(newRole);
		 redirectAttributes.addFlashAttribute("message", "Đã cấp role thành công");
		 return "redirect:/admin/accountdetail?id=" + userid;
	}
	
	@PostMapping("/searchemail")
	public String searchEmail(@RequestParam("email") String email, RedirectAttributes redirectAttributes) {
		
		AppUser user = userService.getUserByEmail(email);
		
		if(user == null) {
			redirectAttributes.addFlashAttribute("message", "Không tìm thấy tài khoản");
			return "redirect:/admin/listaccount?page=1&type=all";
		}
		
		return "redirect:/admin/accountdetail?id=" + user.getUserID();
		
	}
	
	@GetMapping(value = {"/admin/messages"})
	public String showMessage(@RequestParam("page") int page, Model model) {
		
		int n = 10;
		
		List<Message> list = mesRepository.getMessage(page*n-n, n);
		
		model.addAttribute("counter", new Counter());
		model.addAttribute("list", list);
		model.addAttribute("size", list.size());
		model.addAttribute("pre", page - 1);
		
		return "admin/messagemanagement";
	}
	
	@GetMapping(value = {"/admin/mesdetail"})
	public String showMessageDetail(@RequestParam("id") int id, Model model) {
		
		Message m = mesRepository.getById(id);
		model.addAttribute("mes",m);
	
		return "admin/mesdetail";
	}
	
	@PostMapping("/deletemes")
	public String deleteMes(@RequestParam("mesid") int mesid, @RequestParam("page") int page,RedirectAttributes redirectAttributes) {
		mesRepository.deleteById(mesid);
		redirectAttributes.addFlashAttribute("message","Đã xóa");
		return "redirect:/admin/messages?page="+page;
	}
	
	@GetMapping("/admin/statistics")
    public String statistics(Model model) {
    	
		long doanhthu = 0;
		long soluongsp = 0;
		long danhmucsp = 0;
		long soluongdonhang = 0;
		long soluonguser= 0 ;
		
		doanhthu = orderService.getTotal();
		soluongsp = productService.countProduct();
		danhmucsp = categoryService.countCategory();
		soluongdonhang = orderService.countOrder();
		soluonguser = userService.countUser();
		
		model.addAttribute("doanhthu", doanhthu);
		model.addAttribute("soluongsp", soluongsp);
		model.addAttribute("danhmucsp", danhmucsp);
		model.addAttribute("soluongdonhang", soluongdonhang);
		model.addAttribute("soluonguser", soluonguser);
		
    	
    	return "admin/statistics";
    }
	
	@PostMapping("/updateStatusProduct")
	public String updateStatusProduct(@RequestParam("ProductID") int proId, @RequestParam("status") int status) {
		
		Product pro = productService.getProductById(proId);
		pro.setStatus(status);
		productService.save(pro);
		
		return "redirect:/admin/products";
	}
	
}
