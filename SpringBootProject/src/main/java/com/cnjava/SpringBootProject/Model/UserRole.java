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
import jakarta.persistence.UniqueConstraint;

@Entity
@Table(name = "userrole", //
uniqueConstraints = { //
        @UniqueConstraint(name = "USER_ROLE_UK", columnNames = { "userid", "roleid" }) })
public class UserRole {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "userid", nullable = false)
	private AppUser user;
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "roleid", nullable = false)
    private Role appRole;

	public UserRole() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UserRole(int id, AppUser user, Role appRole) {
		super();
		this.id = id;
		this.user = user;
		this.appRole = appRole;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public AppUser getUser() {
		return user;
	}

	public void setUser(AppUser user) {
		this.user = user;
	}

	public Role getAppRole() {
		return appRole;
	}

	public void setAppRole(Role appRole) {
		this.appRole = appRole;
	}
	
	
	
}
