package com.lambdabuy.dao;

import java.util.List;

import com.lambdabuy.entity.Brand;

public interface BrandDAO {
	Brand findById(int id);
	
	List<Brand> findAll();
	
	Brand create(Brand entity);
	
	void update(Brand entity);
	
	Brand delete(Integer id);
}
