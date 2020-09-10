package com.training.dao;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.training.entity.ProductEntity;

@Repository
public interface IProductDao extends JpaRepository<ProductEntity, Long> , JpaSpecificationExecutor<ProductEntity>{

	ProductEntity findByProductId(Long productId);

	ProductEntity findByProductName(String productName);

	ProductEntity findByProductNameAndProductIdNot(String productName, Long productId);

	@Query(value = "SELECT p FROM ProductEntity p JOIN BrandEntity b ON p.brandEntity.brandId=b.brandId "
			+ "WHERE (p.productName LIKE %:keyword% OR b.brandName LIKE %:keyword%) " 
			+ "AND p.price >= :startPrice "
			+ "AND p.price <= :endPrice")
	Page<ProductEntity> resultSearch(@Param("keyword") String keywork, @Param("startPrice") double startPrice,
			@Param("endPrice") double endPrice , Pageable pageable);
	
//	@Query(value = "SELECT p FROM ProductEntity p WHERE  p.brandEntity.brandId  IN :listId ")
//	Page<ProductEntity> searchByCheckBox(@Param("listId") Map<String, Object>  listId, Pageable pageable);
//	Page<ProductEntity> searchByCheckBox(@Param("listId") List<Number>  listId, Pageable pageable);
}
