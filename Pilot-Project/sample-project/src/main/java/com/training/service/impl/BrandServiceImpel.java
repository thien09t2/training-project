package com.training.service.impl;

import java.io.IOException;
import java.util.ArrayList;
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
import com.training.entity.BrandEntity;
import com.training.model.PagerModel;
import com.training.model.ResponseDataModel;
import com.training.service.IBrandService;

@Service
@Transactional
public class BrandServiceImpel implements IBrandService {
	
	private final Logger LOGGER = LoggerFactory.getLogger(getClass());
	
	@Value("${parent.folder.images.brand}")
	private String brandLogoFolderPath;

	@Autowired
	IBrandDao brandDao;

	@Override
	public BrandEntity add(BrandEntity brandEntity) {

		try {
			String imagePath = FileHelper.addNewFile(brandLogoFolderPath, brandEntity.getLogoFiles());
			brandEntity.setLogo(imagePath);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return brandDao.saveAndFlush(brandEntity);
	}

	@Override
	public BrandEntity update(BrandEntity brandEntity) {

		try {
			if (brandEntity.getLogoFiles()[0].getSize() > 0) {

				// Store file into local storage after that remove old file and get image path to save in database 
				String imagePath = FileHelper.editFile(brandLogoFolderPath, brandEntity.getLogoFiles(), brandEntity.getLogo());
				brandEntity.setLogo(imagePath);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return brandDao.saveAndFlush(brandEntity);
	}

	@Override
	public ResponseDataModel delete(Long brandId) {

		BrandEntity brandEntity = brandDao.findByBrandId(brandId);
		if (brandEntity != null) {
			brandDao.deleteById(brandId);
			brandDao.flush();

			try {
				// Remove logo of brand from store folder
				FileHelper.deleteFile(brandEntity.getLogo());
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
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

	@Override
	public void delete(BrandEntity brandEntity) {
		brandDao.delete(brandEntity);
	}

	@Override
	public Map<String, Object> findAllWithPager(int pageNumber) {
		Map<String, Object> responseMap = new HashMap<>();
		Sort sortInfo = Sort.by(Sort.Direction.DESC, "brandId");
		Pageable pageable = PageRequest.of(pageNumber - 1, Constants.PAGE_SIZE, sortInfo);
		Page<BrandEntity> brandEntitiesPage = brandDao.findAll(pageable);
		responseMap.put("brandsList", brandEntitiesPage.getContent());
		responseMap.put("paginationInfo", new PagerModel(pageNumber, brandEntitiesPage.getTotalPages()));
		return responseMap;
	}

	@Override
	public List<BrandEntity> searchBrand(String keyword) {
		 List<BrandEntity> listBrand = brandDao.findAll();
		 List<BrandEntity> listBrandEntity = new ArrayList<>();
		 for (BrandEntity brandEntity : listBrand) {
			 if(brandEntity.getBrandName().contains(keyword)) {
				 listBrandEntity.add(brandEntity);
			 }
		 }
		return listBrandEntity;
	}

	@Override
	public ResponseDataModel findBrandByIbApi(Long brandId) {
		//trả về trang thái của đoạn code(responeCode),mess lỗi nếu có lỗi, 1 đốitượng entity nếu tìm đc )
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		BrandEntity brandEntity = null;
		try {
			brandEntity = brandDao.findByBrandId(brandId);
			if (brandEntity != null) {
				responseCode = Constants.RESULT_CD_SUCCESS;
			}
		} catch (Exception e) {
			responseMsg = "Error when finding brand by ID";
			LOGGER.error("Error when finding brand by ID: ", e);
		}
		return new ResponseDataModel(responseCode, responseMsg, brandEntity);
	}

//	@Override
//	public ResponseDataModel findAllWithPagerApi(int pageNumber) {
//
//		int responseCode = Constants.RESULT_CD_FAIL;
//		String responseMsg = StringUtils.EMPTY;
//		Map<String, Object> responseMap = new HashMap<>();
//		try {
//			Sort sortInfo = Sort.by(Sort.Direction.DESC, "brandId");
//			Pageable pageable = PageRequest.of(pageNumber - 1, Constants.PAGE_SIZE, sortInfo);
//			Page<BrandEntity> brandEntitiesPage = brandDao.findAll(pageable);
//			responseMap.put("brandsList", brandEntitiesPage.getContent());
//			responseMap.put("paginationInfo", new PagerModel(pageNumber, brandEntitiesPage.getTotalPages()));
//			responseCode = Constants.RESULT_CD_SUCCESS;
//		} catch (Exception e) {
//			responseMsg = e.getMessage();
//			LOGGER.error("Error when get all brand: ", e);
//		}
//		return new ResponseDataModel(responseCode, responseMsg, responseMap);
//	}

	@Override
	public ResponseDataModel addApi(BrandEntity brandEntity) {

		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		try {
			if (findByBrandName(brandEntity.getBrandName()) != null) {
				responseMsg = "Brand Name is duplicated";
				responseCode = Constants.RESULT_CD_DUPL;
			} else {
				MultipartFile[] logoFiles = brandEntity.getLogoFiles();
				if (logoFiles != null && logoFiles[0].getSize() > 0) {
					String imagePath = FileHelper.addNewFile(brandLogoFolderPath, logoFiles);
					brandEntity.setLogo(imagePath);
				}
				brandDao.saveAndFlush(brandEntity);
				responseMsg = "Brand is added successfully";
				responseCode = Constants.RESULT_CD_SUCCESS;
			}
		} catch (Exception e) {
			responseMsg = "Error when adding brand";
			LOGGER.error("Error when adding brand: ", e);
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}
	
	@Override
	public ResponseDataModel updateApi(BrandEntity brandEntity) {

		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		try {
			
			BrandEntity duplicatedBrand = brandDao.findByBrandNameAndBrandIdNot(brandEntity.getBrandName(), brandEntity.getBrandId());

			// Check if brand name existed
			if (duplicatedBrand != null) {
				responseMsg = "Brand Name is duplicated";
				responseCode = Constants.RESULT_CD_DUPL;
			} else {
				MultipartFile[] logoFiles = brandEntity.getLogoFiles();
				if (logoFiles != null && logoFiles[0].getSize() > 0) {
					String imagePath = FileHelper.editFile(brandLogoFolderPath, logoFiles, brandEntity.getLogo());
					brandEntity.setLogo(imagePath);
				}
				brandDao.saveAndFlush(brandEntity);
				responseMsg = "Brand is updated successfully";
				responseCode = Constants.RESULT_CD_SUCCESS;
			}
		} catch (Exception e) {
			responseMsg = "Error when updating brand";
			LOGGER.error("Errorr when updating brand: ", e);
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}

	@Override
	public ResponseDataModel deleteApi(Long brandId) {

		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		BrandEntity brandEntity = brandDao.findByBrandId(brandId);
		try {
			if (brandEntity != null) {
				brandDao.deleteById(brandId);
				brandDao.flush();

				// Remove logo of brand from store folder
				FileHelper.deleteFile(brandEntity.getLogo());
				responseMsg = "Brand is deleted successfully";
				responseCode = Constants.RESULT_CD_SUCCESS;
			}
		} catch(Exception e) {
			responseMsg = "Error when deleting brand";
			LOGGER.error("Error when delete brand: ", e);
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}


	@Override
	public ResponseDataModel findAllWithPagerApi(int pageNumber) {

		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		Map<String, Object> responseMap = new HashMap<>();
		try {
			Sort sortInfo = Sort.by(Sort.Direction.DESC, "brandId");
			Pageable pageable = PageRequest.of(pageNumber - 1, Constants.PAGE_SIZE, sortInfo);
			Page<BrandEntity> brandEntitiesPage = brandDao.findAll(pageable);
			responseMap.put("brandsList", brandEntitiesPage.getContent());
			responseMap.put("paginationInfo", new PagerModel(pageNumber, brandEntitiesPage.getTotalPages()));
			responseCode = Constants.RESULT_CD_SUCCESS;
		} catch (Exception e) {
			responseMsg = e.getMessage();
			LOGGER.error("Error when get all brand: ", e);
		}
		return new ResponseDataModel(responseCode, responseMsg, responseMap);
	}

	@Override
	public ResponseDataModel searchApi(String brandName, int pageNumber) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		Map<String, Object> responseMap = new HashMap<String, Object>();
		try {
			Sort sortList = Sort.by(Sort.Direction.DESC, "brandId");
			Pageable pageable = PageRequest.of(pageNumber - 1, Constants.PAGE_SIZE, sortList);
			Page<BrandEntity> brandEntitesPage = brandDao.findByBrandNameLike("%" + brandName + "%", pageable);
			responseMap.put("brandsList", brandEntitesPage.getContent());
			responseMap.put("paginationInfo", new PagerModel(pageNumber, brandEntitesPage.getTotalPages()));
			responseCode = Constants.RESULT_CD_SUCCESS;
			if ( brandEntitesPage.getTotalElements() > 0) {
				responseMsg = "The number of brand found is " + brandEntitesPage.getTotalElements() + " brand";
				responseMap.put("systemMessage", responseMsg);
			} else {
				responseMsg = "The " + brandName + " is not exist!";
			}
		} catch (Exception e) {
			responseMsg = e.getMessage();
			LOGGER.error("Search brand name failed:",e);
		}
		return new ResponseDataModel(responseCode, responseMsg, responseMap);
	}

//	@Override
//	public ResponseDataModel search(String searchKey, int pageNumber) {
//		List<BrandEntity> listBrand = brandDao.findByBrandNameLike("%"+searchKey+"%");
//		int responseCode = Constants.RESULT_CD_FAIL;
//		String responseMsg = StringUtils.EMPTY;
//		Map<String, Object> responseMap = new HashMap<>();
//		try {
//			Sort sortInfo = Sort.by(Sort.Direction.DESC, "brandId");
//			Pageable pageable = PageRequest.of(pageNumber - 1, Constants.PAGE_SIZE, sortInfo);
//			//getOffset = page*size; 
//			int start = (int) pageable.getOffset();
//			int end = (start + pageable.getPageSize()) > listBrand.size() ? listBrand.size()
//					: (start + pageable.getPageSize());
//			// mỗi trang sẽ có page khác nhau
//			Page<BrandEntity> pages = new PageImpl<BrandEntity>(listBrand.subList(start, end), pageable,
//					listBrand.size());
//			// getContent lấy ra listProduct.subList(start, end)
//			responseMap.put("brandsList", pages.getContent());
//			responseMap.put("paginationInfo", new PagerModel(pageNumber, pages.getTotalPages()));
//			responseCode = Constants.RESULT_CD_SUCCESS;
//			responseMsg = "ResultSet has " + listBrand.size() + " products";
//		} catch (Exception e) {
//			responseMsg = e.getMessage();
//			LOGGER.error("Error when get all product: ", e);
//		}
//		return new ResponseDataModel(responseCode, responseMsg, responseMap);
//	}
	



	
}