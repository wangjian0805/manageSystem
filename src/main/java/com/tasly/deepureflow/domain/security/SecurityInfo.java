package com.tasly.deepureflow.domain.security;

import java.io.Serializable;
import java.util.List;
import java.util.Set;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "SecurityInfo")
public class SecurityInfo implements Serializable{

	 /**
	 * 
	 */
	private static final long serialVersionUID = 2292078289127794897L;
	//用户id
	private String userId;
	 //角色名称集合
	private Set<String> roleNames;
	 //权限集合
	private Set<String> permissions;
	
	private List<Menu> menus;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Set<String> getRoleNames() {
		return roleNames;
	}
	public void setRoleName(Set<String> roleNames) {
		this.roleNames = roleNames;
	}
	public Set<String> getPermissions() {
		return permissions;
	}
	public void setPermissions(Set<String> permissions) {
		this.permissions = permissions;
	}
	public void setRoleNames(Set<String> roleNames) {
		this.roleNames = roleNames;
	}
	public List<Menu> getMenus() {
		return menus;
	}
	public void setMenus(List<Menu> menus) {
		this.menus = menus;
	}

}
