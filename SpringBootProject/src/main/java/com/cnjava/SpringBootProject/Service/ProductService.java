package com.cnjava.SpringBootProject.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
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
	
	public Page<Product> getProductsPage(int page) {
        long totalProducts = productRepository.count();
        int pageSize = (int) Math.min(5, Math.max(1, totalProducts));

        Pageable pageable = PageRequest.of(page, pageSize);

        return productRepository.findAll(pageable);
    }
	
	public Page<Product> getProductsPageByBrand(int brandid, int page) {
        long totalProducts = productRepository.countByBrand(brandid);
        int pageSize = (int) Math.min(20, Math.max(1, totalProducts));

        Pageable pageable = PageRequest.of(page, pageSize);

        return productRepository.findByBrand(brandid, pageable);
    }
	
	public Page<Product> getProductsPageByCategory(int categoryid, int page) {
        long totalProducts = productRepository.countByCategory(categoryid);
        int pageSize = (int) Math.min(20, Math.max(1, totalProducts));

        Pageable pageable = PageRequest.of(page, pageSize);

        return productRepository.findByBrand(categoryid, pageable);
    }
	
}
