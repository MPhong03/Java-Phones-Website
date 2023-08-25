package com.cnjava.SpringBootProject.Model;

import java.time.LocalDateTime;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "User")
public class AppUser {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "userid")
	private int UserID;

	public int getUserID() {
		return UserID;
	}
	public void setUserID(int userID) {
		UserID = userID;
	}
	
	@Column(name = "email", length = 255, unique = true)
	private String Email;
	
	
	@Column(name = "username", length = 255)
	private String UserName;
	
	@Column(name = "password", length = 255)
	private String Password;
	
	
	@Column(name = "address", length = 255)
	private String Address;
	
	@Column(name = "phonenumber", length = 255)
	private String PhoneNumber;
	
	@Column(name = "isadmin")
	private boolean IsAdmin;
	
	@Column(name ="otp")
	private String otp;
	
	@Column(name="enable")
	private boolean enable;
	
	@Column(name ="otp_requested_time")
	private String otp_requested_time;
	
	@OneToMany(mappedBy = "user")
	private List<Comment> comments;

	public AppUser() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AppUser(int userID, String email, String userName, String password, String address, String phoneNumber,
			boolean isAdmin, String otp, boolean enable, String otp_requested_time, List<Comment> comments) {
		super();
		UserID = userID;
		Email = email;
		UserName = userName;
		Password = password;
		Address = address;
		PhoneNumber = phoneNumber;
		IsAdmin = isAdmin;
		this.otp = otp;
		this.enable = enable;
		this.otp_requested_time = otp_requested_time;
		this.comments = comments;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		UserName = userName;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public String getPhoneNumber() {
		return PhoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		PhoneNumber = phoneNumber;
	}
	public boolean isIsAdmin() {
		return IsAdmin;
	}
	public void setIsAdmin(boolean isAdmin) {
		IsAdmin = isAdmin;
	}
	public String getOtp() {
		return otp;
	}
	public void setOtp(String otp) {
		this.otp = otp;
	}
	public boolean isEnable() {
		return enable;
	}
	public void setEnable(boolean enable) {
		this.enable = enable;
	}
	public String getOtp_requested_time() {
		return otp_requested_time;
	}
	public void setOtp_requested_time(String otp_requested_time) {
		this.otp_requested_time = otp_requested_time;
	}
	public List<Comment> getComments() {
		return comments;
	}
	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	
	
	
}
