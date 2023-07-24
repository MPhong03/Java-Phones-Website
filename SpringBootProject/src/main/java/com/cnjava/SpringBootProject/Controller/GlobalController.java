package com.cnjava.SpringBootProject.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.cnjava.SpringBootProject.Service.BrandService;
import com.cnjava.SpringBootProject.Service.CategoryService;
import com.cnjava.SpringBootProject.Model.Category;
import com.cnjava.SpringBootProject.Model.Brand;

@ControllerAdvice
public class GlobalController {
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private BrandService brandService;
	
	//	Biến cục bộ
	@ModelAttribute
	public void addCommonAttributes(Model model) {
		List<Category> categories = categoryService.getAllCategory();
        List<Brand> brands = brandService.getAllBrand();
        model.addAttribute("categories", categories);
        model.addAttribute("brands", brands);
	}
}
