package com.training.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
@Order(1000) 
public class WebSecurityConfig extends WebSecurityConfigurerAdapter  {
	//Khi người dùng đăng nhập thì Spring Security sẽ cần lấy các thông tin UserDetails hiện có để kiểm tra. Vì vậy, bạn cần tạo ra một class kế thừa lớp UserDetailsService mà Spring Security cung cấp để làm nhiệm vụ này.
	@Autowired
	private UserDetailsService userDetailsService;

	//mã hóa pass
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		//Cung cáp userservice cho spring security
		// Sét đặt dịch vụ để tìm kiếm User trong Database.
		// Và sét đặt PasswordEncoder.
		auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
	}
	
	//config url
	 @Override
	    protected void configure(HttpSecurity http) throws Exception {
	        http.csrf().disable()
		      .authorizeRequests()
			        .antMatchers("/").permitAll()
			        .antMatchers("/brand").hasRole("ADMIN")
			        .anyRequest().authenticated()
			        .and()
		      .formLogin()
		      		.loginPage("/login")
		      		.loginProcessingUrl("/loginAction")
		      		.defaultSuccessUrl("/brand")
		      		.usernameParameter("userName")
	                .passwordParameter("password")
		      		.failureUrl("/login?error")
		      	    .and()
		      	    .logout().logoutSuccessUrl("/login")
		      	    .and()
		      .exceptionHandling().accessDeniedPage("/login");
	 }
	 
}
