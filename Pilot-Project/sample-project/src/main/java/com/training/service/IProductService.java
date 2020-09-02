package com.training.service;

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
	
	ResponseDataModel searchByPriceBetween (int startPrice , int endPrice,int pageNumber);

}
