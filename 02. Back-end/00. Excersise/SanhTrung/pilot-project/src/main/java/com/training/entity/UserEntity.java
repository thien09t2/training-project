package com.training.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="USER")
public class UserEntity {
	
	@Id
	@Column(name = "USERNAME", nullable = false)
	private String userName;
	
	@Column(name = "PASSWORD", nullable = true)
	private String password;
	
	@Column(name = "ROLE", nullable = true)
	private String role;

	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}

	public UserEntity() {
		super();
	}

	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return the role
	 */
	public String getRole() {
		return role;
	}

	/**
	 * @param role the role to set
	 */
	public void setRole(String role) {
		this.role = role;
	}

	
	
}