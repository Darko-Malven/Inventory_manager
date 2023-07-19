package com.codingdojo.leonel.controller;

import java.util.List;

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
		User userInSession = (User) session.getAttribute("userInSession");
		if(userInSession==null) {
			return "redirect:/ingreso";
		}
		Integer totalProducts=service.totalProducts();
		Integer totalAmount=service.totalAmount();
		List<User> userList = service.allUser();
		model.addAttribute("totalProducts",totalProducts);
		model.addAttribute("totalAmount",totalAmount);
		model.addAttribute("userList",userList);
		model.addAttribute("user", userInSession);
		return "main.jsp";
	}
}
