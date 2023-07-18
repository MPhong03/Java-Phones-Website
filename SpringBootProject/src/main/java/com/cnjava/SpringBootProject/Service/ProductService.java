package com.cnjava.SpringBootProject.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cnjava.SpringBootProject.Model.Product;
import com.cnjava.SpringBootProject.Repository.ProductRepository;

@Service
public class ProductService {
	@Autowired
	private ProductRepository productRepository;
	
	public void save(Product b) {
		productRepository.save(b);
	}
	
	public List<Product> getAllProduct(){
		return productRepository.findAll();
	}
	
	public Product getProductById(int id) {
		return productRepository.findById(id).get();
	}
	
	public void deleteById(int id) {
		productRepository.deleteById(id);
	}
	
}
