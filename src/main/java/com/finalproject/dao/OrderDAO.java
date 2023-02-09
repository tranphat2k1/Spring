package com.finalproject.dao;

import java.util.List;

import com.finalproject.entity.Order;
import com.finalproject.entity.OrderDetail;
import com.finalproject.entity.User;

public interface OrderDAO {
	Order findByID(Integer id);
	List<Order> findAll();
	Order create(Order entity);
	void update(Order entity);
	Order delete(Integer id);
	void create(Order order, List<OrderDetail> details);
	List<Order> findByUser(User user);
	List<Order> findByUserID(Integer uid);
}
