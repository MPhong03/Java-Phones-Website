package com.cnjava.SpringBootProject.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cnjava.SpringBootProject.Model.Brand;
import com.cnjava.SpringBootProject.Repository.BrandRepository;

@Service
public class BrandService {
	
	@Autowired
	private BrandRepository brandRepository;
	
	public void save(Brand b) {
		brandRepository.save(b);
	}
	
	public List<Brand> getAllBrand(){
		return brandRepository.findAll();
	}
	
	public Brand getBrandById(int id) {
		return brandRepository.findById(id).get();
	}
	
	public void deleteById(int id) {
		brandRepository.deleteById(id);
	}
}
