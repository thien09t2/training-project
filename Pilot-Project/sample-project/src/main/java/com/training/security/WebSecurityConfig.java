package com.training.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@Order(value = 99)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	
	 @Autowired
	    private UserDetailsService userDetailsService;
	 

	 @Bean
	 public PasswordEncoder passwordEncoder() {
	 return new BCryptPasswordEncoder();
	 }

	 @Autowired
	 public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		 auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
	 }

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable()
			.authorizeRequests()
					.antMatchers("/","/css/**", "/js/**", "/images/**","/plugins/**","/login").permitAll()
					.antMatchers("/brand","/product").hasRole("ADMIN")
					.anyRequest().authenticated()
			.and().formLogin().loginPage("/login")
					.loginProcessingUrl("/loginAction")
					.defaultSuccessUrl("/product")
					.usernameParameter("userName")
					.passwordParameter("passWord")
					.failureUrl("/login?error")
			.and().logout().logoutSuccessUrl("/login")
			.and().exceptionHandling().accessDeniedPage("/login");
	}
}