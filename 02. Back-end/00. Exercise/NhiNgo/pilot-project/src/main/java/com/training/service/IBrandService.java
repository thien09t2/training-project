package com.training.service;

import com.training.entity.BrandEntity;
import com.training.model.ResponseDataModel;

import java.util.List;
import java.util.Map;

public interface IBrandService {

    BrandEntity add(BrandEntity brandEntity);

    BrandEntity update(BrandEntity brandEntity);

    ResponseDataModel delete(Long brandID);

    List<BrandEntity> getAll();

    BrandEntity findByBrandID(Long brandID);

    BrandEntity findByBrandName(String brandName);

	Map<String, Object> findAllWithPager(int pgNum);

	ResponseDataModel findByBrandIdApi(Long brandID);

	ResponseDataModel findAllWithPagerApi(int pgNum);

	ResponseDataModel addApi(BrandEntity brandEntity);

	ResponseDataModel updateApi(BrandEntity brandEntity);

	ResponseDataModel deleteApi(Long brandID);

}
