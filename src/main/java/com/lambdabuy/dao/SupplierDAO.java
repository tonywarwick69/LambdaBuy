package com.lambdabuy.dao;

import java.util.List;

import com.lambdabuy.entity.Supplier;

public interface SupplierDAO {
	Supplier findById(int id);
	
	List<Supplier> findAll();
	
	Supplier create(Supplier entity);
	
	void update(Supplier entity);
	
	Supplier delete(Integer id);
	
	Supplier findSupplierByUserId(String userId);
}
