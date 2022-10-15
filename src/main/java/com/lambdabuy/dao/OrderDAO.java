package com.lambdabuy.dao;

import java.util.List;

import com.lambdabuy.entity.Order;
import com.lambdabuy.entity.OrderDetail;
import com.lambdabuy.entity.Product;
import com.lambdabuy.entity.User;

public interface OrderDAO {
	Order findById(Integer id);

	List<Order> findAll();

	Order create(Order entity);

	void update(Order entity);

	Order delete(Integer id);

	void create(Order order, List<OrderDetail> details);

	List<Order> findByUser(User user);

	List<Product> findItemsByUser(User user);
}
