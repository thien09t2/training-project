package com.training.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.training.entity.BrandEntity;

@Repository("brandRepository")
public interface IBrandDAO extends JpaRepository<BrandEntity, Long>, PagingAndSortingRepository<BrandEntity, Long> {

	BrandEntity findByBrandId(Long brandId);

	BrandEntity findByBrandName(String brandName);

	BrandEntity findByBrandNameAndBrandIdNot(String brandName, Long brandId);
	
	@Query("SELECT brand "
			+ "FROM BrandEntity brand "
			+ "WHERE brand.brandName LIKE CONCAT('%',?1,'%') "
			+ "OR brand.description LIKE CONCAT('%',?1,'%') "
			+ "ORDER BY brand.brandId")
	Page<BrandEntity> findByBrandNameLike(String keyword, Pageable pageable);
	
}


