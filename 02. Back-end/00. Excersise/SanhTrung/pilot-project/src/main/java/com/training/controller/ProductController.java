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

import com.training.entity.ProductEntity;
import com.training.model.ResponseDataModel;
import com.training.service.IBrandService;
import com.training.service.IProductService;

@Controller
@RequestMapping(value = "/product")
public class ProductController {

	@Autowired
	IProductService productService;

	@Autowired
	IBrandService brandService;

//	Initialization page
	@GetMapping
	public String initProductPage(Model model) {
		model.addAttribute("listBrand", brandService.getAll());
		return "product-index";
	}

//	List all product
	@GetMapping("/api/findAll/{pageNumber}")
	@ResponseBody
	public ResponseDataModel findAllProductWithPage(@PathVariable("pageNumber") int pageNumber) {
		return productService.findAllProductWithPage(pageNumber);
	}

//	Add new product
	@PostMapping(value = "/api/add")
	@ResponseBody
	public ResponseDataModel addProduct(@ModelAttribute ProductEntity productEntity) {
		return productService.addProduct(productEntity);
	}

//	Find product by id
	@GetMapping("/api/find")
	@ResponseBody
	public ResponseDataModel findProductById(@RequestParam("id") Long productId) {
		return productService.findProductById(productId);
	}

//	Edit product
	@PostMapping(value = { "/api/update" })
	@ResponseBody
	public ResponseDataModel updateProduct(@ModelAttribute ProductEntity productEntity) {
		return productService.updateProduct(productEntity);
	}

//	Delete product
	@DeleteMapping(value = {"/api/delete/{productId}"})
	@ResponseBody
	public ResponseDataModel deleteProduct(@PathVariable("productId") Long productId) {
		return productService.deleteProduct(productId);
	}
	
//	Search prodcut by the only price
	@GetMapping(value = {"/api/searchByPrice/{priceFrom}/{toPrice}/{pageNumber}"})
	@ResponseBody
	public ResponseDataModel searchByPrice(@PathVariable("priceFrom") double priceFrom, @PathVariable("toPrice") double toPrice
										  ,@PathVariable("pageNumber") int pageNumber ) {
		return productService.searchByPrice(priceFrom, toPrice, pageNumber );
	}
//	Search product by product name or brandName
	@GetMapping(value = {"/api/searchByName/{keyword}/{pageNumber}"})
	@ResponseBody
	public ResponseDataModel searchByName(@PathVariable("keyword") String keyword, @PathVariable("pageNumber") int pageNumber) {
		return productService.searchByName(keyword, pageNumber);
	}
	
//	Search product by product name or brand name and price
	@GetMapping(value = {"/api/searchByNameAndPrice/{keyword}/{pageNumber}/{priceFrom}/{toPrice}"})
	@ResponseBody
	public ResponseDataModel searchByNameAndPrice(@PathVariable("keyword") String keyword, @PathVariable("pageNumber") int pageNumber,
											@PathVariable("priceFrom") double priceFrom, @PathVariable("toPrice") double toPrice){
		return productService.searchByNameAndPrice(keyword, pageNumber, priceFrom, toPrice);
	}

}
