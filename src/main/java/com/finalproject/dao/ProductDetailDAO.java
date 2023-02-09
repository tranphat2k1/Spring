package com.finalproject.dao;

import java.util.List;

import com.finalproject.entity.ProductDetail;

public interface ProductDetailDAO {
	ProductDetail findByID(Integer id);
	ProductDetail findByProductID(Integer id, Integer size);
	List<ProductDetail> findAll();
	ProductDetail create(ProductDetail entity);
	void update(ProductDetail entity);
	ProductDetail delete(Integer id);
	List<ProductDetail> findByProductID(Integer id);
}
