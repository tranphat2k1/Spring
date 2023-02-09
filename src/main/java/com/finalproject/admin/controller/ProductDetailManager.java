package com.finalproject.admin.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.finalproject.dao.ProductDetailDAO;
import com.finalproject.entity.Product;
import com.finalproject.entity.ProductDetail;


@Controller
public class ProductDetailManager {
	@Autowired
	HttpSession session;
	@Autowired
	ProductDetailDAO dao;
	@Autowired
	ServletContext app;
	
	@RequestMapping("/admin/productDetail")
	public String index(Model model) {
		if((int)session.getAttribute("userRole") == 4) {
			return "redirect:/";
		}
		ProductDetail entity = new ProductDetail();
		model.addAttribute("entity", entity);
		model.addAttribute("list", dao.findAll());
		return "admin/productDetail/index";
	}
	
	@RequestMapping("/admin/productDetail/edit/{id}")
	public String edit(Model model, @PathVariable("id") Integer id) {
		if((int)session.getAttribute("userRole") == 4) {
			return "redirect:/";
		}
		ProductDetail entity = dao.findByID(id);
		model.addAttribute("entity", entity);
		return "admin/productDetail/index";
	}
	
	@RequestMapping("/admin/productDetail/create")
	public String create(RedirectAttributes model, 
			@ModelAttribute("entity") ProductDetail entity){
		if((int)session.getAttribute("userRole") == 4) {
			return "redirect:/";
		}
		List<ProductDetail> list = dao.findByProductID(entity.getProduct().getId());
		for(ProductDetail pd : list) {
			if(pd.getSize() == entity.getSize()) {
				model.addAttribute("error", "Sản phẩm với size này đã tồn tại, vui lòng chọn size khác");
				return "redirect:/admin/productDetail";
			}
		}
		Product pro = new Product();
		pro.setId(entity.getProduct().getId());
		ProductDetail productDetail = new ProductDetail();
		productDetail.setSize(entity.getSize());
		productDetail.setQuantity(entity.getQuantity());
		productDetail.setProduct(pro);
		dao.create(productDetail);
		model.addAttribute("message", "Thêm mới thành công");
		return "redirect:/admin/productDetail";
	}
	
	@RequestMapping("/admin/productDetail/update")
	public String update(RedirectAttributes model, @ModelAttribute("entity") ProductDetail entity) {
		if((int)session.getAttribute("userRole") == 4) {
			return "redirect:/";
		}
		ProductDetail productDetail = dao.findByID(entity.getId());
		productDetail.setSize(entity.getSize());
		productDetail.setQuantity(entity.getQuantity());
		dao.update(productDetail);
		model.addAttribute("message", "Cập nhật thành công");
		return "redirect:/admin/productDetail/edit/"+ entity.getId();
	}
	@RequestMapping(value={"/admin/productDetail/delete", "/admin/productDetail/delete/{id}"})
	public String delete(RedirectAttributes model, 
			@RequestParam(value="id", required=false) Integer id1, 
			@PathVariable(value="id", required=false) Integer id2) {
		if((int)session.getAttribute("userRole") == 4) {
			return "redirect:/";
		}
		Integer id = (id1 != null) ? id1 : id2;
		dao.delete(id);
		model.addAttribute("message", "Xóa thành công");
		return "redirect:/admin/productDetail";
	}
}
