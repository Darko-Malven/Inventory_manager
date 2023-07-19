package com.codingdojo.leonel.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="inv")
public class Inventory {
	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	private Long id;
	@NotEmpty
	private String product;
	@NotNull
	private String numProduct;
	@Size(min=0)
	private Integer quantity=0;
	@Size(min=0)
	private Integer totalQuantity=0;
	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;
	
	@OneToMany(mappedBy="manager",fetch=FetchType.LAZY)
	private List<User> myInventory;
	
	
	public Inventory() {
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public String getNumProduct() {
		return numProduct;
	}
	public void setNumProduct(String numProduct) {
		this.numProduct = numProduct;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	
	public Integer getTotalQuantity() {
		return totalQuantity;
	}
	public void setTotalQuantity(Integer totalQuantity) {
		this.totalQuantity = totalQuantity;
	}
	public List<User> getMyInventory() {
		return myInventory;
	}
	public void setMyInventory(List<User> myInventory) {
		this.myInventory = myInventory;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	@PrePersist
	public void onCreate() {
		this.createdAt = new Date();
	}
	@PreUpdate
	public void onUpdate() {
		this.updatedAt = new Date();
	}
	
}
