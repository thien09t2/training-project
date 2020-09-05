package com.training.service;

import com.training.entity.UserEntity;

public interface IUserService {

	UserEntity findByUserName(String userName);

	UserEntity addUser(UserEntity userEntity);

//	boolean isValidUser(String userName, String password);

//	ResponseDataModel findByUserNameApi(String userName);

	UserEntity validateUser(UserEntity userEntity);

}
