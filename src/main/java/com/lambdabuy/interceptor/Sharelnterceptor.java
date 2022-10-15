package com.lambdabuy.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.lambdabuy.dao.CategoryDAO;
import com.lambdabuy.dao.UserDAO;
import com.lambdabuy.entity.Category;
import com.lambdabuy.entity.User;

@Component
public class Sharelnterceptor extends HandlerInterceptorAdapter{
	
	@Autowired
	CategoryDAO dao;
	
	@Autowired
	UserDAO userDAO;
	/*
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		List<Category> list=dao.findAll();
		modelAndView.addObject("cates", list);
		
		List<User> listUser = userDAO.findAll();
		modelAndView.addObject("users", list);
	}
	*/
}
