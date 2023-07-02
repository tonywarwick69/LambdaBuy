package com.lambdabuy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lambdabuy.dao.ProductDAO;
import com.lambdabuy.entity.Product;



@Controller
public class HomeController {
	@Autowired
	ProductDAO pdao;
	//Mặc định khi vào trang chủ hiển thị danh sách sản phẩm gồm: theo có chương trình đặc biệt(4), Theo sản phẩm mới nhất(0)
	@RequestMapping(value = {"/", "/home","/home/addProduct"})
	public String index(Model model) {
		List<Product> list2 = pdao.findBySpecial(4);
		model.addAttribute("list", list2);
		List<Product> list3 = pdao.findBySpecial(0);
		model.addAttribute("list1", list3);
		return "home/index";
	}
	@RequestMapping("/about")
	public String about() {
		return "home/about";
	}
	//Trang liên hệ
	@RequestMapping("/contact")
	public String contact() {
		return "home/contact";
	}
	//Trang hỏi đáp
	@RequestMapping("/faq")
	public String faq() {
		return "home/faq";
	}

	@ResponseBody
	@RequestMapping("/home/language")
	public void language() {

	}
}
