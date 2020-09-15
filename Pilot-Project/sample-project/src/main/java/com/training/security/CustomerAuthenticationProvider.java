package com.training.security;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import com.training.common.util.FileHelper;
import com.training.entity.UserEntity;
import com.training.service.IUserService;

@Component
public class CustomerAuthenticationProvider implements AuthenticationProvider {
	
	@Autowired
	IUserService userService;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {

		// Get username and password
		String username = authentication.getName();
		String password = authentication.getCredentials().toString();
		String passwordMd5 = FileHelper.ecryptMD5(password);
		UserEntity userEntity = userService.login(username, passwordMd5);
		UsernamePasswordAuthenticationToken usernamePassAuthToken = null;

		if (userEntity != null) {
			List<GrantedAuthority> grantedAuths = new ArrayList<GrantedAuthority>();
			grantedAuths.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
			usernamePassAuthToken = new UsernamePasswordAuthenticationToken(username, StringUtils.EMPTY, grantedAuths);
		}
		return usernamePassAuthToken;
	}

	/**
	 * Remember
	 */
	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}
}