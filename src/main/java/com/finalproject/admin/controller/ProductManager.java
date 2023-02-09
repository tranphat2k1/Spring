package com.finalproject.admin.controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.finalproject.dao.ProductDAO;
import com.finalproject.dao.ProductDetailDAO;
import com.finalproject.entity.Product;
import com.finalproject.entity.ProductDetail;


@Controller
public class ProductManager {
	@Autowired
	HttpSession session;
	@Autowired
	ProductDAO dao;
	@Autowired
	ProductDetailDAO pdao;
	@Autowired
	ServletContext app;
	
	@RequestMapping("/admin/product")
	public String index(Model model) {
		if((int)session.getAttribute("userRole") == 4) {
			return "redirect:/";
		}
		Product entity = new Product();
		model.addAttribute("entity", entity);
		model.addAttribute("list", dao.findAll());
		return "admin/product/index";
	}
	
	@RequestMapping("/admin/product/edit/{id}")
	public String edit(Model model, @PathVariable("id") Integer id) {
		if((int)session.getAttribute("userRole") == 4) {
			return "redirect:/";
		}
		Product entity = dao.findByID(id);
		model.addAttribute("entity", entity);
		return "admin/product/index";
	}
	
	@RequestMapping("/admin/product/create")
	public String create(RedirectAttributes model, 
			@ModelAttribute("entity") Product entity,
			@RequestParam("image_file") MultipartFile file) throws IllegalStateException, IOException{
		if((int)session.getAttribute("userRole") == 4) {
			return "redirect:/";
		}
		Product product = new Product();
		List<Product> list = dao.findAll();
		for(Product p : list) {
			if(p.getProductName().equals(entity.getProductName())) {
				model.addAttribute("error", "Tên sản phẩm này đã tồn tại");
				return "redirect:/admin/product";
			}
		}
		product.setBrand(entity.getBrand());
		product.setDescription(entity.getDescription());
		product.setDiscount(entity.getDiscount());
		product.setProductName(entity.getProductName());
		product.setUnitPrice(entity.getUnitPrice());
		if(file.isEmpty()) {
			product.setImage("product.png");
		}
		else {
			product.setImage(file.getOriginalFilename());
			String path = app.getRealPath("/static/images/products/"+product.getImage());
			file.transferTo(new File(path));
		}
		dao.create(product);
		model.addAttribute("message", "Thêm mới thành công");
		return "redirect:/admin/product";
	}
	
	@RequestMapping("/admin/product/update")
	public String update(RedirectAttributes model, @ModelAttribute("entity") Product entity) {
		if((int)session.getAttribute("userRole") == 4) {
			return "redirect:/";
		}
		Product product = dao.findByID(entity.getId());
		product.setBrand(entity.getBrand());
		product.setDescription(entity.getDescription());
		product.setDiscount(entity.getDiscount());
		product.setImage(entity.getImage());
		product.setProductName(entity.getProductName());
		product.setUnitPrice(entity.getUnitPrice());
		product.setBrand(entity.getBrand());
		dao.update(product);
		model.addAttribute("message", "Cập nhật thành công");
		return "redirect:/admin/product/edit/"+ entity.getId();
	}
	@RequestMapping(value={"/admin/product/delete", "/admin/product/delete/{id}"})
	public String delete(RedirectAttributes model, 
			@RequestParam(value="id", required=false) Integer id1, 
			@PathVariable(value="id", required=false) Integer id2) {
		if((int)session.getAttribute("userRole") == 4) {
			return "redirect:/";
		}
		Integer id = (id1 != null) ? id1 : id2;
		List<ProductDetail> list = pdao.findByProductID(id);
		for(ProductDetail pd : list) {
			pdao.delete(pd.getId());
		}
		dao.delete(id);
		model.addAttribute("message", "Xóa thành công");
		return "redirect:/admin/product";
	}
}
