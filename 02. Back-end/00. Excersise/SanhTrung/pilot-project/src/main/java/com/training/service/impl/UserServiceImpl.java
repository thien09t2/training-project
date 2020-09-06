package com.training.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
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
	public UserEntity findByUserName(String userName) {
		return userDao.findByUserName(userName);
	}
}
