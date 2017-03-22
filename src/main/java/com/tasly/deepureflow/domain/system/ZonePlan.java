package com.tasly.deepureflow.domain.system;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "ZonePlan")
public class ZonePlan implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = -8044263303213036165L;

	private String zoneId;

    private Integer planType;

    private Integer planStartDay;

    private Integer planEndDay;

    private Integer planStatus;

    public String getZoneId() {
        return zoneId;
    }

    public void setZoneId(String zoneId) {
        this.zoneId = zoneId;
    }

    public Integer getPlanType() {
        return planType;
    }

    public void setPlanType(Integer planType) {
        this.planType = planType;
    }

    public Integer getPlanStartDay() {
        return planStartDay;
    }

    public void setPlanStartDay(Integer planStartDay) {
        this.planStartDay = planStartDay;
    }

    public Integer getPlanEndDay() {
        return planEndDay;
    }

    public void setPlanEndDay(Integer planEndDay) {
        this.planEndDay = planEndDay;
    }

    public Integer getPlanStatus() {
        return planStatus;
    }

    public void setPlanStatus(Integer planStatus) {
        this.planStatus = planStatus;
    }
}