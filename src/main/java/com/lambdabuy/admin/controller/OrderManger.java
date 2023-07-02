package com.lambdabuy.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lambdabuy.dao.OrderDAO;
import com.lambdabuy.dao.OrderDetailDAO;
import com.lambdabuy.dao.ProductDAO;
import com.lambdabuy.entity.Order;
import com.lambdabuy.entity.OrderDetail;
import com.lambdabuy.entity.Product;

@Controller
public class OrderManger {
	@Autowired
	OrderDAO dao;
	
	@Autowired
	OrderDetailDAO ddao;
	
	@Autowired
	ProductDAO pdao;
	//Danh sách Order và OrderDetail thuộc Order đó
	@RequestMapping("/admin/order/index")
	public String index(Model model) {
		Order entity = new Order();
		
		model.addAttribute("entity", entity);
		model.addAttribute("details", ddao.findByOrder(entity));
		model.addAttribute("list", dao.findAll());
		
		return "admin/order/index";
	}
	//Chỉnh sửa thông tin
	@RequestMapping("/admin/order/edit/{id}")
	public String edit(Model model, @PathVariable("id") Integer id) {
		Order entity = dao.findById(id);
		model.addAttribute("entity", entity);
		model.addAttribute("details", ddao.findByOrder(entity));
		model.addAttribute("list", dao.findAll());
		return "admin/order/index";
	}
	//Thêm đơn hàng, chức năng chỉ để thử nghiệm, việc lập đơn hàng dành cho khách hàng
	@RequestMapping("/admin/order/create")
	public String create(RedirectAttributes model, @ModelAttribute("entity") Order entity) {
		dao.create(entity);
		model.addAttribute("message", "Thêm mới thành công!");
		return "redirect:/admin/order/index";
	}
	//Cập nhật thông tin
	@RequestMapping("/admin/order/update")
	public String update(RedirectAttributes model, @ModelAttribute("entity") Order entity) {
		List<OrderDetail> listDetail= ddao.findByOrder(entity);
		Order order = dao.findById(entity.getId());
		entity.setDescription(order.getDescription());
		dao.update(entity);
		model.addAttribute("message", "Cập nhật thành công!");
		/*
		if(entity.getStatus()==3) {
			for(OrderDetail searchList:listDetail) {
				//List<Product> product = ddao.findByProduct(null)
				Product products = pdao.findById(searchList.getProduct().getId());
				
					//Product updateProduct = new Product();
					products.setId(products.getId());
					products.setSupplier(products.getSupplier());
					int updateQuantity=products.getQuantity()-searchList.getQuantity();
					products.setQuantity(updateQuantity);
					pdao.update(products);
				
			}
		}
		*/
		return "redirect:/admin/order/edit/"+entity.getId();
	}
	
	@RequestMapping(value = {"/admin/order/delete","/admin/order/delete/{id}"})
	public String delete(RedirectAttributes model, 
			@RequestParam(value="id", required = false) Integer id1, 
			@PathVariable(value="id", required = false) Integer id2) {
		if(id1 != null) {
			dao.delete(id1);
			ddao.delete(id1);
		}else {
			dao.delete(id2);
			ddao.delete(id2);
		}
		
		model.addAttribute("message", "Xóa thành công!");
		return "redirect:/admin/order/index";
	}

}
