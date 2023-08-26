package com.cnjava.SpringBootProject.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.cnjava.SpringBootProject.Model.Message;

@Repository
public interface MessageRepository extends JpaRepository<Message, Integer> {
		
	@Query(nativeQuery = true, value ="Select * from message ORDER BY mesid DESC limit :page,:number")
	List<Message> getMessage(@Param("page") int page, @Param("number") int n);
	
	@Query("SELECT m FROM Message m WHERE m.mesid=:id")
	Message getById(@Param("id") int id);
}
