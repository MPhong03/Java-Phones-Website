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
    
    @Query("SELECT p FROM Product p WHERE p.Brand.BrandID = :brandid  and p.Category.CategoryID=:categoryid")
    Page<Product> findByBrandCategory(@Param("brandid") int brandid,@Param("categoryid") int categoryid,Pageable pageable);

    @Query("SELECT COUNT(p) FROM Product p WHERE p.Brand.BrandID = :brandid")
    long countByBrand(@Param("brandid") int brandid);
    
    @Query("SELECT COUNT(p) FROM Product p WHERE p.Brand.BrandID = :brandid and p.Category.CategoryID=:categoryid")
    long countByBrandCategory(@Param("brandid") int brandid,@Param("categoryid") int categoryid);

    @Query("SELECT p FROM Product p WHERE p.Category.CategoryID = :categoryid")
    Page<Product> findByCategory(@Param("categoryid") int categoryid, Pageable pageable);
    
    @Query("SELECT p FROM Product p WHERE p.Category.CategoryID = :categoryid and p.Brand.BrandID=:brandid")
    Page<Product> findByCategoryBrand(@Param("categoryid") int categoryid,@Param("brandid") int brandid, Pageable pageable);

    @Query("SELECT COUNT(p) FROM Product p WHERE p.Category.CategoryID = :categoryid")
    long countByCategory(@Param("categoryid") int categoryid);
    
    @Query("SELECT COUNT(p) FROM Product p WHERE p.Category.CategoryID = :categoryid and p.Brand.BrandID=:brandid " )
    long countByCategoryBrand(@Param("categoryid") int categoryid,@Param("brandid") int brandid);
    
    @Query("SELECT p FROM Product p WHERE p.Brand.BrandID = :brandid ORDER BY p.ProductID DESC")
    Page<Product> findTop5ByBrand(@Param("brandid") int brandid, Pageable pageable);

    @Query("SELECT p FROM Product p WHERE p.Category.CategoryID = :categoryid ORDER BY p.ProductID DESC")
    Page<Product> findTop5ByCategory(@Param("categoryid") int categoryid, Pageable pageable);
    
    @Query("SELECT COUNT(p) FROM Product p WHERE p.Category.CategoryName LIKE %:keyword% OR p.Brand.BrandName LIKE %:keyword% OR p.ProductName LIKE %:keyword%")
    long countProductByKeyword(@Param("keyword") String keyword);
    
    @Query("SELECT p FROM Product p WHERE p.Category.CategoryName LIKE %:keyword% OR p.Brand.BrandName LIKE %:keyword% OR p.ProductName LIKE %:keyword%")
    Page<Product> getProductByKeyword(@Param("keyword") String keyword, Pageable pageable);
    
    @Query ("Select count(p) from Product p")
    long countProduct();
    
    
}
