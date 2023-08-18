package com.cnjava.SpringBootProject.Service;

import java.util.List;
import java.util.Optional;

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
	
	public OrderDetail getDetailById(int id) {
		Optional<OrderDetail> getDetail =  orderdetailRes.findById(id);
		return getDetail.get();
	}
	
	public List<OrderDetail> getList(int id){
		return orderdetailRes.getList(id);
	}
}
