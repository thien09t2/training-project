package com.training.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.training.dao.IBrandDao;
import com.training.entity.BrandEntity;
import com.training.model.ResponseDataModel;
import com.training.service.IBrandService;

@Service
@Transactional
public class BrandServiceImpl implements IBrandService {

	@Autowired
	IBrandDao brandDao;

	@Override
	public BrandEntity add(BrandEntity brandEntity) {
		return brandDao.saveAndFlush(brandEntity);
	}

	@Override
	public BrandEntity update(BrandEntity brandEntity) {
		return brandDao.saveAndFlush(brandEntity);
	}

	@Override
	public ResponseDataModel delete(Long brandId) {
		brandDao.deleteById(brandId);
		return null;
	}

	@Override
	public BrandEntity findByBrandId(Long brandId) {
		return brandDao.findByBrandId(brandId);
	}

	@Override
	public List<BrandEntity> getAll() {
		return brandDao.findAll(Sort.by(Sort.Direction.DESC, "brandId"));
	}

	@Override
	public BrandEntity findByBrandName(String brandName) {
		return brandDao.findByBrandName(brandName);
	}
}
