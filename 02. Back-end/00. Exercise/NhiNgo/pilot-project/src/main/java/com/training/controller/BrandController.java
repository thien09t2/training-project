package com.training.controller;


import com.training.entity.BrandEntity;
//import com.training.model.ResponseDataModel;
import com.training.service.IBrandService;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = { "/brand" })
public class BrandController {

    @Autowired
    IBrandService brandService;

    @GetMapping
    public String initPage(Model model, @RequestParam(required = false) Integer page) {
        model.addAttribute("responseData", brandService.findAllWithPager(page == null ? 1 : page));
        return "brand-index";
    }

    @GetMapping("/api/find/{pgNum}")
    @ResponseBody
    public Map<String, Object> findAllWithPager(@PathVariable("pgNum") int pgNum) {
        return brandService.findAllWithPager(pgNum);

    }

    @GetMapping(value = {"/add"})
    public String initAddPage() {
        return "brand-add";
    }

    @PostMapping(value = {"/add"})
    public String add(@ModelAttribute BrandEntity brandEntity, RedirectAttributes requestAttributes) {

        if (brandService.findByBrandName(brandEntity.getBrandName()) != null) {
            requestAttributes.addFlashAttribute("errMessage", "Brand Name is duplicated");
            return "redirect:/brand/add";
        }

        BrandEntity brandEntityAdded = brandService.add(brandEntity);

        if (brandEntityAdded == null) {
            requestAttributes.addFlashAttribute("errMessage", "Please enter information for new brand!");
            return "redirect:/brand/add";
        } else {
            return "redirect:/brand";
        }
    }

    @GetMapping(value = {"/update"})
    public String initUpdatePage(@RequestParam(name = "id") Long brandID, Model model) {
        model.addAttribute("brandEntity", brandService.findByBrandID(brandID));
        return "brand-update";
    }

    @PostMapping(value = {"/update"})
    public String update(@ModelAttribute BrandEntity brandEntity, Model model, RedirectAttributes redirectAttributes) {

        BrandEntity brandEntityUpdated = brandService.update(brandEntity);
        if (brandEntityUpdated == null) {
            redirectAttributes.addFlashAttribute("errMessage", "Update Brand Fail");
            return  "redirect:/brand/update?id=" + brandEntity.getBrandID();
        } else {
            return "redirect:/brand";
        }
    }

    @GetMapping(value = {"/delete"})
    public String delete(@RequestParam(name = "id") Long brandID) {
        brandService.delete(brandID);
        return "redirect:/brand";
    }
}
