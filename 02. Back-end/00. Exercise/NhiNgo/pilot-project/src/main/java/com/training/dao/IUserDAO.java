package com.training.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.training.entity.UserEntity;

@Repository("userRepository")
public interface IUserDAO extends JpaRepository<UserEntity, Long> {

	UserEntity findByUserName(String userName);

	UserEntity findByUserNameAndPasswordNot(String userName, String password);
}