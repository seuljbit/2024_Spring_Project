package com.ezen.spring.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@EnableScheduling
@EnableWebMvc
@ComponentScan(basePackages = {"com.ezen.spring.controller","com.ezen.spring.service","com.ezen.spring.handler"})
public class ServletConfiguration implements WebMvcConfigurer {

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		// resources 경로 설정 (css, js, img, font)
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
		
		// 나중에 파일 업로드 경로도 추가 예정
		registry.addResourceHandler("/upload/**").addResourceLocations("file:///D:\\_myProject\\_java\\_fileUpload\\");
	}

	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		// view를 jsp(jstl 포함)로 어떻게 보여줄 지 경로 설정 
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setPrefix("/WEB-INF/views/");
		viewResolver.setSuffix(".jsp");
		
		// 화면에 뷰를 구성할 때 jstl에 대한 사용을 하는 jsp를 구성하겠다
		viewResolver.setViewClass(JstlView.class);
		
		registry.viewResolver(viewResolver);
		
	}
	
	// 나중에 파일 업로드 리졸버도 추가 예정
	// 빈 이름이 multipartResolver 여야 에러가 안남.
	@Bean(name = "multipartResolver")
	public MultipartResolver getMultipartResolver() {
		StandardServletMultipartResolver multipartResolver = new StandardServletMultipartResolver();
		return multipartResolver;
	}
}