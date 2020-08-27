package com.training.service.impl;

import com.training.service.IProductService;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class ProductServiceImpl implements IProductService {
	
	@Value("${parent.folder.images.product}")
	private String productImgFolderPath;
	
	

}
