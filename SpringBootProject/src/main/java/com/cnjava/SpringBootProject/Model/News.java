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
@Table(name = "news")
public class News {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "newid")
	private int newid;
	
	@Column(name = "title")
	private String title;
	
	@Column(name = "thumbnail")
	private String thumbnail;
	
	@Column(name = "date")
	private String date;
	
	@Column(name = "filename")
	private String filename;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userid", nullable = false)
	private AppUser userid;

	public News() {
		super();
		// TODO Auto-generated constructor stub
	}

	public News(int newid, String title, String thumbnail, String date, String filename, AppUser userid) {
		super();
		this.newid = newid;
		this.title = title;
		this.thumbnail = thumbnail;
		this.date = date;
		this.filename = filename;
		this.userid = userid;
	}

	public int getNewid() {
		return newid;
	}

	public void setNewid(int newid) {
		this.newid = newid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public AppUser getUserid() {
		return userid;
	}

	public void setUserid(AppUser userid) {
		this.userid = userid;
	}

   
	
	
	
}
