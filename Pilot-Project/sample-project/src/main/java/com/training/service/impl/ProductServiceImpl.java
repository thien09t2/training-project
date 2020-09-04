package com.training.service.impl;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.training.common.constant.Constants;
import com.training.common.util.FileHelper;
import com.training.dao.IBrandDao;
import com.training.dao.IProductDao;
import com.training.entity.BrandEntity;
import com.training.entity.ProductEntity;
import com.training.model.PagerModel;
import com.training.model.ProductDTO;
import com.training.model.ResponseDataModel;
import com.training.service.IProductService;

@Service
@Transactional
public class ProductServiceImpl implements IProductService {

	private final Logger LOGGER = LoggerFactory.getLogger(getClass());

	@Value("${parent.folder.images.product}")
	private String productImageFolderPath;

	@Autowired
	IProductDao productDao;

	@Override
	public List<ProductEntity> getAll() {
		return productDao.findAll();
	}

	@Override
	public ResponseDataModel findAllProductByApi(int pageNumber) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		Map<String, Object> responseMap = new HashMap<>();
		try {
			Sort sortInfo = Sort.by(Sort.Direction.DESC, "productId");
			Pageable pageable = PageRequest.of(pageNumber - 1, Constants.PAGE_SIZE, sortInfo);
			Page<ProductEntity> productEntityPage = productDao.findAll(pageable);
			responseMap.put("productList", productEntityPage.getContent());
			responseMap.put("paginationInfo", new PagerModel(pageNumber, productEntityPage.getTotalPages()));
			responseCode = Constants.RESULT_CD_SUCCESS;
		} catch (Exception e) {
			responseMsg = e.getMessage();
			LOGGER.error("Error when get all product: ", e);
		}
		return new ResponseDataModel(responseCode, responseMsg, responseMap);
	}

	@Override
	public ResponseDataModel findProductByIdApi(Long productId) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		ProductEntity productEntity = null;
		try {
			productEntity = productDao.findByProductId(productId);
			if (productEntity != null) {
				responseCode = Constants.RESULT_CD_SUCCESS;
			}
		} catch (Exception e) {
			responseMsg = "Error when finding product by ID";
			LOGGER.error("Error when finding product by ID: ", e);
		}
		return new ResponseDataModel(responseCode, responseMsg, productEntity);
	}

	@Override
	public ResponseDataModel addProductByApi(ProductEntity productEntity) {

		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;

		try {
			if (findProductByProductName(productEntity.getProductName()) != null) {
				responseMsg = "Product Name is duplicated";
				responseCode = Constants.RESULT_CD_DUPL;
			} else {
				MultipartFile[] imageFiles = productEntity.getImageFiles();
				if (imageFiles != null && imageFiles[0].getSize() > 0) {
					String imagePath = FileHelper.addNewFile(productImageFolderPath, imageFiles);
					productEntity.setImage(imagePath);
				}
				productDao.saveAndFlush(productEntity);
				responseMsg = "Product is added successfully";
				responseCode = Constants.RESULT_CD_SUCCESS;
			}
		} catch (Exception e) {
			responseMsg = "Error when adding product";
			LOGGER.error("Error when adding product: ", e);
		}

		return new ResponseDataModel(responseCode, responseMsg);
	}

	@Override
	public ProductEntity findProductByProductName(String productName) {
		return productDao.findByProductName(productName);
	}

	@Override
	public ResponseDataModel updateProductByApi(ProductEntity productEntity) {

		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		try {

			ProductEntity duplicatedProduct = productDao
					.findByProductNameAndProductIdNot(productEntity.getProductName(), productEntity.getProductId());

			// Check if brand name existed
			if (duplicatedProduct != null) {
				responseMsg = "Product Name is duplicated";
				responseCode = Constants.RESULT_CD_DUPL;
			} else {
				MultipartFile[] imgFile = productEntity.getImageFiles();
				if (imgFile != null && imgFile[0].getSize() > 0) {
					String imagePath = FileHelper.editFile(productImageFolderPath, imgFile, productEntity.getImage());
					productEntity.setImage(imagePath);
					;
				}
				productDao.saveAndFlush(productEntity);
				responseMsg = "Product is updated successfully";
				responseCode = Constants.RESULT_CD_SUCCESS;
			}
		} catch (Exception e) {
			responseMsg = "Error when updating product";
			LOGGER.error("Errorr when updating product: ", e);
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}

	@Override
	public ResponseDataModel deleteProductByApi(Long productId) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		ProductEntity productEntity = productDao.findByProductId(productId);
		try {
			if (productEntity != null) {
				productDao.deleteById(productId);
				productDao.flush();

				// Remove logo of brand from store folder
				FileHelper.deleteFile(productEntity.getImage());
				responseMsg = "Product is deleted successfully";
				responseCode = Constants.RESULT_CD_SUCCESS;
			}
		} catch (Exception e) {
			responseMsg = "Error when deleting Product";
			LOGGER.error("Error when delete Product: ", e);
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}

	@Override
	public ResponseDataModel search(String searchKey, int pageNumber , double startPrice , double endPrice) {
		List<ProductEntity> listProduct = productDao.resultSearch(searchKey, startPrice, endPrice);

		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		Map<String, Object> responseMap = new HashMap<>();
		try {
			Sort sortInfo = Sort.by(Sort.Direction.DESC, "productId");
			Pageable pageable = PageRequest.of(pageNumber - 1, Constants.PAGE_SIZE, sortInfo);
			int start = (int) pageable.getOffset();
			int end = (start + pageable.getPageSize()) > listProduct.size() ? listProduct.size()
					: (start + pageable.getPageSize());
			// mỗi trang sẽ có page khác nhau
			Page<ProductEntity> pages = new PageImpl<ProductEntity>(listProduct.subList(start, end), pageable,
					listProduct.size());
			// getContent lấy ra listProduct.subList(start, end)
			responseMap.put("productList", pages.getContent());
			responseMap.put("paginationInfo", new PagerModel(pageNumber, pages.getTotalPages()));
			responseCode = Constants.RESULT_CD_SUCCESS;
			responseMsg = "ResultSet has " + listProduct.size() + " products";
		} catch (Exception e) {
			responseMsg = e.getMessage();
			LOGGER.error("Error when get all product: ", e);
		}
		return new ResponseDataModel(responseCode, responseMsg, responseMap);
	}
	
	@Override
	public ResponseDataModel searchByPriceBetween(int startPrice , int endPrice,int pageNumber ) {
		List<ProductEntity> listProduct = productDao.findAllByPriceBetween(startPrice, startPrice);
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		Map<String, Object> responseMap = new HashMap<>();
		try {
			Sort sortInfo = Sort.by(Sort.Direction.DESC, "productId");
			Pageable pageable = PageRequest.of(pageNumber - 1, Constants.PAGE_SIZE, sortInfo);
			int start = (int) pageable.getOffset();
			int end = (start + pageable.getPageSize()) > listProduct.size() ? listProduct.size()
					: (start + pageable.getPageSize());
			// mỗi trang sẽ có page khác nhau
			Page<ProductEntity> pages = new PageImpl<ProductEntity>(listProduct.subList(start, end), pageable,
					listProduct.size());
			// getContent lấy ra listProduct.subList(start, end)
			responseMap.put("productList", pages.getContent());
			responseMap.put("paginationInfo", new PagerModel(pageNumber, pages.getTotalPages()));
			responseCode = Constants.RESULT_CD_SUCCESS;
			responseMsg = "ResultSet has " + listProduct.size() + " products";
		} catch (Exception e) {
			responseMsg = e.getMessage();
			LOGGER.error("Error when get all product: ", e);
		}
		return new ResponseDataModel(responseCode, responseMsg, responseMap);
	}
	
	

}
