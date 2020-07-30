package com.training.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
	public ResponseDataModel add(BrandEntity brandEntity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResponseDataModel update(BrandEntity brandEntity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResponseDataModel delete(Long brandId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BrandEntity> getAll() {
		return brandDao.findAll();
	}
}
