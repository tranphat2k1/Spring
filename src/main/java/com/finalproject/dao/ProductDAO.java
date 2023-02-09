package com.finalproject.dao;

import java.util.List;

import com.finalproject.entity.Product;

public interface ProductDAO {
	Product findByID(Integer id);
	List<Product> findAll();
	Product create(Product entity);
	void update(Product entity);
	Product delete(Integer id);
	List<Product> findByBrandId(Integer brandID);
	List<Product> findByKeywords(String keywords);
}
