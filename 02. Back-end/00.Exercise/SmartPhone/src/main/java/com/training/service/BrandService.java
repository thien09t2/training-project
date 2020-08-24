package com.training.service;

import java.util.List;
import java.util.Map;

import com.training.entity.BrandEntity;
import com.training.model.ResponseDataModel;

public interface BrandService {
	
	List<BrandEntity> getAll();
	BrandEntity add(BrandEntity brandEntity);
	BrandEntity update(BrandEntity brandEntity);
	BrandEntity findByBrandName(String brandName);
	BrandEntity findByBrandId(Long brandId);
	ResponseDataModel delete(Long brandId);
	Map<String, Object> findAllWithPager(int pageNumber);
	
}
