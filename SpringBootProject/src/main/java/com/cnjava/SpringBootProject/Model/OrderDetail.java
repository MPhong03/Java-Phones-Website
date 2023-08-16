package com.cnjava.SpringBootProject.Model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "OrderDetail")
public class OrderDetail {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "orderdetailid")
	private int orderdetailID;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "orderid", nullable = false)
	private Order orderid;
	

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "productid", nullable = false)
	private Product productid;
	
	@Column(name = "quantity")
	private int quantity;

	public OrderDetail() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OrderDetail(int orderdetailID, Order orderid, Product productid, int quantity) {
		super();
		this.orderdetailID = orderdetailID;
		this.orderid = orderid;
		this.productid = productid;
		this.quantity = quantity;
	}

	public int getOrderdetailID() {
		return orderdetailID;
	}

	public void setOrderdetailID(int orderdetailID) {
		this.orderdetailID = orderdetailID;
	}

	public Order getOrderid() {
		return orderid;
	}

	public void setOrderid(Order orderid) {
		this.orderid = orderid;
	}

	public Product getProductid() {
		return productid;
	}

	public void setProductid(Product productid) {
		this.productid = productid;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
	
	
	
}
