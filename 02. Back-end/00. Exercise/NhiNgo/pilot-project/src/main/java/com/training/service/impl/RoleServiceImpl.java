package com.training.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.training.dao.IRoleDAO;
import com.training.entity.RoleEntity;
import com.training.service.IRoleService;

@Service("roleService")
public class RoleServiceImpl implements IRoleService {

	@Autowired
	IRoleDAO roleDAO;

//	@Autowired
//	IUserRoleService userRoleService;
//
	@Autowired
	IRoleService roleService;

	@Override
	public RoleEntity findByRoleName(String roleName) {
		return roleDAO.findByRoleName(roleName);
	}
//
//	@Override
//	public RoleEntity findByRoleId(Long roleId) {
//		return roleDAO.findByRoleId(roleId);
//	}
//
//	@Override
//	public List<RoleEntity> getRoleName(Long userId) {
//
//		UserRoleEntity userRoleEntity = userRoleService.findByUserId(userId);
//		RoleEntity roleEntity = roleService.findByRoleId(userRoleEntity.getRoleEntity().getRoleId());
//
//		return roleDAO.getRoleName(roleEntity.getRoleId());
//	}

}
