package com.training.service.impl;


import com.training.common.constant.Constants;
import com.training.common.util.FileHelpper;
import com.training.dao.IBrandDAO;
import com.training.entity.BrandEntity;
import com.training.model.PagerModel;
import com.training.model.ResponseDataModel;
import com.training.service.IBrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class BrandServiceImpl implements IBrandService {

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
    			
    			//Store file into local storage, then remove old file and get img path to save in database
    			String imagePath = FileHelpper.editFile(brandLogoFolderPath, brandEntity.getLogoFiles(), brandEntity.getLogo());
    			brandEntity.setLogo(imagePath);
    		}
    	} catch (IOException e) {
    		e.printStackTrace();
    	}
    	
        return brandDAO.saveAndFlush(brandEntity);
        //lưu và xóa cache
    }
    

    @Override
    public ResponseDataModel delete(Long brandID) {
    	
    	BrandEntity brandEntity = brandDAO.findByBrandID(brandID);
    	if (brandEntity != null) {
    		brandDAO.deleteById(brandID);
    		brandDAO.flush();
    		
    		try {
    			
    			//Remove logo of brand from store folder
    			FileHelpper.deleteFile(brandEntity.getLogo());
    		} catch (IOException e) {
    			e.printStackTrace();
    		}
    	}
        return null;
    }
    

    @Override
    public List<BrandEntity> getAll() {
        return brandDAO.findAll(Sort.by(Sort.Direction.DESC, "brandID"));
    }

    @Override
    public BrandEntity findByBrandID(Long brandID) {
        return brandDAO.findByBrandID(brandID);
    }

    @Override
    public BrandEntity findByBrandName(String brandName) {
        return brandDAO.findByBrandName(brandName);
    }

    @Override
    public Map<String, Object> findAllWithPager(int pgNum) {

        Map<String, Object> responseMap = new HashMap<>();
        Sort sortInfo = Sort.by(Sort.Direction.DESC, "brandID");
        Pageable pageable = PageRequest.of(pgNum - 1, Constants.PAGE_SIZE, sortInfo);
        Page<BrandEntity> brandEntityPage = brandDAO.findAll(pageable);
        responseMap.put("brandList", brandEntityPage.getContent());
        responseMap.put("paginationInfo", new PagerModel(pgNum, brandEntityPage.getTotalPages()));

        return responseMap;
    }
}
