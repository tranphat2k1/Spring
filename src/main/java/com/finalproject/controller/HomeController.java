package com.finalproject.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.finalproject.dao.ProductDAO;
import com.finalproject.entity.Product;

@Controller
public class HomeController {
	@Autowired
	ProductDAO pdao;
	@Autowired
	HttpSession session;
	
	@RequestMapping("/")
	public String index(Model model) {
		List<Product> list = pdao.findAll();
		model.addAttribute("list", list);
		return "home/index";
	}
	
	@RequestMapping("/home/about")
	public String about() {
		return "home/about";
	}
	
	@RequestMapping("/home/contact")
	public String contact() {
		return "home/contact";
	}
}
