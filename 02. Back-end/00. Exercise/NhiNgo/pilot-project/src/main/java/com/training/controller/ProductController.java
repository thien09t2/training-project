package com.training.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.training.entity.ProductEntity;
import com.training.model.ResponseDataModel;
import com.training.service.IBrandService;
import com.training.service.IProductService;

@Controller
@RequestMapping(value = { "/product" })
public class ProductController {

	@Autowired
	IProductService productService;

	@Autowired
	IBrandService brandService;

	@GetMapping
	public String initProductPage(Model model) {
		model.addAttribute("brandList", brandService.getAllOrderByBrandName());
		return "product-index";
	}

	@GetMapping(value = { "/api/findAll/{pgNum}" })
	@ResponseBody
	public ResponseDataModel findAllProductsWithPagerApi(@PathVariable("pgNum") int pgNum) {
		return productService.findAllProductsWithPagerApi(pgNum);
	}

	@GetMapping(value = { "/api/find" })
	@ResponseBody
	public ResponseDataModel findByProductIdApi(@RequestParam("id") Long productId) {
		return productService.findByProductIdApi(productId);
	}

	@PostMapping(value = { "/api/add" })
	@ResponseBody
	public ResponseDataModel addProductApi(@ModelAttribute ProductEntity productEntity) {
		return productService.addProductApi(productEntity);
	}

	@PostMapping(value = { "/api/update" })
	@ResponseBody
	public ResponseDataModel updateProductApi(@ModelAttribute ProductEntity productEntity) {
		return productService.updateProductApi(productEntity);
	}

	@DeleteMapping(value = { "/api/delete/{productId}" })
	@ResponseBody
	public ResponseDataModel deleteProductApi(@PathVariable Long productId) {
		return productService.deleteProductApi(productId);
	}
	
	@PostMapping(value = { "/api/search/{pgNum}" })
	@ResponseBody
	public ResponseDataModel searchProductApi(@RequestBody Map<String, Object> searchConditionMap, @PathVariable("pgNum") int pgNum) {
		return productService.searchProductWithNameAndPricePager(searchConditionMap, pgNum);		
	}
}