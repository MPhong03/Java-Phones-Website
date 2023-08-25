package com.cnjava.SpringBootProject.Model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "message")
public class Message {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "mesid")
	private int mesid;
	
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "email")
	private String email;
	
	
	@Column(name = "title")
	private String title;
	
	@Column(name = "text")
	private String text;
	
	@Column(name = "date")
	private String date;

	public Message() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Message(int mesid, String name, String email, String title, String text, String date) {
		super();
		this.mesid = mesid;
		this.name = name;
		this.email = email;
		this.title = title;
		this.text = text;
		this.date = date;
	}

	public int getMesid() {
		return mesid;
	}

	public void setMesid(int mesid) {
		this.mesid = mesid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
	
	
	
}
