package com.training.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.training.entity.BrandEntity;

@Repository
public interface IBrandDao extends JpaRepository<BrandEntity, Long> {

	BrandEntity findByBrandId(Long productId);

	BrandEntity findByBrandName(String productName);

	BrandEntity findByBrandNameAndBrandIdNot(String brandName, Long brandId);

	List<BrandEntity> findByBrandNameLike(String brandName);

}
