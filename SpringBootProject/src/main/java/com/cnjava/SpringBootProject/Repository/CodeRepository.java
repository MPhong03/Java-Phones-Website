package com.cnjava.SpringBootProject.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.cnjava.SpringBootProject.Model.Code;


@Repository
public interface CodeRepository extends JpaRepository<Code, Integer> {

	@Query("SELECT c FROM Code c WHERE c.codetext= :text")
	Code getCodeByCodeText(@Param("text") String text);
}
