package com.cnjava.SpringBootProject.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.cnjava.SpringBootProject.Model.Value;

@Repository
public interface ValueRepository extends JpaRepository<Value, Integer> {
	@Query("SELECT u FROM Value u WHERE u.Product.ProductID = ?1")
	List<Value> getValuesByProductID(int ProductID);
}
