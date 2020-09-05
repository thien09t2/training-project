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

	List<BrandEntity> getAllOrderByBrandName();

	BrandEntity findByBrandId(Long brandId);

	BrandEntity findByBrandName(String brandName);

	Map<String, Object> findAllWithPager(int pgNum);

	ResponseDataModel findByBrandIdApi(Long brandId);

	ResponseDataModel findAllWithPagerApi(int pgNum);

	ResponseDataModel addApi(BrandEntity brandEntity);

	ResponseDataModel updateApi(BrandEntity brandEntity);

	ResponseDataModel deleteApi(Long brandId);

}
