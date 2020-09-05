package com.training.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ROLES")
public class RoleEntity {

	@Id
	@Column(name = "ROLE_ID", nullable = false)
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long roleId;

	@Column(name = "ROLE", length = 30, nullable = false)
	private String roleName;

//
//	@JsonIgnore
//	@OneToMany(targetEntity = UserRoleEntity.class, mappedBy = "roleEntity", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
//	private Set<UserRoleEntity> userRoleSet = new HashSet<UserRoleEntity>();
//
	public RoleEntity() {
	}

	/**
	 * @return the roleId
	 */
	public Long getRoleId() {
		return roleId;
	}

	/**
	 * @param roleId the roleId to set
	 */
	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	/**
	 * @return the roleName
	 */
	public String getRoleName() {
		return roleName;
	}

	/**
	 * @param roleName the roleName to set
	 */
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
//
//	/**
//	 * @return the userRoleSet
//	 */
//	public Set<UserRoleEntity> getUserRoleSet() {
//		return userRoleSet;
//	}
//
//	/**
//	 * @param userRoleSet the userRoleSet to set
//	 */
//	public void setUserRoleSet(Set<UserRoleEntity> userRoleSet) {
//		this.userRoleSet = userRoleSet;
//	}

}
