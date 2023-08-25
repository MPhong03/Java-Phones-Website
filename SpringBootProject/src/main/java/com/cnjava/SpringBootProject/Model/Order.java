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
@Table(name = "Orders")
public class Order {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "orderid")
	private int orderid;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userid", nullable = false)
	private AppUser userid;
	
	@Column(name = "date")
	private String date;
	
	@Column(name = "discount", nullable = true)
	private String discount;
	
	
	@Column(name = "total")
	private int total;
	
	@Column(name = "status")
	private int status;
	
	
	
	@Column(name ="fullname")
	private String fullname;
	
	@Column(name ="email")
	private String email;
	
	@Column(name ="phonenumber")
	private String phonenumber;
	
	@Column(name ="province")
	private String province;
	
	@Column(name ="address")
	private String address;
	

	
	@Column(name = "code")
	private String code;

	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Order(int orderid, AppUser userid, String date, String discount, int total, int status, String fullname,
			String email, String phonenumber, String province, String address, String code) {
		super();
		this.orderid = orderid;
		this.userid = userid;
		this.date = date;
		this.discount = discount;
		this.total = total;
		this.status = status;
		this.fullname = fullname;
		this.email = email;
		this.phonenumber = phonenumber;
		this.province = province;
		this.address = address;
		this.code = code;
	}

	public int getOrderid() {
		return orderid;
	}

	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}

	public AppUser getUserid() {
		return userid;
	}

	public void setUserid(AppUser userid) {
		this.userid = userid;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getDiscount() {
		return discount;
	}

	public void setDiscount(String discount) {
		this.discount = discount;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	
	
}
