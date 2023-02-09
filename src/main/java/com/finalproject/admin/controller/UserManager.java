package com.finalproject.admin.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.finalproject.dao.OrderDAO;
import com.finalproject.dao.UserDAO;
import com.finalproject.entity.User;
import com.finalproject.entity.Order;

@Controller
public class UserManager {
	@Autowired
	HttpSession session;
	@Autowired
	UserDAO dao;
	@Autowired
	OrderDAO ddao;
	
	@RequestMapping("/admin/user")
	public String index(Model model) {
		if((int)session.getAttribute("userRole") == 4) {
			return "redirect:/";
		}
		User entity = new User();
		model.addAttribute("entity", entity);
		model.addAttribute("list", dao.findAll());
		return "admin/user/index";
	}
	
	@RequestMapping("/admin/user/edit/{id}")
	public String edit(Model model, @PathVariable("id") Integer id) {
		if((int)session.getAttribute("userRole") == 4) {
			return "redirect:/";
		}
		User entity = dao.findByID(id);
		model.addAttribute("entity", entity);
		model.addAttribute("list", dao.findAll());
		return "admin/user/index";
	}
	
	@RequestMapping("/admin/user/create")
	public String create(RedirectAttributes model, @ModelAttribute("entity") User entity) {
		if((int)session.getAttribute("userRole") == 4) {
			return "redirect:/";
		}
		List<User> list = new ArrayList<User>();
		list = dao.findAll();
		for(User u : list) {
			if(u.getEmail().equals(entity.getEmail())) {
				model.addAttribute("error", "Email đã tồn tại!");
				return "redirect:/admin/user";
			}
		}
		String regex = "^[a-zA-Z]+[a-z0-9]*@{1}\\w+mail.com$";
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(entity.getEmail());
		
		String phoneRegex = "^0\\d{9}$";
		Pattern phonePattern = Pattern.compile(phoneRegex);
		Matcher phoneMatcher = phonePattern.matcher(entity.getPhone());
		
		if(!matcher.find()) {
			model.addAttribute("error", "Email không hợp lệ!");
			return "redirect:/admin/user";
		}
		
		if(entity.getPassword().length() < 8) {
			model.addAttribute("error", "Mật khẩu cần ít nhất 8 kí tự!");
			return "redirect:/admin/user";
		}
		
		if(!phoneMatcher.find()) {
			model.addAttribute("error", "Số điện thoại không hợp lệ!");
			return "redirect:/admin/user";
		}
		entity.setPassword(BCrypt.hashpw(entity.getPassword(), BCrypt.gensalt(12)));
		dao.create(entity);
		model.addAttribute("message", "Thêm mới thành công");
		return "redirect:/admin/user";
	}
	
	@RequestMapping("/admin/user/update")
	public String update(RedirectAttributes model, @ModelAttribute("entity") User entity) {
		if((int)session.getAttribute("userRole") == 4) {
			return "redirect:/";
		}
		dao.update(entity);
		model.addAttribute("message", "Cập nhật thành công");
		return "redirect:/admin/user/edit/"+ entity.getId();
	}
	@RequestMapping(value={"/admin/user/delete", "/admin/user/delete/{id}"})
	public String delete(RedirectAttributes model, 
			@RequestParam(value="id", required=false) Integer id1, 
			@PathVariable(value="id", required=false) Integer id2) {
		if((int)session.getAttribute("userRole") == 4) {
			return "redirect:/";
		}
		Integer id = (id1 != null) ? id1 : id2;
		List<Order> list = ddao.findByUserID(id);
		if(list.isEmpty()) {
			dao.delete(id);
			model.addAttribute("message", "Xóa thành công");
		}
		else {
			model.addAttribute("error", "User này đang có đơn hàng, không thể xóa!");
		}
		return "redirect:/admin/user";
	}
}
