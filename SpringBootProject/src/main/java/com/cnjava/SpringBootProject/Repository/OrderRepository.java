package com.cnjava.SpringBootProject.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.cnjava.SpringBootProject.Model.Order;

@Repository
public interface OrderRepository extends JpaRepository<Order, Integer> {

	
	@Query("SELECT or FROM Order or WHERE or.code= :code")
	Order getByCode(@Param("code") String code);
	
	
	@Query(nativeQuery = true, value = "SELECT * FROM orders where userid= :userid limit :offset,:number")
	List<Order> getListOrder(@Param("userid") int userid, @Param("offset") int offset, @Param("number") int number);
}
