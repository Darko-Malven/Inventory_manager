package com.codingdojo.leonel.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.codingdojo.leonel.models.Inventory;
import com.codingdojo.leonel.models.User;
import com.codingdojo.leonel.service.AppServices;

@Controller
public class InventoryController {
	@Autowired
	private AppServices service;
	@GetMapping("/new-product")
	public String newProduct(HttpSession session, @ModelAttribute("newProduct") Inventory newProduct) {
		User userInSession = (User) session.getAttribute("userInSession");
		if(userInSession==null) {
			return "redirect:/ingreso";
		}
		return "createproduct.jsp";
	}
	@PostMapping("/newproduct/{id}")
	public String createInventory(@Valid @ModelAttribute("newProduct") Inventory newProduct,
			  @PathVariable ("id") Long id,
			  HttpSession session,
			  Model model,
			  BindingResult result) {
		if(result.hasErrors()) {
			model.addAttribute("user", newProduct.getMyInventory());
			return "createproduct.jsp";
		}
		
		else {
		User user = service.findUser(id);
		user.setManager(newProduct);
		service.saveProduct(newProduct);
		return "redirect:/new-product";
		}
	}
	@DeleteMapping("/deleteProduct/{id}")
	public void deleteInventory(@PathVariable("id") Long id,
								HttpSession session, 
					            Model model) {
		Inventory deleted = service.findIdProduct(id);
		service.deleteProduct(id);
	}
}
