package com.training.service;

import java.util.Map;

import com.training.entity.ProductEntity;
import com.training.model.ResponseDataModel;

public interface IProductService {
	
	ProductEntity findProductByProductName(String productName);

	Iterable<ProductEntity> getAll();

	ResponseDataModel findAllProductByApi(int pageNumber);

	ResponseDataModel findProductByIdApi(Long productId);

	ResponseDataModel addProductByApi(ProductEntity productEntity);

	ResponseDataModel deleteProductByApi(Long productId);

	ResponseDataModel updateProductByApi(ProductEntity productEntity);
	
	ResponseDataModel search(String searchKey, int pageNumber , double startPrice , double endPrice);
	
	ResponseDataModel searchByPriceAndName(Map<String, Object> searchConditions, int pageNumber);
	
	ResponseDataModel searchProductByBrandId(Map<String, Object> searchConditions, int pageNumber);

}
