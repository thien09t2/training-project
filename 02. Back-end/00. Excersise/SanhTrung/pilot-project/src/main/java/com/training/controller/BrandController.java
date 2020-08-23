package com.training.controller;



import java.util.Map;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.training.entity.BrandEntity;
import com.training.service.IBrandService;

@Controller
@RequestMapping(value = "/brand")
public class BrandController {
	
//	private final Logger LOGGER = LoggerFactory.getLogger(getClass());
	
	@Autowired
	IBrandService brandService;

	
	@GetMapping
	public String initIndexPage(Model model, @RequestParam( required = false) Integer page) {
		model.addAttribute("responData", brandService.findAllWithPage(page == null ? 1 : page));
		return "brand-index";
	}
	
	@GetMapping("/api/find/{pageNumber}")
	@ResponseBody
	public Map<String, Object> findAllWithPage(@PathVariable("pageNumber") int pageNumber) {
		return brandService.findAllWithPage(pageNumber);
	}
	
	@GetMapping(value = "/add")
	public String initAddPage(Model model) {
		return "brand-add";
	}
	
	@PostMapping(value = "/add")
	public String addBrand(@ModelAttribute BrandEntity brandEntity, RedirectAttributes redirectAttributes) {
		
		if (brandService.findByBrandName(brandEntity.getBrandName()) != null) {
			redirectAttributes.addFlashAttribute("errorMessage", "Brand Name is duplicated");
			return "redirect:/brand/add";
		}
		BrandEntity brandEntityUpdated =  brandService.add(brandEntity);
		if(brandEntityUpdated == null) {
			redirectAttributes.addFlashAttribute("errorMessage", "Add new Brand Fail");
			return "redirect:/brand/add";
		} else {
			return "redirect:/brand"; 
		}
	}
	
	/*Update brand*/
	@GetMapping(value = {"/update"})
	public String initUpdatePage(@RequestParam(name = "id") Long brandId, Model model) {
		model.addAttribute("brandEntity", brandService.findByBrandId(brandId));
		return "brand-update";
	}
	
	@PostMapping(value = {"/update"})
	public String update(@ModelAttribute BrandEntity brandEntity, RedirectAttributes redirectAttributes) {
		BrandEntity brandEntityUpdated = brandService.update(brandEntity);
		if (brandEntityUpdated == null) {
			redirectAttributes.addFlashAttribute("errorMessage", "Update Brand Fail");
			return "redirect:/brand/update?id=" + brandEntity.getBrandId();
		} else {
			return "redirect:/brand";
			}
	}
	
	/* Delete brand */
	@GetMapping(value = {"/delete"})
	public String delete(@RequestParam(name = "id") Long brandId) {
		brandService.delete(brandId);
		return "redirect:/brand";
	}
}
