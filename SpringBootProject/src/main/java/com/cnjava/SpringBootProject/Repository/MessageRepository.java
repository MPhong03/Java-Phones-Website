package com.cnjava.SpringBootProject.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.cnjava.SpringBootProject.Model.Message;

@Repository
public interface MessageRepository extends JpaRepository<Message, Integer> {
	
}