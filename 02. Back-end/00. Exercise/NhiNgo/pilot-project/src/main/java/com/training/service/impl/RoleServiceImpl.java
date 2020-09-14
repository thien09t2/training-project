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

	@Override
	public RoleEntity findByRoleName(String roleName) {
		return roleDAO.findByRoleName(roleName);
	}

}
