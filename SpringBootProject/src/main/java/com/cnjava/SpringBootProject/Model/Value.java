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
@Table(name = "productvalue")
public class Value {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "valueid")
	private int ValueID;
	
	@Column(name = "valuename")
	private String ValueName;
	
	@Column(name = "valueindex")
	private String ValueIndex;
	
	@ManyToOne
	@JoinColumn(name = "productid")
	private Product Product;
	
	public Value() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Value(int valueID, String valueName, String valueIndex, Product product) {
		super();
		ValueID = valueID;
		ValueName = valueName;
		ValueIndex = valueIndex;
		this.Product = product;
	}
	public int getValueID() {
		return ValueID;
	}
	public void setValueID(int valueID) {
		ValueID = valueID;
	}
	public String getValueName() {
		return ValueName;
	}
	public void setValueName(String valueName) {
		ValueName = valueName;
	}
	public String getValueIndex() {
		return ValueIndex;
	}
	public void setValueIndex(String valueIndex) {
		ValueIndex = valueIndex;
	}
	public Product getProduct() {
		return Product;
	}
	public void setProduct(Product product) {
		this.Product = product;
	}
	
	
}
