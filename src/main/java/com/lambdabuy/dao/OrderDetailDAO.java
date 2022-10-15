package com.lambdabuy.dao;

import java.util.List;

import com.lambdabuy.entity.Order;
import com.lambdabuy.entity.OrderDetail;

public interface OrderDetailDAO {
	OrderDetail findById(Integer id);

	List<OrderDetail> findAll();

	OrderDetail create(OrderDetail entity);

	void update(OrderDetail entity);

	OrderDetail delete(Integer id);

	List<OrderDetail> findByOrder(Order order);
}
