package com.finalproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.finalproject.dao.ProductDAO;
import com.finalproject.entity.Product;

@Controller
public class ProductController {
	@Autowired
	ProductDAO pdao;
	
	@RequestMapping("/product/list-by-brand/{bid}")
	public String listByBrand(Model model, @PathVariable("bid") Integer brandID) {
		List<Product> list = pdao.findByBrandId(brandID);
		model.addAttribute("list", list);
		return "product/list";
	}
	
	@RequestMapping("/product/list-by-keywords")
	public String listByKeywords(Model model, @RequestParam("keywords") String keywords) {
		List<Product> list = pdao.findByKeywords(keywords);
		model.addAttribute("list", list);
		return "product/list";
	}
	
	@RequestMapping("/product/detail/{pid}")
	public String viewDetail(Model model, @PathVariable("pid") Integer id) {
		Product pro = pdao.findByID(id);
		List<Product> list = pdao.findByBrandId(pro.getBrand().getId());
		model.addAttribute("pro", pro);
		model.addAttribute("list", list);
		return "product/detail";
	}
}
