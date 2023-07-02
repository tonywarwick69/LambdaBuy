package com.lambdabuy.controller;

import java.util.List;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lambdabuy.bean.MailInfo;
import com.lambdabuy.dao.BrandDAO;
import com.lambdabuy.dao.CategoryDAO;
import com.lambdabuy.dao.ProductDAO;
import com.lambdabuy.dao.SupplierDAO;
import com.lambdabuy.entity.Brand;
import com.lambdabuy.entity.Category;
import com.lambdabuy.entity.Product;
import com.lambdabuy.entity.Supplier;
import com.lambdabuy.service.CookieService;
import com.lambdabuy.service.MailService;
//Các danh sách này cho chức năng tìm kiếm, lọc danh sách sản phẩm
@Controller
public class ProductController {

	@Autowired
	ProductDAO pdao;
	
	@Autowired
	CategoryDAO cdao;
	
	@Autowired
	SupplierDAO sdao;
	
	@Autowired
	BrandDAO bdao;
	
	@Autowired
	CookieService cookie;

	@Autowired
	MailService mail;
	//Tìm kiếm sản phẩm theo danh mục id
	@RequestMapping("/product/list-by-category/{cid}")
	public String listByCategory(Model model, @PathVariable("cid") Integer categoryId) {
		List<Product> list = pdao.findByCategoryId(categoryId);
		Category categoryFind =cdao.findById(categoryId);
		model.addAttribute("list", list);
		model.addAttribute("categoryFind", categoryFind);
		return "product/list";
	}
	//Tìm kiếm sản phẩm theo danh mục
	@RequestMapping("/product/list-by-categorys/{cid}")
	public String listByCategorys(Model model, @PathVariable("cid") Integer categoryId) {
		List<Product> list = pdao.findByCategoryId(categoryId);
		Category categoryFind =cdao.findById(categoryId);
		model.addAttribute("list", list);
		model.addAttribute("categoryFind", categoryFind);
		return "product/list_by_categories";
	}
	//Tìm kiếm sản phẩm theo từ khóa
	@RequestMapping("/product/list-by-keywords")
	public String listByKeywords(Model model, @RequestParam("keywords") String keywords) {
		List<Product> list = pdao.findByKeywords(keywords);
		model.addAttribute("list5", list);
		model.addAttribute("keywords",keywords);
		return "product/list";
	}
	//Tìm kiếm sản phẩm theo chương trình đặc biệt
	@RequestMapping("/product/list-by-special/{id}")
	public String listBySpecial(Model model, @PathVariable("id") Integer id) {
		List<Product> list = pdao.findBySpecial(id);
		model.addAttribute("list", list);
		return "product/list_special_full";
	}
	//Tìm kiếm sản phẩm theo mới nhất
	@RequestMapping("/product/list-by-new/{id}")
	public String listByNews(Model model, @PathVariable("id") Integer id) {
		List<Product> list = pdao.findBySpecial(id);
		model.addAttribute("list", list);
		return "product/list-by-new_full";
	}

	//Trang chi tiết sản phẩm
	@RequestMapping("/product/detail/{id}")
	public String detail(Model model, @PathVariable("id") Integer id) {
		Product prod = pdao.findById(id);
		model.addAttribute("prod", prod);

		// Tăng số lần xem
		prod.setViewCount(prod.getViewCount() + 1);
		pdao.update(prod);

		// Hàng cùng loại
		List<Product> list = pdao.findByCategoryId(prod.getCategory().getId());
		model.addAttribute("list", list);

		// Hàng yêu thích
		Cookie favo = cookie.read("favo");
		if (favo != null) {
			String ids = favo.getValue();
			List<Product> favo_list = pdao.findByIds(ids);
			model.addAttribute("favo", favo_list);
		}

		// Hàng đã xem
		Cookie viewed = cookie.read("viewed");
		String value = id.toString();
		if (viewed != null) {
			value = viewed.getValue();
			value += "," + id.toString();
		}
		cookie.create("viewed", value, 10);
		List<Product> viewed_list = pdao.findByIds(value);
		model.addAttribute("viewed", viewed_list);

		return "product/detail";
	}
	
	//Thêm sản phẩm vào yêu thích với cookie
	@ResponseBody
	@RequestMapping("/product/add-to-favo/{id}")
	public String addToFavorite(Model model, @PathVariable("id") Integer id) {
		Cookie favo = cookie.read("favo");
		String value = id.toString();
		if (favo != null) {
			value = favo.getValue();
			if (!value.contains(id.toString())) {
				value += "," + id.toString();
			}else {
				return "false";
			}
		}
			cookie.create("favo", value, 30);
			return "true";
		
	}
	//Gửi mail báo cáo sản phẩm đến shop
	@ResponseBody
	@RequestMapping("/product/send-to-friend")
	public String sendToFriend(Model model,MailInfo info,HttpServletRequest req) {
			//send mail
			info.setSubject("Thông tin hàng hóa");
			try {
				String id=req.getParameter("id");
				String link=req.getRequestURL().toString().replace("send-to-friend", "detail/"+id);
				info.setBody(info.getBody()+"<hr><a href='"+link+"'>Xem chi tiết...</a>");
				mail.send(info);
				return "true";
			} catch (Exception e) {
				e.printStackTrace();
				return "false";
			}
	}
	//Danh sách sản phẩm đã bấm yêu thích
	@RequestMapping("/product/favo")
	public String favo(Model model) {

		// Hàng yêu thích
				Cookie favo = cookie.read("favo");
				if (favo != null) {
					String ids = favo.getValue();
					List<Product> favo_list = pdao.findByIds(ids);
					model.addAttribute("favo", favo_list);
				}
		return "product/favo";
	}
	
	//Tim kiem theo nha cung cap
	@RequestMapping("/product/list-by-suppliers/{sid}")
	public String listBySupplier(Model model, @PathVariable("sid") int supplierId) {
		List<Product> list = pdao.findBySupplierId(supplierId);
		Supplier supplierFind =sdao.findById(supplierId);
		model.addAttribute("list", list);
		model.addAttribute("supplierFind", supplierFind);
		return "product/list_by_supplier";
	}
	
	//Tim kiem theo thuong hieu
	@RequestMapping("/product/list-by-brands/{bid}")
	public String listByBrand(Model model, @PathVariable("bid") int brandId) {
		List<Product> list = pdao.findByBrandId(brandId);
		Brand brandFind =bdao.findById(brandId);
		model.addAttribute("list", list);
		model.addAttribute("brandFind", brandFind);
		return "product/list_by_brand";
	}
}
