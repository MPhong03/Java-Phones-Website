package com.cnjava.SpringBootProject.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.cnjava.SpringBootProject.Model.Value;

@Repository
public interface ValueRepository extends JpaRepository<Value, Integer> {

}
