package com.cnjava.SpringBootProject.Service;

import java.util.List;

import com.cnjava.SpringBootProject.Model.Brand;
import com.cnjava.SpringBootProject.Repository.BrandRepository;

public class BrandService {
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
