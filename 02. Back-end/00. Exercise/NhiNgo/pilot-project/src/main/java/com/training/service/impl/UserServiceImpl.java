package com.training.service.impl;

import java.util.Arrays;
import java.util.HashSet;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.training.dao.IRoleDAO;
import com.training.dao.IUserDAO;
import com.training.entity.RoleEntity;
import com.training.entity.UserEntity;
import com.training.service.IUserService;

@Service("userService")
public class UserServiceImpl implements IUserService {

	private final Logger LOGGER = LoggerFactory.getLogger(getClass());

	@Autowired
	private IRoleDAO roleDAO;

	@Autowired
	private IUserDAO userDAO;

	@Autowired
	private BCryptPasswordEncoder bCrPwEncoder;

	@Override
	public UserEntity findByUserName(String userName) {
		return userDAO.findByUserName(userName);
	}

	@Override
	public UserEntity validateUser(UserEntity userEntity) {

		UserEntity validUser = null;
		try {
			validUser = userDAO.findByUserNameAndPasswordNot(userEntity.getUserName(),
					bCrPwEncoder.encode(userEntity.getPassword()));

			if (validUser != null) {
				validUser.setActive(true);
				validUser = new UserEntity(userEntity.getUserName(), userEntity.getPassword());
			}
		} catch (Exception e) {
			LOGGER.error("Error occurs when user trying to log in: " + e);
		}
		return validUser;
	}

	@Override
	public UserEntity addUser(UserEntity userEntity) {

		try {
			userEntity.setPassword(bCrPwEncoder.encode(userEntity.getPassword()));
			userEntity.setActive(true);

			RoleEntity userRole = roleDAO.findByRoleName("ADMIN");
			userEntity.setRoleList(new HashSet<RoleEntity>(Arrays.asList(userRole)));
		} catch (Exception e) {
			System.out.println("Error warning: " + e.getMessage());
		}
		return userDAO.saveAndFlush(userEntity);
	}

//	@Override
//	public ResponseDataModel validateUser(UserEntity userEntity) {
//
//		int responseCode = Constants.RESULT_CD_FAIL;
//		String responseMessg = StringUtils.EMPTY;
//
//		try {
//			UserEntity validUser = userDAO.findByUserNameAndPasswordNot(userEntity.getUserName(),
//					userEntity.getEcrPassword());
//
//			if (StringUtils.isEmpty(userEntity.getUserName())) {
//				responseMessg = "Please enter both fields!";
//			} else if (validUser == null) {
//				responseMessg = "Username or Password is incorrect!";
//			} else {
//				validUser.setActive(true);
//				validUser = new UserEntity(userEntity.getUserName(), userEntity.getEcrPassword());
//				responseCode = Constants.RESULT_CD_SUCCESS;
//				responseMessg = "Login successfully!";
//			}
//		} catch (Exception e) {
//			responseMessg = "Error occurs when user trying to log in!";
//			LOGGER.error("Error occurs when user trying to log in: " + e);
//		}
//		return new ResponseDataModel(responseCode, responseMessg);
//	}
}
