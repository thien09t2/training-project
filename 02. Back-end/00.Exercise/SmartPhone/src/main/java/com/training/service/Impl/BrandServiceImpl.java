package com.training.service.Impl;

import java.io.IOException;
import java.text.BreakIterator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.training.dao.BrandDAO;
import com.training.entity.BrandEntity;
import com.training.model.PagerModel;
import com.training.model.ResponseDataModel;
import com.training.service.BrandService;
import com.training.common.constant.Constants;
import com.training.common.util.FileHelper;
@Service
@Transactional
public class BrandServiceImpl implements BrandService {
	
	@Autowired
	BrandDAO branDao;
	
	@Value("${parent.folder.images.brand}")
	private String brandLogoFolderPath;

	public List<BrandEntity> getAll() {
		
		return branDao.findAll(Sort.by(Sort.Direction.DESC, "brandId"));
	}

	public BrandEntity add(BrandEntity brandEntity) {
		try {
	String imagePth = FileHelper.addNewFile(brandLogoFolderPath, brandEntity.getLogoFiles());
	brandEntity.setLogo(imagePth);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return branDao.saveAndFlush(brandEntity);
	}

	public BrandEntity update(BrandEntity brandEntity) {
		if(brandEntity.getLogoFiles()[0].getSize() > 0) {
	try {
		String 	imagePth = FileHelper.editFile(brandLogoFolderPath, brandEntity.getLogoFiles(), brandEntity.getLogo());
		brandEntity.setLogo(imagePth);
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}	
		}
		return branDao.saveAndFlush(brandEntity);
	}

	public BrandEntity findByBrandName(String brandName) {
		
		return branDao.findByBrandName(brandName);
	}

	@Override
	public BrandEntity findByBrandId(Long brandId) {
		
		return branDao.findByBrandId(brandId);
	}

	@Override
	public ResponseDataModel delete(Long brandId) {
		// xoa datavase truoc roi moi xoa hinh
				BrandEntity brandEntity = branDao.findByBrandId(brandId);
				if (brandEntity != null) {
					branDao.deleteById(brandId);
					branDao.flush();

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
	public Map<String, Object> findAllWithPager(int pageNumber) {
		Map<String, Object> responseMap = new HashMap<>();
		Sort sortInfo = Sort.by(Sort.Direction.DESC, "brandId");
		// gom 3 tham so theo thu tu: page hien tai, so luong trang cua trang va sort
		Pageable pageable = PageRequest.of(pageNumber - 1, Constants.PAGE_SIZE, sortInfo);
		Page<BrandEntity> brandEntitiesPage = branDao.findAll(pageable);
		responseMap.put("brandsList", brandEntitiesPage.getContent());
		responseMap.put("paginationInfo", new PagerModel(pageNumber, brandEntitiesPage.getTotalPages()));
		return responseMap;
	}

}
