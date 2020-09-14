package com.training.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.training.dao.IUserDAO;
import com.training.entity.UserEntity;
import com.training.service.IUserService;

@Service("userService")
public class UserServiceImpl implements IUserService {

	@Autowired
	private IUserDAO userDAO;

	@Override
	public UserEntity findByUserName(String userName) {
		return userDAO.findByUserName(userName);
	}

	@Override
	public UserEntity register(UserEntity userEntity) {

		try {
			userEntity.setRole("ADMIN");
		} catch (Exception e) {
			System.out.println("Error warning: " + e.getMessage());
		}
		return userDAO.saveAndFlush(userEntity);
	}

	@Override
	public UserEntity login(String userName, String password) {
		// TODO Auto-generated method stub
		return null;
	}

}
