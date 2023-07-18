package com.cnjava.SpringBootProject.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cnjava.SpringBootProject.Model.Brand;
import com.cnjava.SpringBootProject.Model.Category;
import com.cnjava.SpringBootProject.Model.Product;
import com.cnjava.SpringBootProject.Service.BrandService;
import com.cnjava.SpringBootProject.Service.CategoryService;
import com.cnjava.SpringBootProject.Service.ProductService;

@Controller
public class AdminController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
    private BrandService brandService;

    @Autowired
    private CategoryService categoryService;
	
	@GetMapping(value = {"/admin/products"})
	public String productsManagement(Model model) {
		model.addAttribute("products", productService.getAllProduct());
		model.addAttribute("brands", brandService.getAllBrand());
		model.addAttribute("categories", categoryService.getAllCategory());
		return "admin/adminProduct";
	}
	
	@PostMapping(value = {"/addProduct"})
	public String addProduct(@RequestParam String productName,
            @RequestParam int productPrice,
            @RequestParam String productDescription,
            @RequestParam String productImageLink,
            @RequestParam int productBrand,
            @RequestParam int productCategory) {
		
		Brand brand = brandService.getBrandById(productBrand);
        Category category = categoryService.getCategoryById(productCategory);

        Product product = new Product();
        product.setProductName(productName);
        product.setPrice(productPrice);
        product.setDescription(productDescription);
        product.setImageLink(productImageLink);
        product.setBrand(brand);
        product.setCategory(category);

        productService.save(product);
		
		return "redirect:/admin/products";
	}
	
	@PostMapping(value = {"/deleteProduct"})
	public String deleteProduct(@RequestParam int productid) {
		productService.deleteById(productid);
		return "redirect:/admin/products";
	}
}
