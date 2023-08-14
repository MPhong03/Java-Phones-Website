package com.cnjava.SpringBootProject.Model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "Code")
public class Code {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "codeid")
	private int codeid;
	
	@Column(name="codetext", unique = true)
	private String codetext;
	
	@Column(name="price")
	private int price;
	
	@Column(name="status")
	private int status;

	public Code() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Code(int codeid, String codetext, int price, int status) {
		super();
		this.codeid = codeid;
		this.codetext = codetext;
		this.price = price;
		this.status = status;
	}

	public int getCodeid() {
		return codeid;
	}

	public void setCodeid(int codeid) {
		this.codeid = codeid;
	}

	public String getCodetext() {
		return codetext;
	}

	public void setCodetext(String codetext) {
		this.codetext = codetext;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	
	
}
