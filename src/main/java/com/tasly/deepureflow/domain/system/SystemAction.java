package com.tasly.deepureflow.domain.system;

import java.util.Date;

public class SystemAction {
    private Integer actionId;

    private String actionUrl;

    private Integer actionType;

    private Date actionOperationTime;

    private String actionOperationName;

    private String actionMessage;

    public Integer getActionId() {
        return actionId;
    }

    public void setActionId(Integer actionId) {
        this.actionId = actionId;
    }

    public String getActionUrl() {
        return actionUrl;
    }

    public void setActionUrl(String actionUrl) {
        this.actionUrl = actionUrl == null ? null : actionUrl.trim();
    }

    public Integer getActionType() {
        return actionType;
    }

    public void setActionType(Integer actionType) {
        this.actionType = actionType;
    }

    public Date getActionOperationTime() {
        return actionOperationTime;
    }

    public void setActionOperationTime(Date actionOperationTime) {
        this.actionOperationTime = actionOperationTime;
    }

    public String getActionOperationName() {
        return actionOperationName;
    }

    public void setActionOperationName(String actionOperationName) {
        this.actionOperationName = actionOperationName == null ? null : actionOperationName.trim();
    }

    public String getActionMessage() {
        return actionMessage;
    }

    public void setActionMessage(String actionMessage) {
        this.actionMessage = actionMessage == null ? null : actionMessage.trim();
    }
}