package com.codingdojo.leonel.service;

import java.util.List;
import java.util.Random;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.codingdojo.leonel.models.Inventory;
import com.codingdojo.leonel.models.User;
import com.codingdojo.leonel.repository.InventoryRepository;
import com.codingdojo.leonel.repository.UserRepository;

@Service
public class AppServices {
	@Autowired
	private UserRepository userRepo;
	@Autowired
	private InventoryRepository invRepo;
	public User register(User newUser, BindingResult result) {
			
			Integer userUnique = new Random().nextInt(200- 1);
			User userNum = userRepo.findByNumUser(userUnique); //NULL o Objeto Usuario
			if(userNum != null) {
				result.rejectValue("numUser", "Unique", "This user number does exist");
			}
			
			String password = newUser.getPassword();
			String confirm = newUser.getConfirm();
			if(!password.equals(confirm)) { //! -> Lo contrario
				//result.rejectValue("confirm", "Matches", "The passwords don't match");
				result.rejectValue("confirm", "Matches", "The passwords don't match");
			}
			
		
			if(result.hasErrors()) {
				return null;
			} 
			else {
				newUser.setNumUser(userUnique);
				String pass_encript = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
				newUser.setPassword(pass_encript);
				return userRepo.save(newUser);
			}	
			
		}
	
	public User login(Integer userNum, String password) {
		User userExists = userRepo.findByNumUser(userNum); //NULL o Objeto de User
		if(userExists == null) {
			return null;
		}
		
		if(BCrypt.checkpw(password, userExists.getPassword())) {
			return userExists;
		} else {
			return null;
		}
	}
	public User findUser(Long id) {
		return userRepo.findById(id).orElse(null);
	}
	public List<User> allUser(){
		return userRepo.findAll();
	}
	public User saveUser(User user) {
		String pass_encript = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
		user.setPassword(pass_encript);
		return userRepo.save(user);
	}
	public void deleteUser(Long id) {
        userRepo.deleteById(id);
    }
	public Inventory saveProduct(Inventory product) {
		
		return invRepo.save(product);
	}
	public Inventory findIdProduct(Long id) {
		return invRepo.findById(id).orElse(null);
	}
	public void deleteProduct(Long id) {
		invRepo.deleteById(id);
	}
	public Inventory findProduct(String numProduct) {
		return invRepo.findByNumProduct(numProduct);
	}
	public List<Inventory> finAllProducts(){
		return invRepo.findAll();
	}
	public Integer totalAmount() {
		return invRepo.totalAmount();
	}
	public Integer totalProducts() {
		return invRepo.totalProducts();
	}
}
