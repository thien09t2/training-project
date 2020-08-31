package com.training.service;

import java.util.List;

import com.training.entity.BrandEntity;
import com.training.model.ResponseDataModel;

public interface IBrandService {

	BrandEntity findByBrandName(String brandName);

	ResponseDataModel findAllWithPageApi(int pageNumber);

	ResponseDataModel addApi(BrandEntity brandEntity);

	ResponseDataModel deleteApi(Long brandId);

	ResponseDataModel updateApi(BrandEntity brandEntity);

	ResponseDataModel findBrandByIdApi(Long brandId);

	List<BrandEntity> getAll();

	BrandEntity findByBrandId(Long brandId);
}
