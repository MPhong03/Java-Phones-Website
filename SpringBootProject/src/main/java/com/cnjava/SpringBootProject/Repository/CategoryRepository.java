package com.cnjava.SpringBootProject.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.cnjava.SpringBootProject.Model.Category;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Integer> {

	
	@Query("SELECT count(c) from Category c")
	long countCategory();
}
