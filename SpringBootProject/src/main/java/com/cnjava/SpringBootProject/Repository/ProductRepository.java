package com.cnjava.SpringBootProject.Repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.cnjava.SpringBootProject.Model.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {
    @Query("SELECT p FROM Product p WHERE p.Brand.BrandID = :brandid")
    Page<Product> findByBrand(@Param("brandid") int brandid, Pageable pageable);

    @Query("SELECT COUNT(p) FROM Product p WHERE p.Brand.BrandID = :brandid")
    long countByBrand(@Param("brandid") int brandid);

    @Query("SELECT p FROM Product p WHERE p.Category.CategoryID = :categoryid")
    Page<Product> findByCategory(@Param("categoryid") int categoryid, Pageable pageable);

    @Query("SELECT COUNT(p) FROM Product p WHERE p.Category.CategoryID = :categoryid")
    long countByCategory(@Param("categoryid") int categoryid);
    
    @Query("SELECT p FROM Product p WHERE p.Brand.BrandID = :brandid ORDER BY p.ProductID DESC")
    Page<Product> findTop5ByBrand(@Param("brandid") int brandid, Pageable pageable);

    @Query("SELECT p FROM Product p WHERE p.Category.CategoryID = :categoryid ORDER BY p.ProductID DESC")
    Page<Product> findTop5ByCategory(@Param("categoryid") int categoryid, Pageable pageable);
}
