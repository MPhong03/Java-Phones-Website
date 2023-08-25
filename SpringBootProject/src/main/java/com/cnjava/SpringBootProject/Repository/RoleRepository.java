package com.cnjava.SpringBootProject.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.cnjava.SpringBootProject.Model.Role;

public interface RoleRepository extends JpaRepository<Role, Integer> {

    @Query("SELECT r FROM Role r WHERE r.name = :name")
	Role findByName(@Param("name") String name);
}
