package com.lambdabuy;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;


@Configuration
public class TilesConfig {
	@Bean("viewResolver")
	public ViewResolver getViewResolver() {
		UrlBasedViewResolver r = new UrlBasedViewResolver();
		r.setViewClass(TilesView.class);
		return r;
	}

	@Bean("tilesConfigurer")
	public TilesConfigurer getTilesConfigurer() {
		TilesConfigurer t = new TilesConfigurer();
		t.setDefinitions("/WEB-INF/tiles.xml");
		return t;
	}
}
