package com.codingdojo.leonel.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.leonel.models.Inventory;

@Repository
public interface InventoryRepository extends CrudRepository<Inventory,Long>{
	Inventory findByNumProduct(String numProduct);
	List<Inventory> findAll();
	@Query("SELECT SUM(quantity) FROM Inventory")
	Integer totalAmount();
	@Query("SELECT COUNT(product) FROM Inventory")
	Integer totalProducts();
}
