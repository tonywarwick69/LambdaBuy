package com.windmotors.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.windmotors.dao.CategoryDAO;
import com.windmotors.entity.Category;
import com.windmotors.entity.User;

@Component
public class Authorizelnterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if(user == null) {
			session.setAttribute("back-url", request.getRequestURI());
			response.sendRedirect("/account/login");
			return false;
		}
		return true;
	}
}
