package com.training.service.impl;

import java.io.IOException;
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
import com.training.dao.IBrandDAO;
import com.training.entity.BrandEntity;
import com.training.model.PagerModel;
import com.training.model.ResponseDataModel;
import com.training.service.IBrandService;

@Service
@Transactional
public class BrandServiceImpl implements IBrandService {

	private final Logger LOGGER = LoggerFactory.getLogger(getClass());

	@Value("${parent.folder.images.brand}")
	private String brandLogoFolderPath;

	@Autowired
	IBrandDAO brandDAO;

	@Override
	public BrandEntity add(BrandEntity brandEntity) {

		try {
			String imagePath = FileHelpper.addNewFile(brandLogoFolderPath, brandEntity.getLogoFiles());
			brandEntity.setLogo(imagePath);
		} catch (IOException e) {
			System.out.println("Error warning: " + e.getMessage());
		}
		return brandDAO.saveAndFlush(brandEntity);
	}

	@Override
	public BrandEntity update(BrandEntity brandEntity) {

		try {
			if (brandEntity.getLogoFiles()[0].getSize() > 0) {

				// Store file into local storage, then remove old file and get img path to save
				// in database
				String imagePath = FileHelpper.editFile(brandLogoFolderPath, brandEntity.getLogoFiles(),
						brandEntity.getLogo());
				brandEntity.setLogo(imagePath);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		return brandDAO.saveAndFlush(brandEntity);
		// lưu và xóa cache
	}

	@Override
	public ResponseDataModel delete(Long brandId) {

		BrandEntity brandEntity = brandDAO.findByBrandId(brandId);
		if (brandEntity != null) {
			brandDAO.deleteById(brandId);
			brandDAO.flush();

			try {

				// Remove logo of brand from store folder
				FileHelpper.deleteFile(brandEntity.getLogo());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	@Override
	public List<BrandEntity> getAll() {
		return brandDAO.findAll(Sort.by(Sort.Direction.DESC, "brandId"));
	}

	@Override
	public BrandEntity findByBrandId(Long brandId) {
		return brandDAO.findByBrandId(brandId);
	}

	@Override
	public List<BrandEntity> getAllOrderByBrandName() {
		return brandDAO.findAll(Sort.by(Sort.Direction.ASC, "brandName"));
	}

	@Override
	public BrandEntity findByBrandName(String brandName) {
		return brandDAO.findByBrandName(brandName);
	}

	@Override
	public Map<String, Object> findAllWithPager(int pgNum) {

		Map<String, Object> responseMap = new HashMap<>();
		Sort sortInfo = Sort.by(Sort.Direction.DESC, "brandId");
		Pageable pageable = PageRequest.of(pgNum - 1, Constants.PAGE_SIZE, sortInfo);
		Page<BrandEntity> brandEntityPage = brandDAO.findAll(pageable);
		responseMap.put("brandList", brandEntityPage.getContent());
		responseMap.put("paginationInfo", new PagerModel(pgNum, brandEntityPage.getTotalPages()));

		return responseMap;
	}

	@Override
	public ResponseDataModel findByBrandIdApi(Long brandId) {

		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMessg = StringUtils.EMPTY;
		BrandEntity brandEntity = null;

		try {
			brandEntity = brandDAO.findByBrandId(brandId);
			if (brandEntity != null) {
				responseCode = Constants.RESULT_CD_SUCCESS;
			}
		} catch (Exception e) {
			responseMessg = "Error occurs when finding brand #" + brandEntity.getBrandId();
			LOGGER.error("Error occurs when finding brand " + brandEntity.getBrandId() + ": ", e);
		}

		return new ResponseDataModel(responseCode, responseMessg, brandEntity);
	}

	@Override
	public ResponseDataModel findAllWithPagerApi(int pgNum) {

		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMessg = StringUtils.EMPTY;
		Map<String, Object> responseMap = new HashMap<>();

		try {
			Sort sortInfo = Sort.by(Sort.Direction.DESC, "brandId");
			Pageable pageable = PageRequest.of(pgNum - 1, Constants.PAGE_SIZE, sortInfo);
			Page<BrandEntity> brandEntityPage = brandDAO.findAll(pageable);
			responseMap.put("brandList", brandEntityPage.getContent());
			responseMap.put("paginationInfo", new PagerModel(pgNum, brandEntityPage.getTotalPages()));
			responseCode = Constants.RESULT_CD_SUCCESS;
		} catch (Exception e) {
			responseMessg = e.getMessage();
			LOGGER.error("Error occurs when getting all brands: ", e);
		}

		return new ResponseDataModel(responseCode, responseMessg, responseMap);
	}

	@Override
	public ResponseDataModel addApi(BrandEntity brandEntity) {

		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMessg = StringUtils.EMPTY;

		try {
			if (StringUtils.isEmpty(brandEntity.getBrandName())) {
				responseMessg = "Brand Name is required!";
			} else if (findByBrandName(brandEntity.getBrandName()) != null) {
				responseMessg = "Brand Name existed";
				responseCode = Constants.RESULT_CD_DUPL;
			} else {
				MultipartFile[] logoFiles = brandEntity.getLogoFiles();
				if (logoFiles != null && logoFiles[0].getSize() > 0) {
					String imgPath = FileHelpper.addNewFile(brandLogoFolderPath, logoFiles);
					brandEntity.setLogo(imgPath);
				}
				brandDAO.saveAndFlush(brandEntity);
				responseMessg = "Brand #" + brandEntity.getBrandId() + " has been added successfully!";
				responseCode = Constants.RESULT_CD_SUCCESS;
			}
		} catch (Exception e) {
			responseMessg = "Error occurs when adding new brand!";
			LOGGER.error("Error occurs when adding new brand: ", e);
		}

		return new ResponseDataModel(responseCode, responseMessg);
	}

	@Override
	public ResponseDataModel updateApi(BrandEntity brandEntity) {

		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMessg = StringUtils.EMPTY;

		try {

			BrandEntity existedBrand = brandDAO.findByBrandNameAndBrandIdNot(brandEntity.getBrandName(),
					brandEntity.getBrandId());

			// Checking if brand name existed
			if (existedBrand != null) {
				responseMessg = "Brand Name existed";
				responseCode = Constants.RESULT_CD_DUPL;
			} else {
				MultipartFile[] logoFiles = brandEntity.getLogoFiles();
				if (logoFiles != null && logoFiles[0].getSize() > 0) {
					String imgPath = FileHelpper.editFile(brandLogoFolderPath, logoFiles, brandEntity.getLogo());
					brandEntity.setLogo(imgPath);
				}
				brandDAO.saveAndFlush(brandEntity);
				responseMessg = "Brand #" + brandEntity.getBrandId() + " was modifyied successfully!";
				responseCode = Constants.RESULT_CD_SUCCESS;
			}
		} catch (Exception e) {
			responseMessg = "Error occurs when updating brand #" + brandEntity.getBrandId() + ".";
			LOGGER.error("Error occurs when updating brand #" + brandEntity.getBrandId() + ": ", e);
		}

		return new ResponseDataModel(responseCode, responseMessg);
	}

	@Override
	public ResponseDataModel deleteApi(Long brandId) {

		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMessg = StringUtils.EMPTY;
		BrandEntity brandEntity = brandDAO.findByBrandId(brandId);

		try {

			if (brandEntity != null) {

				brandDAO.deleteById(brandId);
				brandDAO.flush();

				// remove logo from storage after deleting brand
				FileHelpper.deleteFile(brandEntity.getLogo());
				responseMessg = "Brand #" + brandEntity.getBrandId() + " - " + brandEntity.getBrandName()
						+ " was deleted successfully!";
				responseCode = Constants.RESULT_CD_SUCCESS;
			}
		} catch (Exception e) {
			responseMessg = "Error occurs when deleting brand #" + brandEntity.getBrandId() + ".";
			LOGGER.error("Error occurs when updating brand #" + brandEntity.getBrandId() + ": ", e);
		}

		return new ResponseDataModel(responseCode, responseMessg);
	}
}
