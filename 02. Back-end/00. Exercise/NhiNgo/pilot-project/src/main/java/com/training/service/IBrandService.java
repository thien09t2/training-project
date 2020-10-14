package com.training.service;

import java.util.List;

import com.training.entity.BrandEntity;
import com.training.model.ResponseDataModel;

public interface IBrandService {

	List<BrandEntity> getAllOrderByBrandName();
	
	BrandEntity findByBrandName(String brandName);

	ResponseDataModel findByBrandIdApi(Long brandId);

	ResponseDataModel findAllWithPagerApi(int pgNum);

	ResponseDataModel addApi(BrandEntity brandEntity);

	ResponseDataModel updateApi(BrandEntity brandEntity);

	ResponseDataModel deleteApi(Long brandId);

	ResponseDataModel searchBrandWithPager(String keyword, int pgNum);

}
