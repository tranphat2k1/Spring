package com.finalproject.dao;

import java.util.List;

import com.finalproject.entity.Brand;

public interface BrandDAO {
	Brand findByID(Integer id);
	List<Brand> findAll();
	Brand create(Brand entity);
	void update(Brand entity);
	Brand delete(Integer id);
}
