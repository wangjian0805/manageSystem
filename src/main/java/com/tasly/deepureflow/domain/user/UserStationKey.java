package com.tasly.deepureflow.domain.user;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "UserStationKey")
public class UserStationKey {
    private String stationCode;

    private String userId;

    public String getStationCode() {
        return stationCode;
    }

    public void setStationCode(String stationCode) {
        this.stationCode = stationCode == null ? null : stationCode.trim();
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }
}