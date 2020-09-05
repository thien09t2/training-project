package com.training.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.training.entity.BrandEntity;

@Repository("brandRepository")
public interface IBrandDAO extends JpaRepository<BrandEntity, Long> {

	BrandEntity findByBrandId(Long brandId);

	BrandEntity findByBrandName(String brandName);

	BrandEntity findByBrandNameAndBrandIdNot(String brandName, Long brandId);
}
