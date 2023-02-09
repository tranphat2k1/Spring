package com.finalproject.service;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.finalproject.dao.ProductDetailDAO;
import com.finalproject.entity.ProductDetail;

@SessionScope
@Service
public class CartService {
	@Autowired
	ProductDetailDAO dao;
	
	Map<Integer, ProductDetail> map = new HashMap<>();
	
	public void add(Integer id, Integer size) {
		ProductDetail pd = map.get(dao.findByProductID(id, size).getId());
		if(pd == null) {
			pd = dao.findByProductID(id, size);
			pd.setQuantity(1);
			map.put(pd.getId(), pd);
		}
		else {
			pd.setQuantity(pd.getQuantity() + 1);
		}
	}
	
	public void remove(Integer id) {
		map.remove(id);
	}
	
	public void update(Integer id, int qty) {
		ProductDetail pd = map.get(id);
		pd.setQuantity(qty);
	}
	
	public void clear() {
		map.clear();
	}
	
	public int getCount() {
		Collection<ProductDetail> list = this.getItems();
		int count = 0;
		for(ProductDetail pd: list){
			count += pd.getQuantity();
		}
		return count;
	}
	
	public float getTotal() {
		Collection<ProductDetail> list = this.getItems();
		float total = 0;
		for(ProductDetail pd: list){
			total += (pd.getQuantity()* pd.getProduct().getUnitPrice()) * (1-pd.getProduct().getDiscount());
		}
		return total;
	}
	
	public Collection<ProductDetail> getItems(){
		return map.values();
	}
}
