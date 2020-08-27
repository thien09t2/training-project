package com.training.dao;

import com.training.entity.BrandEntity;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IBrandDAO extends JpaRepository<BrandEntity, Long> {

    BrandEntity findByBrandID(Long brandID);

    BrandEntity findByBrandName(String brandName);

	BrandEntity findByBrandNameAndBrandIDNot(String brandName, Long brandID);
}
