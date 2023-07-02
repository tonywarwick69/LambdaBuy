
package com.lambdabuy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.lambdabuy.interceptor.AuthorizeInterceptorSupplier;
import com.lambdabuy.interceptor.Sharelnterceptor;

public class InterceptorConfigSupplier implements WebMvcConfigurer{
	@Autowired
	Sharelnterceptor share;
	
	@Autowired
	AuthorizeInterceptorSupplier auth;
	//Interceptors intercept requests and process them. They help to avoid repetitive handler code such as logging and authorization 
	//Interceptors chặn requests và xử lý chúng. Interceptors giúp tránh việc phải xử lý code lặp đi lặp lại như logging và authorization
	//các link dưới sẽ yêu cầu User login để có thể sử dụng
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(share).addPathPatterns("/**");

		registry.addInterceptor(auth).addPathPatterns(
				"/supplier/login",
				"/supplier/product/**",
				"/supplier/");
	}

}
