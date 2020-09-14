package com.training.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.training.entity.RoleEntity;

@Repository("roleRepository")
public interface IRoleDAO extends JpaRepository<RoleEntity, Long> {

	RoleEntity findByRoleName(String roleName);

}
