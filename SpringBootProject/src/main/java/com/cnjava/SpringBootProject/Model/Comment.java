package com.cnjava.SpringBootProject.Model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "comment")
public class Comment {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int commentid;
	
	private String commenttext;
	
	private String date;
	
	private int rate;
	
	@ManyToOne
	@JoinColumn(name = "productid")
	private Product product;
	
	@ManyToOne
	@JoinColumn(name = "userid")
	private AppUser user;

	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Comment(int commentid, String commenttext, String date, int rate, Product product, AppUser user) {
		super();
		this.commentid = commentid;
		this.commenttext = commenttext;
		this.rate = rate;
		this.product = product;
		this.user = user;
		this.date = date;
	}

	public int getCommentid() {
		return commentid;
	}

	public void setCommentid(int commentid) {
		this.commentid = commentid;
	}

	public String getCommenttext() {
		return commenttext;
	}

	public void setCommenttext(String commenttext) {
		this.commenttext = commenttext;
	}

	public int getRate() {
		return rate;
	}

	public void setRate(int rate) {
		this.rate = rate;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public AppUser getUser() {
		return user;
	}

	public void setUser(AppUser user) {
		this.user = user;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
	
}
