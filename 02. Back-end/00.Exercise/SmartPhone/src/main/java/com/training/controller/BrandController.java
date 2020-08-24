package com.training.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.training.service.BrandService;
import com.training.entity.BrandEntity;

@Controller
@RequestMapping(value = { "/brand" })
public class BrandController {
	
	@Autowired
	BrandService brandService;
	
	@GetMapping
	public String initPage(Model model, @RequestParam(required = false) Integer page) {
		model.addAttribute("responseData", brandService.findAllWithPager(page == null ? 1 : page));
		return "brand-index";
	}
	
	@GetMapping(value = {"/add"})
	public String initAddPage() {
		return"brand-add";
	}
	
	@PostMapping(value = {"/add"})
	public String add(@ModelAttribute BrandEntity brandEntity, RedirectAttributes redirectAttributes) {
		if(brandService.findByBrandName(brandEntity.getBrandName()) != null) {
			redirectAttributes.addAttribute("errorMessage", "trung ten");
			return "redirect:/brand/add";
		}
	BrandEntity brandEntityUpdate = brandService.add(brandEntity);
	if(brandEntityUpdate == null) {
		redirectAttributes.addAttribute("errorMessage", "khong luu duoc");
		return "redirect:/brand/add";
	}
		else {
			return "redirect:/brand";
		}
	}
	  
	@GetMapping(value = {"/update"})
	public String intiUpdate(@RequestParam(name = "id") Long brandId, Model model) {
		model.addAttribute("brandEntity", brandService.findByBrandId(brandId));
		return "brand-update";
	}
	
	@PostMapping(value = {"/update"})
	public String update(@ModelAttribute BrandEntity brandEntity, RedirectAttributes redirectAttributes ) {
		BrandEntity brandEntityUpdate = brandService.update(brandEntity);
		if(brandEntityUpdate == null) {
			redirectAttributes.addAttribute("errorMessage", "khong update duoc");
			return "redirect:/brand/update";
		}
		else {
			return "redirect:/brand";
		}
	}
	
	@GetMapping(value = {"/delete"})
	public String delete(@RequestParam(name = "id") Long brandId) {
		brandService.delete(brandId);
		return "redirect:/brand";
	}
	
	}
	
	
