package com.cnjava.SpringBootProject.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.cnjava.SpringBootProject.Model.Brand;
import com.cnjava.SpringBootProject.Model.Category;
import com.cnjava.SpringBootProject.Model.Product;
import com.cnjava.SpringBootProject.Service.BrandService;
import com.cnjava.SpringBootProject.Service.CategoryService;
import com.cnjava.SpringBootProject.Service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private BrandService brandService;
	
	@GetMapping("/products")
	public String getProductsPage(@RequestParam(defaultValue = "0") int page, Model model) {
        Page<Product> productPage = productService.getProductsPage(page);
        List<Category> categories = categoryService.getAllCategory();
        List<Brand> brands = brandService.getAllBrand();

        // Set model attributes
        model.addAttribute("products", productPage.getContent());
        model.addAttribute("currentPage", productPage.getNumber());
        model.addAttribute("totalPages", productPage.getTotalPages());
        model.addAttribute("categories", categories);
        model.addAttribute("brands", brands);

        return "user/products";
    }
	
	@GetMapping("/brand/{brandid}")
	public String getProductsPageByBrand(@PathVariable("brandid") int brandId, @RequestParam(defaultValue = "0") int page, Model model) {
		Page<Product> productPage = productService.getProductsPageByBrand(brandId, page);
		List<Category> categories = categoryService.getAllCategory();
		List<Brand> brands = brandService.getAllBrand();

		model.addAttribute("products", productPage.getContent());
        model.addAttribute("currentPage", productPage.getNumber());
        model.addAttribute("totalPages", productPage.getTotalPages());
        model.addAttribute("categories", categories);
        model.addAttribute("brands", brands);

        return "user/products";
	}
	
	@GetMapping("/category/{categoryid}")
	public String getProductsPageByCategory(@PathVariable("categoryid") int categoryId, @RequestParam(defaultValue = "0") int page, Model model) {
		Page<Product> productPage = productService.getProductsPageByCategory(categoryId, page);
		List<Category> categories = categoryService.getAllCategory();
		List<Brand> brands = brandService.getAllBrand();

		model.addAttribute("products", productPage.getContent());
        model.addAttribute("currentPage", productPage.getNumber());
        model.addAttribute("totalPages", productPage.getTotalPages());
        model.addAttribute("categories", categories);
        model.addAttribute("brands", brands);

        return "user/products";
	}
	
}
