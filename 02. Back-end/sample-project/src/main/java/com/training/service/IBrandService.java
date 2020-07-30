package com.training.service;

import java.util.List;

import com.training.entity.BrandEntity;
import com.training.model.ResponseDataModel;

public interface IBrandService {

	ResponseDataModel add(BrandEntity brandEntity);

	ResponseDataModel update(BrandEntity brandEntity);

	ResponseDataModel delete(Long brandId);

	List<BrandEntity> getAll();
}
