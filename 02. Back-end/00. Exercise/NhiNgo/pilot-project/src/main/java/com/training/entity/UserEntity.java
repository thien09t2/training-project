package com.training.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "USERS")
public class UserEntity {

	@Id
	@Column(name = "USER_ID", nullable = false)
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long userId;

	@Column(name = "USERNAME", length = 20, nullable = false)
	private String userName;

	@Column(name = "FULL_NAME", length = 50, nullable = false)
	private String fullName;

	@Column(name = "EMAIL", nullable = false)
	private String email;

	@Column(name = "TEL", nullable = true)
	private Long tel;

	@Column(name = "PASSWORD", nullable = false)
	private String password;

	@Column(name = "ROLE", length = 20, nullable = false)
	private String role;

		public UserEntity() {
	}

	public UserEntity(String userName, String password, String role) {
			this.userName = userName;
			this.password = password;
			this.role = role;
		}



	/**
	 * @return the userId
	 */
	public Long getUserId() {
		return userId;
	}

	/**
	 * @param userId the userId to set
	 */
	public void setUserId(Long userId) {
		this.userId = userId;
	}

	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * @return the fullName
	 */
	public String getFullName() {
		return fullName;
	}

	/**
	 * @param fullName the fullName to set
	 */
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return the tel
	 */
	public Long getTel() {
		return tel;
	}

	/**
	 * @param tel the tel to set
	 */
	public void setTel(Long tel) {
		this.tel = tel;
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

	/**
	 * @param active the active to set
	 */

	
	
}
