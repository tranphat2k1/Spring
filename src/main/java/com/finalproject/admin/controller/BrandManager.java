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

import com.finalproject.dao.BrandDAO;
import com.finalproject.entity.Brand;

@Controller
public class BrandManager {
	@Autowired
	HttpSession session;
	@Autowired
	BrandDAO dao;
	
	@RequestMapping("/admin/brand")
	public String index(Model model) {
		if((int)session.getAttribute("userRole") == 4) {
			return "redirect:/";
		}
		Brand entity = new Brand();
		model.addAttribute("entity", entity);
		model.addAttribute("list", dao.findAll());
		return "admin/brand/index";
	}
	
	@RequestMapping("/admin/brand/edit/{id}")
	public String edit(Model model, @PathVariable("id") Integer id) {
		if((int)session.getAttribute("userRole") == 4) {
			return "redirect:/";
		}
		Brand entity = dao.findByID(id);
		model.addAttribute("entity", entity);
		model.addAttribute("list", dao.findAll());
		return "admin/brand/index";
	}
	
	@RequestMapping("/admin/brand/create")
	public String create(RedirectAttributes model, @ModelAttribute("entity") Brand entity) {
		if((int)session.getAttribute("userRole") == 4) {
			return "redirect:/";
		}
		List<Brand> list = new ArrayList<Brand>();
		list = dao.findAll();
		for(Brand b : list) {
			if(!b.getBrandName().equals(entity.getBrandName())) {
				model.addAttribute("message", "Thêm mới thành công");
			}
			else {
				model.addAttribute("error", "Tên nhãn hàng này đã tồn tại!");
				return "redirect:/admin/brand";
			}
		}
		dao.create(entity);
		return "redirect:/admin/brand";
	}
	
	@RequestMapping("/admin/brand/update")
	public String update(RedirectAttributes model, @ModelAttribute("entity") Brand entity) {
		if((int)session.getAttribute("userRole") == 4) {
			return "redirect:/";
		}
		dao.update(entity);
		model.addAttribute("message", "Cập nhật thành công");
		return "redirect:/admin/brand/edit/"+ entity.getId();
	}
	@RequestMapping(value={"/admin/brand/delete", "/admin/brand/delete/{id}"})
	public String delete(RedirectAttributes model, 
			@RequestParam(value="id", required=false) Integer id1, 
			@PathVariable(value="id", required=false) Integer id2) {
		if((int)session.getAttribute("userRole") == 4) {
			return "redirect:/";
		}
		Integer id = (id1 != null) ? id1 : id2;
		dao.delete(id);
		model.addAttribute("message", "Xóa thành công");
		return "redirect:/admin/brand";
	}
}
