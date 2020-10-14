package com.training.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.training.entity.BrandEntity;
import com.training.model.ResponseDataModel;
import com.training.service.IBrandService;

@Controller
@RequestMapping(value = { "/brand" })
public class BrandController {

	@Autowired
	IBrandService brandService;

	@GetMapping
	public String initPage(Model model) {
		return "brand-index";
	}

	@GetMapping(value = { "/api/findAll/{pgNum}" })
	@ResponseBody
	public ResponseDataModel findAllWithPagerApi(@PathVariable("pgNum") int pgNum) {
		return brandService.findAllWithPagerApi(pgNum);
	}

	@PostMapping(value = { "/api/add" })
	@ResponseBody
	public ResponseDataModel addApi(@ModelAttribute BrandEntity brandEntity) {
		return brandService.addApi(brandEntity);
	}

	@GetMapping(value = { "/api/find" })
	@ResponseBody
	public ResponseDataModel findByBrandIdApi(@RequestParam("id") Long brandId) {
		return brandService.findByBrandIdApi(brandId);
	}

	@PostMapping(value = { "/api/update" })
	@ResponseBody
	public ResponseDataModel updateApi(@ModelAttribute BrandEntity brandEntity) {
		return brandService.updateApi(brandEntity);
	}

	@DeleteMapping(value = { "/api/delete/{brandId}" })
	@ResponseBody
	public ResponseDataModel deleteApi(@PathVariable("brandId") Long brandId) {
		return brandService.deleteApi(brandId);
	}
	
	@GetMapping(value = {"/api/search/{keyword}/{pgNum}"})
	@ResponseBody
	public ResponseDataModel searchBrandApi(@PathVariable("keyword") String keyword, @PathVariable("pgNum") int pgNum) {
		return brandService.searchBrandWithPager(keyword, pgNum);
	}

}
