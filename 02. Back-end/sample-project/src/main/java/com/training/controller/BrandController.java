package com.training.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
		model.addAttribute("brandsList", brandService.getAll());
		return "brand";
	}

	@PostMapping(value = {"/add"})
	@ResponseBody
	public ResponseDataModel add(@ModelAttribute BrandEntity brandEntity) {
		return brandService.add(brandEntity);
	}

	@PutMapping(value = {"/update"})
	@ResponseBody
	public ResponseDataModel update(@ModelAttribute BrandEntity brandEntity) {
		return brandService.update(brandEntity);
	}

	@DeleteMapping(value = {"/delete/{brandId}"})
	@ResponseBody
	public ResponseDataModel delete(@PathVariable("brandId") Long brandId) {
		return brandService.delete(brandId);
	}
}