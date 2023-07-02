package com.lambdabuy.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="Carts")
public class Cart {
	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	int id;
	int productId;
	int quantity;
	double unitpirce;
	double total;
	
	//@OneToMany(mappedBy="cart")
	//List<Product> products;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getUnitpirce() {
		return unitpirce;
	}

	public void setUnitpirce(double unitpirce) {
		this.unitpirce = unitpirce;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}
/*
	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}
*/	

}
