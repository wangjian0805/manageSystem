package com.tasly.deepureflow.domain.security;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlRootElement;
@XmlRootElement(name = "RoleResourceRelationship")
public class RoleResourceRelationship implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7053887427478325315L;
	private long roleId;
	private long resourceId;
	
	public long getRoleId() {
		return roleId;
	}
	public void setRoleId(long roleId) {
		this.roleId = roleId;
	}
	public long getResourceId() {
		return resourceId;
	}
	public void setResourceId(long resourceId) {
		this.resourceId = resourceId;
	}
	
}
