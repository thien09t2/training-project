package com.training.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	// Khi người dùng đăng nhập thì Spring Security sẽ cần lấy các thông tin
	// UserDetails hiện có để kiểm tra. Vì vậy, bạn cần tạo ra một class kế thừa lớp
	// UserDetailsService mà Spring Security cung cấp để làm nhiệm vụ này.
	@Autowired
	private UserDetailsService userDetailsService;
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

	// mã hóa pass
	@Bean
	public PasswordEncoder passwordEncoder() {
//		return new BCryptPasswordEncoder();
		return  NoOpPasswordEncoder.getInstance();
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		// TODO Auto-generated method stub
		auth.userDetailsService(userDetailsService);
	}

	// config url
	@Override
	    protected void configure(HttpSecurity http) throws Exception {
	        http.csrf().disable()
		      .authorizeRequests()
		      		.antMatchers("/","/css/**", "/js/**", "/images/**","/plugins/**","/login").permitAll()
			      
			        .antMatchers("/brand").hasRole("ADMIN")
			        .anyRequest().authenticated()
			        .and()
		      .formLogin()
		      		.loginPage("/login")
		      		.loginProcessingUrl("/loginAction")
		      		.successHandler(new AuthenticationSuccessHandler() {
		      		  						@Override
						public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
								Authentication authentication) throws IOException, ServletException {
		      		  						redirectStrategy.sendRedirect(request, response, "/brand");
							
						}
		      		})
		      		 
		      		.usernameParameter("username")
	                .passwordParameter("password")
		      		.failureUrl("/login?error")
		      	    .and()
		      	    .logout().logoutSuccessUrl("/login")
		      	    .and()
		      .exceptionHandling().accessDeniedPage("/login");
	 }
	// e code theo treen mang co viet 1 cai service duoi nay nua a ne a xem qua thu

}
