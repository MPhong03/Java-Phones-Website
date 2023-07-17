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
@Table(name = "Brand")
public class Brand {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "brandid")
	private int BrandID;
	
	@Column(name = "brandname", length = 255)
	private String BrandName;
	
	@OneToMany(mappedBy = "brandid")
	private List<Product> products;

	public Brand() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Brand(int brandID, String brandName) {
		super();
		BrandID = brandID;
		BrandName = brandName;
	}

	public int getBrandID() {
		return BrandID;
	}

	public void setBrandID(int brandID) {
		BrandID = brandID;
	}

	public String getBrandName() {
		return BrandName;
	}

	public void setBrandName(String brandName) {
		BrandName = brandName;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}
	
	
}
