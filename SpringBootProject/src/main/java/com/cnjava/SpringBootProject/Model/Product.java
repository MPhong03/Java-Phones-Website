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
	
	@Column(name = "description", length = 2000)
	private String Description;
	
	@Column(name = "imagelink", length = 255)
	private String ImageLink;
	
	@ManyToOne
	@JoinColumn(name = "categoryid")
	private Category Category;
	
	@ManyToOne
	@JoinColumn(name = "brandid")
	private Brand Brand;
	
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Product(int productID, String productName, int price, String description, String imageLink,
			com.cnjava.SpringBootProject.Model.Category category, com.cnjava.SpringBootProject.Model.Brand brand) {
		super();
		ProductID = productID;
		ProductName = productName;
		Price = price;
		Description = description;
		ImageLink = imageLink;
		Category = category;
		Brand = brand;
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

	public Category getCategory() {
		return Category;
	}

	public void setCategory(Category category) {
		Category = category;
	}

	public Brand getBrand() {
		return Brand;
	}

	public void setBrand(Brand brand) {
		Brand = brand;
	}
	
	public void addImageUrl(String imageUrl) {
        if (this.ImageLink == null || this.ImageLink.isEmpty()) {
            this.ImageLink = imageUrl;
        } else {
            this.ImageLink += ";" + imageUrl;
        }
    }
	
	public String getFirstImageUrl() {
        if (this.ImageLink != null && !this.ImageLink.isEmpty()) {
            String[] urls = this.ImageLink.split(";");
            if (urls.length > 0) {
                return urls[0];
            }
        }
        return null;
    }
	
}
