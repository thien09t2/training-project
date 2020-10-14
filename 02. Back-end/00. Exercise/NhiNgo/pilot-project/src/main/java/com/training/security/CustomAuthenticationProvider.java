package com.training.security;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Component;

import com.training.common.util.CommonUtil;
import com.training.entity.UserEntity;
import com.training.service.IUserService;

@Component
public class CustomAuthenticationProvider implements AuthenticationProvider {
	
	@Autowired
	IUserService userService;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {

		// Get userName and password to authenticate
		String userName = authentication.getName();
		String password = authentication.getCredentials().toString();
		String passwordMd5 = CommonUtil.ecryptMD5(password);
		
		UserEntity userInfo = userService.login(userName, passwordMd5);
		UsernamePasswordAuthenticationToken userNamePassAuthToken = null;

		if (userInfo != null) {
			List<GrantedAuthority> grantedAuths = new ArrayList<GrantedAuthority>();
			grantedAuths.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
			userNamePassAuthToken = new UsernamePasswordAuthenticationToken(userName, StringUtils.EMPTY, grantedAuths);
		}
		return userNamePassAuthToken;
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}

}
