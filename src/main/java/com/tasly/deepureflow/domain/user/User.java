package com.tasly.deepureflow.domain.user;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlRootElement;

import com.tasly.deepureflow.domain.security.Role;
import com.tasly.deepureflow.domain.system.Office;
import com.tasly.deepureflow.domain.system.Station;
import com.tasly.deepureflow.domain.system.Zone;

@XmlRootElement(name = "User")
public class User implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 315446212412313095L;

	private String id;

	private String username;

	private String password;

	private Boolean isactive;

	private Role role;

	private Station station;

	private Office office;

	private Zone zone;
	
	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public Station getStation() {
		return station;
	}

	public void setStation(Station station) {
		this.station = station;
	}

	public Office getOffice() {
		return office;
	}

	public void setOffice(Office office) {
		this.office = office;
	}

	public Zone getZone() {
		return zone;
	}

	public void setZone(Zone zone) {
		this.zone = zone;
	}



	
	

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Boolean getIsactive() {
		return isactive;
	}

	public void setIsactive(Boolean isactive) {
		this.isactive = isactive;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	
	
}