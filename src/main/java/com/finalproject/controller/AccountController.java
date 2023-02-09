package com.finalproject.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.finalproject.dao.UserDAO;
import com.finalproject.entity.User;
import com.finalproject.entity.UserRole;

import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class AccountController {
	@Autowired
	UserDAO dao;
	@Autowired
	HttpSession session;
	@Autowired
	ServletContext app;
	
	@GetMapping("/account/login")
	public String login() {
		return "account/login";
	}
	
	@PostMapping("/account/login")
	public String login(Model model,
			@RequestParam("email") String email,
			@RequestParam("psw") String psw) {
		User user = dao.findByEmail(email);
		if(user == null) {
			model.addAttribute("error", "Email không chính xác!");
			return "account/login";
		}
		else if(!BCrypt.checkpw(psw, user.getPassword())) {
			model.addAttribute("error", "Mật khẩu không chính xác!");
			return "account/login";
		}
		else {
			model.addAttribute("success", "Đăng nhập thành công");
			session.setAttribute("user", user);
			session.setAttribute("userRole", user.getUserRole().getId());
			session.setAttribute("email", user.getEmail());	
			if(user.getUserRole().getId() == 1) {
				return "redirect:/admin";
			}
		}
		String backUrl = (String)session.getAttribute("back-url");
		if(backUrl != null) {
			return "redirect:" + backUrl;
		}	
		return "redirect:/";
	}
	
	@RequestMapping("/account/logout")
	public String logout() {
		session.removeAttribute("user");
		session.removeAttribute("email");
		return "redirect:/";
	}
	
	@GetMapping("/account/register")
	public String register(Model model) {
		User user = new User();
		model.addAttribute("form", user);
		return "account/register";
	}
	
	@PostMapping("/account/register")
	public String register(Model model, 
			@ModelAttribute("form") User user,
			@RequestParam("avatar_file") MultipartFile file) throws IllegalStateException, IOException{
		if(file.isEmpty()) {
			user.setAvatar("user.png");
		}
		else {
			String dir = app.getRealPath("/static/images/users");
			File f = new File(dir, file.getOriginalFilename());
			file.transferTo(f);
			user.setAvatar(f.getName());
		}
		List<User> list = new ArrayList<User>();
		list = dao.findAll();
		for(User u : list) {
			if(u.getEmail().equals(user.getEmail())) {
				model.addAttribute("error", "Email đã tồn tại!");
				return "account/register";
			}
		}
		String regex = "^[a-zA-Z]+[a-z0-9]*@{1}\\w+mail.com$";
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(user.getEmail());
		
		String phoneRegex = "^0\\d{9}$";
		Pattern phonePattern = Pattern.compile(phoneRegex);
		Matcher phoneMatcher = phonePattern.matcher(user.getPhone());
		
		if(!matcher.find()) {
			model.addAttribute("error", "Email không hợp lệ!");
			return "account/register";
		}
		
		if(user.getPassword().length() < 8) {
			model.addAttribute("error", "Mật khẩu cần ít nhất 8 kí tự!");
			return "account/register";
		}
		
		if(!phoneMatcher.find()) {
			model.addAttribute("error", "Số điện thoại không hợp lệ!");
			return "account/register";
		}
		user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(12)));
		UserRole ur = new UserRole();
		ur.setId(4);
		user.setUserRole(ur);
		
		dao.create(user);
		model.addAttribute("success", "Đăng ký thành công");

		return "redirect:/account/login";
	}
	
	@GetMapping("/account/change-password")
	public String changePsw() {
		return "account/change";
	}
	
	@PostMapping("/account/change-password")
	public String changePsw(Model model,
			@RequestParam("email") String email,
			@RequestParam("psw") String psw,
			@RequestParam("psw1") String psw1,
			@RequestParam("psw2") String psw2) {
		if(!psw1.equals(psw2)){
			model.addAttribute("error", "Mật khẩu xác nhận không khớp!");
		}
		else {
			User user = dao.findByEmail(email);
			if(user == null) {
				model.addAttribute("error", "Email không chính xác!");
			}
			else if(!psw.equals(user.getPassword())){
				model.addAttribute("error", "Mật khẩu hiện tại không chính xác!");
			}
			else if(psw1.length() < 8){
				model.addAttribute("error", "Mật khẩu cần ít nhất 8 kí tự!");
			}
			else {
				user.setPassword(psw1);
				dao.update(user);
				model.addAttribute("success", "Mật khẩu đã được đổi thành công");
			}
		}
		return "account/change";
	}
	
	@GetMapping("/account/update")
	public String update(Model model) {
		User user = (User) session.getAttribute("user");
		model.addAttribute("form", user);
		return "account/update";
	}
	
	@PostMapping("/account/update")
	public String update(Model model, 
			@ModelAttribute("form") User user,
			@RequestParam("avatar_file") MultipartFile file) throws IllegalStateException, IOException{
		if(!file.isEmpty()) {
			String dir = app.getRealPath("/static/images/users");
			File f = new File(dir, file.getOriginalFilename());
			file.transferTo(f);
			user.setAvatar(f.getName());
		}
		UserRole ur = new UserRole();
		ur.setId(4);
		user.setUserRole(ur);
		dao.update(user);
		session.setAttribute("user", user);
		session.setAttribute("email", user.getEmail());
		model.addAttribute("success", "Cập nhật thông tin thành công");
		return "account/update";
	}
	
}
