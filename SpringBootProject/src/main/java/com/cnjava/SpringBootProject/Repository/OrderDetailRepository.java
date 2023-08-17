package com.cnjava.SpringBootProject.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.cnjava.SpringBootProject.Model.OrderDetail;

@Repository
public interface OrderDetailRepository extends  JpaRepository<OrderDetail, Integer>  {

}
