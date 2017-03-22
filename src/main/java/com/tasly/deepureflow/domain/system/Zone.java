package com.tasly.deepureflow.domain.system;

import java.io.Serializable;
import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;
@XmlRootElement(name = "Zone")
public class Zone implements Serializable{
	
	private static final long serialVersionUID = 3549929296962147836L;
	
    private Integer zoneId;

    private String zoneCode;

    private String zoneName;

    private Integer zonePlanStatus;

    private Integer zoneFlowStatus;

    private Integer isDelete;
    
    private List<ZonePlan> zonePlanList;

    public Integer getZoneId() {
        return zoneId;
    }

    public void setZoneId(Integer zoneId) {
        this.zoneId = zoneId;
    }

    public String getZoneCode() {
        return zoneCode;
    }

    public void setZoneCode(String zoneCode) {
        this.zoneCode = zoneCode == null ? null : zoneCode.trim();
    }

    public String getZoneName() {
        return zoneName;
    }

    public void setZoneName(String zoneName) {
        this.zoneName = zoneName == null ? null : zoneName.trim();
    }

    public Integer getZonePlanStatus() {
        return zonePlanStatus;
    }

    public void setZonePlanStatus(Integer zonePlanStatus) {
        this.zonePlanStatus = zonePlanStatus;
    }

    public Integer getZoneFlowStatus() {
        return zoneFlowStatus;
    }

    public void setZoneFlowStatus(Integer zoneFlowStatus) {
        this.zoneFlowStatus = zoneFlowStatus;
    }

    public Integer getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }

	public List<ZonePlan> getZonePlanList() {
		return zonePlanList;
	}

	public void setZonePlanList(List<ZonePlan> zonePlanList) {
		this.zonePlanList = zonePlanList;
	}
    
    
}