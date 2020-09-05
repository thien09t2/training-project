package com.training.security;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

/**
 * Security Configuration
 *
 * @author Red Devil
 * @since 2018-07-27
 */

@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

	@Autowired
	private DataSource dataSource;

	@Autowired
	public BCryptPasswordEncoder bCrPwEncoder;

	private final String USERS_UNAME_QUERY = "SELECT username, ecrypted_password, active FROM user_info WHERE username = ?";
	private final String ROLES_QUERY = "SELECT u.username, r.role FROM user_info u INNER JOIN user_role ur ON (u.user_id = ur.user_id) INNER JOIN roles r ON(ur.role_id = r.role_id) WHERE u.username = ?";

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {

		auth.jdbcAuthentication().usersByUsernameQuery(USERS_UNAME_QUERY).authoritiesByUsernameQuery(ROLES_QUERY)
				.dataSource(dataSource).passwordEncoder(bCrPwEncoder);
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {

		// User Permission
		http.authorizeRequests()
				.antMatchers("/css/**", "/js/**", "/images/**", "/plugins/**").permitAll()
				.antMatchers("/login", "/signup").permitAll()
				.antMatchers("/*", "/**/*", "/**/**/*").hasAuthority("ADMIN").anyRequest().authenticated()
						.and().csrf().disable()// Disable CSRF check
				.formLogin().loginPage("/login").failureUrl("/login?error=true").defaultSuccessUrl("/brand")
						.usernameParameter("userName").passwordParameter("password")
						.and().logout().logoutRequestMatcher(new AntPathRequestMatcher("/logout")).logoutSuccessUrl("/login")
						.and().rememberMe().tokenRepository(persistentTokenRepository()).tokenValiditySeconds(60 * 60)
						.and().exceptionHandling().accessDeniedPage("/login");
	}

	@Bean
	public PersistentTokenRepository persistentTokenRepository() {

		JdbcTokenRepositoryImpl db = new JdbcTokenRepositoryImpl();
		db.setDataSource(dataSource);

		return db;
	}

}
