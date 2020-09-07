package com.training.security;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Component;

@Component
public class CustomAuthenticationProvider implements AuthenticationProvider {

	private static Logger logger = LoggerFactory.getLogger(CustomAuthenticationProvider.class);

	/**
	 * Set Authentication
	 */
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {

		logger.info("[START] : authenticate");

		// Get username and password
		String username = authentication.getName();
		String password = authentication.getCredentials().toString();
		//UserInfoModel userInfo = userInfoService.login(username, password, true);
		UsernamePasswordAuthenticationToken usernamePassAuthToken = null;

		if (username.equals(password)) {
			List<GrantedAuthority> grantedAuths = new ArrayList<GrantedAuthority>();
			grantedAuths.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
			usernamePassAuthToken = new UsernamePasswordAuthenticationToken(username, StringUtils.EMPTY, grantedAuths);
		}
		return usernamePassAuthToken;
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}
}