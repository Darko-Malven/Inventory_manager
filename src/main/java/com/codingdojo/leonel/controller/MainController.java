package com.codingdojo.leonel.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.codingdojo.leonel.models.User;
import com.codingdojo.leonel.service.AppServices;

@Controller
public class MainController {
	@Autowired
	private AppServices service;
	
	@GetMapping("/mainpage")
	public String mainPage(HttpSession session,Model model) {
		/*User userInSession = (User) session.getAttribute("userInSession");
		if(userInSession==null) {
			return "redirect:/ingreso";
		}
		model.addAttribute("user", userInSession);*/
		return "main.jsp";
	}
	
	
}
