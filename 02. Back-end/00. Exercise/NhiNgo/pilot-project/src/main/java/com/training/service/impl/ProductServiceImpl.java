package com.training.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.training.common.constant.Constants;
import com.training.common.util.FileHelpper;
import com.training.dao.IProductDAO;
import com.training.dao.jpaspec.ProductSpecifycation;
import com.training.entity.ProductEntity;
import com.training.model.PagerModel;
import com.training.model.ResponseDataModel;
import com.training.service.IProductService;

@Service
@Transactional
public class ProductServiceImpl implements IProductService {

	private final Logger LOGGER = LoggerFactory.getLogger(getClass());

	@Value("${parent.folder.images.product}")
	private String productImgFolderPath;

	@Autowired
	IProductDAO prodDAO;

	@Override
	public List<ProductEntity> getAllProducts() {
		return prodDAO.findAll(Sort.by(Sort.Direction.DESC, "productId"));
	}

	@Override
	public ProductEntity findByProductName(String productName) {
		return prodDAO.findByProductName(productName);
	}

	@Override
	public ProductEntity findByProductId(Long productId) {
		return prodDAO.findByProductId(productId);
	}

	@Override
	public ResponseDataModel findByProductIdApi(Long productId) {

		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMessg = StringUtils.EMPTY;
		ProductEntity productEntity = null;

		try {
			productEntity = prodDAO.findByProductId(productId);
			if (productEntity != null) {
				responseCode = Constants.RESULT_CD_SUCCESS;
			}
		} catch (Exception e) {
			responseMessg = "Error occurs when finding product #" + productEntity.getProductId();
			LOGGER.error("Error occurs when finding product " + productEntity.getProductId() + ": ", e);
		}

		return new ResponseDataModel(responseCode, responseMessg, productEntity);
	}

	@Override
	public ResponseDataModel findAllProductsWithPagerApi(int pgNum) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMessg = StringUtils.EMPTY;
		Map<String, Object> responseMap = new HashMap<String, Object>();

		try {
			Sort sortInfo = Sort.by(Sort.Direction.DESC, "productId");
			Pageable pageable = PageRequest.of(pgNum - 1, Constants.PAGE_SIZE, sortInfo);
			Page<ProductEntity> prodEntityPage = prodDAO.findAll(pageable);
			responseMap.put("prodList", prodEntityPage.getContent());
			responseMap.put("paginationInfo", new PagerModel(pgNum, prodEntityPage.getTotalPages()));
			responseCode = Constants.RESULT_CD_SUCCESS;
		} catch (Exception e) {
			responseMessg = e.getMessage();
			LOGGER.error("Error occurs when loading all products: ", e);
		}

		return new ResponseDataModel(responseCode, responseMessg, responseMap);
	}

	@Override
	public ResponseDataModel addProductApi(ProductEntity productEntity) {

		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMessg = StringUtils.EMPTY;

		try {
			if (findByProductName(productEntity.getProductName()) != null) {
				responseMessg = "Product Name existed!";
				responseCode = Constants.RESULT_CD_DUPL;
			} else {
				MultipartFile[] prodImgFiles = productEntity.getProdImgFiles();
				if (prodImgFiles != null && prodImgFiles[0].getSize() > 0) {
					String imgPath = FileHelpper.addNewFile(productImgFolderPath, prodImgFiles);
					productEntity.setProdImg(imgPath);
				}
				prodDAO.saveAndFlush(productEntity);
				responseMessg = "Product #" + productEntity.getProductId() + " has been added successfully!";
				responseCode = Constants.RESULT_CD_SUCCESS;
			}
		} catch (Exception e) {
			responseMessg = "Error occurs when adding new product!";
			LOGGER.error("Error occurs when adding new product: ", e);
		}
		return new ResponseDataModel(responseCode, responseMessg);
	}

	@Override
	public ResponseDataModel updateProductApi(ProductEntity productEntity) {

		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMessg = StringUtils.EMPTY;

		try {
			ProductEntity existedProd = prodDAO.findByProductNameAndProductIdNot(productEntity.getProductName(),
					productEntity.getProductId());

			// Check if product name existed

			if (StringUtils.isEmpty(productEntity.getProductName())) {
				responseMessg = "Product Name is required!";
			} else if (existedProd != null) {
				responseMessg = "Product Name existed";
				responseCode = Constants.RESULT_CD_DUPL;
			} else {
				MultipartFile[] prodImgFiles = productEntity.getProdImgFiles();
				if (prodImgFiles != null && prodImgFiles[0].getSize() > 0) {
					String imgPath = FileHelpper.editFile(productImgFolderPath, prodImgFiles,
							productEntity.getProdImg());
					productEntity.setProdImg(imgPath);
				}
				prodDAO.saveAndFlush(productEntity);
				responseMessg = "Product #" + productEntity.getProductId() + " was modifyied successfully!";
				responseCode = Constants.RESULT_CD_SUCCESS;
			}
		} catch (Exception e) {
			responseMessg = "Error occurs when updating product #" + productEntity.getProductId() + ".";
			LOGGER.error("Error occurs when updating product #" + productEntity.getProductId() + ": ", e);
		}

		return new ResponseDataModel(responseCode, responseMessg);
	}

	@Override
	public ResponseDataModel deleteProductApi(Long productId) {

		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMessg = StringUtils.EMPTY;
		ProductEntity productEntity = prodDAO.findByProductId(productId);

		try {
			if (productEntity != null) {
				prodDAO.deleteById(productId);
				prodDAO.flush();

				// Deleting Image of product after that
				FileHelpper.deleteFile(productEntity.getProdImg());
				responseMessg = "Product " + productEntity.getProductName() + " was deleted successfully!";
				responseCode = Constants.RESULT_CD_SUCCESS;
			}

		} catch (Exception e) {
			responseMessg = "Error occurs when deleting product #" + productEntity.getProductId() + ".";
			LOGGER.error("Error occurs when deleting product #" + productEntity.getProductId() + ": ", e);
		}

		return new ResponseDataModel(responseCode, responseMessg);
	}

	@Override
	public ResponseDataModel searchProductWithNameAndPricePager(Map<String, Object> searchConditionMap, int pgNum) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMessg = StringUtils.EMPTY;
		Map<String, Object> responseMap = new HashMap<>();
		
		try {
//			Sort sortInfo = Sort.by(
//					Sort.Order.asc("price"),
//					Sort.Order.asc("brandEntity.brandId"));
			Sort sortList = Sort.by(Sort.Direction.ASC,"price");
			Pageable pageable = PageRequest.of(pgNum - 1, Constants.PAGE_SIZE, sortList);
			Page<ProductEntity> prodEntityResultPage = prodDAO.findAll(ProductSpecifycation.getSearchCriteria(searchConditionMap), pageable);
			responseMap.put("prodResultList", prodEntityResultPage.getContent());
			responseMap.put("resultPaginationInfo", new PagerModel(pgNum, prodEntityResultPage.getTotalPages()));
			responseCode = Constants.RESULT_CD_SUCCESS;
			if (prodEntityResultPage.getTotalElements() > 0) {
				responseMessg = "Found " + prodEntityResultPage.getTotalElements() + " match results.";
			} else {
				responseMessg = "No match found.";
			}
			
		} catch (Exception e) {
			responseMessg = "Error occurs when loading results: " + e.getMessage();
			LOGGER.error("Error occurs when loading results", e);
		}
		
		return new ResponseDataModel(responseCode, responseMessg, responseMap);
	}

}
