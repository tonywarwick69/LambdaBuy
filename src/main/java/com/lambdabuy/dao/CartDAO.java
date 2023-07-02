package com.lambdabuy.dao;

import java.util.List;

import com.lambdabuy.entity.Cart;

public interface CartDAO {
	Cart findById(int id);
	
	List<Cart> findAll();
	
	Cart create(Cart entity);
	
	void update(Cart entity);
	
	Cart delete(Integer id);
	
	Cart findCartByUserId(String userId);
	
}
