package com.finalproject.admin.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.finalproject.dao.OrderDAO;
import com.finalproject.dao.OrderDetailDAO;
import com.finalproject.entity.Order;
import com.finalproject.entity.OrderDetail;

@Controller
public class OrderManager {
	@Autowired
	HttpSession session;
	@Autowired
	OrderDAO dao;
	@Autowired
	OrderDetailDAO ddao;
	
	@RequestMapping("/admin/order")
	public String index(Model model) {
		if((int)session.getAttribute("userRole") == 4) {
			return "redirect:/";
		}
		Order entity = new Order();
		model.addAttribute("entity", entity);
		model.addAttribute("list", dao.findAll());
		model.addAttribute("details", ddao.findByOrder(entity));
		return "admin/order/index";
	}
	
	@RequestMapping("/admin/order/edit/{id}")
	public String edit(Model model, @PathVariable("id") Integer id) {
		if((int)session.getAttribute("userRole") == 4) {
			return "redirect:/";
		}
		Order entity = dao.findByID(id);
		model.addAttribute("entity", entity);
		model.addAttribute("list", dao.findAll());
		model.addAttribute("details", ddao.findByOrder(entity));
		return "admin/order/index";
	}
	
	@RequestMapping("/admin/order/update")
	public String update(RedirectAttributes model, @ModelAttribute("entity") Order entity) {
		if((int)session.getAttribute("userRole") == 4) {
			return "redirect:/";
		}
		dao.update(entity);
		model.addAttribute("message", "Cập nhật thành công");
		return "redirect:/admin/order/edit/"+ entity.getId();
	}
	@RequestMapping(value={"/admin/order/delete", "/admin/order/delete/{id}"})
	public String delete(RedirectAttributes model, 
			@RequestParam(value="id", required=false) Integer id1, 
			@PathVariable(value="id", required=false) Integer id2) {
		if((int)session.getAttribute("userRole") == 4) {
			return "redirect:/";
		}
		Integer id = (id1 != null) ? id1 : id2;
		List<OrderDetail> list = new ArrayList<OrderDetail>();
		list = ddao.findByOrderID(id);
		for(OrderDetail od : list) {
			ddao.delete(od.getId());
		}
		dao.delete(id);
		model.addAttribute("message", "Xóa thành công");
		return "redirect:/admin/order";
	}
}
