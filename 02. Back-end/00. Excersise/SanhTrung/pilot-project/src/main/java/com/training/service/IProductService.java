package com.training.service;

import com.training.entity.ProductEntity;
import com.training.model.ResponseDataModel;

public interface IProductService {

	ProductEntity findByProductName(String productName);

	ResponseDataModel findAllProductWithPage(int pageNumber);

	ResponseDataModel addProduct(ProductEntity productEntity);

	ResponseDataModel deleteProduct(Long productId);

	ResponseDataModel updateProduct(ProductEntity productEntity);

	ResponseDataModel findProductById(Long productId);

	ResponseDataModel searchByNameAndPrice(String keyword, int pageNumber, double priceFrom, double toPrice);

	ResponseDataModel searchByPrice(double priceFrom, double toPrice, int pageNumber);

	ResponseDataModel searchByName(String keyword, int pageNumber);


}
