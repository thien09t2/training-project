package com.training.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.training.common.util.CommonUtil;
import com.training.dao.IUserDAO;
import com.training.entity.UserEntity;
import com.training.service.IUserService;

@Service("userService")
public class UserServiceImpl implements IUserService {

	@Autowired
	private IUserDAO userDAO;

	@Override
	public UserEntity register(UserEntity userEntity) {

		try {
			userEntity.setRole("ADMIN");
			userEntity.setPassword(CommonUtil.ecryptMD5(userEntity.getPassword()));
		} catch (Exception e) {
			System.out.println("Error warning: " + e.getMessage());
		}
		return userDAO.saveAndFlush(userEntity);
	}

	@Override
	public UserEntity login(String userName, String password) {
		UserEntity userEntity = userDAO.findByUserNameAndPassword(userName, password);
		return userEntity;
	}

	@Override
	public UserEntity findByUserName(String userName) {
		return userDAO.findByUserName(userName);
	}

}
