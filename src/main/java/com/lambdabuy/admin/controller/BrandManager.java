package com.lambdabuy.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lambdabuy.dao.BrandDAO;
import com.lambdabuy.entity.Brand;

@Controller
public class BrandManager {
	@Autowired
	BrandDAO dao;
	//Điều hướng về trang chủ
	@RequestMapping("/admin/brand/index")
	public String index(Model model) {
		Brand enity = new Brand();
		model.addAttribute("entity",enity);
		model.addAttribute("list",dao.findAll());
		return "admin/brand/index";
	}
	//Load form khi user bấm nút edit 
	@RequestMapping("/admin/brand/edit/{id}")
	public String edit(Model model, @PathVariable("id") Integer id) {
		Brand entity = dao.findById(id);
		model.addAttribute("entity", entity);
		model.addAttribute("list", dao.findAll());
		return "admin/brand/index";
	}
	//Tạo mới
	@RequestMapping("/admin/brand/create")
	public String create(RedirectAttributes model, @ModelAttribute("entity") Brand entity) {
		dao.create(entity);
		model.addAttribute("message", "Thêm mới thành công!");
		return "redirect:/admin/brand/index";
	}
	//Tạo form và chỉnh sửa dữ liệu
	@RequestMapping("/admin/brand/update")
	public String update(RedirectAttributes model, @ModelAttribute("entity") Brand entity) {
		dao.update(entity);
		model.addAttribute("message", "Cập nhật thành công!");
		return "redirect:/admin/brand/edit/"+entity.getId();
	}
	//Xóa trong form và xóa khi bấm vào nút delete
	@RequestMapping(value = {"/admin/brand/delete","/admin/brand/delete/{id}"})
	public String delete(RedirectAttributes model, 
			@RequestParam(value="id", required = false) Integer id1, 
			@PathVariable(value="id", required = false) Integer id2) {
		if(id1 != null) {
			dao.delete(id1);
		}else {
			dao.delete(id2);
		}
		
		model.addAttribute("message", "Xóa thành công!");
		return "redirect:/admin/brand/index";
	}
}
