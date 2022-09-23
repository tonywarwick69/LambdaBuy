package com.windmotors.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.windmotors.dao.OrderDAO;
import com.windmotors.dao.OrderDetailDAO;
import com.windmotors.dao.ProductDAO;
import com.windmotors.entity.Order;
import com.windmotors.entity.OrderDetail;
import com.windmotors.entity.Product;
import com.windmotors.entity.User;
import com.windmotors.service.CartService;



@Controller
public class OrderController {
	@Autowired
	ProductDAO pdao;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	CartService cart;
	
	@Autowired
	OrderDAO dao;
	
	@Autowired
	OrderDetailDAO ddao;

	@GetMapping("/order/checkout")
	public String showForm(@ModelAttribute("order") Order order) {
		User user = (User) session.getAttribute("user");
		
		order.setOrderDate(new Date());
		order.setUser(user);
		order.setAmount(cart.getAmount());
		order.setStatus(1);
		return "order/checkout";

	}
	
	@PostMapping("/order/checkout")
	public String purchase(Model model, 
			@ModelAttribute("order") Order order){
		Collection<Product> list = cart.getItems();
		List<OrderDetail> details = new  ArrayList<>();
		List<Product> listProduct = pdao.findAll();
		for(Product product:list) {
			OrderDetail detail =new OrderDetail();
			detail.setOrder(order);
			detail.setProduct(product);
			detail.setUnitPrice(product.getUnitPrice());
			detail.setQuantity(product.getQuantity());
			detail.setDiscount(product.getDiscount());
			details.add(detail);
			/*
			 * for(Product updateProduct:listProduct) { Product productUpdate = new
			 * Product(); productUpdate.setId(product.getId());
			 * productUpdate.setQuantity(updateProduct.getQuantity()-product.getQuantity());
			 * pdao.update(productUpdate); }
			 */
			
		}
		dao.create(order, details);
		cart.clear();
		model.addAttribute("message", "Đặt hàng thành công!");

		
		return "redirect:/order/list";

	}
	
	
	@GetMapping("/order/list")
	public String list(Model model) {
		User user = (User) session.getAttribute("user");
		List<Order> orders = dao.findByUser(user);
		model.addAttribute("orders", orders);
		return "order/list";
	}
	
	@GetMapping("/order/detail/{id}")
	public String detail(Model model, @PathVariable("id") Integer id) {
		Order order = dao.findById(id);
		List<OrderDetail> details = ddao.findByOrder(order);
		model.addAttribute("order", order);
		model.addAttribute("details", details);
		return "order/detail";
	}
	
	@GetMapping("/order/items")
	public String items(Model model) {
		User user = (User) session.getAttribute("user");
		List<Product> list = dao.findItemsByUser(user);
		model.addAttribute("list", list);
		return "product/list_order_item";
	}
	

}




