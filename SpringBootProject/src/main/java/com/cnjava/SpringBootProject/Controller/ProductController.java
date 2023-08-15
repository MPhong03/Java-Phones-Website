package com.cnjava.SpringBootProject.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.cnjava.SpringBootProject.Model.Product;
import com.cnjava.SpringBootProject.Service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@GetMapping(value = {"/", "/home"})
	public String index(Model model) {
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

        return "user/products";
    }
	
	@GetMapping("/brand/{brandid}")
	public String getProductsPageByBrand(@PathVariable("brandid") int brandId, @RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "none") String sortingOptions, Model model) {
		Page<Product> productPage = productService.getProductsPageSortedByBrand(brandId, page, sortingOptions);

		model.addAttribute("products", productPage.getContent());
        model.addAttribute("currentPage", productPage.getNumber());
        model.addAttribute("totalPages", productPage.getTotalPages());
        model.addAttribute("sortingOptions", sortingOptions);
        
        return "user/products";
	}
	
	@GetMapping("/category/{categoryid}")
	public String getProductsPageByCategory(@PathVariable("categoryid") int categoryId, @RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "none") String sortingOptions, Model model) {
		Page<Product> productPage = productService.getProductsPageSortedByCategory(categoryId, page, sortingOptions);

		model.addAttribute("products", productPage.getContent());
        model.addAttribute("currentPage", productPage.getNumber());
        model.addAttribute("totalPages", productPage.getTotalPages());
        model.addAttribute("sortingOptions", sortingOptions);

        return "user/products";
	}
	
	@GetMapping("/searching")
	public String search(@RequestParam("keyword") String keyword, Model model, @RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "none") String sortingOptions) {
		Page<Product> productPage = productService.getProductsPageSortedByKeyword(keyword, page, sortingOptions);
		
		model.addAttribute("products", productPage.getContent());
        model.addAttribute("currentPage", productPage.getNumber());
        model.addAttribute("totalPages", productPage.getTotalPages());
        model.addAttribute("sortingOptions", sortingOptions);
		
		return "/user/products";
	}
	
}
