package com.example.config;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import javax.servlet.Filter;

public class MyWebAppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

    // 无需根配置（仅Spring MVC）
    @Override
    protected Class<?>[] getRootConfigClasses() {
        return null;
    }

    // 指定Spring MVC配置类
    @Override
    protected Class<?>[] getServletConfigClasses() {
        return new Class[]{SpringMvcConfig.class};
    }

    // 映射所有请求到DispatcherServlet
    @Override
    protected String[] getServletMappings() {
        return new String[]{"/"};
    }

    // 配置字符编码过滤器（解决中文乱码问题）
    @Override
    protected Filter[] getServletFilters() {
        CharacterEncodingFilter encodingFilter = new CharacterEncodingFilter();
        encodingFilter.setEncoding("UTF-8");
        encodingFilter.setForceRequestEncoding(true);  // 强制请求使用UTF-8
        encodingFilter.setForceResponseEncoding(true); // 强制响应使用UTF-8
        return new Filter[]{encodingFilter};
    }
}