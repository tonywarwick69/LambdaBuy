/*
package com.lambdabuy.service;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.lambdabuy.dao.CartItemDAO;
import com.lambdabuy.dao.ProductDAO;
import com.lambdabuy.entity.Cart;
import com.lambdabuy.entity.CartItem;
import com.lambdabuy.entity.Product;

@SessionScope //Name: scopedTarget.cartService
@Service
public class CartService {

	@Autowired
	ProductDAO dao;
	
	@Autowired
	CartItemDAO items;
	
	Map<Integer, CartItem> map = new HashMap<>();

	public void add(Integer id) {
		CartItem p = map.get(id);
		if (p == null) {
			p = items.findById(id);
			p.setQuantity(1);
			map.put(id, p);
		} else {
			p.setQuantity(p.getQuantity() + 1);
		}
	}

	public void remove(Integer id) {
		map.remove(id);
	}

	public void update(Integer id, int qty) {
		CartItem p = map.get(id);
		p.setQuantity(qty);
	}

	public void clear() {
		map.clear();
	}

	public int getCount() {
		Collection<CartItem> ps = this.getItems();
		int count = 0;
		for (CartItem p : ps) {
			count += p.getQuantity();
		}
		return count;
	}

	public double getAmount() {
		Collection<CartItem> ps = this.getItems();
		double amount = 0;
		for (CartItem i : ps) {
			List<Product> pros = dao.findByIds(i.getProduct().getId().toString());
			for(Product p: pros) {
				amount += i.getQuantity() * p.getUnitPrice() * (1 - p.getDiscount());
			}
			
		}
		return amount;
	}

	public Collection<CartItem> getItems() {
		return map.values();
	}
}
*/