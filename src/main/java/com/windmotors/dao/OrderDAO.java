package com.windmotors.dao;

import java.util.List;

import com.windmotors.entity.Order;
import com.windmotors.entity.OrderDetail;
import com.windmotors.entity.Product;
import com.windmotors.entity.User;

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
