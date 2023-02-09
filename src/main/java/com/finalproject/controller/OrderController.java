package com.finalproject.controller;


import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.finalproject.dao.OrderDAO;
import com.finalproject.dao.OrderDetailDAO;
import com.finalproject.dao.ProductDetailDAO;
import com.finalproject.entity.Order;
import com.finalproject.entity.OrderDetail;
import com.finalproject.entity.ProductDetail;
import com.finalproject.entity.User;
import com.finalproject.service.CartService;

@Controller
public class OrderController {
	@Autowired
	HttpSession session;
	@Autowired
	CartService cart;
	@Autowired
	OrderDAO dao;
	@Autowired
	OrderDetailDAO ddao;
	@Autowired
	ProductDetailDAO pdao;
	
	@GetMapping("/order/checkout")
	public String showForm(Model model, @ModelAttribute("order") Order order) {
		DecimalFormat df = new DecimalFormat("#,###");
		df.setMaximumFractionDigits(10);
		User user = (User)session.getAttribute("user");
		order.setOrderDate(new Date());
		order.setUser(user);
		order.setTotal(cart.getTotal());
		model.addAttribute("total", df.format(cart.getTotal()));
		return "order/checkout";
	}
	
	@PostMapping("/order/checkout")
	public String purchase(Model model, @ModelAttribute("order") Order order) {
		Collection<ProductDetail> list = cart.getItems();
		List<OrderDetail> details = new ArrayList<>();
		for(ProductDetail pd : list) {
			OrderDetail detail = new OrderDetail();
			detail.setOrder(order);
			detail.setProductDetail(pd);
			detail.setUnitPrice(pd.getProduct().getUnitPrice());
			detail.setQuantity(pd.getQuantity());
			detail.setDiscount(pd.getProduct().getDiscount());
			detail.setSize(pd.getSize());
			
			details.add(detail);
			
			ProductDetail p = pdao.findByID(pd.getId());
			p.setQuantity(p.getQuantity() - pd.getQuantity());
			pdao.update(p);
		}
		dao.create(order, details);
		cart.clear();
		return "redirect:/order/list";
	}
	
	@GetMapping("/order/list")
	public String list(Model model) {
		User user = (User)session.getAttribute("user");
		List<Order> list = dao.findByUser(user);
		model.addAttribute("orders", list);
		return "order/list";
	}
	
	@GetMapping("/order/detail/{id}")
	public String detail(Model model,
			@PathVariable("id") Integer id) {
		Order order = dao.findByID(id);
		List<OrderDetail> details = ddao.findByOrder(order);
		model.addAttribute("order", order);
		model.addAttribute("details", details);
		return "order/detail";
	}
	
	@GetMapping("/order/delete/{id}")
	public String delete(Model model,
			@PathVariable("id") Integer id) {
		List<OrderDetail> list = new ArrayList<OrderDetail>();
		list = ddao.findByOrderID(id);
		for(OrderDetail od : list) {
			ddao.delete(od.getId());
		}
		dao.delete(id);
		model.addAttribute("message", "Xóa thành công");
		return "order/list";
	}
}
