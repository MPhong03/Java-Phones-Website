package com.cnjava.SpringBootProject.Model;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "Category")
public class Category {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "categoryid")
	private int CategoryID;
	
	@Column(name = "categoryname", length = 255)
	private String CategoryName;
	
	@OneToMany(mappedBy = "Category")
	private List<Product> products;

	public Category(int categoryID, String categoryName) {
		super();
		CategoryID = categoryID;
		CategoryName = categoryName;
	}
	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getCategoryID() {
		return CategoryID;
	}
	public void setCategoryID(int categoryID) {
		CategoryID = categoryID;
	}
	public String getCategoryName() {
		return CategoryName;
	}
	public void setCategoryName(String categoryName) {
		CategoryName = categoryName;
	}
	public List<Product> getProducts() {
		return products;
	}
	public void setProducts(List<Product> products) {
		this.products = products;
	}
	
}
