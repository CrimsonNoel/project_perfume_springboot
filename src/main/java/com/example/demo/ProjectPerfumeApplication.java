package com.example.demo;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import login.LoginAdmin;
import login.LoginUser;

/*
 * https://wakestand.tistory.com/618
 * Whitelabel Error Page >> index.html 먼저 찾기떄문에 resources>static>index.html이 있어야함
 */

@SpringBootApplication
@Configuration
@ComponentScan(basePackages = "controller, service, login" )
public class ProjectPerfumeApplication implements WebMvcConfigurer{

	public static void main(String[] args) {
		SpringApplication.run(ProjectPerfumeApplication.class, args);
	}

	@Bean // mybatis spring boot 가 만든 mybatis db pool을 사용 한다.
	public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception{
		SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
		sessionFactory.setDataSource(dataSource);		
		
		sessionFactory.setConfigLocation(
				new PathMatchingResourcePatternResolver().getResource("classpath:mybatis/mybatis-config.xml")
				);
		return sessionFactory.getObject();
	}
	
	@Bean
	public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) throws Exception{
		return new SqlSessionTemplate(sqlSessionFactory);
	}
	
	@Bean // sitemesh
	public FilterRegistrationBean<ConfigurableSiteMeshFilter> siteMethFilter(){
		FilterRegistrationBean<ConfigurableSiteMeshFilter> filter = 
				new FilterRegistrationBean<ConfigurableSiteMeshFilter>();
		filter.setFilter(new ConfigurableSiteMeshFilter() {
			protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
				builder
						.addDecoratorPath("/home/*", "/layout/layout.jsp")
						.addDecoratorPath("/member/*", "/layout/layout.jsp")
						.addDecoratorPath("/shop/*", "/layout/layout.jsp")
						.addDecoratorPath("/product/*", "/layout/layout.jsp")
						.addDecoratorPath("/board/*", "/layout/layout.jsp")
						.addDecoratorPath("/order/*", "/layout/layout.jsp")
						.addDecoratorPath("/cart/*", "/layout/layout.jsp")
						.addDecoratorPath("/test/*", "/layout/layout.jsp")
						.addExcludedPath("*/boardDeleteForm")
						.addExcludedPath("*/boardCommentPro")
						.addExcludedPath("*/surveyStart")
						.addExcludedPath("*/survey01")
						.addExcludedPath("*/survey02")
						.addExcludedPath("*/survey03")
						.addExcludedPath("*/surveyResult")
						.addExcludedPath("*/cartDeleteForm")
						.addExcludedPath("*/productDeleteForm")
						.addExcludedPath("*/reviewEnroll/")
						.addExcludedPath("*/reviewUpdate")
						.addExcludedPath("*/reviewDelete");
						
			}});
		return filter;	
	}
	
	@Autowired // user
	LoginUser loginInterceptor;
	
	@Autowired // admin
	LoginAdmin adminInterceptor;
	
	@Override // interceptors (implements WebMvcConfigurer 필요)
	public void addInterceptors(InterceptorRegistry registry) {
		System.out.println("interceptors");
		registry
				.addInterceptor(adminInterceptor)
				.addPathPatterns("/product/productForm")
				.addPathPatterns("/product/productPro")
				.addPathPatterns("/product/productUpdateForm")
				.addPathPatterns("/product/productUpdatePro")
				.addPathPatterns("/product/productDeleteForm")
				.addPathPatterns("/product/productDeletePro")
				.addPathPatterns("/product/productManagement")
				.addPathPatterns("/board/boardForm")
				.addPathPatterns("/board/boardPro")
				.addPathPatterns("/board/boardUpdateForm")
				.addPathPatterns("/board/boardUpdatePro")
				.addPathPatterns("/board/boardDeleteForm")
				.addPathPatterns("/board/CommentManagement")
				.addPathPatterns("/order/orderStateUpdate")
				.addPathPatterns("/order/orderManagement")
				.addPathPatterns("/member/adminMemberDelete")
				.addPathPatterns("/member/memberList");
		
		registry
				.addInterceptor(loginInterceptor)
				.addPathPatterns("/survey/surveyStart")
				.addPathPatterns("/survey/surveyResult")
				.addPathPatterns("/survey/survey01")
				.addPathPatterns("/survey/survey02")
				.addPathPatterns("/survey/survey03fruit")
				.addPathPatterns("/survey/survey03flower")
				.addPathPatterns("/survey/survey03wood")
				.addPathPatterns("/cart/cartPro")
				.addPathPatterns("/cart/cartList")
				.addPathPatterns("/cart/cartUpdate")
				.addPathPatterns("/cart/cartDelete")
				.addPathPatterns("/member/memberInfo")
				.addPathPatterns("/member/memberUpdateForm")
				.addPathPatterns("/member/memberUpdatePro")
				.addPathPatterns("/member/memberPassForm")
				.addPathPatterns("/member/memberDeleteForm")
				.addPathPatterns("/member/memberPassPro")
				.addPathPatterns("/member/memberDeletePro")
				.addPathPatterns("/order/order")
				.addPathPatterns("/order/orderPro")
				.addPathPatterns("/order/orderList")
				.addPathPatterns("/order/orderDetail")
				.addPathPatterns("/order/orderCancelForm")
				.addPathPatterns("/order/orderCancelPro")
				.addPathPatterns("/order/orderResult")
				.addPathPatterns("/order/orderConfirm")
				.addPathPatterns("/board/myComment");
	}
	@Override // image resource
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		
		registry.addResourceHandler("/view/board/images/**","/view/product/images/**","/images/**","/css/**")  // browser url
				.addResourceLocations("/WEB-INF/view/board/images/","/WEB-INF/view/product/images/","/WEB-INF/resource/images/","/WEB-INF/resource/css/"); // 실행 위치
		
	}
	
	
	
}//end
