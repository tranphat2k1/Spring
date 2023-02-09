package com.finalproject.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminHomeController {
	@Autowired
	HttpSession session;
	
	@RequestMapping("/admin")
	public String index() {
		if((int)session.getAttribute("userRole") < 4) {
			return "admin/home/index";
		}
		return "redirect:/";
	}
}
