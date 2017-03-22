package com.tasly.deepureflow.domain.security;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlRootElement;
@XmlRootElement(name = "RoleMenuRelationship")
public class RoleMenuRelationship implements Serializable{

	private static final long serialVersionUID = -8978080381748457372L;
	private long roleId;
	private long menuId;
	
	public long getRoleId() {
		return roleId;
	}
	public void setRoleId(long roleId) {
		this.roleId = roleId;
	}
	public long getMenuId() {
		return menuId;
	}
	public void setMenuId(long menuId) {
		this.menuId = menuId;
	}
	
}
