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
@Table(name = "Cart")
public class Cart {


	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "cartid")
	private int cartID;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userid", nullable = false)
	private User userid;
	
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "productid", nullable = false)
	private Product productid;
	
	@Column(name="quantity")
	private int quantity;
	
	@Column(name = "price")
	private int price;

	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Cart(int cartID, User userid, Product productid, int quantity, int price) {
		super();
		this.cartID = cartID;
		this.userid = userid;
		this.productid = productid;
		this.quantity = quantity;
		this.price = price;
	}

	public int getCartID() {
		return cartID;
	}

	public void setCartID(int cartID) {
		this.cartID = cartID;
	}

	public User getUserid() {
		return userid;
	}

	public void setUserid(User userid) {
		this.userid = userid;
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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
	
}
