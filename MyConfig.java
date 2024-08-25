package com.blog;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
@Configuration
@ComponentScan("com.blog")
public class MyConfig {
	@Bean
	public ViewResolver internalResourceViewResolver() {
		InternalResourceViewResolver ir=new InternalResourceViewResolver();
		ir.setPrefix("/WEB-INF/");
		ir.setSuffix(".jsp");
		return ir;
	}
}
