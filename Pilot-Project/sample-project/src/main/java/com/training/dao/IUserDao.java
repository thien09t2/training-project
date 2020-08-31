package com.training.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.training.entity.UserEntity;

@Repository
public interface IUserDao extends JpaRepository<UserEntity, String>{
	UserEntity findByUserName(String userName);

}
