package com.finalproject.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.finalproject.dao.BrandDAO;
import com.finalproject.dao.ProductDAO;
import com.finalproject.entity.Brand;
import com.finalproject.entity.Product;

@Component
public class ShareInterceptor extends HandlerInterceptorAdapter{
	@Autowired
	BrandDAO dao;
	@Autowired
	ProductDAO pdao;
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
		ModelAndView modelAndView) throws Exception {
		List<Brand> list = dao.findAll();
		request.setAttribute("brands", list);
		List<Product> plist = pdao.findAll();
		request.setAttribute("products", plist);
	}
}
