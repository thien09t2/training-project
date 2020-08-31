package com.training.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User.UserBuilder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.training.entity.UserEntity;
import com.training.service.IUserService;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {
	@Autowired
	IUserService userService ;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserEntity userEntity = userService.findByUsername(username);
		UserBuilder  builder = null;

		if(userEntity != null) {
			builder = org.springframework.security.core.userdetails.User.withUsername(username);
			builder.password(new BCryptPasswordEncoder().encode(userEntity.getPassWord()));
			builder.roles(userEntity.getRole());
		}else {
			throw new UsernameNotFoundException("User not found.");
		}
		return builder.build();
	}

}

