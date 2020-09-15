package com.training.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.PropertySource;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * Spring Boot Application
 * 
 * @author Red Devil
 * @since 2020-02-20
 */
@SpringBootApplication
@PropertySource({"classpath:config/datasource.properties"})
@EnableTransactionManagement
@EnableJpaRepositories(basePackages = "com.training")
@ComponentScan(basePackages = "com.training")
@EntityScan("com.training")
public class SpringBootWebApplication extends SpringBootServletInitializer {
	@Autowired
	PasswordEncoder passwordEncoder;
	
	public static void main(String[] args) {
		SpringApplication.run(SpringBootWebApplication.class, args);
		System.out.println(new BCryptPasswordEncoder().encode("abc") +"///");
	}
}