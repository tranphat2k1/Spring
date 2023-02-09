package com.finalproject.dao;

import java.util.List;

import com.finalproject.entity.Order;
import com.finalproject.entity.OrderDetail;

public interface OrderDetailDAO {
	OrderDetail findByID(Integer id);
	List<OrderDetail> findAll();
	OrderDetail create(OrderDetail entity);
	void update(OrderDetail entity);
	OrderDetail delete(Integer id);
	List<OrderDetail> findByOrder(Order order);
	List<OrderDetail> findByOrderID(Integer id);
}
