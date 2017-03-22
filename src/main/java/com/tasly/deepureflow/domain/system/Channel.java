package com.tasly.deepureflow.domain.system;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "Channel")
public class Channel {
    private String channelId;

    private String channelName;

    private String hierarchyId;
    
    private Hierarchy hierarchy;
    
    private Integer isDelete;

    public String getChannelId() {
        return channelId;
    }

    public void setChannelId(String channelId) {
        this.channelId = channelId == null ? null : channelId.trim();
    }

    public String getChannelName() {
        return channelName;
    }

    public void setChannelName(String channelName) {
        this.channelName = channelName == null ? null : channelName.trim();
    }

    public String getHierarchyId() {
        return hierarchyId;
    }

    public void setHierarchyId(String hierarchyId) {
        this.hierarchyId = hierarchyId == null ? null : hierarchyId.trim();
    }

	public Hierarchy getHierarchy() {
		return hierarchy;
	}

	public void setHierarchy(Hierarchy hierarchy) {
		this.hierarchy = hierarchy;
	}

	public Integer getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}
}