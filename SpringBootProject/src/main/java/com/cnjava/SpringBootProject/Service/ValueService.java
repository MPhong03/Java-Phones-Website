package com.cnjava.SpringBootProject.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cnjava.SpringBootProject.Model.Value;
import com.cnjava.SpringBootProject.Repository.ValueRepository;

@Service
public class ValueService {
	
	@Autowired
	private ValueRepository valueRepository;
	
	public void save(Value value) {
		valueRepository.save(value);
	}
	
	public List<Value> getAllValue(){
		return valueRepository.findAll();
	}
	
	public Value getValueById(int id) {
		return valueRepository.findById(id).get();
	}
	
	public void deleteById(int id) {
		valueRepository.deleteById(id);
	}
	
	public List<Value> getValuesByProductID(int productid) {
		return valueRepository.getValuesByProductID(productid);
	}
}
