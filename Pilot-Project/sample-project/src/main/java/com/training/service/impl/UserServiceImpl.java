package com.training.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.training.dao.IUserDao;
import com.training.entity.UserEntity;
import com.training.service.IUserService;


@Repository
@Transactional
public class UserServiceImpl implements IUserService{
	
	@Autowired
	IUserDao userDao;
	
	@Override
	public UserEntity findByUsername(String userName) {
		return userDao.findByUserName(userName);
	}

	@Override
	public UserEntity login(String userName, String passWord) {
		UserEntity userEntity = userDao.findUserEntityByUsername(userName, passWord);
		return userEntity;
	}
	
	
}
