package com.cnjava.SpringBootProject.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cnjava.SpringBootProject.Model.OrderDetail;
import com.cnjava.SpringBootProject.Repository.OrderDetailRepository;

@Service
public class OrderDetailService {

	@Autowired
	private OrderDetailRepository orderdetailRes;
	
	
	public void saveDetail(OrderDetail od) {
		orderdetailRes.save(od);
	}
}
