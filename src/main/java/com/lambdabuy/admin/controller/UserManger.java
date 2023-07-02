package com.lambdabuy.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
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

import com.lambdabuy.dao.UserDAO;
import com.lambdabuy.entity.User;

@Controller
public class UserManger {
	@Autowired
	UserDAO dao;

	@Autowired
	ServletContext app;
	//Danh sách user
	@RequestMapping("/admin/customer/index")
	public String index(Model model) {
		User entity = new User();
		model.addAttribute("entity", entity);
		model.addAttribute("list", dao.findAll());
		return "admin/customer/index";
	}
	//Form chỉnh sửa User
	@RequestMapping("/admin/customer/edit/{id}")
	public String edit(Model model, @PathVariable("id") String id) {
		User entity = dao.findById(id);
		model.addAttribute("entity", entity);
		model.addAttribute("list", dao.findAll());
		return "admin/customer/index";
	}
	//Tạo User mới, chức năng chỉ dành cho Admin
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
	//Update thông tin User, chỉ cho phép vô hiệu hóa
	@RequestMapping("/admin/customer/update")
	public String update(RedirectAttributes model, @ModelAttribute("entity") User entity,
			@RequestParam("photo_file") MultipartFile file) throws IllegalStateException, IOException {
		String id=entity.getId();
		String fullname=entity.getFullname();
		int sdt=entity.getTelephone();
		String email=entity.getEmail();
		if (!file.isEmpty()) {
			entity.setPhoto(file.getOriginalFilename());
			String path = app.getRealPath("/static/images/customers/" + entity.getPhoto());
			file.transferTo(new File(path));
		}
		User findUser= dao.findById(entity.getId());
		String password= findUser.getPassword();
		String photo=entity.getPhoto();
		boolean activated=entity.getActivated();
		int role=entity.getRole();
		Date birthDay= entity.getBirthDay();
		User user2=new User(id,password,fullname,sdt,email,photo,activated,role,birthDay);
		dao.update(user2);
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
	//Chức năng vô hiệu hóa tài khoản User
	@RequestMapping(value = { "/admin/customer/deactivate", "/admin/customer/deactivate/{id}" })
	public String deactivate(RedirectAttributes model, @RequestParam(value = "id", required = false) String id1,
			@PathVariable(value = "id", required = false) String id2) {
		if (id1 != null) {
			User user = dao.findById(id1);
			user.setActivated(false);
			dao.update(user);
		} else {
			User user = dao.findById(id2);
			user.setActivated(false);
			dao.update(user);
		}

		model.addAttribute("message", "Vô hiệu hóa tài khoản thành công!");
		return "redirect:/admin/customer/index";
	}
}