package com.lambdabuy.supplier.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lambdabuy.dao.SupplierDAO;
import com.lambdabuy.entity.Supplier;
import com.lambdabuy.entity.User;

@Controller
public class SupplierSelfController {
	@Autowired
	HttpSession session;
	
	@Autowired
	SupplierDAO sdao;
	//CHỉnh sửa thông tin của chính nhà bán hàng đang đăng nhập vào trang quản lý bán hàng 
	@RequestMapping("/supplier/self/edit")
	public String editSupplier(Model model) {
		User user = (User) session.getAttribute("user");
		Supplier entity = sdao.findSupplierByUserId(user.getId());
		model.addAttribute("entity", entity);
		return "supplier/EditSupplier/EditSupplierForm";
	}
	@RequestMapping("/supplier/self/update")
	public String update(RedirectAttributes model, @ModelAttribute("entity") Supplier entity) {
		sdao.update(entity);
		model.addAttribute("message", "Cập nhật thành công!");
		return "redirect:/supplier/self/edit";
	}
}
