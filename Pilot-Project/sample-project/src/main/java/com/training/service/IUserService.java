package com.training.service;

import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;

import com.training.entity.UserEntity;


public interface IUserService {
	
	UserEntity findByUsername(String userName);
	
	UserEntity login(String userName ,String passWord );
}
