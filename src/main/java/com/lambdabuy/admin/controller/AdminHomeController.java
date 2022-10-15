package com.lambdabuy.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lambdabuy.dao.OrderDAO;
import com.lambdabuy.dao.ProductDAO;
import com.lambdabuy.dao.UserDAO;
import com.lambdabuy.entity.Order;
import com.lambdabuy.entity.Product;
import com.lambdabuy.entity.User;

@Controller
public class AdminHomeController {
	
	@Autowired
	UserDAO dao;
	
	@Autowired
	ProductDAO pdao;
	
	@Autowired
	OrderDAO odao;
	
	@RequestMapping("/admin/home/index")
	public String index(Model model) {
		
		//Thống kê số lượng người dùng
		User user = new User();
		model.addAttribute("user", user);
		model.addAttribute("user", dao.findAll());
		
		//Thống kê số lượng sản phẩm
		Product product = new Product();
		model.addAttribute("product", product);
		model.addAttribute("product", pdao.findAll());
		
		//Thống kê số đơn hàng
		Order order = new Order();
		model.addAttribute("order", order);
		model.addAttribute("order", odao.findAll());
		
		return "admin/home/index";
		
	}
	

	
}
