package com.tasly.deepureflow.domain.security;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlRootElement;
@XmlRootElement(name = "UserRoleRelationship")
public class UserRoleRelationship implements Serializable{

	private static final long serialVersionUID = 7068438040176865993L;
	private long id;
	private long roleId;
	private String userId;
	
	public long getRoleId() {
		return roleId;
	}
	public void setRoleId(long roleId) {
		this.roleId = roleId;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}

}
