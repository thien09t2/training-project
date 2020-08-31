package com.training.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.training.entity.ProductEntity;
@Repository
public interface IProductDao extends JpaRepository<ProductEntity, Long>{

	ProductEntity findByProductName(String productName);

	ProductEntity findByProductId(Long productId);

	ProductEntity findByProductNameAndProductIdNot(String productName, Long productId);


}
