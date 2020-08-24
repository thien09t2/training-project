package com.training.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.training.entity.BrandEntity;

@Repository
public interface BrandDAO extends JpaRepository<BrandEntity, Long> {

	BrandEntity findByBrandName(String brandName);

	BrandEntity findByBrandId(Long brandId);

}
