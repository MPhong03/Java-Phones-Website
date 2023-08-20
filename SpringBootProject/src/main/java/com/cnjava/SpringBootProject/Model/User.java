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
public class User {
	
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
	
	@Column(name ="otp_requested_time")
	private String otp_requested_time;
	
	@OneToMany(mappedBy = "user")
	private List<Comment> comments;
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(int userID, String userName, String password, String email, String address, String phoneNumber,
			boolean isAdmin) {
		super();
		
		UserID = userID;
		UserName = userName;
		Password = password;
		Email = email;
		Address = address;
		PhoneNumber = phoneNumber;
		IsAdmin = isAdmin;
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
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
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
	
	
	public String getOneTimePassword() {
		return otp;
	}
	public void setOneTimePassword(String oneTimePassword) {
		this.otp = oneTimePassword;
	}
	public String getOtpRequestedTime() {
		return otp_requested_time;
	}
	public void setOtpRequestedTime(String otpRequestedTime) {
		this.otp_requested_time = otpRequestedTime;
	}
	public List<Comment> getComments() {
		return comments;
	}
	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}
	
}
