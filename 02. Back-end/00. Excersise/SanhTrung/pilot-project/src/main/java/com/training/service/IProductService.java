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


}
