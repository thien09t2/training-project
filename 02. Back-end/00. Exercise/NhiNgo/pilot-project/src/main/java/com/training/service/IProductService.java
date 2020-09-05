package com.training.service;

import java.util.List;

import com.training.entity.ProductEntity;
import com.training.model.ResponseDataModel;

public interface IProductService {

	ProductEntity findByProductName(String productName);

	ProductEntity findByProductId(Long productId);

	List<ProductEntity> getAllProducts();

	ResponseDataModel findByProductIdApi(Long productId);

	ResponseDataModel findAllProductsWithPagerApi(int pgNum);

	ResponseDataModel addProductApi(ProductEntity productEntity);

	ResponseDataModel updateProductApi(ProductEntity productEntity);

	ResponseDataModel deleteProductApi(Long productId);

}
