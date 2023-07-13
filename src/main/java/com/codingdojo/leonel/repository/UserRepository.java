package com.codingdojo.leonel.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.leonel.models.User;

@Repository
public interface UserRepository extends CrudRepository<User,Long>{
	
	User findByNumUser(Integer userNum);
	List<User> findAll();
}
