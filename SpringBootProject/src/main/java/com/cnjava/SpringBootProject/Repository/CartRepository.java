package com.cnjava.SpringBootProject.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cnjava.SpringBootProject.Model.Cart;

public interface CartRepository extends JpaRepository<Cart, Integer> {
	
}
