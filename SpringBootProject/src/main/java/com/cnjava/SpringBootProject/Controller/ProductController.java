package com.cnjava.SpringBootProject.Controller;

import java.security.Principal;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cnjava.SpringBootProject.Model.Comment;
import com.cnjava.SpringBootProject.Model.Product;
import com.cnjava.SpringBootProject.Model.AppUser;
import com.cnjava.SpringBootProject.Model.Value;
import com.cnjava.SpringBootProject.Repository.CommentRepository;
import com.cnjava.SpringBootProject.Repository.UserRepository;
import com.cnjava.SpringBootProject.Repository.UserRoleRepository;
import com.cnjava.SpringBootProject.Service.BrandService;
import com.cnjava.SpringBootProject.Service.CategoryService;
import com.cnjava.SpringBootProject.Service.ProductService;
import com.cnjava.SpringBootProject.Service.ValueService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ValueService valueService;
	
	@Autowired
	private BrandService brandService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private CommentRepository commentRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private UserRoleRepository userRoleRepository;
	
	@GetMapping(value = {"/", "/home"})
	public String index(Model model,Principal principal,HttpSession session) {
		
		if(principal != null) {
			 String email = principal.getName();
			 
			 System.out.println(email);
			 
			 AppUser user = userRepository.findByEmail(email);
			 
			 session.setAttribute("email", user.getEmail());
			 session.setAttribute("username", user.getUserName());
		}
		
		Page<Product> samsungProduct = productService.getTop5ProductsByBrand(1);
		Page<Product> appleProduct = productService.getTop5ProductsByBrand(2);
		
		model.addAttribute("samsung", samsungProduct.getContent());
		model.addAttribute("apple", appleProduct.getContent());
		
		return "index.html";
	}
	
	@GetMapping("/products")
	public String getProductsPage(@RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "none") String sortingOptions, Model model) {
        Page<Product> productPage = productService.getProductsPageSorted(page, sortingOptions);

        model.addAttribute("products", productPage.getContent());
        model.addAttribute("currentPage", productPage.getNumber());
        model.addAttribute("totalPages", productPage.getTotalPages());
        model.addAttribute("sortingOptions", sortingOptions);
        model.addAttribute("webtitle", "Tất cả sản phẩm");

        return "products";
    }
	
	@GetMapping("/brand/{brandid}")
	public String getProductsPageByBrand(@PathVariable("brandid") int brandId, @RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "none") String sortingOptions, Model model) {
		Page<Product> productPage = productService.getProductsPageSortedByBrand(brandId, page, sortingOptions);

		model.addAttribute("products", productPage.getContent());
        model.addAttribute("currentPage", productPage.getNumber());
        model.addAttribute("totalPages", productPage.getTotalPages());
        model.addAttribute("sortingOptions", sortingOptions);
        model.addAttribute("webtitle", brandService.getBrandById(brandId).getBrandName());
        
        return "products";
	}
	
	@GetMapping("/category/{categoryid}")
	public String getProductsPageByCategory(@PathVariable("categoryid") int categoryId, @RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "none") String sortingOptions, Model model) {
		Page<Product> productPage = productService.getProductsPageSortedByCategory(categoryId, page, sortingOptions);

		model.addAttribute("products", productPage.getContent());
        model.addAttribute("currentPage", productPage.getNumber());
        model.addAttribute("totalPages", productPage.getTotalPages());
        model.addAttribute("sortingOptions", sortingOptions);
        model.addAttribute("webtitle", categoryService.getCategoryById(categoryId).getCategoryName());

        return "products";
	}
	
	@GetMapping("/searching")
	public String search(@RequestParam("keyword") String keyword, Model model, @RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "none") String sortingOptions) {
		Page<Product> productPage = productService.getProductsPageSortedByKeyword(keyword, page, sortingOptions);
		
		model.addAttribute("products", productPage.getContent());
        model.addAttribute("currentPage", productPage.getNumber());
        model.addAttribute("totalPages", productPage.getTotalPages());
        model.addAttribute("sortingOptions", sortingOptions);
        model.addAttribute("webtitle", keyword);
		
		return "products";
	}
	
	@GetMapping("/product/{id}")
	public String productDetail(@PathVariable("id") int id, Model model, HttpSession session) {
		Product product = productService.getProductById(id);
		List<Value> values = valueService.getValuesByProductID(id);
		List<Comment> comments = commentRepository.findAllCommentsByProductID(id);
		
		Integer totalrate = 0;
		
		for(Comment comment: comments) {
			totalrate += comment.getRate();
		}
		
		String email = (String)session.getAttribute("email");
		
		AppUser user = userRepository.findByEmail(email);
		
		model.addAttribute("product", product);
		model.addAttribute("performances", values);
		model.addAttribute("comments", comments);
		model.addAttribute("email", session.getAttribute("email"));
		
		if(comments.size() != 0) {
			model.addAttribute("totalrate", Math.round(totalrate / comments.size()));
		} else {
			model.addAttribute("totalrate", 0);
		}
		
		
		List<String> imageLinks = Arrays.asList(product.getImageLink().split(";"));

	    model.addAttribute("imageLinks", imageLinks);
	    
	    if(user!= null) {
		    List<String> role = userRoleRepository.getRoleNames(user.getUserID());
		    
		    String namerole = "ROLE_USER";
			
			for(String s : role) {
				if(s.equals("ROLE_ADMIN")) {
					namerole = "ROLE_ADMIN";
				}
			}
	
			model.addAttribute("namerole", namerole);
	    }
	    
       
	 
		return "product";
	}
	
	@PostMapping("/submit-comment")
    public String submitComment(@RequestParam("commentText") String commentText,
                                @RequestParam("rating") int rating,
                                @RequestParam("productId") int productId,
                                HttpSession session) {
		
        AppUser user = userRepository.findByEmail((String) session.getAttribute("email"));
        Product product = productService.getProductById(productId);

        // Create a new Comment object and save it
        Comment comment = new Comment();
        comment.setCommenttext(commentText);
        comment.setRate(rating);
        comment.setUser(user);
        comment.setProduct(product);
        comment.setDate(LocalDate.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy")));
        commentRepository.save(comment);

        return "redirect:/product/" + productId;
    }
}
