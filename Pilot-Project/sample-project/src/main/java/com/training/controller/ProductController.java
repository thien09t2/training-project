package com.training.controller;

import javax.websocket.server.PathParam;

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
import com.training.entity.ProductEntity;
import com.training.model.ProductDTO;
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
	public String initPage(Model model) {
		model.addAttribute("listBrand", brandService.getAll());
		return "product-index";
	}
	
	//API
	
	@GetMapping("/api/findAll/{pageNumber}")
	@ResponseBody
	public ResponseDataModel findAllProductByApi(@PathVariable("pageNumber") int pageNumber) {
		return productService.findAllProductByApi(pageNumber);
	}
	
	@GetMapping("/api/find")
	@ResponseBody
	public ResponseDataModel findProductByIdApi(@RequestParam("id") Long productId) {
		return productService.findProductByIdApi(productId);
	}
	
	@PostMapping("/api/add/{brandId}")
	@ResponseBody
	public ResponseDataModel addProductByApi(@ModelAttribute ProductEntity productEntity, @PathVariable("brandId") long brandId) {
		BrandEntity brandEntity = brandService.findByBrandId(brandId);
		productEntity.setBrandEntity(brandEntity);
		return productService.addProductByApi(productEntity);
	}
	
	@PostMapping("/api/update/{brandId}")
	@ResponseBody
	public ResponseDataModel updateProductByApi(@ModelAttribute ProductEntity productEntity, @PathVariable("brandId") long brandId) {
		BrandEntity brandEntity = brandService.findByBrandId(brandId);
		productEntity.setBrandEntity(brandEntity);
		return productService.updateProductByApi(productEntity);
	}
	
	@DeleteMapping(value = {"/api/delete/{productId}"})
	@ResponseBody
	public ResponseDataModel deleteProductByApi(@PathVariable("productId") Long productId) {
		return productService.deleteProductByApi(productId);
	}
}
