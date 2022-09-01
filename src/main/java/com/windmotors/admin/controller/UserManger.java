package com.windmotors.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.windmotors.dao.UserDAO;
import com.windmotors.entity.User;

@Controller
public class UserManger {
	@Autowired
	UserDAO dao;

	@Autowired
	ServletContext app;

	@RequestMapping("/admin/customer/index")
	public String index(Model model) {
		User entity = new User();
		model.addAttribute("entity", entity);
		model.addAttribute("list", dao.findAll());
		return "admin/customer/index";
	}

	@RequestMapping("/admin/customer/edit/{id}")
	public String edit(Model model, @PathVariable("id") String id) {
		User entity = dao.findById(id);
		model.addAttribute("entity", entity);
		model.addAttribute("list", dao.findAll());
		return "admin/customer/index";
	}

	@RequestMapping("/admin/customer/create")
	public String create(RedirectAttributes model, @Validated @ModelAttribute("entity") User entity,
			@RequestParam("photo_file") MultipartFile file) throws IllegalStateException, IOException {

		User user2 = dao.findById(entity.getId());
		if (user2 != null) {
			model.addAttribute("message", "Tên đăng nhập đã được sử dụng!");
			return "redirect:/admin/customer/index";
		}

		if (file.isEmpty()) {
			entity.setPhoto("user.png");
		} else {
			entity.setPhoto(file.getOriginalFilename());
			String path = app.getRealPath("/static/images/customers/" + entity.getPhoto());
			file.transferTo(new File(path));
		}

		dao.create(entity);
		model.addAttribute("message", "Thêm mới thành công!");
		return "redirect:/admin/customer/index";
	}

	@RequestMapping("/admin/customer/update")
	public String update(RedirectAttributes model, @ModelAttribute("entity") User entity,
			@RequestParam("photo_file") MultipartFile file) throws IllegalStateException, IOException {
		if (!file.isEmpty()) {
			entity.setPhoto(file.getOriginalFilename());
			String path = app.getRealPath("/static/images/customers/" + entity.getPhoto());
			file.transferTo(new File(path));
		}
		dao.update(entity);
		model.addAttribute("message", "Cập nhật thành công!");
		return "redirect:/admin/customer/edit/" + entity.getId();
	}

	@RequestMapping(value = { "/admin/customer/delete", "/admin/customer/delete/{id}" })
	public String delete(RedirectAttributes model, @RequestParam(value = "id", required = false) String id1,
			@PathVariable(value = "id", required = false) String id2) {
		if (id1 != null) {
			dao.delete(id1);
		} else {
			dao.delete(id2);
		}

		model.addAttribute("message", "Xóa thành công!");
		return "redirect:/admin/customer/index";
	}

	int pageSize = 8;

	@ResponseBody
	@RequestMapping("/pager/customer/page-count")
	public long pageCount() {

		return dao.getPageCount(pageSize);
	}

	@ResponseBody
	@RequestMapping("/pager/customer/page/{pageNo}")
	public List<User> getPage(@PathVariable("pageNo") int pageNo) {
		List<User> list = dao.getPage(pageNo, pageSize);
		return list;
	}
}