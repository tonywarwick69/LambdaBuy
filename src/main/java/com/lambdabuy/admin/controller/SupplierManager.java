package com.lambdabuy.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lambdabuy.dao.SupplierDAO;
import com.lambdabuy.entity.Supplier;

@Controller
public class SupplierManager {
	@Autowired
	SupplierDAO dao;
	//Danh sách supplier
	@RequestMapping("/admin/supplier/index")
	public String index(Model model) {
		Supplier enity = new Supplier();
		model.addAttribute("entity",enity);
		model.addAttribute("list",dao.findAll());
		return "admin/supplier/index";
	}
	
	@RequestMapping("/admin/supplier/edit/{id}")
	public String edit(Model model, @PathVariable("id") Integer id) {
		Supplier entity = dao.findById(id);
		model.addAttribute("entity", entity);
		model.addAttribute("list", dao.findAll());
		return "admin/supplier/index";
	}
	
	@RequestMapping("/admin/supplier/create")
	public String create(RedirectAttributes model, @ModelAttribute("entity") Supplier entity) {
		dao.create(entity);
		model.addAttribute("message", "Thêm mới thành công!");
		return "redirect:/admin/supplier/index";
	}
	
	@RequestMapping("/admin/supplier/update")
	public String update(RedirectAttributes model, @ModelAttribute("entity") Supplier entity) {
		dao.update(entity);
		model.addAttribute("message", "Cập nhật thành công!");
		return "redirect:/admin/supplier/edit/"+entity.getId();
	}
	
	@RequestMapping(value = {"/admin/supplier/delete","/admin/supplier/delete/{id}"})
	public String delete(RedirectAttributes model, 
			@RequestParam(value="id", required = false) Integer id1, 
			@PathVariable(value="id", required = false) Integer id2) {
		if(id1 != null) {
			dao.delete(id1);
		}else {
			dao.delete(id2);
		}
		
		model.addAttribute("message", "Xóa thành công!");
		return "redirect:/admin/supplier/index";
	}
}
