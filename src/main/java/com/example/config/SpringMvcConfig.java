package com.example.config;

import com.example.formatter.DateFormatter;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.format.FormatterRegistry;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@EnableWebMvc  // 开启Spring MVC注解驱动
@ComponentScan("com.example.controller")  // 扫描控制器包
public class SpringMvcConfig implements WebMvcConfigurer {

    // 配置视图解析器（指定JSP路径前缀和后缀）
    @Override
    public void configureViewResolvers(ViewResolverRegistry registry) {
        registry.jsp("/WEB-INF/views/", ".jsp");
    }

    // 注册全局日期格式化器（所有Controller生效）
    @Override
    public void addFormatters(FormatterRegistry registry) {
        registry.addFormatter(new DateFormatter());
    }
}
