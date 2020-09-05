package com.training.service;

import java.util.List;
import java.util.Map;

import com.training.entity.BrandEntity;
import com.training.model.ResponseDataModel;

public interface IBrandService {

	BrandEntity add(BrandEntity brandEntity);

	BrandEntity update(BrandEntity brandEntity);

	ResponseDataModel delete(Long brandId);
	
	List<BrandEntity> getAll();

	BrandEntity findByBrandId(Long brandId);

	BrandEntity findByBrandName(String brandName);
	
	void delete(BrandEntity brandEntity);
	
	Map<String, Object> findAllWithPager(int pageNumber);
	
	List<BrandEntity> searchBrand(String keywork);

	ResponseDataModel findBrandByIbApi(Long brandId);

	ResponseDataModel findAllWithPagerApi(int pageNumber);

	ResponseDataModel addApi(BrandEntity brandEntity);

	ResponseDataModel deleteApi(Long brandId);

	ResponseDataModel updateApi(BrandEntity brandEntity);
	
	ResponseDataModel search( Map<String, String> searchConditions, int pageNumber);
	

	

}
