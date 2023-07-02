package com.lambdabuy.dao;

import java.util.List;

import com.lambdabuy.entity.CartItem;

public interface CartItemDAO {
	CartItem findById(int id);
	
	List<CartItem> findAll();
	
	CartItem create(CartItem entity);
	
	void update(CartItem entity);
	
	CartItem delete(int id);
	
	List<CartItem> findCartItemsByCartId(int itemId);
	
	List<CartItem> findSameCartIdAndProductInCartItem(int cartId,int productId);
	
	List<CartItem> findCartIdInCartItem(int cartId);
	
	//public double Total(int cartId);
	
}
