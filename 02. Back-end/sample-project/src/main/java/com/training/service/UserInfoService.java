package com.training.service;

import com.training.entity.UserInfoEntity;

public interface UserInfoService {

	UserInfoEntity login(String username, String password);
}
