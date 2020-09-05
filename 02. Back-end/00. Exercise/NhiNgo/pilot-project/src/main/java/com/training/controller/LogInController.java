package com.training.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.training.service.IUserService;

@Controller
@RequestMapping(value = { "" })
public class LogInController {

	@Autowired
	private IUserService userService;

	@GetMapping(value = { "/", "/login" })
	public String initLoginPage(Model model) {
		return "login";
	}

	@GetMapping(value = { "/logout" })
	public String initLogoutPage(Model model) {
		model.addAttribute("title", "Logout");
		return "login";
	}

}
