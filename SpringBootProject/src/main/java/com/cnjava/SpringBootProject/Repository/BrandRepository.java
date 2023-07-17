package com.cnjava.SpringBootProject.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.cnjava.SpringBootProject.Model.Brand;

@Repository
public interface BrandRepository extends JpaRepository<Brand, Integer> {

}
