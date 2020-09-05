package com.training.service;

import com.training.entity.RoleEntity;

public interface IRoleService {

	RoleEntity findByRoleName(String roleName);
//
//	List<RoleEntity> getRoleName(Long userId);
}
