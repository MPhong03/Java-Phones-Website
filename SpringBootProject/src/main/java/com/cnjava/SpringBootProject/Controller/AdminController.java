package com.cnjava.SpringBootProject.Controller;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cnjava.SpringBootProject.Model.Brand;
import com.cnjava.SpringBootProject.Model.Category;
import com.cnjava.SpringBootProject.Model.Product;
import com.cnjava.SpringBootProject.Model.Value;
import com.cnjava.SpringBootProject.Service.BrandService;
import com.cnjava.SpringBootProject.Service.CategoryService;
import com.cnjava.SpringBootProject.Service.ProductService;
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
    
    private final String uploadDirectory = "static/uploads/";
    	
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

}
