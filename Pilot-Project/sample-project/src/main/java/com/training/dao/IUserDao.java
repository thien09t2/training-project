package com.training.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.training.entity.UserEntity;

@Repository
public interface IUserDao extends JpaRepository<UserEntity, String>{
	UserEntity findByUserName(String userName);

	@Query(value = "SELECT u FROM UserEntity u WHERE u.userName= :username AND u.passWord= :password")
	UserEntity findUserEntityByUsername(@Param("username") String username, @Param("password") String password);
}
 