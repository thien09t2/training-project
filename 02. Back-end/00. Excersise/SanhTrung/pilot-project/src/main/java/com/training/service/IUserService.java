package com.training.service;

import com.training.entity.UserEntity;


public interface IUserService {
	
	UserEntity findByUserName(String userName);
}
