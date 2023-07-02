package com.lambdabuy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.lambdabuy.interceptor.Authorizelnterceptor;
import com.lambdabuy.interceptor.Sharelnterceptor;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {

	@Autowired
	Sharelnterceptor share;

	@Autowired
	Authorizelnterceptor auth;
	//Interceptors intercept requests and process them. They help to avoid repetitive handler code such as logging and authorization 
	//Interceptors chặn requests và xử lý chúng. Interceptors giúp tránh việc phải xử lý code lặp đi lặp lại như logging và authorization
	//các link dưới sẽ yêu cầu User login để có thể sử dụng
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(share).addPathPatterns("/**");

		registry.addInterceptor(auth).addPathPatterns(
				"/account/change", 
				"/order/checkout", 
				"/account/logout",
				"/account/edit", 
				"/order/list",
				"/order/items",
				"/order/detail",
				"/cart/view",
				"/home/addProduct",
				"/cart/add",
				"/account/order/**",
				"/cart/add-to-cart/**");
	}
}
