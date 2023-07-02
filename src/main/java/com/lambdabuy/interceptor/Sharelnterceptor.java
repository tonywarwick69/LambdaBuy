package com.lambdabuy.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.lambdabuy.dao.BrandDAO;
import com.lambdabuy.dao.CategoryDAO;
import com.lambdabuy.dao.ProductDAO;
import com.lambdabuy.dao.SupplierDAO;
import com.lambdabuy.dao.UserDAO;
import com.lambdabuy.entity.Brand;
import com.lambdabuy.entity.Category;
import com.lambdabuy.entity.Product;
import com.lambdabuy.entity.Supplier;
import com.lambdabuy.entity.User;

@Component
public class Sharelnterceptor extends HandlerInterceptorAdapter{
	
	@Autowired
	CategoryDAO dao;
	
	@Autowired
	UserDAO userDAO;
	
	@Autowired
	BrandDAO brandDAO;
	
	@Autowired
	SupplierDAO supplierDAO;
	
	@Autowired
	ProductDAO pdao;
	//postHandle để lấy dữ liệu các danh sách dưới (list) load lên trang jsp khi cần sử dùng
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		List<Category> list=dao.findAll();
		modelAndView.addObject("cates", list);
		
		List<User> listUser = userDAO.findAll();
		modelAndView.addObject("users", listUser);
		List<Brand> listBrand = brandDAO.findAll();
		modelAndView.addObject("brands", listBrand);
		List<Supplier> listSupplier = supplierDAO.findAll();
		modelAndView.addObject("suppliers", listSupplier);
		
		//List<Product> listProduct = pdao.findAll();
		//modelAndView.addObject("products", listProduct);
	}
	
}
