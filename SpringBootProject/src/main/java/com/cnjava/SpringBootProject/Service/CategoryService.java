package com.cnjava.SpringBootProject.Service;

import java.util.List;

import com.cnjava.SpringBootProject.Model.Category;
import com.cnjava.SpringBootProject.Repository.CategoryRepository;

public class CategoryService {
	private CategoryRepository categoryRepository;
	
	public void save(Category category) {
		categoryRepository.save(category);
	}
	
	public List<Category> getAllCategory(){
		return categoryRepository.findAll();
	}
	
	public Category getCategoryById(int id) {
		return categoryRepository.findById(id).get();
	}
	
	public void deleteById(int id) {
		categoryRepository.deleteById(id);
	}
}
