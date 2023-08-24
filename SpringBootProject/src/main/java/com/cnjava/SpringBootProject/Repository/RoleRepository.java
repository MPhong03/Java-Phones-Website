package com.cnjava.SpringBootProject.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.cnjava.SpringBootProject.Model.Role;

public interface RoleRepository extends JpaRepository<Role, Integer> {

//	@Query("SELECT r FROM roles r WHERE r.name = ?1")
	Role findByName(String name);
}
