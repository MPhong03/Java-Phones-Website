package com.cnjava.SpringBootProject.Model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "Product")
public class Product {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "productid")
	private int ProductID;
	
	@Column(name = "productname", length = 255)
	private String ProductName;
	
	@Column(name = "price")
	private int Price;
	
	@Column(name = "description", length = 255)
	private String Description;
	
	@Column(name = "imagelink", length = 255)
	private String ImageLink;
	
	@ManyToOne
	@JoinColumn(name = "categoryid")
	@Column(name = "categoryid")
	private int CategoryID;
	
	@ManyToOne
	@JoinColumn(name = "brandid")
	@Column(name = "brandid")
	private int BrandID;
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Product(int productID, String productName, int price, String description, String imageLink, int categoryID,
			int brandID) {
		super();
		ProductID = productID;
		ProductName = productName;
		Price = price;
		Description = description;
		ImageLink = imageLink;
		CategoryID = categoryID;
		BrandID = brandID;
	}
	public int getProductID() {
		return ProductID;
	}
	public void setProductID(int productID) {
		ProductID = productID;
	}
	public String getProductName() {
		return ProductName;
	}
	public void setProductName(String productName) {
		ProductName = productName;
	}
	public int getPrice() {
		return Price;
	}
	public void setPrice(int price) {
		Price = price;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	public String getImageLink() {
		return ImageLink;
	}
	public void setImageLink(String imageLink) {
		ImageLink = imageLink;
	}
	public int getCategoryID() {
		return CategoryID;
	}
	public void setCategoryID(int categoryID) {
		CategoryID = categoryID;
	}
	public int getBrandID() {
		return BrandID;
	}
	public void setBrandID(int brandID) {
		BrandID = brandID;
	}
	
	
}
