package com.cnjava.SpringBootProject.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.cnjava.SpringBootProject.Model.News;

public interface NewsRepository extends JpaRepository<News, Integer> {
	
	@Query("SELECT n From News n WHERE n.filename=:name")
	News getByFileName(@Param("name") String name);
	
	@Query(nativeQuery = true, value = "Select * FROM News p ORDER BY newid DESC limit :page,:number ")
	List<News> getList (@Param("page") int offset, @Param("number") int num);
}
