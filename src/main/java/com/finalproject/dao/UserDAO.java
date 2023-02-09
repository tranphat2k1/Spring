package com.finalproject.dao;

import java.util.List;

import com.finalproject.entity.User;

public interface UserDAO {
	User findByID(Integer id);
	List<User> findAll();
	User create(User entity);
	void update(User entity);
	User delete(Integer id);
	User findByEmail(String email);
}
