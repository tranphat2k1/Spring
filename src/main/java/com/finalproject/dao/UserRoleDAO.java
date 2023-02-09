package com.finalproject.dao;

import java.util.List;

import com.finalproject.entity.UserRole;

public interface UserRoleDAO {
	UserRole findByID(Integer id);
	List<UserRole> findAll();
	UserRole create(UserRole entity);
	void update(UserRole entity);
	UserRole delete(Integer id);
}
