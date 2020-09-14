package com.training.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.training.entity.UserEntity;
import com.training.service.IUserService;

@Controller
@RequestMapping(value = { "" })
public class SignUpController {

	@Autowired
	private IUserService userService;

	@GetMapping(value = { "/signup" })
	public String initRegisterPage(Model model) {
		UserEntity userEntity = new UserEntity();
		model.addAttribute("userEntity", userEntity);
		return "register";
	}

	@PostMapping(value = { "/signup" })
	public String addUser(@Valid UserEntity userEntity, RedirectAttributes redirectAttributes) {

		if (userService.findByUserName(userEntity.getUserName()) != null) {
			redirectAttributes.addFlashAttribute("errMessage", "Username existed!");
			return "redirect:/signup";
		}

		UserEntity newUser = userService.register(userEntity);

		if (newUser == null) {
			redirectAttributes.addFlashAttribute("errMessage", "Please enter required fields to register new user!");
			return "redirect:/signup";
		} else {
			redirectAttributes.addFlashAttribute("errMessage", "Please log in to get started!");
			return "redirect:/login";
		}
	}

}
