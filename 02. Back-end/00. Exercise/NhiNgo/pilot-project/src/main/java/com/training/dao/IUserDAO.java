package com.training.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.training.entity.UserEntity;

@Repository("userRepository")
public interface IUserDAO extends JpaRepository<UserEntity, Long> {
	
	UserEntity findByUserName(String userName);

	@Query("SELECT user "
			+ "FROM UserEntity user "
			+ "WHERE user.userName = ?1 "
			+ "AND user.password = ?2")
	UserEntity findByUserNameAndPassword(String userName, String password);
	
}