package com.cnjava.SpringBootProject.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.cnjava.SpringBootProject.Model.Card;

@Repository
public interface CardRepository  extends JpaRepository<Card, Integer>{

	@Query("SELECT c FROM Card c WHERE c.name= :name and c.numbercard= :numbercard and c.month= :month and c.year= :year and c.cvv= :cvv")
	Card checkCard(@Param("name") String name, @Param("numbercard") String numbercard, @Param("month") int month, @Param("year") int year, @Param("cvv") int cvv );
	
}
