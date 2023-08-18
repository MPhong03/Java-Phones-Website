package com.cnjava.SpringBootProject.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.cnjava.SpringBootProject.Model.OrderDetail;

@Repository
public interface OrderDetailRepository extends  JpaRepository<OrderDetail, Integer>  {

	@Query("SELECT od FROM OrderDetail od WHERE od.orderid.orderid= :id")
	List<OrderDetail> getList(@Param("id") int id);
}
