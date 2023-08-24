package com.cnjava.SpringBootProject.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.cnjava.SpringBootProject.Model.Admin;

public interface AdminRepository extends JpaRepository<Admin, Integer> {

//	@Query("SELECT a FROM admins a WHERE a.email = ?1")
	Admin findByEmail(String email);
}
