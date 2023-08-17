package com.cnjava.SpringBootProject.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cnjava.SpringBootProject.Model.Order;
import com.cnjava.SpringBootProject.Repository.OrderRepository;

@Service
public class OrderService {

	@Autowired 
	private OrderRepository orderRepository;
	
	
	public void saveOrder(Order o) {
		orderRepository.save(o);
	}
	
	public Order getOrderByCode(String code) {
		return orderRepository.getByCode(code);
	}
	
}
