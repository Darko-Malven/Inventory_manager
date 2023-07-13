package com.codingdojo.leonel.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codingdojo.leonel.models.User;
import com.codingdojo.leonel.service.AppServices;
@Controller
public class UserController {
	@Autowired
	private AppServices service;
	@GetMapping("/ingreso")
	public String mainPage(@ModelAttribute("newUser") User newUser,HttpSession session) {
		session.getAttribute("newUser");
		return "login.jsp";
	}
	@PostMapping("/create")
	public String newUser(@Valid @ModelAttribute("newUser") User newUser,
			  BindingResult result,
			  HttpSession session,
			  Model model) {
		
		
		service.register(newUser, result);
		if(result.hasErrors()) {
			return "login.jsp";
		}
		else {
			session.setAttribute("userInSession", newUser);
			return "redirect:/mainpage";	
		}
	}
	@PostMapping("/login")
	public String login(@RequestParam ("userNum") Integer userNum,
						@RequestParam ("password") String password,
						RedirectAttributes redirectAttributes,
						HttpSession session) {
		User userLogin = service.login(userNum,password);
		if(userLogin==null) {
			redirectAttributes.addFlashAttribute("error_login", "The ID/password is incorrect.");
			return "redirect:/ingreso";
		}
		else {
			session.setAttribute("userInSession", userLogin);
			return "redirect:/mainpage";  
		}
	}
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("userInSession");
		return "redirect:/ingreso";
	}
}
