package com.lambdabuy.interceptor;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.lambdabuy.entity.User;

@Component
public class AuthorizelnterceptorAdmin extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if(user == null || user.getRole()==2) {
			session.setAttribute("back-url-admin", request.getRequestURI());
			response.sendRedirect("/admin/login");
			return false;
		}
		return true;
	}
}
